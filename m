Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3CAC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWsgfEAQHm54Ng0u2tPdvrmxn3+T3ltIDzMXNSihheU=; b=vd/2EWzJ5+qC71
	CUxZm+Zr/UjFkLiJUgVxRQXFaN3PZX/8FBjjKb2ejThe9K/6IwOcOkH43DUu6bHW3lZDX/HZJbpSj
	s/WiLPBOnD3bRD7Gx3WbDngJWopkmUieLpetb26MqD5Ed3OVyl4DLwX+C4CzHYc+0u72SE+UM2WMv
	EG6pQvICNTpKN2WfXUVlMX3xn+X9JE3x856JeXZaohyCROB9v+KgzppVm+DRzIknNzhWSqyRTNws0
	Rg0JCgHBtLLGi29APgMC+x04KfyypTJLIHWEvqzgZqhiwJhAcs3BVLJZOPmyO561l05GieldXOcRs
	o67YBTXtlUSutGWeL0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neGxO-00Ei46-T7; Tue, 12 Apr 2022 13:53:22 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neGxJ-00Ei05-7f
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 13:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1649771597;
 x=1681307597; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LejCdvhc0hzLl8lZPhOSbxuyu0T2rEaAYkiZnsIK59M=;
 b=Xpl8Tl9c4Dfl8gLllu+N/2Y8W7FTusF9hUvgPn003vGe+kERdJM+qzur
 ibmmQoao4nrGMJzCfTn5WD2YA1A7whCtNjyRqU6etiLaS9YfNdDvZX3ed
 71pErzIzLgvsvtEaiOATuLyDHulyT6LedlCZzlGIJ9DbIUSvtiPXgtqH6
 KLK/vTk+Hk6I7hX5qhSQtj22QRwtcL8t+CTe/XEMEfw6eXwAkNp5lS6Da
 6lzt3PGheH/mLBCI1A3fx5KGQKgPOkLOU/pe8p1BTGHAinaiE/E1Az/hy
 483+H2R3KDHthYlW4URe4q46aLpsh9+3jxtaAggwF4sXF0BHQW5v4tP4b g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <frowand.list@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/4] mtd: phram: Allow cached mappings
Date: Tue, 12 Apr 2022 15:53:02 +0200
Message-ID: <20220412135302.1682890-5-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220412135302.1682890-1-vincent.whitchurch@axis.com>
References: <20220412135302.1682890-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_065317_644416_BC085D50 
X-CRM114-Status: GOOD (  12.72  )
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
index 506e9edf5c85..89d74a1eff4f 100644
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
