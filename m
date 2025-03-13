Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2A2C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vogcT277xe959Aj8Vkod1PmyTKFj+5ZzNDk7iRol+8w=; b=MmigXdfr0Ql1DU
	FZgAGHrRMpFJXo+5lee7C5r0CvWlsowYXXSCMR9zDeYyRKv+f1gVWia4mll78blscn8QEx476da6o
	jENIfcHIrOowOMAlfqflCYxRCBZaG6ZyI4YPZDhIzk4WfVtfbz8uLkQanQGui2c/AA0MuLC3fy8bC
	wTH/W249GH9TXr/Y4SnW6AMP9tikoXUkyx7p9Psfj/a9gHCVuMfad7k5RGtGCP5WuGu3FfzHOo9C7
	hII1J3q63/w9uwxAAch9nWjWrolLkyhuYf/y/zmLavdD9QjPxPz4Jkk+DmUrmcZHzeThECDaYIbl5
	jXEbBXurm9xoxZhjpXnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfKd-0000000AnVz-2dMV;
	Thu, 13 Mar 2025 09:58:27 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfKQ-0000000AnSA-1s36
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 09:58:16 +0000
X-UUID: a8a3dbc2fff111efa216b1d71e6e1362-20250313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:3de06487-e397-4f0a-86da-1bab374ecafa,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:2d9882719783582ce917f1dc80192fb1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:5,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a8a3dbc2fff111efa216b1d71e6e1362-20250313
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 656145711; Thu, 13 Mar 2025 17:58:05 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 234BFE008902;
	Thu, 13 Mar 2025 17:58:05 +0800 (CST)
X-ns-mid: postfix-67D2AC2C-8975662165
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id 0D53AE008901;
	Thu, 13 Mar 2025 17:58:03 +0800 (CST)
From: Zhang Heng <zhangheng@kylinos.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	han.xu@nxp.com,
	hs@denx.de,
	david@protonic.nl,
	jre@pengutronix.de
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/2] mtd: mchp48l640: Use str_enable_disable() in mchp48l640_write_prepare()
Date: Thu, 13 Mar 2025 17:57:56 +0800
Message-ID: <20250313095756.945890-2-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250313095756.945890-1-zhangheng@kylinos.cn>
References: <20250313095756.945890-1-zhangheng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_025814_802448_B8FE609F 
X-CRM114-Status: UNSURE (   6.71  )
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

Remove hard-coded strings by using the str_enable_disable() helper
function.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 drivers/mtd/devices/mchp48l640.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index 7584d0ba9396..4af9208f9690 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -23,6 +23,7 @@
 #include <linux/spi/flash.h>
 #include <linux/spi/spi.h>
 #include <linux/of.h>
+#include <linux/string_choices.h>
 
 struct mchp48_caps {
 	unsigned int size;
@@ -128,11 +129,11 @@ static int mchp48l640_write_prepare(struct mchp48l640_flash *flash, bool enable)
 	mutex_unlock(&flash->lock);
 
 	if (ret)
-		dev_err(&flash->spi->dev, "write %sable failed ret: %d",
-			(enable ? "en" : "dis"), ret);
+		dev_err(&flash->spi->dev, "write %s failed ret: %d",
+			str_enable_disable(enable), ret);
 
-	dev_dbg(&flash->spi->dev, "write %sable success ret: %d",
-		(enable ? "en" : "dis"), ret);
+	dev_dbg(&flash->spi->dev, "write %s success ret: %d",
+		str_enable_disable(enable), ret);
 	if (enable)
 		return mchp48l640_waitforbit(flash, MCHP48L640_STATUS_WEL, true);
 
-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
