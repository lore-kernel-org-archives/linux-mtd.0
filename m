From: hno@marasystems.com (Henrik Nordstrom)
Date: 17 Mar 2003 14:30:38 +0100
Subject: New problem with DoC
In-Reply-To: <001701c2ec78$b3f1e3c0$dbc3580c@who5>
References: <001701c2ec78$b3f1e3c0$dbc3580c@who5>
Message-ID: <1047907838.3306.81.camel@henrik.marasystems.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I did not get the bypass to work in the 4.2 firmware. Have only
succeeded using the M-Sys bypass when using 5.X firmware.

However, if the system does not even print the M-SYS banner when
programmed with the M-Sys firmware then the firmware on the module is
completely non-functional and the module needs to be reformatted (or at
a minimum have the firmware reinstalled). The M-Sys bypass only works if
the firmware works in the first place and can only deactivate the
installation of the emulated harddrive.

Reformatting a "busted" DoC having a bad firmware installed is a little
hard unless you have a burner, but there is some dirty tricks you can
try such as plugging the DoC module while the system is running and
other similar adventures, but is nothing I would recommend unless all
other options have been exhausted as it may easily burn both your board
and the DoC module..

Regards
Henrik



m?n 2003-03-17 klockan 12.31 skrev Gregg C Levine:

> Hello again from Gregg C Levine
> Actually Henrik, it's also documented in the release notes for the
> 4.2.2 material for Linux for the Disk On Chip, as well. And from what
> I can see also in the release notes in the 4.2 series of material as
> well. I've contacted M-SYS technical support so I'll see what happens.
> There's got to be something that I can do, as the company can't afford
> to buy any of these things until sometime next month.
> -------------------
> Gregg C Levine hansolofalcon at worldnet.att.net
> ------------------------------------------------------------
> "The Force will be with you...Always." Obi-Wan Kenobi
> "Use the Force, Luke."  Obi-Wan Kenobi
> (This company dedicates this E-Mail to General Obi-Wan Kenobi )
> (This company dedicates this E-Mail to Master Yoda )
> 
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
Henrik Nordstrom <hno@marasystems.com>
MARA Systems AB
