Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E34C98325
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7taD9egZBsuHfFsXhKKJovhRzYcI09hMAzPmOIVEog=; b=KMxbvjtg2E7EW1
	UigvxIy2qSndPsXLa7w8nTkyK8cxupMWqabWNV8CydLFmQsfoJmAnBbx32B3M4bTJrrHrVWZTpN6G
	eNjz0K8me4kX6XbGsUhaK/KpH7zW7afi3OG+57bQeSODoug/sad7KzR6ZpHfw4iXCHSsHPOrW0tzk
	KhkrWJ402oNXIwertPfdtaILbVTZxMQ/rN0lei1NLYh+OWY29hg8ITtQ4BWmvcZ6+NL9xVRBSpfxX
	fNZTjExwQvNn517fBoGyAoRYGHDBzowVcn215FuAsux+In2No5ceawucOBXGLESVGDv7G1yzCeRDm
	GgWS5vWOywpwxyYVzkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgR-0000000C6GS-3VyY;
	Thu, 24 Sep 2026 20:04:43 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgO-0000000C6EX-3uyX
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:04:42 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so1185625e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2026 13:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280279; x=1790885079; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvoJ+1SnGtHb1aER45OX4q+Sg7b0MJkGQf+G9BmIWik=;
        b=fplNmTtfiPeDEJpEpKLu5Rbm+34e/PTFSw2v5hI6D81OTY+mYEBvIc+uL8ASGFWpNy
         zrHyVjIMWwfsBjkTGWOgOOqA9BbqtU11Xq/Uv9OF4rrkCWWK9YEyRMfwzTN5itu5lp+C
         28w8fokDXcJ4HlwcRaBP4Au9qZL/2NjqnRhB/YHH6jH10UaPgx3EGCAToiaL3aH6WvX5
         3i+9S73Ty6cyBHLOuGYetkInw/ybsRUfYinURTL6nxoRmbNunFHSPk862VozYhZQOuCC
         oK/yrxxzIHunSa4H+MYbjZh6LNWYAl5cT60WV5ejf/Hg4uFnJxXqOWwUxvSVtmYqBgcu
         EjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280279; x=1790885079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvoJ+1SnGtHb1aER45OX4q+Sg7b0MJkGQf+G9BmIWik=;
        b=R1XTEq3/gml80G9tXgClMH4G833/hjvWD/vIxh9QgkmBQm6OkzZm99VSWHx+m8cuD6
         VZvYrhad/onqsDFt+lT8oqk2XMtzEdUmOhzkkR+47yNjM7qbuNF2G1z6A10htQV7SmQ+
         MYijm81Vpck7Lz3O0vM2MQWGj/G7spcryLMwkwK0PAliD8CvOpIhTXL7cZMngUNZBk8p
         WPkjpjJ6ze7BUssDTvA/syvX2zJxF1q2aXWCSCOJPASeyvWqT+wZOlD2xSyWUCUgZT/R
         X5I/P/F/pIr/0xRpVZp8yCueHPY2znBFNXPVK5cuOLRg/kWGp8XFhnMBZ+OuUWLoDCa7
         GzVQ==
X-Forwarded-Encrypted: i=1; AKwUvByGgARMAvZgHYrV+ssWu2kl+NzpNfosee6FvlNkj9DzQfxOW/R8DBCtotUk+T7PqmNKi1pnbUS/czg=@lists.infradead.org
X-Gm-Message-State: AFuF++mCwqWQlJpyO5L7IhOfyP+HdqdSmZphycp8660gFRiNLyPm6CrT
	LQ4wTjVROQsXbawq55WIkTB+Qj2sMibHNz8g6RqkEAiUHnC1DDXTii5n
X-Gm-Gg: AYBFou0zzJgnMxXJjwmPsgHZ0ENv9Jz78Tjd4EpZBVibMfNapbMw3VZhZaddZ1FjUVr
	wejROHCRMdBmENYfPl/qpXmays1dZZqo/GRoWY2/hq0r5sCbCOCG8TXg8T23q5Y9+EErQsYDkip
	t/2D2inTkUk3N5GnZZ3h7cRJYqwkwPsqg8JtQcbFfPoZdKMLLmKFl2qNzD5P/fYjwX94t2kBNmx
	LH9VIdRC9HZN3v4NMaiYGG1Gw4rbrI0oPaYBZ5aVk5VKPQs8fXLB4PrEka8uZ0ZvcRwMRwZtsf4
	ZRzViGkQfVlO59DvABDAC6dodB9eEaz9iYzzmiautwwWhXPezuXe5d9YGQE6tS033emIs8dvxZ9
	2rkxs9iUPZGOpnikWdHDGASz1kNC/Lz5yAtwOGkZnCz9cQdZahbvoJEXR6C3XQSY17envVhwaYf
	Z8GTKpITguYAnnY5TfJX8om4kDVyaFHujmHM+4LjVUlZ2tX8bUqZ73lGslnhbieev18agwscK5P
	4IsOCzp5mwRJOq011IZ6u5Cuac=
X-Received: by 2002:a05:600c:37c9:b0:49f:c2ef:cfb9 with SMTP id 5b1f17b1804b1-49fe66c897cmr55518965e9.4.1790280279053;
        Thu, 24 Sep 2026 13:04:39 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:38 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:18 +0200
Subject: [PATCH 3/8] mtd: rawnand: qcom: make config_nand_page_write() more
 generic
MIME-Version: 1.0
Message-Id: <20260924-qcom_nandc-share-more-code-v1-3-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_130440_997842_D4AB944A 
X-CRM114-Status: GOOD (  14.73  )
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

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qpic_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index c65a8416c3f5..1f3c00823309 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -365,10 +365,8 @@ config_nand_single_cw_page_read(struct nand_chip *chip,
  * Helper to prepare DMA descriptors used to configure registers needed for
  * before writing a NAND page.
  */
-static void config_nand_page_write(struct nand_chip *chip)
+static void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-
 	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
 	if (!nandc->props->qpic_version2)
@@ -989,7 +987,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
 
 	host->use_ecc = true;
 	update_rw_regs(host, ecc->steps, false, 0);
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
@@ -1059,7 +1057,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 
 	host->use_ecc = false;
 	update_rw_regs(host, ecc->steps, false, 0);
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size1, data_size2, oob_size1, oob_size2;
@@ -1143,7 +1141,7 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, false, 0);
 
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, data_size + oob_size, 0);
 	config_nand_cw_write(chip);
@@ -1219,7 +1217,7 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, false, ecc->steps - 1);
 
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, host->cw_size, 0);
 	config_nand_cw_write(chip);

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
