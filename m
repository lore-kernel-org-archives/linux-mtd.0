Received: from h-67-102-66-132.snfccasy.covad.net ([67.102.66.132]
	helo=hheld.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fxpqb-000507-IT
	for linux-mtd@lists.infradead.org; Tue, 04 Jul 2006 14:42:15 -0400
Received: from [206.15.76.194] (HELO RudiDell)
	by hheld.com (CommuniGate Pro SMTP 4.3.7)
	with ESMTPS id 793630 for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2006 11:39:39 -0700
From: "David Byron" <dbyron@hheld.com>
To: <linux-mtd@lists.infradead.org>
Subject: CFI info for Atmel AT49BV322A
Date: Tue, 4 Jul 2006 11:39:17 -0700
Message-ID: <001301c69f99$28e53340$a134800a@RudiDell>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Reply-To: dbyron@hheld.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think the code for processing the extended query info for the Atmel
AT49BV322A doesn't match what the chip provides.  I'm not sure this is a =
big
deal, but it's the first thing I found when looking into what I think is
confusion over sector erase size.  The datasheet for the chip is here:

http://www.atmel.com/dyn/resources/prod_documents/doc3308.pdf

Here's what I see:

- The first 8 sectors are 8K each
- The next 63 sectors are 64K each
- There's support for this chip in jedec_probe (manufacturer 0x1F, =
device id
0xC8) with the correct erase layout
- I can only detect the chip using cfi

Here's the CFI info I see:

Number of erase regions: 2
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0041
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  2.7 V
Vcc Maximum:  3.6 V
Vpp Minimum: 11.5 V
Vpp Maximum: 12.5 V
Typical byte/word write timeout: 16 =B5s
Maximum byte/word write timeout: 256 =B5s
Full buffer write not supported
Typical block erase timeout: 1024 ms
Maximum block erase timeout: 4096 ms
Typical chip erase timeout: 65536 ms
Maximum chip erase timeout: 262144 ms
Device size: 0x400000 bytes (4 MiB)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x10000 bytes, 63 blocks
  Erase Region #1: BlockSize 0x2000 bytes, 8 blocks

which all looks correct.  The extended query info:

 Amd/Fujitsu Extended Query Table at 0x0041 (16 bytes)
  Silicon revision: 67
  Address sensitive unlock: Not required
  Erase Suspend: Read only
  Block protection: Not supported
  Temporary block unprotect: Not supported
  Block protect/unprotect scheme: 128
  Number of simultaneous operations: 3
  Burst mode: Supported
  Page mode: 1020 word page
  Vpp Supply Minimum Program/Erase Voltage: 15.15 V
  Vpp Supply Maximum Program/Erase Voltage: 15.15 V
  Top/Bottom Boot Block: Unknown value 255
phys_mapped_flash: CFI does not contain boot bank location. Assuming =
top.
number of CFI chips: 1
cfi_amdstd_setup: 2 erase regions
0: offset=3D0x0,size=3D0x10000,blocks=3D63
1: offset=3D0x3f0000,size=3D0x2000,blocks=3D8
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.

Doesn't seem right.  This chip doesn't provide silicon revision (see =
page 28
of the data sheet).  Also, it seems like the erase regions don't have =
the
correct offset....I think region 0 (with 63 64k blocks) should have =
offset
0x10000 and region 1 should have offset 0 since the little blocks begin =
the
chip.  Looking at the info in CFI, I'm not sure how the software is =
supposed
to figure that out.

My real cause for concern comes with the physmap partition code.  The =
option
I give to the kernel is:

mtdparts=3Dphys_mapped_flash:128K(u-boot),64K(boot-params),-(kernel)

In other words, the first partition contains the 8 8k sectors and 1 64K
sector.  I didn't decide to organize it like this, but for now this is =
it.

I added some extra debug to mtdpart.c and now I see this:

Creating 3 MTD partitions on "phys_mapped_flash":
add_mtd_partitions: master mtd_info numeraseregions is 2
0x00000000-0x00020000 : "u-boot"
add_mtd_partitions: multiple erase regions
add_mtd_partitions: partition 0: first erase region is 1 (size 8192)
add_mtd_partitions: erase size 65536
add_mtd_partitions: numeraseregions 0
0x00020000-0x00030000 : "boot-params"
add_mtd_partitions: multiple erase regions
add_mtd_partitions: partition 1: first erase region is 1 (size 8192)
add_mtd_partitions: erase size 65536
add_mtd_partitions: numeraseregions 0
0x00030000-0x00400000 : "kernel"
add_mtd_partitions: multiple erase regions
add_mtd_partitions: partition 2: first erase region is 1 (size 8192)
add_mtd_partitions: erase size 65536
add_mtd_partitions: numeraseregions 0

Seems like the erase size for the u-boot partition isn't correct since =
part
of is 8192 and part is 65536.  I haven't tried erasing it just yet since =
I
don't want to torch the bootloader unless I'm pretty sure it's going to
work.

Is this just a matter of adding/fixing some logic in add_mtd_partitions? =
 If
I fix the way the cfi extended query works, will that somehow let the =
code
figure out the right thing?  If that's the way forward, should I declare
another packed structure in include/linux/mtd/cfi.h and then use it when =
the
device id matches?

Thanks for your help.

-DB
