Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9157DC05023
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2024 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpQqb3/7INVVouH9K0j6AikfDanwyFX0oqS9vg5/brw=; b=u9+1zv0nxmB1zl
	Aqw2nwo5m8E5cm16okho/sFzkmkzK9zZ7yfe0nucN+J4Zm4W1bvDJlkME3JpUg5DdfzoXZzEVOvq0
	4tkA+aBc9LQpZ1yIa+hrMij8mu9kSXZrnMlIS7hDiYaY53Y5v6Awqv4JikgCEQl9rdSwa2vxX+msH
	vAY7BOA/xXv39J+ufB+cJ3ttoKAPwsRxJwvnHIIcQ0DwngsblvlUXZZeyntOhlDcJe23PiTMCzj1/
	gdgKJYHZr6pkE8NobGuJrKwrgKh0b0fS3Dagv5/1W2Qg2IiUUPwCMFuN0m6coBBkiwWLwtW7HBIsy
	JvY0d6sA6b1EDaRUkO8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxp0Q-00000005vRh-3ZnC;
	Fri, 19 Apr 2024 14:14:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxp0N-00000005vPK-0ll9
	for linux-mtd@lists.infradead.org;
	Fri, 19 Apr 2024 14:14:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB82E61A10;
	Fri, 19 Apr 2024 14:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC9AC32781;
	Fri, 19 Apr 2024 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713536058;
	bh=DcpeOrGfxSWHHh5NWmUVMOKN4dI/mFp5Fo+st0c8Sy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MPzfyqZDTSlEOuYwta3lRloXs0YAlULAlSge2d5/w+h0p9F1rCwkCaU190HAsPf+C
	 1bH9QgzNb5p1UuLAU0OcQBe+loA2WqYp0w8xC0PZz0sHNHTHD7HPgrjctiWJSo9QRE
	 q3Kg5AWBb2Yz9x1lHjsgBe0HHDtImeGhLN8uDxP9dS5UgR4Jzd+vyWlaS1WXuGEOM2
	 T96DNEIJPb/mIk0fXd9u8ij9sH/wEVbkRJzo+LZuKm1uvn/UlRc4FzelePYoSkQ1Qn
	 QLiJZg/NzE1Kii8Zoq+cRjuyAGzxdtEeJsWKH8NS+sTtLCWe2ESwfn8PUnDXiktuAF
	 qRTUxxFd6VS7A==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 5/6] mtd: spi-nor: simplify spi_nor_get_flash_info()
Date: Fri, 19 Apr 2024 16:12:48 +0200
Message-Id: <20240419141249.609534-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419141249.609534-1-mwalle@kernel.org>
References: <20240419141249.609534-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_071419_371290_C947FF3D 
X-CRM114-Status: GOOD (  15.06  )
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

Rework spi_nor_get_flash_info() to make it look more straight forward
and esp. don't return early. The latter is a preparation to check for
deprecated flashes.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 45 ++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4e2ae6642d4c..8e4ae1317870 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3294,39 +3294,36 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
 static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 						       const char *name)
 {
-	const struct flash_info *info = NULL;
+	const struct flash_info *jinfo = NULL, *info = NULL;
 
 	if (name)
 		info = spi_nor_match_name(nor, name);
-	/* Try to auto-detect if chip name wasn't specified or not found */
-	if (!info)
-		return spi_nor_detect(nor);
-
 	/*
-	 * If caller has specified name of flash model that can normally be
-	 * detected using JEDEC, let's verify it.
+	 * Auto-detect if chip name wasn't specified or not found, or the chip
+	 * has an ID. If the chip supposedly has an ID, we also do an
+	 * auto-detection to compare it later.
 	 */
-	if (name && info->id) {
-		const struct flash_info *jinfo;
-
+	if (!info || info->id) {
 		jinfo = spi_nor_detect(nor);
-		if (IS_ERR(jinfo)) {
+		if (IS_ERR(jinfo))
 			return jinfo;
-		} else if (jinfo != info) {
-			/*
-			 * JEDEC knows better, so overwrite platform ID. We
-			 * can't trust partitions any longer, but we'll let
-			 * mtd apply them anyway, since some partitions may be
-			 * marked read-only, and we don't want to loose that
-			 * information, even if it's not 100% accurate.
-			 */
-			dev_warn(nor->dev, "found %s, expected %s\n",
-				 jinfo->name, info->name);
-			info = jinfo;
-		}
 	}
 
-	return info;
+	/*
+	 * If caller has specified name of flash model that can normally be
+	 * detected using JEDEC, let's verify it.
+	 */
+	if (info && jinfo && jinfo != info)
+		dev_warn(nor->dev, "found %s, expected %s\n",
+			 jinfo->name, info->name);
+
+	/*
+	 * JEDEC knows better, so overwrite platform ID. We can't trust
+	 * partitions any longer, but we'll let mtd apply them anyway, since
+	 * some partitions may be marked read-only, and we don't want to loose
+	 * that information, even if it's not 100% accurate.
+	 */
+	return jinfo ?: info;
 }
 
 static u32
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
