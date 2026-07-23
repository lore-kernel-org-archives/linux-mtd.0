Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EC7C531D1
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17eZtQly7HkiTdVV4OvkyQ4KJIpMibKp3dOm5mXkZXA=; b=NaC8J/JD3I0wHv
	hNYjaF+qYSq/Kz/FS+r8NmOhvmypywIfA/jdVaWbbbmEtVdLQhFroF8+Qu4WJwoqKusZ/fU+eogf2
	xu6f0llsNecpY0FqWu8K60+1tiAigtqrTjANIjmEKnYeKM09EU6/978cIsKR5zviuyDu2n6znphXs
	ZZCwvFSAd2ivWpDPlbpWAJP3CD/g5A7W6hLAohirVm3gk9AkWjNW7wVVBl7b9RA/PCKGOaz2ARh65
	IctjOYM6CizyUJtgRDpkGVeIctMNcnE015HtEFKLWlqv7PgSFiFK1hpJR+VJluvhwS0MkOsvguidM
	PBrra0WJ4Eek0fAGMv2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtfp-0000000EOvk-3ULp;
	Thu, 23 Jul 2026 13:41:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtfk-0000000EOta-3PZs
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 13:41:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B9C624E40EBE;
	Thu, 23 Jul 2026 13:41:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8ED96602B8;
	Thu, 23 Jul 2026 13:41:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C68F511C10E96;
	Thu, 23 Jul 2026 15:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784814069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XWe+Pt54+26aQCE30XaKKDodsWuXQQjhkt3Geccg33s=;
	b=Oan5aCAzlTDX987vYi/UkPlQpdAHJQimS4Kk1sKKU82Dg6o474a9qGN/ab/2qDP9VQ/rs4
	bXumAwdjL4V8sSGHRqsS6s2GOW6lDWnQ8j+uKPr0E0481iS8GczCvvnQd2fNGi/hKCDsp8
	Dvo9q8w+0exCvFi9J3+7pdZQR1CW9Vp1mJTVIIf3fcZiom7UixAB94D2jB1jzK7TK8T+SM
	hQSqJe4dBEC7A5ZbjFkfT08MymdV1NlS92WwwMVE+3BQVgg58xjBUvuG+WZT7NCaN3Zehq
	Mt5stZE9d+f8oWNJ0ji3+UVvAwFm2ndxSB+J5axLcz0AumXGnWSVJCREAMQ/8Q==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Thu, 23 Jul 2026 15:41:03 +0200
Subject: [PATCH 3/4] rawnand: base: Export nand_read_page_swecc
MIME-Version: 1.0
Message-Id: <20260723-mix-ecc-v1-3-7361c3baeb07@bootlin.com>
References: <20260723-mix-ecc-v1-0-7361c3baeb07@bootlin.com>
In-Reply-To: <20260723-mix-ecc-v1-0-7361c3baeb07@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_064113_014355_18579FA9 
X-CRM114-Status: GOOD (  11.43  )
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

nand_read_page_swecc() isn't exported while it could be used from the
drivers for the mixed case where ECC writes are done by the hardware and
ECC reads are done by software.

Export nand_read_page_swecc() to make it usable by drivers.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c             | 5 +++--
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 1 +
 include/linux/mtd/rawnand.h                  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c04c3e74f661..950c079aa27b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2941,8 +2941,8 @@ static int nand_read_page_raw_syndrome(struct nand_chip *chip, uint8_t *buf,
  * @oob_required: caller requires OOB data read to chip->oob_poi
  * @page: page number to read
  */
-static int nand_read_page_swecc(struct nand_chip *chip, uint8_t *buf,
-				int oob_required, int page)
+int nand_read_page_swecc(struct nand_chip *chip, uint8_t *buf,
+			 int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int i, eccsize = chip->ecc.size, ret;
@@ -2979,6 +2979,7 @@ static int nand_read_page_swecc(struct nand_chip *chip, uint8_t *buf,
 	}
 	return max_bitflips;
 }
+EXPORT_SYMBOL_GPL(nand_read_page_swecc);
 
 /**
  * nand_read_subpage - [REPLACEABLE] ECC based sub-page read function
diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index bd89aaadd1b2..d61eba938311 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 3658315752bf..5539e96b2cac 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1578,6 +1578,8 @@ int nand_write_data_op(struct nand_chip *chip, const void *buf,
 		       unsigned int len, bool force_8bit);
 int nand_read_page_hwecc_oob_first(struct nand_chip *chip, uint8_t *buf,
 				   int oob_required, int page);
+int nand_read_page_swecc(struct nand_chip *chip, uint8_t *buf,
+			 int oob_required, int page);
 
 /* Scan and identify a NAND device */
 int nand_scan_with_ids(struct nand_chip *chip, unsigned int max_chips,

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
