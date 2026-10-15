Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234A0CC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aKeB+NCFH7oe/8bYTBkvcoHw+CDUDk8/4Hl21glNjRE=; b=q+up/UGIMw32cI
	2lIEM1bOrzjfbNk8f6/o+JVQ0i4SMLX4sAMJGdKtVhFtOmTRGyDms23tUtp/Dng2CvkA2TrE2VvFU
	L0ckWELRUauRs2JdDnN01leZTFlrBSjTNnOI8tzME45VJUYNUcXouqqMr2r0nr9Go44f9CCLzbB9s
	9Mi31K6pKm7dDLY9vhWAhTdp4yvzQXJ0DqlaedFDwpYSFvPZ/rxENCreYleFcguh8imP+oVg6s5v/
	d06tqmpUFyulrXezQGfJ6bPh+lCA2oyBZlPJ6OjubDe0EZBwOY3cUTly0lJdn4RFxYJES+Izi44kt
	YK9mzUYii476QVLky+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHP4-0000000HDVM-0lFH;
	Thu, 15 Oct 2026 09:05:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHP0-0000000HDVC-19SF
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 09:05:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5A4243CA1;
	Thu, 15 Oct 2026 09:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FB41F000C4;
	Thu, 15 Oct 2026 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792055129;
	bh=47/p8YmQs+5a2RqOu3MNEr5/73AtKBVmpsZc2mAhwlE=;
	h=From:To:Cc:Subject:Date;
	b=GbVUxeKItyZs5BqitpaPbAi07yjmNB8r8R3QyYSL0J4yNcxYnXAzy+z/WQwXuoCTh
	 /P7C/t/tznqE6So+VI2sw3PmFClQDsAXERCW8B3n24ertx/vMadQNo9jZOZ6o6YN8E
	 86DwMfqkCQvzdPYu0J82/pbBC3ZWSb+gGtbXbJLTZwAa4jhEn4G+pKjJdpy40uWxle
	 XTR634UlOIq2qAkvVKicMmX8jQWenFrC4qupR6MuZOY2UV3mBImXAgEZ0Pt1eSub6s
	 0dc+9J968qprjlrccgjAi6MfY5OgWs/yk2JbESxvMpU+k/qK/hTFcTwUVrVdIupwfP
	 U2/B3tR0yOr7A==
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
Subject: [PATCH] mtd: spi-nor: sfdp: reduce stack usage in spi_nor_parse_sfdp()
Date: Thu, 15 Oct 2026 11:01:28 +0200
Message-ID: <20261015090516.924703-1-mwalle@kernel.org>
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
 drivers/mtd/spi-nor/sfdp.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index beb0f5c66212..e30cdb5b18ed 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1535,9 +1535,9 @@ int spi_nor_check_sfdp_signature(struct spi_nor *nor)
  */
 int spi_nor_parse_sfdp(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *save_params __free(kfree) = kmalloc_objs(*save_params, 2);
 	const struct sfdp_parameter_header *param_header, *bfpt_header;
 	struct sfdp_parameter_header *param_headers = NULL;
-	struct spi_nor_flash_parameter params, params2;
 	struct sfdp_header header;
 	struct device *dev = nor->dev;
 	struct sfdp *sfdp;
@@ -1549,7 +1549,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	 * Get a backup of all the parameter to roll back to in case of an
 	 * error.
 	 */
-	memcpy(&params, nor->params, sizeof(params));
+	if (!save_params)
+		return -ENOMEM;
+	save_params[0] = *nor->params;
 
 	/* Get the SFDP header. */
 	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
@@ -1665,7 +1667,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
-		memcpy(&params2, nor->params, sizeof(params2));
+		save_params[1] = *nor->params;
 		param_header = &param_headers[i];
 
 		switch (SFDP_PARAM_HEADER_ID(param_header)) {
@@ -1703,7 +1705,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 			 * spi_nor_flash_parameter data.
 			 */
 			err = 0;
-			memcpy(nor->params, &params2, sizeof(*nor->params));
+			*nor->params = save_params[1];
 		}
 	}
 
@@ -1724,7 +1726,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 free_param_headers:
 	kfree(param_headers);
 	if (err)
-		memcpy(nor->params, &params, sizeof(*nor->params));
+		*nor->params = save_params[0];
 
 	return err;
 }
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
