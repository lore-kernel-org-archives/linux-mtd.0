Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F8DC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 13:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bfUVk/7SHYWNbk5oKt8gDrTyhDr9szRMUzlr1TVXUM=; b=ffv/T4hc22YZ/E
	9eTFaEfSd9mT8UrP2tMjt1D+XW16zfpnqUYeKbwcYRAEQXMXUaCCxlQ2cs7GrG16qvkM4UT8F/PbO
	582CjK5n9ynYhKEyiTMJvofioSoG6LZ9WflXvmY+eyeLJnthwQje8JwsgCQYDAH9AY42XgY2rQ1HK
	J0AKJQCqMH6Uy7qPEOtQfEHJ+ijNLVmT+pRd7+iPzJpZW3v1cXo7XrrYKGTmvhzZqVYPOewkU/3zW
	5ajTQibw1g420LMw/mUEHrbp0luw3BVh5wXt/HtlHFOlsj0hgaoGGSVrIQjKFn6g9jZuJLafqaKSM
	dhNRqPFBWPvUDtE8TOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbir5-0012ix-1P; Tue, 05 Apr 2022 13:04:19 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbiqo-0012dr-4q
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2022 13:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1649163842;
 x=1680699842; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S1wiQhSXl03OwHvB8odQNz0Ply4j8QcaKLui++yLhe4=;
 b=BR9UJt+xebBX61EnItzM1D4i+ES/2PGgUsLDCQCad4qrhNzjlnv3lWby
 SmnpI/7ERweYQNoilBuzIAgGmIinBTFCml3tGI3Ws1BTyPlSi2M1e8PoB
 Q85YwXBkX6sCgcoe6asR8lK3gJQQBkYn641YsRbOZHWVaJspzprSW2t62
 5FYaisD8sGysg0z4ri6MNlBUC8GW0d2yBF8IW0CUn8FmD9zMQ2RcxXa0V
 6+sDVjnAfX3ACGP5xqs/jA1d28MdsGyVQMiytktXls2c7muEXB+Isgqob
 +ahwGbKizEl3IgJKv1ntOUPesAJK797sq1f07QOmJTa5WWYtJkgJ7PPQr A==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <frowand.list@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/4] mtd: phram: Allow cached mappings
Date: Tue, 5 Apr 2022 15:03:50 +0200
Message-ID: <20220405130350.1640985-5-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405130350.1640985-1-vincent.whitchurch@axis.com>
References: <20220405130350.1640985-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_060402_534005_E52334F1 
X-CRM114-Status: GOOD (  12.22  )
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
