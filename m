Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3046C25B75
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2024 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8kKNdCPWnXE1BjDLHrGKAKC+PVXkAD6wIdR1uXT0AYc=; b=uBm9Lm9mkqVJV2
	mLx2WgGdpsB5q8H6PcltDMmJVoesJDZODmoeGfi4dG7HpRwdqO8zTVgqTXWOoMZ3xVM/e4TXxS7Qd
	IZsMh/fLyZ43pgzHA/i/1BUG60foxR2KpzJiw8dR/jaUERFngK1lN24F+bXJ73eSpHxgnn9l/W6kc
	0qHVWCtRqmKQMdVfIXDwTfSQjKs0jS4MY8oBNsmCAVbEUbrhMNwtfnroJtOfjmUF6mKm9TpURoCQE
	+Qy/D5pID5BUltE2bAvPV3V3mrVEKEm5d3xQidrqm2S8XllNyJhJQzwLbzs1953g1tR5G/ur3wlRL
	qCPLtJAsvYf7UoM3yFxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7vx-0000000GwsS-2TUD;
	Mon, 03 Jun 2024 13:41:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7vv-0000000Gwry-1DzD
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jun 2024 13:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 79777CE0C7C;
	Mon,  3 Jun 2024 13:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EA5C2BD10;
	Mon,  3 Jun 2024 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717422063;
	bh=Up225fPrblCk8vyakWXB0/yPHz5gAz1M47n4JUzhfjk=;
	h=From:To:Cc:Subject:Date:From;
	b=h6mfXiT4Wx8nQ/F3zZbIjuPJn7F0/oQ0WKqJ3/5tgr4AwAa/PWsGpOpy75Wr5vGus
	 2yilPSnU3BcK0GbHpTa6tTz/MJIflbzNCGkixAoczqN11vcB2qNDV4Bzue+vs3M42J
	 TfmqPQrR3Qs47NBFTWy8a1XG+LQZNmCdYgKoOqkk3IcUBAM1ENo3APBrnXZIBlhrzE
	 pS6WCPJcxTBDvObJTiQmxAmYvBpCWRi4aTShELTy3+JaKwo6VbE99VM+1la7kqwWwX
	 gre9endQ1POpewU+qIqg3VP3oVOrxBL9jvPA2RWk5Zb9plhqzpicUxbSmU4UJOgj+a
	 lyO67RfnXfiog==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: spi-nor: simplify spi_nor_get_flash_info()
Date: Mon,  3 Jun 2024 15:40:55 +0200
Message-Id: <20240603134055.1859863-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_064107_530230_B2BC1914 
X-CRM114-Status: GOOD (  17.10  )
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
v3:
 - rework the handling quite a bit, thanks Tudor.
 - drop the spurious comment about the partitions, it goes way back
   until the initial support. I don't think it's accurate anymore.
   If the flash has the same size, the partitions can be trusted. If
   not, anything can happen.. We don't know.

v2/v1:
 - none, this is a remaining patch of my spring cleanup series.

 drivers/mtd/spi-nor/core.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 7128d45870d4..e0c4efc424f4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3298,32 +3298,28 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 
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
+	if (!info || info->id) {
 		const struct flash_info *jinfo;
 
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
+
+		/*
+		 * If caller has specified name of flash model that can normally
+		 * be detected using JEDEC, let's verify it.
+		 */
+		if (info && jinfo != info)
 			dev_warn(nor->dev, "found %s, expected %s\n",
 				 jinfo->name, info->name);
-			info = jinfo;
-		}
+
+		/* If info was set before, JEDEC knows better. */
+		info = jinfo;
 	}
 
 	return info;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
