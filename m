Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67390C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:22:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 378656058D
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 378656058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAlbfkEoawZaU0+WsGQGMu2/rgtFH/r3vykmlt8bmUM=; b=biBiYT/Z6fidXL
	mETQ8ZrNV2UIhRJHTvYd89FfGqj+rtch7JMn04bpfoTgGD78obLgAELYvgNxnVsi7Xcb37phkGMxx
	8lsi8K3YkjaGdLmzxBSyzruzOTzcEQCthgccIspsPoLMKeFjwXbZG+I6Pl81PjsVJJwQ/ZrvOPVQ/
	bpqP/D2WYOl/xhUdo3leK7ej/uYAshEyv4EwQdstrmRovRts38355LsiEjjkFF5LvDUbfAMNa0pDE
	SOGmY6t7UG7IbbYdMTnRbVgA5aMcGnMEjI2AFlLwnEpCeGhaSYUb00T1Fp8Zx6K5upJNCfKPwNx5q
	Tnnv7Ys/IDWl81L8QyWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUz0E-004cbl-T3; Mon, 27 Sep 2021 22:21:38 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyhC-004UJX-Ie; Mon, 27 Sep 2021 22:01:58 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, bhelgaas@google.com, liushixin2@huawei.com,
 thunder.leizhen@huawei.com, lee.jones@linaro.org, geoff@infradead.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 jim@jtan.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 josh.h.morris@us.ibm.com, pjk1939@linux.ibm.com, tim@cyberelk.net,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v2 06/10] block/rsxx: add error handling support for add_disk()
Date: Mon, 27 Sep 2021 15:01:53 -0700
Message-Id: <20210927220157.1069658-7-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220157.1069658-1-mcgrof@kernel.org>
References: <20210927220157.1069658-1-mcgrof@kernel.org>
MIME-Version: 1.0
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

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/rsxx/core.c |  4 +++-
 drivers/block/rsxx/dev.c  | 12 +++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
index 83636714b8d7..8d9d69f5dfbc 100644
--- a/drivers/block/rsxx/core.c
+++ b/drivers/block/rsxx/core.c
@@ -935,7 +935,9 @@ static int rsxx_pci_probe(struct pci_dev *dev,
 			card->size8 = 0;
 	}
 
-	rsxx_attach_dev(card);
+	st = rsxx_attach_dev(card);
+	if (st)
+		goto failed_create_dev;
 
 	/************* Setup Debugfs *************/
 	rsxx_debugfs_dev_new(card);
diff --git a/drivers/block/rsxx/dev.c b/drivers/block/rsxx/dev.c
index 1cc40b0ea761..b2d3ac3efce2 100644
--- a/drivers/block/rsxx/dev.c
+++ b/drivers/block/rsxx/dev.c
@@ -192,6 +192,8 @@ static bool rsxx_discard_supported(struct rsxx_cardinfo *card)
 
 int rsxx_attach_dev(struct rsxx_cardinfo *card)
 {
+	int err = 0;
+
 	mutex_lock(&card->dev_lock);
 
 	/* The block device requires the stripe size from the config. */
@@ -200,13 +202,17 @@ int rsxx_attach_dev(struct rsxx_cardinfo *card)
 			set_capacity(card->gendisk, card->size8 >> 9);
 		else
 			set_capacity(card->gendisk, 0);
-		device_add_disk(CARD_TO_DEV(card), card->gendisk, NULL);
-		card->bdev_attached = 1;
+		err = device_add_disk(CARD_TO_DEV(card), card->gendisk, NULL);
+		if (err == 0)
+			card->bdev_attached = 1;
 	}
 
 	mutex_unlock(&card->dev_lock);
 
-	return 0;
+	if (err)
+		blk_cleanup_disk(card->gendisk);
+
+	return err;
 }
 
 void rsxx_detach_dev(struct rsxx_cardinfo *card)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
