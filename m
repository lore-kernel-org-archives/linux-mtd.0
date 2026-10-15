Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC16CC6B3A
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 11:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PAC4lsQwccxqufy272KTI0OcdS1zJ2v/YblfyiFhWwE=; b=wWg/bYdobBfXoM
	29go2xm0Ourh2U9CxQOTO4PY2ydezAxbpUPcVVpC0i6H6bcls2JbwTWKqwWzKc71IKC3xCl7KqZ0E
	RnhI96UxyvinQx2ZMLt0ZucEOKg0AGv1S1qvioxz24V15spuxiUocNS8TpBr24KYO/33jw0KMhHg2
	1fpjnpkEhHov8g+78ZJoHndZVCn3Cj4poq1QTI43yTr1WcGsK236Yt6VxPBq5Teq9gfTvYS2X4SU1
	2mAHc1rR5HV4Lj2kLPPuVWyTQmksbtT2z152n4e58ErsTlFBbqM4QJ1MEoJWfOmGK9PDsWusHDrQ/
	4GKB1zbET+wKhiD6b3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJh5-0000000Ha8U-3j8M;
	Thu, 15 Oct 2026 11:32:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJh4-0000000Ha88-3sQr
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 11:32:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BF3D413EA;
	Thu, 15 Oct 2026 11:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3174C1F000C4;
	Thu, 15 Oct 2026 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792063938;
	bh=QD82TOQ9OGxgrllEERAIi/zP33vRrwNqhrzU5axxFWY=;
	h=From:To:Cc:Subject:Date;
	b=ZMjNmyAecradzBaB+dthqM1md27KcWUj0cFPv9GPYutzs4i4D4Zw8c9Q5/xq9Kf2H
	 yIHNSr1tkmTnU2MnPf3HAQI0GMYVTuRGkhDvMs+rSnlvZodHtEl/A+MAAI0BUNHc0v
	 IGa3ZcQ5JRw+SJVYER+9nUAaQWKxQ1f8opRPmKViT/4MbwZfKdYL8mxSu4kHtAePrk
	 azNTZEBLk2lzUha6JaavOpacASDfx/qNVLyiXahbKRBFaYDwkc3pzs15sAarEv9Xl6
	 t21PwN8FN/IiH/XbCpl9siJOerbqwPTESmcgcKdvQcmnahbY7j3d6reIWhHbpGKuzF
	 NUr7gxhTTHmqQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	David Laight <david.laight.linux@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: sfdp: reduce stack usage in spi_nor_parse_sfdp()
Date: Thu, 15 Oct 2026 13:31:52 +0200
Message-ID: <20261015113209.975641-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

Two large spi_nor_flash_parameter structures on a function stack
are really too much, and this can exceed an otherwise reasonable
frame limit:

drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]

Allocate both rollback copies on the heap and use structure copies
for type safety.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
v2:
 - don't use the cleanup helpers to not mix them with gotos as
   suggested by Miquel. I didn't carry your Rb over because there
   is quite a bit more code change.

 drivers/mtd/spi-nor/sfdp.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index beb0f5c66212..2c96f7820188 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1537,7 +1537,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 {
 	const struct sfdp_parameter_header *param_header, *bfpt_header;
 	struct sfdp_parameter_header *param_headers = NULL;
-	struct spi_nor_flash_parameter params, params2;
+	struct spi_nor_flash_parameter *save_params;
 	struct sfdp_header header;
 	struct device *dev = nor->dev;
 	struct sfdp *sfdp;
@@ -1549,17 +1549,22 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	 * Get a backup of all the parameter to roll back to in case of an
 	 * error.
 	 */
-	memcpy(&params, nor->params, sizeof(params));
+	save_params = kmalloc_objs(*save_params, 2);
+	if (!save_params)
+		return -ENOMEM;
+	save_params[0] = *nor->params;
 
 	/* Get the SFDP header. */
 	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
 	if (err < 0)
-		return err;
+		goto free_save_params;
 
 	/* Check the SFDP header version. */
 	if (le32_to_cpu(header.signature) != SFDP_SIGNATURE ||
-	    header.major != SFDP_JESD216_MAJOR)
-		return -EINVAL;
+	    header.major != SFDP_JESD216_MAJOR) {
+		err = -EINVAL;
+		goto free_save_params;
+	}
 
 	/*
 	 * Verify that the first and only mandatory parameter header is a
@@ -1567,8 +1572,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	 */
 	bfpt_header = &header.bfpt_header;
 	if (SFDP_PARAM_HEADER_ID(bfpt_header) != SFDP_BFPT_ID ||
-	    bfpt_header->major != SFDP_JESD216_MAJOR)
-		return -EINVAL;
+	    bfpt_header->major != SFDP_JESD216_MAJOR) {
+		err = -EINVAL;
+		goto free_save_params;
+	}
 
 	sfdp_size = SFDP_PARAM_HEADER_PTP(bfpt_header) +
 		    SFDP_PARAM_HEADER_PARAM_LEN(bfpt_header);
@@ -1588,8 +1595,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 		psize = header.nph * sizeof(*param_headers);
 
 		param_headers = kmalloc(psize, GFP_KERNEL);
-		if (!param_headers)
-			return -ENOMEM;
+		if (!param_headers) {
+			err = -ENOMEM;
+			goto free_save_params;
+		}
 
 		err = spi_nor_read_sfdp(nor, sizeof(header),
 					psize, param_headers);
@@ -1665,7 +1674,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
-		memcpy(&params2, nor->params, sizeof(params2));
+		save_params[1] = *nor->params;
 		param_header = &param_headers[i];
 
 		switch (SFDP_PARAM_HEADER_ID(param_header)) {
@@ -1703,7 +1712,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 			 * spi_nor_flash_parameter data.
 			 */
 			err = 0;
-			memcpy(nor->params, &params2, sizeof(*nor->params));
+			*nor->params = save_params[1];
 		}
 	}
 
@@ -1712,6 +1721,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 		goto clear_sfdp_ptr;
 
 	kfree(param_headers);
+	kfree(save_params);
 
 	return 0;
 
@@ -1724,7 +1734,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 free_param_headers:
 	kfree(param_headers);
 	if (err)
-		memcpy(nor->params, &params, sizeof(*nor->params));
+		*nor->params = save_params[0];
+free_save_params:
+	kfree(save_params);
 
 	return err;
 }
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
