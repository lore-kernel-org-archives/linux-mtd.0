Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B725E69EA6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZk32Ngi0N9nkHWsOtu6f4pae+yPDEI3ECAbuNU43G0=; b=w6UfNjJY+AqL0w
	M4fjwSMNMV2Q6GdgvUBPl4+WwIV50z+gOYHJp42wmZmkYrroW0UWTkjJuqGHq5H+IYLF4TkVjOKb+
	h1V1q6+2XgNStQOmyR1yL18JwCt5J4DxEMmfdLTpvyzjY8FRwlwtSX3tI0m2L8UA+Qn83ra9FP+cC
	FSuW3Xl12kpzSrsLVXAbomPOceWbsxv/njfVHZFFVeTIDizQq0vZnntCmDoWGznbFKaayAaQjEyk/
	rxpJvybAzmlJDZkzQPICZ+7pxJlVBM/wDqexrWUmqljuzVks+0S2Ye0va7+lvBiMS2W+jrMSFHMKy
	dmDHSAUlCAHScGuyA6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQaJ-000000099qf-2Fn6;
	Tue, 03 Dec 2024 10:56:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQJH-0000000964H-2l3l
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 10:39:17 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1tIQJ6-00012Q-2c; Tue, 03 Dec 2024 11:39:04 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Tue, 03 Dec 2024 11:38:35 +0100
Subject: [PATCH v3 1/3] mtd: mchp48l640: make WEL behaviour configurable
MIME-Version: 1.0
Message-Id: <20241203-mb85rs128ty-v3-1-79107d54d839@pengutronix.de>
References: <20241203-mb85rs128ty-v3-0-79107d54d839@pengutronix.de>
In-Reply-To: <20241203-mb85rs128ty-v3-0-79107d54d839@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Schocher <hs@denx.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, David Jander <david@protonic.nl>, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=pmKV2DTV1hVzHSifSfG65uDKd3xGW/MuLvE4Vczmd2E=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkj3u39kRrfVeSbBia9O6pavmebx4fPZzxbeURUp7xY5N
 NstuqHh3FHKwiDGwSArpsgSqyanIGTsf92s0i4WZg4rE8gQBi5OAZjImiBGhov+KzlOrX24eMnM
 TeHp337E+ddOem10bnf/09x+J9bex4oM/90vdGxy31PVs9mhg2sj44Nf6+dHJhgs0Hh8e7HvxBO
 GHGwA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_023915_702612_CAFF6DFB 
X-CRM114-Status: GOOD (  13.96  )
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

From: David Jander <david@protonic.nl>

The 48L640 resets the WEL bit (the Write Enable Latch bit in the status
register) to zero on the completion of write operations. In preparation
to support chips behaving differently, introduce .auto_disable_wel
capability, and, if it's missing, explicitly reset the WEL bit after
writes.

Signed-off-by: David Jander <david@protonic.nl>
Reviewed-by: Heiko Schocher <hs@denx.de>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/mtd/devices/mchp48l640.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index f576e6a890e859e7d20aeeb2ede4ca0acf4850fc..4cdd24aaed416fc7e40a8060b5c7eaf6684fc6d5 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -27,6 +27,7 @@
 struct mchp48_caps {
 	unsigned int size;
 	unsigned int page_size;
+	bool auto_disable_wel;
 };
 
 struct mchp48l640_flash {
@@ -194,9 +195,15 @@ static int mchp48l640_write_page(struct mtd_info *mtd, loff_t to, size_t len,
 	else
 		goto fail;
 
-	ret = mchp48l640_waitforbit(flash, MCHP48L640_STATUS_WEL, false);
-	if (ret)
-		goto fail;
+	if (flash->caps->auto_disable_wel) {
+		ret = mchp48l640_waitforbit(flash, MCHP48L640_STATUS_WEL, false);
+		if (ret)
+			goto fail;
+	} else {
+		ret = mchp48l640_write_prepare(flash, false);
+		if (ret)
+			goto fail;
+	}
 
 	kfree(cmd);
 	return 0;
@@ -293,6 +300,7 @@ static int mchp48l640_read(struct mtd_info *mtd, loff_t from, size_t len,
 static const struct mchp48_caps mchp48l640_caps = {
 	.size = SZ_8K,
 	.page_size = 32,
+	.auto_disable_wel = true,
 };
 
 static int mchp48l640_probe(struct spi_device *spi)

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
