Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07842C00A94
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 13:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0RCNDiK/6QYizix4N11AC6Se+iuZWE0Nl7AHHxRSeI=; b=qV3YwvZ7kEdBZG
	VTuTNizosRj9IwXXzsYrFw10pxE3arOstpMzUSiccbaknk7nDt9yqgtFXE8cYp7Upf3KYw9dcL39N
	DuXvDavVmft6ahGyHBWmKQ1k445bHlzwNlH6qaQOpp9YzjQ3YY/SDwqjU6QE7l736Mn1kv0WtABoS
	TqCHKOPExizpMGMOo1+91L6LjFuoUQLdVpZGgoEJ6Dqb1ibPvhSBlZXkNy9OE3PaBDdnMWAXV/k6a
	LkVeYUiqXQXonddzJmYKaQt6xpx+zmp6fhd/dHSl8RmZD9fHtjnngF4yNzPzQRhk8+I7hmmzNMerr
	q25FG9uaZa1EXit4MJ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCr-0000000HOVF-2MJY;
	Fri, 12 Apr 2024 13:44:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCd-0000000HOK5-2xqc
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 13:44:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 04039CE3951;
	Fri, 12 Apr 2024 13:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0450C2BD11;
	Fri, 12 Apr 2024 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712929465;
	bh=B7/0WXuNeHfB1kb629KPZ4FB30EU6w2b00Yh+4BqI5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzndw7DQL4qgxyf+i/F1X6Ux4uobIQIrrUahDYPKEe/uuUdQiwNY8rkMf8YlVuaKn
	 BJaODhv1AMqazS3IfOT5wTTawOpqvif6YS31LOmMRqD3QKVELrlEWI0Y2W54NvubhU
	 C4+X7gQz9EZhjd+Etq3YVBUUWNAReyN5bl8djIWSsasPto7Cj8/RSdy7K7LmYOh8BL
	 F4aOZiroGwU4dYWR7Ia3chsHv8fsJUJDoDEYHz2Fox/8Dl7e4R1HlttvXeI0nmA2zZ
	 edOMT2eWhJop6owo34F7zDkQir/C3uUzSpYGylF608I8UXURaH0Z9yinJIQHfOH/jO
	 6dz+CbrPEv+hQ==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v1 5/6] mtd: spi-nor: simplify spi_nor_get_flash_info()
Date: Fri, 12 Apr 2024 15:44:04 +0200
Message-Id: <20240412134405.381832-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240412134405.381832-1-mwalle@kernel.org>
References: <20240412134405.381832-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_064428_818547_70F1D5E8 
X-CRM114-Status: GOOD (  14.62  )
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
---
 drivers/mtd/spi-nor/core.c | 45 ++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bbfef7b3997f..58d310427d35 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3311,39 +3311,36 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
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
