From: joel@fireful.co.uk (joel at fireful.co.uk)
Date: Tue, 18 Mar 2003 13:03:08 -0000 (GMT)
Subject: MTD support on an MVME5100
Message-ID: <30006.217.37.98.114.1047992588.squirrel@webmail.netweaver.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,

I'm trying to get Linux MTD/JFFS working on an MVME5100 PowerPC board. The
flash device used is an AMD29DL323CT90VI. This is 32Mbit, organised as 2M
x 16bit on this board. Four devices are used to provide 16MByte,
interleaved so that each device provides the next 16 bits in the address
space. The physical bus is 64 bits wide, but only 32 bit writes are
allowed.

I recently fetched (in the last couple of weeks) a copy of the devel
branch of the 2.4 PPC kernel using Bitkeeper. It builds as 2.4.21-pre3. It
doesn't seem to support a 64 bit FLASH bus width though, and I've had no
luck with 16 and 32 bit bus widths. I didn't use the advanced CFI options,
to let it try all of the probes.

I used the following commands to load the modules (taken from the MTD,
JFFS HOWTO):

# modprobe -a mtdchar mtdblock cfi_cmdset_0002 map_rom cfi_probe
# modprobe -a physmap

The physmap module failed to load, and the following messages were printed
to the console:

# physmap flash device: 1000000 at f4000000
# CFI: Found no Physically mapped flash device at location zero

Is FLASH on the MVME5100 supported by the MTD, and if so in what version?

Thanks,

Joel
