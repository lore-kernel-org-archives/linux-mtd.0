Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0137C77B7C
	for <linux-mtd@archiver.kernel.org>; Mon, 29 May 2023 01:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jx4wPRn4CRBr+Y2Z1bpUiMkuWzkGIuWj1NMY1te8RZk=; b=TC8J0twozILOr2
	LQVoEogikwIarO2dYH+dGCXpUZJHYl6X+CpbuW6eMTLIv8zy3tl9vWoem4npbWc9f0hxH4AgczXzZ
	cF8WlnatHPaJnDlwiNEyREweoXMmEJiT1AVF1kw2zzXcJrP00hEMIwA7rX/Kt2P3e8tdYjLi/IF3z
	elEMANo5WM994jYS7hFvslzZCcllzOKUAhXCU354PcN58F+dh811U7Vxhd+6GXGwAE+vsVsgZFuoC
	lqoWpSV2GrWIlfgxay+myzcjS29Q+aVALAJJEhh9MoKB3PNw04C+WY55xDxsthUFSaIxhSAZ+v2FH
	WbImjyj1PrpdV56SewHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3S2s-008pPQ-1d;
	Mon, 29 May 2023 01:51:38 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3S2n-008pO0-2u
	for linux-mtd@lists.infradead.org;
	Mon, 29 May 2023 01:51:35 +0000
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id BE84418011D6BC;
	Mon, 29 May 2023 09:50:12 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Su Hui <suhui@nfschina.com>
Subject: [PATCH] mtd: devices: docg3: Remove unnecessary (void*) conversions
Date: Mon, 29 May 2023 09:50:11 +0800
Message-Id: <20230529015011.38811-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_185134_135893_2FF3B072 
X-CRM114-Status: UNSURE (   6.73  )
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

Pointer variables of (void*) type do not require type cast.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/mtd/devices/docg3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index a7714e3de887..22e73dd6118b 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1599,7 +1599,7 @@ static void doc_unregister_sysfs(struct platform_device *pdev,
  */
 static int flashcontrol_show(struct seq_file *s, void *p)
 {
-	struct docg3 *docg3 = (struct docg3 *)s->private;
+	struct docg3 *docg3 = s->private;
 
 	u8 fctrl;
 
@@ -1621,7 +1621,7 @@ DEFINE_SHOW_ATTRIBUTE(flashcontrol);
 
 static int asic_mode_show(struct seq_file *s, void *p)
 {
-	struct docg3 *docg3 = (struct docg3 *)s->private;
+	struct docg3 *docg3 = s->private;
 
 	int pctrl, mode;
 
@@ -1658,7 +1658,7 @@ DEFINE_SHOW_ATTRIBUTE(asic_mode);
 
 static int device_id_show(struct seq_file *s, void *p)
 {
-	struct docg3 *docg3 = (struct docg3 *)s->private;
+	struct docg3 *docg3 = s->private;
 	int id;
 
 	mutex_lock(&docg3->cascade->lock);
@@ -1672,7 +1672,7 @@ DEFINE_SHOW_ATTRIBUTE(device_id);
 
 static int protection_show(struct seq_file *s, void *p)
 {
-	struct docg3 *docg3 = (struct docg3 *)s->private;
+	struct docg3 *docg3 = s->private;
 	int protect, dps0, dps0_low, dps0_high, dps1, dps1_low, dps1_high;
 
 	mutex_lock(&docg3->cascade->lock);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
