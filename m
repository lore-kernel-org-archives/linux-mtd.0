Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CD7C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 08:46:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A45214AE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 08:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dXNEUYr4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="AehNnrTG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A45214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MinjXs9WfxXNw/WhixNrKF1bXjFSVX8kaFj4Ql7Lrqw=; b=dXNEUYr4m9uMy3hIRnGO1MhrUG
	rouN7VDU9QGm0XmcfVAA9IK0DfeZ/HucTTgrskusMNNY55a6xOoEcYlou9De2G8k1rqNdrh88LXZO
	1N27jqfBoITFuFjE3adQBg9rz/I73LGtm9pwxOZB+YuXLULpVcz5pOTz9F0DX4sCxAnIg7nm5+uCg
	BDmrQ47ofSMLxORM5InjIFujEksgFaNQ3fN1nVnhdLqhvShEEjSqNgADSnA5fV6wzZb8An3fHfqY4
	jAH4PVNrkcW2CyDRhmb3+Fx7ESUuRzsCW/hzn8KqfSVUfqza95h2UYFn2RM8+JY64GZdTDR9RofPY
	39Xp6Psg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3d3K-00017q-Qo; Tue, 12 Mar 2019 08:46:26 +0000
Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3d2e-000076-Id
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 08:45:48 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id x2C8j6Zb004092;
 Tue, 12 Mar 2019 17:45:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x2C8j6Zb004092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1552380316;
 bh=/fdtXUQ1tDw8khieyu/bhW6CDbduWdbRweP4Qu1RY0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AehNnrTGCTGIr5GTCikJJbGnpaN5TEyLtekhMhjmfDI8t4qTfErnf+Yol3EVjVw/h
 NcF6FWVtw28SEbx1cEzRNcdK1E/g5gLwjR9GE96j/LEpZBnFKeygwvf1uZDHn+8rB3
 gpbQgUyWTfBPE4WuMrgCzHSnivQADaI/NJ8VbKeqYNSKLSU436/fEOeOIGjv3/amc7
 wOk0o24qF5wT71IDktmHnk6TwQrRxg0qtHGbGqpHFhtMTqUsqL2J9lrgMVgf5sbB/p
 qDSzwiUjV5f08MnC3xJdAc0xvZKt6lSK6OuV2yNkpTQkdCrNTZ8aGnR24fjEGmQ43I
 EWZ31/QZ+9mvg==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 1/9] mtd: rawnand: denali: use nand_chip pointer more for
 internal functions
Date: Tue, 12 Mar 2019 17:44:42 +0900
Message-Id: <1552380290-19951-2-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
References: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_014545_012215_492C25AF 
X-CRM114-Status: GOOD (  15.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

With the recent refactoring, the NAND driver hooks now take a pointer
to nand_chip. Add to_denali() in order to convert (struct nand_chip *)
to (struct denali_nand_info *) directly. It is more useful than the
current mtd_to_denali().

I changed some helper functions to take (struct nand_chip *). This will
avoid pointer conversion back and forth, and ease further development.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/raw/denali.c | 57 ++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 24aeafc..4ac1314 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -47,6 +47,11 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
 	return container_of(mtd_to_nand(mtd), struct denali_nand_info, nand);
 }
 
+static struct denali_nand_info *to_denali(struct nand_chip *chip)
+{
+	return container_of(chip, struct denali_nand_info, nand);
+}
+
 /*
  * Direct Addressing - the slave address forms the control information (command
  * type, bank, block, and page address).  The slave data is the actual data to
@@ -282,12 +287,12 @@ static void denali_cmd_ctrl(struct nand_chip *chip, int dat, unsigned int ctrl)
 	denali->host_write(denali, DENALI_BANK(denali) | type, dat);
 }
 
-static int denali_check_erased_page(struct mtd_info *mtd,
-				    struct nand_chip *chip, uint8_t *buf,
+static int denali_check_erased_page(struct nand_chip *chip,
+				    struct denali_nand_info *denali, u8 *buf,
 				    unsigned long uncor_ecc_flags,
 				    unsigned int max_bitflips)
 {
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	struct mtd_ecc_stats *ecc_stats = &nand_to_mtd(chip)->ecc_stats;
 	uint8_t *ecc_code = chip->oob_poi + denali->oob_skip_bytes;
 	int ecc_steps = chip->ecc.steps;
 	int ecc_size = chip->ecc.size;
@@ -303,9 +308,9 @@ static int denali_check_erased_page(struct mtd_info *mtd,
 						  NULL, 0,
 						  chip->ecc.strength);
 		if (stat < 0) {
-			mtd->ecc_stats.failed++;
+			ecc_stats->failed++;
 		} else {
-			mtd->ecc_stats.corrected += stat;
+			ecc_stats->corrected += stat;
 			max_bitflips = max_t(unsigned int, max_bitflips, stat);
 		}
 
@@ -316,11 +321,11 @@ static int denali_check_erased_page(struct mtd_info *mtd,
 	return max_bitflips;
 }
 
-static int denali_hw_ecc_fixup(struct mtd_info *mtd,
+static int denali_hw_ecc_fixup(struct nand_chip *chip,
 			       struct denali_nand_info *denali,
 			       unsigned long *uncor_ecc_flags)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtd_ecc_stats *ecc_stats = &nand_to_mtd(chip)->ecc_stats;
 	int bank = denali->active_bank;
 	uint32_t ecc_cor;
 	unsigned int max_bitflips;
@@ -346,16 +351,17 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
 	 * Unfortunately, we can not know the total number of corrected bits in
 	 * the page.  Increase the stats by max_bitflips. (compromised solution)
 	 */
-	mtd->ecc_stats.corrected += max_bitflips;
+	ecc_stats->corrected += max_bitflips;
 
 	return max_bitflips;
 }
 
-static int denali_sw_ecc_fixup(struct mtd_info *mtd,
+static int denali_sw_ecc_fixup(struct nand_chip *chip,
 			       struct denali_nand_info *denali,
 			       unsigned long *uncor_ecc_flags, uint8_t *buf)
 {
-	unsigned int ecc_size = denali->nand.ecc.size;
+	struct mtd_ecc_stats *ecc_stats = &nand_to_mtd(chip)->ecc_stats;
+	unsigned int ecc_size = chip->ecc.size;
 	unsigned int bitflips = 0;
 	unsigned int max_bitflips = 0;
 	uint32_t err_addr, err_cor_info;
@@ -404,7 +410,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 			/* correct the ECC error */
 			flips_in_byte = hweight8(buf[offset] ^ err_cor_value);
 			buf[offset] ^= err_cor_value;
-			mtd->ecc_stats.corrected += flips_in_byte;
+			ecc_stats->corrected += flips_in_byte;
 			bitflips += flips_in_byte;
 
 			max_bitflips = max(max_bitflips, bitflips);
@@ -587,9 +593,11 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 	return ret;
 }
 
-static int denali_data_xfer(struct denali_nand_info *denali, void *buf,
-			    size_t size, int page, int raw, int write)
+static int denali_data_xfer(struct nand_chip *chip, void *buf, size_t size,
+			    int page, int raw, int write)
 {
+	struct denali_nand_info *denali = to_denali(chip);
+
 	iowrite32(raw ? 0 : ECC_ENABLE__FLAG, denali->reg + ECC_ENABLE);
 	iowrite32(raw ? TRANSFER_SPARE_REG__FLAG : 0,
 		  denali->reg + TRANSFER_SPARE_REG);
@@ -678,7 +686,7 @@ static int denali_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	size_t size = writesize + oobsize;
 	int ret, i, pos, len;
 
-	ret = denali_data_xfer(denali, tmp_buf, size, page, 1, 0);
+	ret = denali_data_xfer(chip, tmp_buf, size, page, 1, 0);
 	if (ret)
 		return ret;
 
@@ -766,14 +774,14 @@ static int denali_read_page(struct nand_chip *chip, uint8_t *buf,
 	int stat = 0;
 	int ret;
 
-	ret = denali_data_xfer(denali, buf, mtd->writesize, page, 0, 0);
+	ret = denali_data_xfer(chip, buf, mtd->writesize, page, 0, 0);
 	if (ret && ret != -EBADMSG)
 		return ret;
 
 	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
-		stat = denali_hw_ecc_fixup(mtd, denali, &uncor_ecc_flags);
+		stat = denali_hw_ecc_fixup(chip, denali, &uncor_ecc_flags);
 	else if (ret == -EBADMSG)
-		stat = denali_sw_ecc_fixup(mtd, denali, &uncor_ecc_flags, buf);
+		stat = denali_sw_ecc_fixup(chip, denali, &uncor_ecc_flags, buf);
 
 	if (stat < 0)
 		return stat;
@@ -783,7 +791,7 @@ static int denali_read_page(struct nand_chip *chip, uint8_t *buf,
 		if (ret)
 			return ret;
 
-		stat = denali_check_erased_page(mtd, chip, buf,
+		stat = denali_check_erased_page(chip, denali, buf,
 						uncor_ecc_flags, stat);
 	}
 
@@ -866,17 +874,16 @@ static int denali_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 		memcpy(tmp_buf + size - len, oob, len);
 	}
 
-	return denali_data_xfer(denali, tmp_buf, size, page, 1, 1);
+	return denali_data_xfer(chip, tmp_buf, size, page, 1, 1);
 }
 
 static int denali_write_page(struct nand_chip *chip, const uint8_t *buf,
 			     int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-	return denali_data_xfer(denali, (void *)buf, mtd->writesize,
-				page, 0, 1);
+	return denali_data_xfer(chip, (void *)buf, mtd->writesize, page,
+				0, 1);
 }
 
 static void denali_select_chip(struct nand_chip *chip, int cs)
@@ -1092,9 +1099,9 @@ static const struct mtd_ooblayout_ops denali_ooblayout_ops = {
 	.free = denali_ooblayout_free,
 };
 
-static int denali_multidev_fixup(struct denali_nand_info *denali)
+static int denali_multidev_fixup(struct nand_chip *chip)
 {
-	struct nand_chip *chip = &denali->nand;
+	struct denali_nand_info *denali = to_denali(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
 	/*
@@ -1222,7 +1229,7 @@ static int denali_attach_chip(struct nand_chip *chip)
 	chip->ecc.read_oob = denali_read_oob;
 	chip->ecc.write_oob = denali_write_oob;
 
-	ret = denali_multidev_fixup(denali);
+	ret = denali_multidev_fixup(chip);
 	if (ret)
 		return ret;
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
