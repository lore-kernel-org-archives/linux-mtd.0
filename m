Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2EDC61DD4
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2026 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqPNeCQW49GpFpUSVFgaYCXaUGDkZP/60L2cw5ZRS8E=; b=CDPIZzl/ocY/aZ
	Bisrg36eMtKZ11+ZPzk8rUdyCgzr/Eqrblx5jMyFD72/98o54BJm+Pdkh2G+6v1jkDbZxVrIsyS1s
	Y13QmzEsgdvx04liRg7W5Hd/9YnvCE8iDvd/Sffvequu8AYHvksU2g0bA4FFQWGtfNQ7Qh5L9zHvT
	Na8aFmmuiev8DDy/d7LNljXz5HVf8uArYoFYxEhmNNXAGpRR+fdHWociXmhhX0Qh3LlrAW95ClnJ8
	63ZXwSPWl+4rZ60vOBDejmLY2sdY1Pq/9dgffQSoSLpl5vDPB4fYZ6Q8b1W/19eygv1rgHq9HUptc
	och7mg6IoKOyaTAjaSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLK-00000005MuF-0kXn;
	Fri, 28 Aug 2026 08:53:46 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLF-00000005Ms3-2Gm7
	for linux-mtd@lists.infradead.org;
	Fri, 28 Aug 2026 08:53:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-482e5733a5aso440811f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2026 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907219; x=1788512019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGhN+ilnc4OyW7fR3BEkzBzu80tMPaZCFmBpLkVQFp4=;
        b=rTONXIVQRa/PlEQ1qASZyhtBEoo8tN8Shjt1pl/nCOs9ZcZOQEf6ZSAVjxC9Ia1XtL
         rnMkG19K9lDqJ3NcA1o/quj9dSrSPn4JlqPCl3suDWfn32PUVpw/giMkC6bhEgkAza3Z
         V0bdvz3RfAbSuwr26sv/zc6pZW8aLW4wDtKzwn9gv2o12wc0rFYRXaFccCtyTkEFsNWH
         DTgsMZwv1L1AH0CO3G60JOfhJ0J16Xer0VbNw/eXPRi61EfJxU4mo3pvZm8FkBnB33eP
         1pVrW01FfGU+R536l3SaWAk/xVYHuxqSs40n3U+ZaCVKK9z+iNCAhJMP6LyhexV6feqX
         56qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907219; x=1788512019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGhN+ilnc4OyW7fR3BEkzBzu80tMPaZCFmBpLkVQFp4=;
        b=ZyilXOJG5H5KIC0RHs/vucjHrpMT2ftQG8eH3Qe1XZYfa9hzhjhWSuZajqpd9aWeOC
         l6CMWVKgThRvXAq2KwSOUV/2V5MyfIRvuwnISUsoF242UzauCxH5prh/+LCQYnAAJXzR
         neCn3lE/HJAVy35LySNC8Nouq8rmqUxBfjU4J0ZsUnoTMLVCyN8CH3jrh9x8Q9PkRsED
         6ov//UJKr0JrUK8thsScwy2fsMQXaJ/2Kz0NKrZ+wppP1ecajDobfh47+hYdWUf9k4Ti
         7Z9ec+SVNdQ9KgVXTA5mw51oTekQyAyFfZ3VYE5KtO4hjDyzYccUP0ONjCmLmmi6D6qQ
         DvUQ==
X-Forwarded-Encrypted: i=1; AHgh+RquKuT52a7xKa2EmNUATugt249XJ8TF/DB0E61ypvi7WhSGPREU/vIbP7x7DAmXp8wxsw6Fs2MUk+c=@lists.infradead.org
X-Gm-Message-State: AFuF++kOa+9i1q9jVl1pb53s4sB2jKb2wgtc094V8Q9S1WMIGKl2inTE
	Aa/4YIRmdIR2GWyn8VaUrducOmshoiCxkjRz8NcCwe7sioz7zGpV/Ype
X-Gm-Gg: AR+sD10KBRWCWZQxyJNpdw10zqPMwma7c5E/tbwTPQ+6XAjqOU+KjvACHbragaHk7Dv
	Fjea0TVeU6zfafbyREBdOiH4Tf1ejMZhypGyny86hmeLa2ngrw9dSqAq+CNt4U2i8GTMXCC/7oR
	4t6RVeJAiGslGYiFAuzEFlenTajG1PzoeDvxqrbP67fafQW8+IFBa3bAG6Q7PTCBQcV7KrAcT3k
	xJHLm4OCJKXV3MF8rXlFQEzTf6RoFWHGEyNrXCDzIFU8sWs7pCDrqIbJ3fQHwHh7Ghw09HZ0xqU
	xSeFyJwA5OhHhFISPghlKyHh7l3doOFOGUfT/uEdvT82t7SDt+UeWjT/k/niNmcGD+JFKo28f/s
	B57rTOCy5d9bWz+BvxMxe7UemENnR/2910Co1cbp6BfnAAajapDNMRf6NPea9A885aaEcYlfrk0
	1D2ud+uVz38Eo+edLbK1iCBhQgkIVuVUHVW0U1mA0xuy8Xonts4rxeirWkdRSUOX2DGg==
X-Received: by 2002:a5d:5d0f:0:b0:481:5ba5:994c with SMTP id ffacd0b85a97d-482f7a281c3mr7817532f8f.20.1787907219377;
        Fri, 28 Aug 2026 01:53:39 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb278f7sm2921103f8f.26.2026.08.28.01.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:38 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Fri, 28 Aug 2026 10:53:36 +0200
Message-ID: <20260828085337.3916199-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828085337.3916199-1-mehmet.fide@gmail.com>
References: <20260828085337.3916199-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015341_616626_2AA72847 
X-CRM114-Status: GOOD (  24.76  )
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

Reported-by: Edward Karpicz <webmaster@toradex.com>
Link: https://community.toradex.com/t/colibri-vf50-vf61-on-the-current-bsp-mainline-u-boot-v2026-07-and-linux-6-18-lts/30735
Fixes: a7ab085d7c16 ("mtd: rawnand: Initialize the nand_device object")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
 - keep the detected OOB size and add driver ooblayout_ops computed on
   the first 64 OOB bytes instead of clamping the memory organization
   (Miquel)
 - clamp the spare transfer size in the data paths so the controller
   keeps reading and writing 64 spare bytes
 - drop the truncation dev_info() and with it the %d format for a u32
   (Sashiko report)

 drivers/mtd/nand/raw/vf610_nfc.c | 59 ++++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..9104db19dd29 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -505,6 +505,12 @@ static int vf610_nfc_exec_op(struct nand_chip *chip,
 				      check_only);
 }
 
+/* The controller transfers 64 spare bytes; larger OOBs keep using the first 64 */
+static inline unsigned int vf610_nfc_spare_size(struct mtd_info *mtd)
+{
+	return min_t(unsigned int, mtd->oobsize, 64);
+}
+
 static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 					 uint8_t *oob, int page)
 {
@@ -522,7 +528,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 		return ecc_count;
 
 	nfc->data_access = true;
-	nand_read_oob_op(&nfc->chip, page, 0, oob, mtd->oobsize);
+	nand_read_oob_op(&nfc->chip, page, 0, oob, vf610_nfc_spare_size(mtd));
 	nfc->data_access = false;
 
 	/*
@@ -530,7 +536,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	 * at least less then half of the ECC strength.
 	 */
 	return nand_check_erased_ecc_chunk(dat, nfc->chip.ecc.size, oob,
-					   mtd->oobsize, NULL, 0,
+					   vf610_nfc_spare_size(mtd), NULL, 0,
 					   flips_threshold);
 }
 
@@ -551,7 +557,7 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 {
 	struct vf610_nfc *nfc = chip_to_nfc(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int trfr_sz = mtd->writesize + mtd->oobsize;
+	int trfr_sz = mtd->writesize + vf610_nfc_spare_size(mtd);
 	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
 	int stat;
 
@@ -581,7 +587,7 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 		vf610_nfc_rd_from_sram(chip->oob_poi,
 				       nfc->regs + NFC_MAIN_AREA(0) +
 						   mtd->writesize,
-				       mtd->oobsize, false);
+				       vf610_nfc_spare_size(mtd), false);
 
 	stat = vf610_nfc_correct_data(chip, buf, chip->oob_poi, page);
 
@@ -599,7 +605,7 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 {
 	struct vf610_nfc *nfc = chip_to_nfc(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int trfr_sz = mtd->writesize + mtd->oobsize;
+	int trfr_sz = mtd->writesize + vf610_nfc_spare_size(mtd);
 	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
 	u8 status;
 	int ret;
@@ -740,6 +746,42 @@ static void vf610_nfc_init_controller(struct vf610_nfc *nfc)
 	}
 }
 
+/* The default large page layout, clamped to the 64 transferred bytes */
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
@@ -770,12 +812,7 @@ static int vf610_nfc_attach_chip(struct nand_chip *chip)
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
