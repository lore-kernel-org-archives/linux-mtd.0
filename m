Received: from nz-out-0102.google.com ([64.233.162.200])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FbTYJ-0001Vy-Cd
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 22:26:54 -0400
Received: by nz-out-0102.google.com with SMTP id z6so348990nzd
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 May 2006 19:26:47 -0700 (PDT)
Message-ID: <c0c067900605031926w730bc9a3sed5c7eee03585b2b@mail.gmail.com>
Date: Wed, 3 May 2006 22:26:45 -0400
From: "Dan Merillat" <harik.attar@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: CFI Extended (Intel P30) problems on an ARM PXA255
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I originally sent this to the linux-arm list, but it's looking more
and more like either a MTD issue, or a hardware issue with our board.

We have a custom PXA255 board, based on the generic Intel reference
design.  Nothing very
complex at all.   RAM, Strataflash (P30), JTAG and a serial port is
all I have active at this point.

Everything works correctly, until I try to write to the filesystem.=20
As soon as I do, I start getting JFFS corruption notices.  It's fairly
obvious what's wrong: All reads are returning 0x0080, the 'Ok' status
bit.   I can break in the jtag, write a reset to the flash, and
continue, and new reads work properly, until I write again (or the
original write retries).

I thought it might be a memory timing issue, but I pulled the timing
register (MSC0) and applied the faster timings to u-boot, and it can
still read and write the flash properly.    System speed and memory
speed are also the same (200mhz/100mhz) for both u-boot and linux.

I started from the gumstix.org tree, so I'm currently using their
static-partitions patch until I can patch something better in.  It
only touches the maps/ directory to create their MTD partition info.

trimmed dmesg:

Linux version 2.6.15gum (harik=A7taz) (gcc version 3.4.5) #5 Tue May 2
18:43:14 EDT 2006
CPU: XScale-PXA255 =C469052d06=DC revision 6 (ARMv5TE)
Machine: The Gumstix Platform
Memory policy: ECC disabled, Data cache writeback
Memory clock: 99.53MHz (*27)
Run Mode clock: 199.07MHz (*2)
Turbo Mode clock: 199.07MHz (*1.0, inactive)
CPU0: D VIVT undefined 5 cache
CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
Built 1 zonelists
Kernel command line: console=3DttyS0,115200n8 rootfstype=3Djffs2
reboot=3Dcold,hard init=3D/bin/sh root=3D1f01
...
Probing Gumstix Flash ROM at physical address 0x00000000 (16-bit bankwidth)
Gumstix Flash ROM: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Using static partitions on Gumstix Flash ROM
Creating 2 MTD partitions on "Gumstix Flash ROM":
0x00000000-0x00040000 : "Bootloader"
0x00040000-0x02000000 : "RootFS"

....

Write error in obliterating obsoleted node at 0x00102318: -30
Node header CRC failed at 0030171c. But it must have been OK earlier.
Node was: =E4 0080, 2080, 00800080, 00800080 =FC
Node totlen on flash (0x00800080) !=3D totlen from node ref (0x00000030)


What are the exit points from mtd erase/write operations?  I was
thinking of putting a test-read of phys 0x0 and comparing to 0x0080 to
see if I'm getting real data, and if not, to
re-send the CFI_RESET.  I just can't follow the internals well enough
to figure where that's happening.

I have not ruled out hardware, but I have tested it quite a bit with
the CFI driver of u-boot and I havn't seen this problem there.

Thanks in advance for any help.

--Dan
