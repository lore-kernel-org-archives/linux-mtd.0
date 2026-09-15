Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D88C88E7F
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cFLTOt6ANLsbTYp+PWRyfqmEXaK4KtMwo2kA+LcFSNU=; b=ooxLgAL46T61G5
	RnXAhX+wZvvD0is4LXLjPCvdBlg1C0xdSIcJqVyMaUpJBHaQGV2MuWQBWDePbMFx3pxiudJr9iunG
	OxMUGWNObh3HDa5ljEqah9HajQrTtfI91Di05tdiu12UwsOvtdDNOS4rBXZXapW5cnYH5/PmsVG6O
	9+eEWZm+GrCNyseMGD10hZuWKYEaB0H5Fs87EQrHqa0y7PdOxXf6aHUoDdhKVx3SiIq5dv111+Kh3
	WGqBpnA/k+IblUwFIzxXad2NVjoRM7lS333rofXS2EmkvBwqIQhiA7B9AgqIw+qlw3XtbAayC9dmT
	YxknN88KyrU4ZhWgYRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UPy-00000006zv0-13EP;
	Tue, 15 Sep 2026 14:45:54 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UPv-00000006zse-1hWy
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 14:45:53 +0000
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ddceb527;
	Tue, 15 Sep 2026 22:45:46 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Maxim Levitsky <maximlevitsky@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] mtd: rawnand: r852: Prevent card work during removal
Date: Tue, 15 Sep 2026 22:45:43 +0800
Message-Id: <20260915144543.3466083-1-lhfff@tju.edu.cn>
MIME-Version: 1.0
X-HM-Tid: 0aa0a587f7f503a1kunm35bf4d8e2df843
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ01OVklOQhlMGU9JTUweH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=tIDlp0VPgZQMucIua2E7MLzI6R6LiX+1z9YPWHvJ7a9waxd2T0Lv1dQ/rW8GarWFsyLaULnD/T61Vqt/uZoo8nWACQZEan/AWVCbW19rN1AFM+tTOP6+tYhZI9BDTHk7BpOXngKTFcKLIZ+dTF4k2RpVA3kl4kO2dDubvhK7XA8=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=BhOZe8NSRy2x4UKf+xHcg6ZlHNX3SVPP+kqzW3NooFQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_074551_670767_131BF23D 
X-CRM114-Status: GOOD (  14.54  )
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

r852_irq() queues card_detect_work when card state changes.  r852_remove()
currently cancels that work and destroys its private workqueue before it
disables and frees the IRQ.

A card event in this interval can queue delayed work on the destroyed
workqueue.  Its timer is part of struct r852_device, which is freed later
in r852_remove().  KASAN reported a use-after-free in the timer code when
the card interrupt occurred in this interval.  The same test completed
without a kernel diagnostic after this change.

Set a removal flag while holding irqlock before cancelling the work.  The
IRQ handler still acknowledges and disables card events, but does not
queue more card-detect work during removal.  The lock ensures that work
queued before the flag is cancelled and later interrupts skip the queue.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
 drivers/mtd/nand/raw/r852.c | 7 +++++++
 drivers/mtd/nand/raw/r852.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..6170a481cb1f 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -747,6 +747,9 @@ static irqreturn_t r852_irq(int irq, void *data)
 		/* this will timeout DMA if active, but better that garbage */
 		r852_disable_irqs(dev);
 
+		if (dev->removing)
+			goto out;
+
 		if (dev->card_unstable)
 			goto out;
 
@@ -977,6 +980,10 @@ static void r852_remove(struct pci_dev *pci_dev)
 {
 	struct r852_device *dev = pci_get_drvdata(pci_dev);
 
+	spin_lock_irq(&dev->irqlock);
+	dev->removing = true;
+	spin_unlock_irq(&dev->irqlock);
+
 	/* Stop detect workqueue -
 		we are going to unregister the device anyway*/
 	cancel_delayed_work_sync(&dev->card_detect_work);
diff --git a/drivers/mtd/nand/raw/r852.h b/drivers/mtd/nand/raw/r852.h
index 96fe301d15da..5c931880c2f4 100644
--- a/drivers/mtd/nand/raw/r852.h
+++ b/drivers/mtd/nand/raw/r852.h
@@ -131,6 +131,7 @@ struct r852_device {
 	int card_detected;		/* card detected in slot */
 	int card_unstable;		/* whenever the card is inserted,
 					   is not known yet */
+	bool removing;			/* do not queue card work during removal */
 	int readonly;			/* card is readonly */
 	int sm;				/* Is card smartmedia */
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
