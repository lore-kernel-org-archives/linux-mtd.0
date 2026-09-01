Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C738DC61DD6
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2026 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CevajF0uElUlDmdtl4vH2CnvRg+zDJ3l6wu8qwWtMU=; b=OuZiGgWXqc39rJ
	38XZrRB128c7R5BiqGeEUEl2l+NsjIveU8XBL+3RajT+yEPG0SRkldoSHuwODZttT0xFD/Cemu9qu
	MojX1SkJmKnhb31OvamIKnqcRx5wdtgHM/0KZSjYPFBgQ4OqJvYwdX8FZGLw9XdhmVeSa4pV993d0
	D/6jeb7FR7jgrx0OozVBCR/K36wujP4OgNf4CGcdg0YgfGaC76dKAF4IxXJO15N6V1SvnRPh+/tXa
	lixgAz4+OZCWoDHqM5byii8j1Ozo7G1QndfGTqF3gaOZoLNEdTFgBE6TMdM59+CNWKhopa2pDfEhj
	KLTCW4Jxni6HVoZE6QHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1J5O-0000000B90T-3UAL;
	Tue, 01 Sep 2026 07:39:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1J5L-0000000B8yc-2ieZ
	for linux-mtd@lists.infradead.org;
	Tue, 01 Sep 2026 07:39:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2596739f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2026 00:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788248350; x=1788853150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxuNHMnlajHVgcX65Arb3FqrfAoHreh7iYiEvJueLq4=;
        b=IMR2N7ZUTSBf0BtbmI7lrs1YK3N3aMHFQnhMQiHva82z249Ir8OVNSANjMZ4aZSZqc
         fBDzfchNhHQu6xDIXQABN5J+2idI4U+c+00IkYWC8XSfErz52fMnZMksVdyqbNHz9NPH
         btPCfBb5qZNXxrkY9XltBhY8mtoR090+D9IF0p/i7hqVdrjqgVGB06UrlEsE5SkPgPsB
         LorlGt/MJ/yO0ixG1pikV3NQeeMX0VU2SuwDLecL8mRwzT3lAT1EZQzqhDy/MwihmWS3
         Czz+5obecD1PaZanYrrj4x+V70JIHCrQf1UKTx2hMAv27IkZEVQfbpZ9F7SNm29hhooW
         78ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248350; x=1788853150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VxuNHMnlajHVgcX65Arb3FqrfAoHreh7iYiEvJueLq4=;
        b=MMsqAs8qSvHx9q6Ci/G4aDCQ8cjfGEzi2udHXuecYH08wpyXw+ePAYruDqoSU/6oNd
         JHoVkytlyCstDW45kkBmQIJukx74gsoq5Qz5HgULIAiqGRCG1hJfGpGqCDUnoc/wv5zI
         FXjZQnFsVMAzPicNcpswt0utOCkm63chCaIOUK+Bz5DTJR8vfBXsbGNjw3l+m6Pf6Xg7
         TdLYQzNFbjQjmC5P6MkpAp0KoFiz4beUv7zCWow18uD83aYxTmezw0NK/0CDRekZEGB1
         2Vu5VQTDl8IutAWKV2IRYtnnoNBYapgAVrhJbXVR02yecB28O9kNcZeLsA+uXkRUBMlW
         Temw==
X-Forwarded-Encrypted: i=1; AKwUvBxU2PFWTI27RBBj8+7hnmr55VKEYZvdCMkDlL2bGzxw1X5UP74Yh9+xeeG9rN5ZIs0LYyb/SI/6Jgw=@lists.infradead.org
X-Gm-Message-State: AFuF++m2DrxWjrvEJysqGTVrBDfKK43BnLM5aChDuyWGKkIbgwRDcv3K
	sWHV6+9zH2xO66nHeE94n+lOd+tDiF3U7vVm2DbJt05O4rKd3QPYz3eEZEnwJCDf
X-Gm-Gg: AYBFou0I/HRN3OCRSjlU4v5CKeOzX5K7mCB/TcWS9gchTsFkQFeqRv3rdG4nnQqsRVK
	u6COtb9Cd0NI08O56eUI+RdaTwt5t+B7LZBvc6OnvW00sBCuoO5X58TA543CbM1PuT3iXTeBEJv
	yYUHY98+stSX8YyRjA4FgZKcB6zYLmqOfTw/SuE0UFa9OasjX4ZYF/8WjvKKz2jDl8BAh+rax98
	vlG04XVLhZzCFZL3Xb0ZTgGS9D7FJOrKAeLnBIFz2Xx7RsEeBnL2GPsJ0V/HHtvpA5at6kuRKCl
	OxXJFQAixS84HMBPy6dXLRMyP3KIq/QQFGfKUIHx/hriqclE0kM7q5ONG7DbIymBpHuw7q889JE
	VjgHkThiqtgiEMOcoplerdK47Wtfzzf30r61X2zxwJqQyXhdrMO6uycSzi5FBPC1FsO4AWXHB4H
	byFC5ec1B94KKo2v0BE/85d45TIIktIM82tleya1EQ9lCrv2rpwb4HhDXj9qBixYGP9Q==
X-Received: by 2002:a05:6000:27c6:b0:482:f270:65c5 with SMTP id ffacd0b85a97d-48440fe3214mr8435228f8f.9.1788248349726;
        Tue, 01 Sep 2026 00:39:09 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c460sm3014790f8f.13.2026.09.01.00.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:39:09 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Edward Karpicz <webmaster@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Tue,  1 Sep 2026 09:39:06 +0200
Message-ID: <20260901073907.2443698-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260901073907.2443698-1-mehmet.fide@gmail.com>
References: <20260901073907.2443698-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_003911_913185_8526C624 
X-CRM114-Status: GOOD (  28.03  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The controller transfers 64 spare bytes per page and the driver only
implements the matching 64-byte ECC layout, so attach_chip() shrinks
mtd->oobsize when the chip provides more. That clamp does not survive:
nand_scan_tail() runs nanddev_init() after ->attach_chip(), and it
restores mtd->oobsize from the memory organization, which still holds
the value detected from the chip. The driver then transfers writesize
plus the chip's full OOB size, the hardware ECC parity ends up at a
different offset than the layout the controller was set up for, and
every ECC-protected read fails with -EBADMSG.

Measured on a Colibri VF61 (MX30LF4G28AC, 2048-byte pages, 112 bytes of
OOB): with the clamp lost, UBI cannot read the erase counter headers of
the pages U-Boot has just written, and the on-flash bad block table
written by an older kernel reads back with ECC errors, so the board
does not boot. Kernels before commit a7ab085d7c16 ("mtd: rawnand:
Initialize the nand_device object") are not affected because nothing
overwrote the clamp there, which is why the same chip works with a v4.4
kernel and with U-Boot, whose copy of this driver has no memory
organization to restore the value from. Edward Karpicz reported that
the clamp no longer takes effect on this chip; see the link below.

Instead of modifying the memory organization, keep the detected OOB
size and give the driver its own mtd_ooblayout_ops: the same layout the
NAND core uses for large pages, but computed on the first 64 OOB bytes
instead of the whole OOB, so the ECC bytes stay where U-Boot and the
old kernels put them. The data paths transfer writesize plus those 64
bytes, as the controller always has.

Since mtd->oobsize now reports the chip's real spare size, fill the
tail of oob_poi with 0xff after the 64 transferred bytes on ECC page
reads: the core may copy the full mtd->oobsize from it, which would
otherwise expose whatever the buffer held before. 0xff also matches
what a raw read returns from flash, since the write path only ever
programs the first 64 spare bytes.

Reported-by: Edward Karpicz <webmaster@toradex.com>
Link: https://community.toradex.com/t/colibri-vf50-vf61-on-the-current-bsp-mainline-u-boot-v2026-07-and-linux-6-18-lts/30735
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Fixes: a7ab085d7c16 ("mtd: rawnand: Initialize the nand_device object")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v3:
 - add Suggested-by (Miquel)
 - drop the comment above vf610_nfc_spare_size() and its explicit
   inline (Miquel); the 64 is the established on-flash format, not a
   controller limit
 - explain at the ooblayout why the driver has its own, in the terms
   Miquel suggested
 - fill the tail of oob_poi with 0xff on ECC page reads so the bytes
   beyond the 64 transferred cannot expose stale buffer content
   (Sashiko report)
v2:
 - keep the detected OOB size and add driver ooblayout_ops computed on
   the first 64 OOB bytes instead of clamping the memory organization
   (Miquel)

 drivers/mtd/nand/raw/vf610_nfc.c | 72 ++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..1c3e7b167e53 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -505,6 +505,11 @@ static int vf610_nfc_exec_op(struct nand_chip *chip,
 				      check_only);
 }
 
+static unsigned int vf610_nfc_spare_size(struct mtd_info *mtd)
+{
+	return min_t(unsigned int, mtd->oobsize, 64);
+}
+
 static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 					 uint8_t *oob, int page)
 {
@@ -522,7 +527,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 		return ecc_count;
 
 	nfc->data_access = true;
-	nand_read_oob_op(&nfc->chip, page, 0, oob, mtd->oobsize);
+	nand_read_oob_op(&nfc->chip, page, 0, oob, vf610_nfc_spare_size(mtd));
 	nfc->data_access = false;
 
 	/*
@@ -530,7 +535,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	 * at least less then half of the ECC strength.
 	 */
 	return nand_check_erased_ecc_chunk(dat, nfc->chip.ecc.size, oob,
-					   mtd->oobsize, NULL, 0,
+					   vf610_nfc_spare_size(mtd), NULL, 0,
 					   flips_threshold);
 }
 
@@ -551,7 +556,7 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 {
 	struct vf610_nfc *nfc = chip_to_nfc(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int trfr_sz = mtd->writesize + mtd->oobsize;
+	int trfr_sz = mtd->writesize + vf610_nfc_spare_size(mtd);
 	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
 	int stat;
 
@@ -577,11 +582,16 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 	 */
 	vf610_nfc_rd_from_sram(buf, nfc->regs + NFC_MAIN_AREA(0),
 			       mtd->writesize, false);
-	if (oob_required)
+	if (oob_required) {
+		unsigned int spare = vf610_nfc_spare_size(mtd);
+
 		vf610_nfc_rd_from_sram(chip->oob_poi,
 				       nfc->regs + NFC_MAIN_AREA(0) +
 						   mtd->writesize,
-				       mtd->oobsize, false);
+				       spare, false);
+		/* Not transferred, and never written: reads back erased */
+		memset(chip->oob_poi + spare, 0xff, mtd->oobsize - spare);
+	}
 
 	stat = vf610_nfc_correct_data(chip, buf, chip->oob_poi, page);
 
@@ -599,7 +609,7 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 {
 	struct vf610_nfc *nfc = chip_to_nfc(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int trfr_sz = mtd->writesize + mtd->oobsize;
+	int trfr_sz = mtd->writesize + vf610_nfc_spare_size(mtd);
 	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
 	u8 status;
 	int ret;
@@ -740,6 +750,49 @@ static void vf610_nfc_init_controller(struct vf610_nfc *nfc)
 	}
 }
 
+/*
+ * With 64 byte OOB chips the core's large page layout matches what
+ * U-Boot uses, and on chips with more, U-Boot and older kernels clamped
+ * mtd->oobsize to 64. Modifying the OOB size is no longer possible, the
+ * actual chip geometry must be respected, so to avoid breaking those
+ * existing setups use our own layout: the core's large page one,
+ * computed over the first 64 spare bytes only.
+ */
+static int vf610_nfc_ooblayout_ecc(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
+
+	if (section || !total_ecc_bytes)
+		return -ERANGE;
+
+	oobregion->length = total_ecc_bytes;
+	oobregion->offset = vf610_nfc_spare_size(mtd) - oobregion->length;
+
+	return 0;
+}
+
+static int vf610_nfc_ooblayout_free(struct mtd_info *mtd, int section,
+				    struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = vf610_nfc_spare_size(mtd) - total_ecc_bytes - 2;
+	oobregion->offset = 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops vf610_nfc_ooblayout_ops = {
+	.ecc = vf610_nfc_ooblayout_ecc,
+	.free = vf610_nfc_ooblayout_free,
+};
+
 static int vf610_nfc_attach_chip(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -770,12 +823,7 @@ static int vf610_nfc_attach_chip(struct nand_chip *chip)
 		return -ENXIO;
 	}
 
-	/* Only 64 byte ECC layouts known */
-	if (mtd->oobsize > 64)
-		mtd->oobsize = 64;
-
-	/* Use default large page ECC layout defined in NAND core */
-	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
+	mtd_set_ooblayout(mtd, &vf610_nfc_ooblayout_ops);
 	if (chip->ecc.strength == 32) {
 		nfc->ecc_mode = ECC_60_BYTE;
 		chip->ecc.bytes = 60;
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
