Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F91E936EB
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 22:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FHR5H2LYt+rKEkuidhzDC+5lOELkgUZRamOJDgETg5I=; b=Q9MpCzyM0orSPY
	e1+66Ti59v+y9FguslYAzpJr9qditbIw4GQtxU6BDNJIl/aG9hnrdG4Udyy+EYcmnSAi+Alq1TQTa
	PTbAVpfuvVJk9YKPy/W3ZDQfD7hrUIKipZN8x6OujfrrEE5Xolp4TUJN67QL90xEEZQSuJYBmYqjw
	hbndzYsSodUZTscMu1vSfQNG5Gi+cqcCRG+UoJ2H76lFIObMjZGYoNeQP6WMCiT2TjtzFfDSdyvMu
	cP1GcGzm/9NwJJyQUFMqpje8MtO8mO2IjjPfBKMSgQRZXuaQMRjBpF0WT16Crp0SSFQrH9NcaarTw
	dl7KDAjAW8DtEC3QH7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo9z6-000y4m-1e;
	Wed, 04 Oct 2023 22:04:48 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo9z3-000y3d-1s
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 22:04:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54369E0006;
	Wed,  4 Oct 2023 22:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696457081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9ONukwliW8afod/uqqOCJF3W294VpFny5l+bXSFF2Ac=;
	b=I4Gy56FNjUtiehwUUxOkR9l/FMBhS8k6o4d9n7dSkDqVwog+3VDuwO3uSESc43p9xnYvrg
	t8bvG98qGnDVSWjSokJ9JQtEhdIT/r9L7VunsuuRGBDViYJhV0mTXvhOZs0JFe6Al38Zk2
	k6mBuVf4Ehs36GBfWZQXX6dSAFbaIFmS54aMD1Spl5uyFX+fN/Cmjlnwm+FCbvvPcmjo/J
	MtHfaH2aTO8BnDXUuPUZuVwpl7qpv4Z+fBLsXn6EkIULvauToema0jT4K/PL5NFUa2L3f1
	39rXnIQSFGvfHzhfmugBIpkBwc4rN8GHTbBCyc875+IE/4pJIK5tOTmuTpK4cw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: Ensure NVMEM layouts get their of_node
Date: Thu,  5 Oct 2023 00:04:37 +0200
Message-Id: <20231004220437.405959-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_150445_914464_E92F8012 
X-CRM114-Status: GOOD (  10.94  )
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

All the nvmem-layouts logic expects an of_node to be available. When mtd
started registering nvmem devices, the exact exposure was not yet
decided and thus the no_of_node field was set to 1 to avoid exposing
"too much". This has been lowered since we want children nodes of mtd
devices with the "nvmem-cells" compatible to be actually registered in
NVMEM. This is now also the case of the nvmem-layout containers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtdcore.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 061745acb9a7..60b670c42be5 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -543,6 +543,13 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
 	return retlen == bytes ? 0 : -EIO;
 }
 
+static bool mtd_contains_nvmem_layout(struct mtd_info *mtd)
+{
+	/* of_find_node_by_name() calls of_node_put() on the starting node */
+	of_node_get(mtd->dev.of_node);
+	return of_find_node_by_name(mtd->dev.of_node, "nvmem-layout");
+}
+
 static int mtd_nvmem_add(struct mtd_info *mtd)
 {
 	struct device_node *node = mtd_get_of_node(mtd);
@@ -559,7 +566,8 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.read_only = true;
 	config.root_only = true;
 	config.ignore_wp = true;
-	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells");
+	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells") ||
+			    !mtd_contains_nvmem_layout(mtd);
 	config.priv = mtd;
 
 	mtd->nvmem = nvmem_register(&config);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
