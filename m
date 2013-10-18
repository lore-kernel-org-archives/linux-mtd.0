Received: from mail-wi0-f180.google.com ([209.85.212.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VXDT3-00024T-Mg
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 17:04:06 +0000
Received: by mail-wi0-f180.google.com with SMTP id ey11so1343087wid.13
 for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2013 10:03:43 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 18 Oct 2013 10:03:43 -0700
Message-ID: <CAJ+vNU1JWZp=JoBDJALh59yFybGZ0iQxMEYy8qvTFGDLhyRzqg@mail.gmail.com>
Subject: gpmi-mtd ecc regression
From: Tim Harvey <tharvey@gateworks.com>
To: linux-mtd@lists.infradead.org, Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Huang,

The patch you made to obtain ECC info from the chip
(http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/mtd/nand/gpmi-nand?id=2febcdf84b75aae627c61f0a5bf531a69299966c)
has caused a regression for an i.MX6 board I'm working with that uses
NAND and ubifs.

I'm using a Micron MT29F8G08
(http://download.micron.com/pdf/datasheets/flash/nand/2_4_8gb_nand_m49a.pdf)
which has:
page size: 2112 bytes (2048 + 64 bytes)
block size: 1056 words (1024 + 32 words)
plane size: 2 planes x 1024 blocks per plane
device size: 2Gb: 2048 blocks
ecc: 4bit

The legacy_set_geometry function comes up with:
gf_len=13
ecc_strength=8
page_size=2112
metadata_size=10
ecc_chunk_size=512
ecc_chunk_count=4
payload_size=2048
auxiliary_size=16
auxiliary_status_offset=12
block_mark_byte_offset=1999

and the new set_geometry_by_ecc_info comes up with:
gf_len=13
ecc_strength=4
page_size=2084
metadata_size=10
ecc_chunk_size=512
ecc_chunk_count=4
payload_size=2048
auxiliary_size=16
auxiliary_status_offset=12
block_mark_byte_offset=2018
block_mark_bit_offset=4

There are two discrepancies above:
 a) ecc_strength - this part has 4bit ecc but being detected as 8?
 b) page_size - the legacy function includes oob in page size, and the
new one does not

which is correct?

With your patch using the new function to detect ECC from the part,
booting to a ubifs that was flashed with uboot (which incidentally
also set ecc_strength=8) I get endless ECC failures:

[    3.946205] UBI: attaching mtd2 to ubi0
[    3.946585] UBI warning: ubi_io_read: error -74 (ECC error) while
reading 64 bytes from PEB 0:0, read only 64 bytes, retry
[    3.946785] UBI warning: ubi_io_read: error -74 (ECC error) while
reading 64 bytes from PEB 0:0, read only 64 bytes, retry
[    3.946983] UBI warning: ubi_io_read: error -74 (ECC error) while
reading 64 bytes from PEB 0:0, read only 64 bytes, retry
[    3.947177] UBI error: ubi_io_read: error -74 (ECC error) while
reading 64 bytes from PEB 0:0, read 64 bytes
[    3.947186] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.12.0-rc3+ #253
[    3.947192] Backtrace:
[    3.947220] [<8001265c>] (dump_backtrace+0x0/0x10c) from
[<800127fc>] (show_stack+0x18/0x1c)
[    3.947230]  r6:00000040 r5:ffffffb6 r4:00000000 r3:00000000
[    3.947247] [<800127e4>] (show_stack+0x0/0x1c) from [<80661820>]
(dump_stack+0x78/0x94)
[    3.947269] [<806617a8>] (dump_stack+0x0/0x94) from [<803b4ebc>]
(ubi_io_read+0x12c/0x364)
[    3.947274]  r4:bf09e000 r3:00000000
[    3.947285] [<803b4d90>] (ubi_io_read+0x0/0x364) from [<803b533c>]
(ubi_io_read_ec_hdr+0x60/0x330)
[    3.947295] [<803b52dc>] (ubi_io_read_ec_hdr+0x0/0x330) from
[<803bb2dc>] (ubi_attach+0x160/0x15f0)
[    3.947304] [<803bb17c>] (ubi_attach+0x0/0x15f0) from [<803ae5f0>]
(ubi_attach_mtd_dev+0x794/0xf18)
[    3.947319] [<803ade5c>] (ubi_attach_mtd_dev+0x0/0xf18) from
[<808d9850>] (ubi_init+0x1f8/0x2bc)
[    3.947330] [<808d9658>] (ubi_init+0x0/0x2bc) from [<80008880>]
(do_one_initcall+0xdc/0x194)
[    3.947342] [<800087a4>] (do_one_initcall+0x0/0x194) from
[<808aeb94>] (kernel_init_freeable+0x104/0x1d0)
[    3.952386] [<808d9658>] (ubi_init+0x0/0x2bc) from [<80008880>]
(do_one_initcall+0xdc/0x194)
[    3.960828] [<800087a4>] (do_one_initcall+0x0/0x194) from
[<808aeb94>] (kernel_init_freeable+0x104/0x1d0)
[    3.967418] [<800087a4>] (do_one_initcall+0x0/0x194) from
[<808aeb94>] (kernel_init_freeable+0x104/0x1d0)
[    3.967426] [<808aea90>] (kernel_init_freeable+0x0/0x1d0) from
[<8065c74c>] (kernel_init+0x10/0xec)

Ideas?

Thanks,

Tim
