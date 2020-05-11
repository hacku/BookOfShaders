// Created with Shade for iPad
Shader "Shade/03 - Algorithmic drawing - Linear"
{
    Properties
    {
    }

    SubShader
    {
        Tags { "Queue"="Geometry" "RenderType"="Opaque" }
        ZWrite On
        LOD 200

        CGPROGRAM

        #pragma target 4.0

        // Unlit model
        #pragma surface surf NoLighting vertex:vert noforwardadd addshadow

        fixed4 LightingNoLighting(SurfaceOutput s, fixed3 lightDir, fixed atten)
        {
            fixed4 c;
            c.rgb = s.Albedo + s.Emission.rgb;
            c.a = s.Alpha;
            return c;
        }

        struct Input {
            float2 texcoord : TEXCOORD0;
            float4 screenPos : TEXCOORD1;
            float4 color : COLOR;
        };
        
        void vert (inout appdata_full v, out Input o)
        {
            UNITY_INITIALIZE_OUTPUT(Input, o);
            o.texcoord = v.texcoord;
            o.screenPos = ComputeGrabScreenPos(UnityObjectToClipPos(v.vertex));
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Emission = float3(0.0, 0.0, 0.0);
            float4 add_20 = ((float4(IN.screenPos.xy.r, IN.screenPos.xy.r, IN.screenPos.xy.r, IN.screenPos.xy.r) * (1.0 - (smoothstep((IN.screenPos.xy.r - 0.02), IN.screenPos.xy.r, IN.screenPos.xy.g) - smoothstep(IN.screenPos.xy.r, (IN.screenPos.xy.r + 0.02), IN.screenPos.xy.g)))) + (float4(0.0, 1.0, 5.9605e-08, 1.0) * (smoothstep((IN.screenPos.xy.r - 0.02), IN.screenPos.xy.r, IN.screenPos.xy.g) - smoothstep(IN.screenPos.xy.r, (IN.screenPos.xy.r + 0.02), IN.screenPos.xy.g))));
            o.Albedo = add_20.rgb;
            o.Alpha = 1.0;
        }
        ENDCG
    }
}
