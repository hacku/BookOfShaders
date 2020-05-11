{
    name = "03 - Algorithmic drawing - Curved",

    options =
    {
        USE_COLOR = { true },
        SELECTION_MODE = { true },
    },

    properties =
    {
    },

    pass =
    {
        base = "Surface",

        blendMode = "disabled",
        depthWrite = true,
        depthFunc = "lessEqual",
        renderQueue = "solid",
        colorMask = {"rgba"},
        cullFace = "back",

        vertex =
        [[
            void vertex(inout Vertex v, out Input o)
            {
            }
        ]],

        surface =
        [[
            uniform vec4 screenParams;
            
            void surface(in Input IN, inout SurfaceOutput o)
            {
                o.emissive = 1.0;
                float pow_10 = pow((gl_FragCoord.xy * screenParams.zw).r, 5.0);
                vec4 add_22 = ((vec4(pow_10, pow_10, pow_10, pow_10) * (1.0 - (smoothstep((pow_10 - 0.02), pow_10, (gl_FragCoord.xy * screenParams.zw).g) - smoothstep(pow_10, (pow_10 + 0.02), (gl_FragCoord.xy * screenParams.zw).g)))) + (vec4(0.0, 1.0, 5.9605e-08, 1.0) * (smoothstep((pow_10 - 0.02), pow_10, (gl_FragCoord.xy * screenParams.zw).g) - smoothstep(pow_10, (pow_10 + 0.02), (gl_FragCoord.xy * screenParams.zw).g))));
                o.diffuse = add_22.rgb;
                o.emission = vec3(0.0, 0.0, 0.0);
                o.opacity = 1.0;
            }
        ]]
    }
}
