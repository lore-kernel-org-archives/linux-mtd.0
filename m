Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B513ECD54B5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 11:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VhEHkZtJq97PLGMTxREw0Msadst0+hI+LtujsAUdN04=; b=Tn7LqGKWBUY7kK
	3ZO7lMcXsb+Za30q7swN+rcyK4i0g5hlZjq2A1PDtIqshqK6cjHI6GTeOVtvjuJsFCRsv6AMRZdBI
	NRBHJtQPx3dN6KyK689gGb6v3kwGxso8spR0RtSa5YLBaVD9oqbfh/Xm66O+jZW4Y1IlHQ96iHcrC
	BV92B23dS1DhKzCZ2aEclxgu1iNBLEqTyqaJk23AS52Q29kvguUx2jgfElRmWoLI9/r0HqCCODwm9
	NEZhMy9wrrU4GAwRIMyJYDY8AF1YTG1hSKj4SDDWVKX1DaxR4rNWhcXj+U9Rw0MhocPf3BybtFxNu
	sXoNjhQXc24f9og43C2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZ0N-000InU-2Z;
	Tue, 19 Sep 2023 11:34:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZ0K-000Ilq-1S
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 11:34:57 +0000
From: Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1695123293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K2A2PAUnE9j4r0bvfMULyyO54Q1ghBSOYLvBI7DnlD0=;
	b=yxqFG7Z+B++kL3d0+j8S6CBXJsy0Fl3Z3Qp3xVy1gcpHYB2A9czAOt8CMO4AlCCdAKrh2l
	JzXNWQqNYpHNmxHIrVgTzwwJmQY9rFJjRiuR8ZNX1KllzIealcP4re8xyD6va9bZuMy/Zx
	WGK8/pZH9fFWN7m9CAB0zMuNiPwlFG32FxRNQ7QFJe4uqcAKXCQO2rJ1Hq7WW1bPqWfdoy
	l2keHyrd0XwozNNW2LkunnQMeTX1Pkv/zQquGb6VhitkKv40R1plVr/Aut50IoJWVTGb9D
	vZy5SeRQXlY6FRTsarTT+v0c0MGjbe1GgmA2GklAMEWB2FBCTYN4rsP06HOwNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1695123293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K2A2PAUnE9j4r0bvfMULyyO54Q1ghBSOYLvBI7DnlD0=;
	b=daifXY8/6UqNcZCv3usko3EDxMPUhJXqWDt7X5SoZ0tZU3zfH3rMkCCRLzX2svl0QMJF/f
	D+uEPfkmWr0szRDQ==
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org
Cc: linus.walleij@linaro.org,
	b.spranger@linutronix.de,
	shivamurthy.shastri@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: map_ram: prevent use of point and unpoint when NO_XIP is set
Date: Tue, 19 Sep 2023 13:33:20 +0200
Message-Id: <20230919113320.16953-1-shivamurthy.shastri@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_043456_626932_E1E6FBF8 
X-CRM114-Status: GOOD (  10.22  )
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

When the DT property no-unaligned-direct-access is set, map->phys is set
to NO_XIP. With this property set, the flash should not be exposed
directly to MTD users, since it cannot be mapped.

map_ram() exposes the flash direct access unconditionally which leads to
access errors (when the bus width does not match the RAM width).

Therefore do not set point and unpoint when NO_XIP is set.

Signed-off-by: Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
Reviewed-by: Benedikt Spranger <b.spranger@linutronix.de>
---
 drivers/mtd/chips/map_ram.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index e8dd6496927e..f9d3e32ef8e9 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -70,12 +70,16 @@ static struct mtd_info *map_ram_probe(struct map_info *map)
 	mtd->_read = mapram_read;
 	mtd->_write = mapram_write;
 	mtd->_panic_write = mapram_write;
-	mtd->_point = mapram_point;
 	mtd->_sync = mapram_nop;
-	mtd->_unpoint = mapram_unpoint;
 	mtd->flags = MTD_CAP_RAM;
 	mtd->writesize = 1;
 
+	/* Disable direct access when NO_XIP is set */
+	if (map->phys != NO_XIP) {
+		mtd->_point = mapram_point;
+		mtd->_unpoint = mapram_unpoint;
+	}
+
 	mtd->erasesize = PAGE_SIZE;
  	while(mtd->size & (mtd->erasesize - 1))
 		mtd->erasesize >>= 1;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
