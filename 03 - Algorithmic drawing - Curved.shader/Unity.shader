// Created with Shade for iPad
Shader "Shade/03 - Algorithmic drawing - Curved"
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
            float pow_10 = pow(IN.screenPos.xy.r, 5.0);
            float4 add_22 = ((float4(pow_10, pow_10, pow_10, pow_10) * (1.0 - (smoothstep((pow_10 - 0.02), pow_10, IN.screenPos.xy.g) - smoothstep(pow_10, (pow_10 + 0.02), IN.screenPos.xy.g)))) + (float4(0.0, 1.0, 5.9605e-08, 1.0) * (smoothstep((pow_10 - 0.02), pow_10, IN.screenPos.xy.g) - smoothstep(pow_10, (pow_10 + 0.02), IN.screenPos.xy.g))));
            o.Albedo = add_22.rgb;
            o.Alpha = 1.0;
        }
        ENDCG
    }
}
