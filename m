From: vijoy@nortelnetworks.com (Vijoy Pandey)
Date: Fri, 28 Feb 2003 12:56:11 -0800
Subject: AMD 29LV640D
Message-ID: <3E5FCCEB.19ACA1EE@nortelnetworks.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Folks,

Has anyone used the mtd device with the AMD
LV640D chips? They are 64Mbit (4Mx16) chips
and are CFI-compatible.

I have a layout where 4 of these chips have
been arranged over a bus width of 64bits.

I have tried the following..

MTD RAM/ROM Config section:
16bit-buswidth
4 chip interleaving

MAP section:
Buswidth in octets = 2 (Tried 8, but got "unsupported")


Using the above, all the modules (physmap
cfi_probe map_rom chipreg gen_probe cfi_cmdset_0002 
mtdchar mtdcore, in reverse order) get inserted,
but I get a complaint of:
CFI: Found no Physically mapped flash device at location zero
Can't locate module jedec_probe

So, on a whim, I inserted the following in reverse
order - physmap jedec_probe cfi_probe map_rom chipreg 
gen_probe cfi_cmdset_0002 mtdchar mtdcore.

Again, everything gets inserted fine, but
I get "CFI: Found no Physically mapped flash device at 
location zero", and "JEDEC: Found no Physically mapped 
flash device at location zero".

*BUT*, now I am able to read from /dev/mtd0 anywhere
in the flash address space. While trying to write, I
get a "dd: cannot open /dev/mtd0: permission denied",
even though I am root, and the permissions are fine.

Any ideas as to what might be going on?

Thanks a bunch,
-vijoy
