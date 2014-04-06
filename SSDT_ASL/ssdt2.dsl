/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140325-64 [Apr  5 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of ssdt2.dd, Sun Apr  6 12:56:42 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000003DE (990)
 *     Revision         0x01
 *     Checksum         0x66
 *     OEM ID           "AMD   "
 *     OEM Table ID     "POWERNOW"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "AMD "
 *     Compiler Version 0x00000001 (1)
 */
DefinitionBlock ("ssdt2.aml", "SSDT", 1, "AMD   ", "POWERNOW", 0x00000001)
{

    External (_PR_.C000, DeviceObj)
    External (_PR_.C001, DeviceObj)

    Scope (\_PR.C000)
    {
        Name (_PCT, Package (0x02)  // _PCT: Performance Control
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000C0010062, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }
        })
        Name (_PSS, Package (0x03)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x00000672, 
                0x000017BB, 
                0x00000000, 
                0x00000000, 
                0x00000000, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000528, 
                0x00000E10, 
                0x00000000, 
                0x00000000, 
                0x00000001, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x00000339, 
                0x0000059A, 
                0x00000000, 
                0x00000000, 
                0x00000002, 
                0x00000002
            }
        })
        Name (XPSS, Package (0x03)
        {
            Package (0x08)
            {
                0x00000672, 
                0x000017BB, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000528, 
                0x00000E10, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000339, 
                0x0000059A, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }
        })
        Name (_PSD, Package (0x01)  // _PSD: Power State Dependencies
        {
            Package (0x05)
            {
                0x05, 
                0x00, 
                0x00000000, 
                0x000000FC, 
                0x00000002
            }
        })
        Name (_PPC, 0x00)  // _PPC: Performance Present Capabilites
        Name (_CST, Package (0x02)  // _CST: C-States
        {
            0x01, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000841, // Address
                        0x01,               // Access Size
                        )
                }, 

                0x02, 
                0x0064, 
                0x00000000
            }
        })
    }

    Scope (\_PR.C001)
    {
        Name (_PCT, Package (0x02)  // _PCT: Performance Control
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000C0010062, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }
        })
        Name (_PSS, Package (0x03)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x00000672, 
                0x000017BB, 
                0x00000000, 
                0x00000000, 
                0x00000000, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000528, 
                0x00000E10, 
                0x00000000, 
                0x00000000, 
                0x00000001, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x00000339, 
                0x0000059A, 
                0x00000000, 
                0x00000000, 
                0x00000002, 
                0x00000002
            }
        })
        Name (XPSS, Package (0x03)
        {
            Package (0x08)
            {
                0x00000672, 
                0x000017BB, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000528, 
                0x00000E10, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000339, 
                0x0000059A, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }
        })
        Name (_PSD, Package (0x01)  // _PSD: Power State Dependencies
        {
            Package (0x05)
            {
                0x05, 
                0x00, 
                0x00000000, 
                0x000000FC, 
                0x00000002
            }
        })
        Name (_PPC, 0x00)  // _PPC: Performance Present Capabilites
        Name (_CST, Package (0x02)  // _CST: C-States
        {
            0x01, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000841, // Address
                        0x01,               // Access Size
                        )
                }, 

                0x02, 
                0x0064, 
                0x00000000
            }
        })
    }
}

