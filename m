Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC795C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FrfCpMmK3zj1ROV6F3J9HnRw01bGbz5j3OSOH+PupOQ=; b=Nppd89t1yyUwmk
	ylt07Fi4gWYmur0Z1L0+/R6NbMhpyJmhuCYiDM8zeMzgaEvdq+496UE2zydNbyA3X1U0gNnF/P9va
	9CRN41sqGV8bdiHJX9D/Blb7yE3z1I/xGHJoilNnmxzw5kG//1wrW8oZW5gdOnCBWekLWZTPoXh5B
	0vvgMlKQKg2OR6oR7B6FawXTxLxaVKcI9yZg1TAbOLXpDYCGkUdC7GMzn08zV5rNFj07NClSZANrd
	ixKAKWmm0fk8wfSxLWUuU1F7QRKlV7L+Rs8Dkfy4tpbYgHeCuro+ryfuXg3wWxyzkCM+lSV+/LGp3
	t63uzE/TJLBTDFEOY/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noRdG-002gjQ-VR; Tue, 10 May 2022 15:18:39 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noRdD-002ggM-IP
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 15:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1652195915;
 x=1683731915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L72R/3pl0k6gCMx5L3/WImeqw8/7Ha/qfVw/S09dPtQ=;
 b=mlUKzeKnJ9gvIJy2TqYcp/s9vgx631wqBB0tAc7N4B3jS/8zYbQcGDJg
 d0q5Fh414Orh0x72ts9nlQgc02Xwk5mmlhpETjVj3MBvitIxxYZhtPnmC
 SoQfmLNDBKOw3ek3Sh1XqFSLvcdLRJD4JGL13OtC53DbpEkg247vdhR3h
 w7JqzpDl4t7qlQ2ecqhzkisM/NpXNjNMHyQyhGjYTsRjfByYoH5j7w8k7
 /O9eGZVrqXlQM3rQfAntlomgRXCQdyyTeeG6mHWveZsrbwMG4MgKMdurW
 Vfmi+HepMtWqEjx1lTLXwnuv01Epl12atF+SnyHtwxporMv0Uyk6oW+in w==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Joern Engel <joern@lazybastard.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
CC: <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4] mtd: phram: Allow cached mappings
Date: Tue, 10 May 2022 17:18:22 +0200
Message-ID: <20220510151822.1809278-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_081836_107792_0712A566 
X-CRM114-Status: GOOD (  18.01  )
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

(Note that this driver has always used normal memcpy/memset functions on
memory obtained from ioremap(), which sparse doesn't like.  There is no
memremap() variant which maps exactly to ioremap() on all architectures,
so that behaviour of the driver is not changed to avoid affecting
existing users, but the sparse warnings are suppressed in the moved code
with __force.)

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---

Notes:
    v4:
    - Split out from "[PATCH v3] mtd: phram: Allow cached mappings"[0] since the
      rest of the patches have been merged to mtd-next.
    - Rebased on mtd-next.
    - Refactored to avoid code duplication, fix sparse warnings in the existing
      code which is moved, and also to avoid SH build problems[1]
    
    [0] https://lore.kernel.org/lkml/20220412135302.1682890-1-vincent.whitchurch@axis.com/"
    [1] https://lore.kernel.org/lkml/CAMuHMdW-8HaQip+DT5W2Owq8M8kbYwHsf8_Zd-5rRfSjSjK0=g@mail.gmail.com/

 drivers/mtd/devices/phram.c | 43 +++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 506e9edf5c85..208bd4d871f4 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -34,6 +34,7 @@
 struct phram_mtd_list {
 	struct mtd_info mtd;
 	struct list_head list;
+	bool cached;
 };
 
 static LIST_HEAD(phram_list);
@@ -80,13 +81,41 @@ static int phram_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+static int phram_map(struct phram_mtd_list *phram, phys_addr_t start, size_t len)
+{
+	void *addr = NULL;
+
+	if (phram->cached)
+		addr = memremap(start, len, MEMREMAP_WB);
+	else
+		addr = (void __force *)ioremap(start, len);
+	if (!addr)
+		return -EIO;
+
+	phram->mtd.priv = addr;
+
+	return 0;
+}
+
+static void phram_unmap(struct phram_mtd_list *phram)
+{
+	void *addr = phram->mtd.priv;
+
+	if (phram->cached) {
+		memunmap(addr);
+		return;
+	}
+
+	iounmap((void __iomem *)addr);
+}
+
 static void unregister_devices(void)
 {
 	struct phram_mtd_list *this, *safe;
 
 	list_for_each_entry_safe(this, safe, &phram_list, list) {
 		mtd_device_unregister(&this->mtd);
-		iounmap(this->mtd.priv);
+		phram_unmap(this);
 		kfree(this->mtd.name);
 		kfree(this);
 	}
@@ -96,6 +125,7 @@ static int register_device(struct platform_device *pdev, const char *name,
 			   phys_addr_t start, size_t len, uint32_t erasesize)
 {
 	struct device_node *np = pdev ? pdev->dev.of_node : NULL;
+	bool cached = np ? !of_property_read_bool(np, "no-map") : false;
 	struct phram_mtd_list *new;
 	int ret = -ENOMEM;
 
@@ -103,9 +133,10 @@ static int register_device(struct platform_device *pdev, const char *name,
 	if (!new)
 		goto out0;
 
-	ret = -EIO;
-	new->mtd.priv = ioremap(start, len);
-	if (!new->mtd.priv) {
+	new->cached = cached;
+
+	ret = phram_map(new, start, len);
+	if (ret) {
 		pr_err("ioremap failed\n");
 		goto out1;
 	}
@@ -140,7 +171,7 @@ static int register_device(struct platform_device *pdev, const char *name,
 	return 0;
 
 out2:
-	iounmap(new->mtd.priv);
+	phram_unmap(new);
 out1:
 	kfree(new);
 out0:
@@ -362,7 +393,7 @@ static int phram_remove(struct platform_device *pdev)
 	struct phram_mtd_list *phram = platform_get_drvdata(pdev);
 
 	mtd_device_unregister(&phram->mtd);
-	iounmap(phram->mtd.priv);
+	phram_unmap(phram);
 	kfree(phram);
 
 	return 0;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
