Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OlURm-000181-AM
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2010 22:15:55 +0000
Message-ID: <4C6B0836.5030602@broadcom.com>
Date: Tue, 17 Aug 2010 15:07:50 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "Abdoulaye Walsimou GAYE" <awg@embtoolkit.org>
Subject: Re: [BUG] Nand support broken with v2.6.36-rc1
References: <20100817113644.GA31317@gibson.comsick.at>
	<4C6AC037.7070205@broadcom.com> <4C6AF83E.6050408@embtoolkit.org>
In-Reply-To: <4C6AF83E.6050408@embtoolkit.org>
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/17/2010 01:59 PM, Abdoulaye Walsimou GAYE wrote:
> Hello,
> I don't know if it's the same issue reported here (sorry if not), but
> when I use flash_eraseall
> to erase a partition of a NAND flash[1] with linux-2.6.33.5 running on
> the target here is the output:
> 
> # flash_eraseall  /dev/mtd3
> Erasing 16 Kibyte @ 1270000 -- 31 % complete.
> Skipping bad block at 0x01274000
> Erasing 16 Kibyte @ 3aa0000 -- 100 % complete.
> 
> And if it is latest linus tree (v2.6.36-rc1):
> 
> # flash_eraseall  /dev/mtd3
> Erasing 16 Kibyte @ 1274000 -- 31 % complete.
> flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error
> Erasing 16 Kibyte @ 3aa0000 -- 100 % complete.
> 
> Now 0x01274000 is not recognized as bad block.
> I use flash_eraseall from latest mtd-utils git tree
> (07a87aa599a8fc32e938d9987bd2b59eebcfcb76)
> 
> Do you think it's the same issue?
> 
> Thanks,
> AWG
> 
> [1]
> S3C24XX NAND Driver, (c) 2004 Simtec Electronics
> s3c24xx-nand s3c2440-nand: Tacls=1, 9ns Twrph0=3 29ns, Twrph1=2 19ns
> s3c24xx-nand s3c2440-nand: NAND hardware ECC
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB
> 3,3V 8-bit)
> Creating 4 MTD partitions on "NAND 64MiB 3,3V 8-bit":
> 0x000000000000-0x000000040000 : "u-boot"
> 0x000000040000-0x000000060000 : "u-boot-env"
> 0x000000060000-0x000000560000 : "kernel"
> 0x000000560000-0x000004000000 : "root"

This is not the *same* problem (you have a Samsung, not Hynix, part);
however, it may be related, esp. considering they have the same
device ID (0x76). Can you isolate the problem down to that same
commit?
c7b28e25cb9beb943aead770ff14551b55fa8c79
mtd: nand: refactor BB marker detection

That commit may not the problem, your problem is also likely related to:
58373ff0afff4cc8ac40608872995f4d87eb72ec

If commit c7b28e... is the problem, then perhaps you can try the
following patch (applied to 2.6.36-rc1) that I recommended to Michael.
I can't see quite *why* this patch would fix this issue for your Samsung
part, whereas, it makes perfect sense for the Hynix part.

Let me know how that goes.

Thanks,
Brian

---
 drivers/mtd/nand/nand_base.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c7473..a22ed7b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2934,14 +2934,10 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32)) + 32 - 1;
 
 	/* Set the bad block position */
-	if (!(busw & NAND_BUSWIDTH_16) && (*maf_id == NAND_MFR_STMICRO ||
-				(*maf_id == NAND_MFR_SAMSUNG &&
-				 mtd->writesize == 512) ||
-				*maf_id == NAND_MFR_AMD))
-		chip->badblockpos = NAND_SMALL_BADBLOCK_POS;
-	else
+	if (mtd->writesize > 512 || (busw & NAND_BUSWIDTH_16))
 		chip->badblockpos = NAND_LARGE_BADBLOCK_POS;
-
+	else
+		chip->badblockpos = NAND_SMALL_BADBLOCK_POS;
 
 	/* Get chip options, preserve non chip based options */
 	chip->options &= ~NAND_CHIPOPTIONS_MSK;
-- 
1.7.0.4
