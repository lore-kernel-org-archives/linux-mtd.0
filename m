From: jasmine@regolith.co.uk (Jasmine Strong)
Date: Wed, 26 Feb 2003 01:41:03 +0000
Subject: "Hot" updating root-mounted mtd partitions
In-Reply-To: <200302260131.11190@henrik.marasystems.com>
Message-ID: <5D750506-492B-11D7-A737-000393AD6294@regolith.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wednesday, Feb 26, 2003, at 00:31 Europe/London, Henrik Nordstrom 
wrote:

[trials and tribulations]

The way I have solved this problem in the past is to make the update 
actually
happen during the reboot.

This is a bit more 'feely' than just replacing the Flash contents with 
a new
image file but it leaves more wiggle room when things go wrong.

This is what you do:

1)  Download the update, a file at a time, so that all the 
non-conflicting or
	non-critical files are already in their final locations.  Obviously 
all the
	non-essential processes are halted before this happens.  Checksum
	all the downloaded files so that you are sure they are good.

2)  Download the new kernel.  It can replace the old one, unless you do
	kernel XIP, which would be unlikely in a modern STB (they're mostly
	NAND based for cost reasons.)

3)  Download a system updater binary.  Set the bootloader to run the
	updater binary on init and to use the new kernel.  Download the
	files to replace the open binaries and libraries into a temporary
	place.

4)  Put 'Please wait' on your LCD :-)  Garbage collect the flash and
       sync; sync; reboot the box.

...At this point the box reboots, the bootloader starts the new kernel 
and
the new kernel runs the updater binary.  The updater binary moves the
libraries and so forth into place, changes the bootloader configuration 
to
normal (whatever that is :-) and triggers a second reboot.

If anything goes wrong the updater binary is still running;  the flash 
has
never been completely wiped clean so the box has never been in that
'if you power down you have a beige brick' situation.

Jas.
