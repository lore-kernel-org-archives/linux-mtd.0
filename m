From: hno@marasystems.com (Henrik Nordstrom)
Date: Sun, 16 Mar 2003 23:45:08 +0100 (CET)
Subject: Using a DoC [continued]
In-Reply-To: <000001c2ebf0$508d2160$82ca580c@who5>
Message-ID: <Pine.LNX.4.44.0303162328470.6952-100000@filer.marasystems.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

If you get as far as GRUB then you should be able to boot pretty much
anything by just entering the correct grub command line..

Your options to bypass GRUB when installed on the DoC depends on how your 
GRUB was built. There is many ways of having the GRUB "DoC BIOS" build, 
giving various degree of bypass capability

a) If the bootblock includes the bypass hook then just press the required 
key combination (Control key in the versions of this patch I have seen) to 
temporarily disable GRUB.

b) If GRUB is built to hook into network boot (INT18) instead of bootstrap
(INT19) then disable LAN booting in your system BIOS. This is recommended
if you want a flexible boot procedure as the boot order is then under the
control of your system BIOS, but I suspect this may collide with other
network boot roms in some systems..

Neither of these GRUB bypass options is enabled by default.

Both methods are documented in README_DiskOnChip.

Regards
Henrik



On Sun, 16 Mar 2003, Gregg C Levine wrote:

> Hello again from Gregg C Levine
> Basically everything works. Now with the card plugged into the
> computer, it promptly runs through the boot sequence, and then
> displays "Found DoC".
> 
> Then the firmware on it, runs, and it displays the GRUB-0.92
> messaging. This happens even with the chosen hard drive installed. The
> system thinks that the Disk On Chip is the only disk drive in the
> system, and is annoyed that it can't find the menu list from the usual
> locations.
> 
> Personally, I am not surprised by this. Only mystified. I suspect I
> should have obtained a secondary system to manage my Disk On Chip
> activities, and tests on. Any methods available for resetting the
> device back to the original firmware? And so that it will boot from
> floppy, rather then wanting to boot from the Disk On Chip?
> -------------------
> Gregg C Levine hansolofalcon at worldnet.att.net
> ------------------------------------------------------------
> "The Force will be with you...Always." Obi-Wan Kenobi
> "Use the Force, Luke."? Obi-Wan Kenobi
> (This company dedicates this E-Mail to General Obi-Wan Kenobi )
> (This company dedicates this E-Mail to Master Yoda )
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
