Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA69C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bfUVk/7SHYWNbk5oKt8gDrTyhDr9szRMUzlr1TVXUM=; b=Lg+QxxgvNwv+AC
	yabMq2WRGb85xUcSDQ0byxSE0yqrSx3EA7GEl53ARd8iQU5buEfP480JWWfLFwoGWUs87ZCrf5sAZ
	R+wBkUN1ToA0bU5+NAIxpVrEyfDPbk8pVnL9X+L7GJRpXl+y2o4OlPLlW6aBU+9h7cdSLWWw6lCcD
	8USTucQRJ+kYX1BCW/l+SysZ7y7Bzm7UWQqYyZvXhiYCfmQhrd06RtW1YO36Ft8wNoMs/vdDusGZ2
	cNimSX91i1FaLTpou3U1E0DXmtUKvjnobCQfj9k5YvfI7OfX85XOYrKjhP7s/3D9tl/CvNf8ENfXb
	LYks/7bxtr3oV+p7zPbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nREB6-000Lqz-V0; Mon, 07 Mar 2022 14:17:37 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRE9s-000LLE-0u
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 14:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1646662580;
 x=1678198580; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S1wiQhSXl03OwHvB8odQNz0Ply4j8QcaKLui++yLhe4=;
 b=PD745jsmt1S66BQynj8PWhu8EVtAWH7/uEwlF9eKZSFgRx/tMWLh3Pee
 TX02v0QTHnLlIZwB+iP+cb7XusZyyAYI+P+Ji7C/EL0MnjZniOp8MT2VG
 tJkLI97ITBOWSNbkRY2ldW6AReBxx4oEpfAnHO3Rj1eEST/1pspvSCWgF
 NVsinAk+yLH4iyQBX9rlrIdyC9NT3qxT/bIbavVvJt8m7MixL82Xam0r4
 /6EEZBWJ8K2rtiIGvjE3BexYr5wKyFoPz2XBL7sDuq8+Vk6Y55YqF1W4o
 ++LMPFiUAhWlQfjGw4fpnCQILj0p24bkw1yeWX04EL1mf/12GwTFTj5yP g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <frowand.list@gmail.com>, <krzysztof.kozlowski@canonical.com>,
 <robh+dt@kernel.org>, Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH 4/4] mtd: phram: Allow cached mappings
Date: Mon, 7 Mar 2022 15:15:49 +0100
Message-ID: <20220307141549.2732179-5-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307141549.2732179-1-vincent.whitchurch@axis.com>
References: <20220307141549.2732179-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_061620_441934_53DB375A 
X-CRM114-Status: GOOD (  12.66  )
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

Currently phram always uses ioremap(), but this is unnecessary when
normal memory is used.  If the reserved-memory node does not specify the
no-map property, indicating it should be mapped as system RAM and
ioremap() cannot be used on it, use a cached mapping using
memremap(MEMREMAP_WB) instead.

On one of my systems this improves read performance by ~70%.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/mtd/devices/phram.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 6dfe9401a3c5..ac2679f9031a 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -34,6 +34,7 @@
 struct phram_mtd_list {
 	struct mtd_info mtd;
 	struct list_head list;
+	bool cached;
 };
 
 static LIST_HEAD(phram_list);
@@ -96,6 +97,7 @@ static int register_device(struct platform_device *pdev, const char *name,
 			   phys_addr_t start, size_t len, uint32_t erasesize)
 {
 	struct device_node *np = pdev ? pdev->dev.of_node : NULL;
+	bool cached = np ? !of_property_read_bool(np, "no-map") : false;
 	struct phram_mtd_list *new;
 	int ret = -ENOMEM;
 
@@ -103,8 +105,13 @@ static int register_device(struct platform_device *pdev, const char *name,
 	if (!new)
 		goto out0;
 
+	new->cached = cached;
+
 	ret = -EIO;
-	new->mtd.priv = ioremap(start, len);
+	if (cached)
+		new->mtd.priv = memremap(start, len, MEMREMAP_WB);
+	else
+		new->mtd.priv = ioremap(start, len);
 	if (!new->mtd.priv) {
 		pr_err("ioremap failed\n");
 		goto out1;
@@ -140,7 +147,7 @@ static int register_device(struct platform_device *pdev, const char *name,
 	return 0;
 
 out2:
-	iounmap(new->mtd.priv);
+	cached ? memunmap(new->mtd.priv) : iounmap(new->mtd.priv);
 out1:
 	kfree(new);
 out0:
@@ -362,7 +369,7 @@ static int phram_remove(struct platform_device *pdev)
 	struct phram_mtd_list *phram = platform_get_drvdata(pdev);
 
 	mtd_device_unregister(&phram->mtd);
-	iounmap(phram->mtd.priv);
+	phram->cached ? memunmap(phram->mtd.priv) : iounmap(phram->mtd.priv);
 	kfree(phram);
 
 	return 0;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
