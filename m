Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UziEo-0002I4-VP
 for linux-mtd@lists.infradead.org; Thu, 18 Jul 2013 07:02:56 +0000
Received: by mail-vc0-f181.google.com with SMTP id lf11so2013450vcb.26
 for <linux-mtd@lists.infradead.org>; Thu, 18 Jul 2013 00:02:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1373445550.346364381@f159.i.mail.ru>
References: <1373445550.346364381@f159.i.mail.ru>
Date: Thu, 18 Jul 2013 00:02:32 -0700
Message-ID: <CAN8TOE_oOj9yVPMjTOKwgfWvNoVPTUm4jAOE-Z0Mfko+bjnzng@mail.gmail.com>
Subject: Re: Resend: NAND 16bit ONFI problem
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding Matthieu, since he introduced NAND_BUSWIDTH. Leaving full context intact.

On Wed, Jul 10, 2013 at 1:39 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
> Hello.
>
> Updated: Same effect for 3.10 kernel.
>
> --------
>
> I have a problem with attach NAND UBI in 16 bit mode.
> NAND works fine if I specify NAND_BUSWIDTH_16 option, but not
> working with NAND_BUSWIDTH_AUTO option. In second case NAND
> chip is identifyed with ONFI. Logs below.
> Can anyone help me with this issue? Is it a known problem?
> Thanks.
> PS: Kernel 3.9.3

I'm inspecting the NAND_BUSWIDTH_AUTO code and it looks rather broken.
For chips with NAND_BUSWIDTH_AUTO, it calls nand_set_defaults() twice.
The second call will do exactly nothing. To do this right, you'll
probably have to hack up nand_set_defaults() so that it will check if
the function pointer is one of two options:

1. NULL
2. the 8-bit version

My (untested, not compiled, and possibly line-wrapped) patch:

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index acd2fc9..26aad56 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2786,7 +2786,7 @@ static void nand_set_defaults(struct nand_chip
*chip, int busw)

 	if (!chip->select_chip)
 		chip->select_chip = nand_select_chip;
-	if (!chip->read_byte)
+	if (!chip->read_byte || chip->read_byte == nand_read_byte)
 		chip->read_byte = busw ? nand_read_byte16 : nand_read_byte;
 	if (!chip->read_word)
 		chip->read_word = nand_read_word;
@@ -2794,9 +2794,9 @@ static void nand_set_defaults(struct nand_chip
*chip, int busw)
 		chip->block_bad = nand_block_bad;
 	if (!chip->block_markbad)
 		chip->block_markbad = nand_default_block_markbad;
-	if (!chip->write_buf)
+	if (!chip->write_buf || chip->write_buf == nand_write_buf)
 		chip->write_buf = busw ? nand_write_buf16 : nand_write_buf;
-	if (!chip->read_buf)
+	if (!chip->read_buf || chip->read_buf == nand_read_buf)
 		chip->read_buf = busw ? nand_read_buf16 : nand_read_buf;
 	if (!chip->scan_bbt)
 		chip->scan_bbt = nand_default_bbt;

> New chip, first start, NAND_BUSWIDTH_AUTO:
>
> ONFI param page 0 valid
> ONFI flash detected
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xca (Micron MT29F2G16ABAEAWP), 256MiB, page size: 2048, OOB size: 64
> Scanning device for bad blocks
> Creating 1 MTD partitions on "MT29F2G16ABAEAWP":
> 0x000000000000-0x000010000000 : "nand-gpio"
> UBI: attaching mtd4 to ubi0
> UBI: scanning is finished
> UBI: empty MTD device detected
> UBI: attached mtd4 (name "nand-gpio", size 256 MiB) to ubi0
> UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
> UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
> UBI: VID header offset: 512 (aligned 512), data offset: 2048
> UBI: good PEBs: 2048, bad PEBs: 0, corrupted PEBs: 0
> UBI: user volume: 0, internal volumes: 1, max. volumes count: 128
> UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 2920475650
> UBI: available PEBs: 2004, total reserved PEBs: 44, PEBs reserved for bad PEB handling: 40
> UBI: background thread "ubi_bgt0d" started, PID 22
>
>
> sync && reboot:
>
> ONFI param page 0 valid
> ONFI flash detected
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xca (Micron MT29F2G16ABAEAWP), 256MiB, page size: 2048, OOB size: 64
> Scanning device for bad blocks
> Creating 1 MTD partitions on "MT29F2G16ABAEAWP":
> 0x000000000000-0x000010000000 : "nand-gpio"
> UBI: attaching mtd4 to ubi0
> UBI: fixable bit-flip detected at PEB 2
> UBI: fixable bit-flip detected at PEB 3
> UBI: fixable bit-flip detected at PEB 4
> UBI: fixable bit-flip detected at PEB 5
> UBI: fixable bit-flip detected at PEB 6
> UBI: fixable bit-flip detected at PEB 7
> ...
>
>
> NAND_BUSWIDTH_16:
>
> Trying ONFI probe in 16 bits mode, aborting !
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xca (Micron NAND 256MiB 3,3V 16-bit), 256MiB, page size: 2048, OOB size: 64
> Scanning device for bad blocks
> Creating 1 MTD partitions on "NAND 256MiB 3,3V 16-bit":
> 0x000000000000-0x000010000000 : "nand-gpio"
> UBI: attaching mtd4 to ubi0
> UBI: scanning is finished
> UBI: empty MTD device detected
> UBI: attached mtd4 (name "nand-gpio", size 256 MiB) to ubi0
> UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
> UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
> UBI: VID header offset: 512 (aligned 512), data offset: 2048
> UBI: good PEBs: 2048, bad PEBs: 0, corrupted PEBs: 0
> UBI: user volume: 0, internal volumes: 1, max. volumes count: 128
> UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 2573182024
> UBI: available PEBs: 2004, total reserved PEBs: 44, PEBs reserved for bad PEB handling: 40
> UBI: background thread "ubi_bgt0d" started, PID 23
>
> ----------------
>

Brian
