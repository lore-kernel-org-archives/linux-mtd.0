Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E44C001B2
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Dec 2022 19:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwFYrRL/mMX2hNw2P3MlUk1IqTpyXrkrLN58bzf+33M=; b=r8XC9se7e24Gkk
	/j6HD7Hwkk+8ZNsOh/8D3juWKWWbfHA7il74+SQ7yNvFryd5+PdZHoLKvFyR25GVV8QBliFxtarg/
	6NDWzxdT1GSO9MLlAaPqQ+0ViUxI8p0cUHKzew5Us4cS+mvujO+eeU+Lp+t2ZowqHlBKnckkxGLqx
	8O4fsSEvOo/6Mwwn4S88rb8Qd11z5wqngQ54LH9D73S62eonwcUsnIXq0w5ndewXW/NT8LA+UyzXG
	YKOKj9N62B9GT96LkUS1yYnHhCKsvmQZXZS9ENqYHsFwDg40wD/KtV4J7uTDfRgc46JgU6TnwouYE
	RZ+bf/tRMgn8uiOPkruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RKE-00FxHt-Qj; Thu, 22 Dec 2022 19:33:54 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RJX-00FwfN-Ad
	for linux-mtd@lists.infradead.org; Thu, 22 Dec 2022 19:33:12 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1p8RJW-0004V0-0C;
	Thu, 22 Dec 2022 20:33:10 +0100
Date: Thu, 22 Dec 2022 19:33:04 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/2] mtd: ubi: wire-up parent MTD device
Message-ID: <39de7617513dfae3a0183b74aac119fbdc5141e9.1671737443.git.daniel@makrotopia.org>
References: <cover.1671737443.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1671737443.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_113311_401105_3524B1D7 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

Wire up the device parent pointer of UBI devices to their lower MTD
device, typically an MTD partition or whole-chip device.

The most noticeable change is that in sysfs, previously ubi devices
would be could in /sys/devices/virtual/ubi while after this change they
would be correctly attached to their parent MTD device, e.g.

/sys/devices/platform/1100d000.spi/spi_master/spi1/spi1.0/mtd/mtd2/ubi0.

Locating UBI devices using /sys/class/ubi/ of course still works as
well.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 5e90a4423b699..0904eb40c95fa 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -915,6 +915,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	ubi->dev.release = dev_release;
 	ubi->dev.class = &ubi_class;
 	ubi->dev.groups = ubi_dev_groups;
+	ubi->dev.parent = &mtd->dev;
 
 	ubi->mtd = mtd;
 	ubi->ubi_num = ubi_num;
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
