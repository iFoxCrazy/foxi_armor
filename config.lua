Config = {}

Config.Options = {
    ESXSharedObject = "esx:getSharedObject", -- Jeres shared object event
    ArmorItem = "vest",
    SuperArmor = 500, -- 100 er det normale antal armor fra en super heavy vest
    CheckTime = 75, -- I MS - hvor ofte den skal tjekke om ens armor er droppet, ik ændre hvis du ik forstår det, det er noget med optimisering
    DistanceCheckTime = 500, -- I MS - hvor ofte den tjekker hvor tæt på man er, ik ændre hvis du ik forstår det, det er noget med optimisering
    JobCheckTime = 2500, -- I MS - hvor ofte den checker om man har et politi job, ik ændre hvis du ik forstår det, det er noget med optimisering
    ArmorComponent = {{9, 4, 1, 2}, {9, 6, 1, 2}}, -- 1 male, 2 female - https://docs.fivem.net/natives/?_0xD4F7B05C
    Locations = {
        GetArmor = {vector3(438.75738525391,-981.58654785156,30.689609527588), vector3(2,2,2), vector3(3,3,3)},
        RemoveArmor = {vector3(442.39123535156,-981.31597900391,30.689609527588), vector3(2,2,2), vector3(3,3,3)},
    },
    MarkerType = 20, -- Hvilken markertype der bliver brugt - https://docs.fivem.net/docs/game-references/markers/
    InteractionKey = 38, -- https://docs.fivem.net/docs/game-references/controls/
    DrawDistance = 3, -- Hvor langt man skal være før markeren viser sig
    InteractionDistance = 1, -- Hvor langt man skal være for at kunne interaktere
    Strings = {
        ['Interact'] = 'Tryk ~INPUT_CONTEXT~ for at %s',
        ['GetArmor'] = 'få armor',
        ['RemoveArmor'] = 'fjerne dit armor'
    },
    AllowedJobs = {'Politi', 'Politi Chef', 'Idk'}
}