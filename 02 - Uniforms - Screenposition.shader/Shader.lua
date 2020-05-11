{
    name = "02 - Uniforms - Screenposition",

    options =
    {
        USE_COLOR = { true },
        USE_LIGHTING = { true },
        STANDARD = { true },
        PHYSICAL = { true },
        USE_ENVMAP = { false, {"envMap"} },
        SELECTION_MODE = { true },
    },

    properties =
    {
        {"envMap", "cubeTexture", "nil" },
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
                o.diffuse = vec4((gl_FragCoord.xy * screenParams.zw).r, (gl_FragCoord.xy * screenParams.zw).g, 0.0, 0.0).rgb;
                o.roughness = 0.32468;
                o.metalness = 0.0;
                o.emission = vec3(0.0, 0.0, 0.0);
                o.opacity = 1.0;
                o.occlusion = 1.0;
            }
        ]]
    }
}
