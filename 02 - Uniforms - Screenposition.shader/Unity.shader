// Created with Shade for iPad
Shader "Shade/02 - Uniforms - Exercise"
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

        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard vertex:vert fullforwardshadows addshadow
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

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Emission = float3(0.0, 0.0, 0.0);
            o.Albedo = float4(IN.screenPos.xy.r, IN.screenPos.xy.g, 0.0, 0.0).rgb;
            o.Smoothness = (1.0 - 0.32468);
            o.Metallic = 0.0;
            o.Alpha = 1.0;
            o.Occlusion = 1.0;
        }
        ENDCG
    }
}
