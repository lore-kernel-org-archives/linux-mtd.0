Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E236EC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:35:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8796560E97
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8796560E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DNifQI25+4KkNVVbg6xWujOK4G0u5n6hx3GcCi6zpk=; b=DY3cywqMP1PFGZ
	LU4M/2KwClnHxpdQUxRwZIqUj7MyP6WJrL4s38po+bQlzz3B+sWdizDAJERfIbv7BjO2KbRhVQB6U
	AtGthCfym8pQdMOG+sTjW82ZyAuS6RL3Zt+YagoMAjRx4Jm0wjSj25va9Pp5f5arRTAsf+hFVGLIl
	xf8+bfwvACusMC/YLwTxxpXfBgfSW1dGmUS8USjXNu2B4VfsJTcIXrwBv1dUZFuEy2clUUR3TQau9
	BCrJNUZnkMQvi2gvke03S6gPj8YeBVM46QX5c9s2CCOVoKrtMR3yU/KLf/TnI0bw08gRkTpbQzvXP
	jRbvXrS3rZBhilZbWmQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI4UJ-00FkUN-5N; Mon, 23 Aug 2021 07:35:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4UH-00FkU1-Vx
 for linux-mtd@bombadil.infradead.org; Mon, 23 Aug 2021 07:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=2tzDZdLpuKXA+ygmvE34pMzvWGlwygVPE/R2irJ5MLo=; b=gCMffEP/BRk0dEPPUyj9UlH+Wf
 5Nq9MqYwTnSYo/2I+R9/DGMjkbKkOLdIG8gv4XPhkUF42EECGOuK8MFUXaRR313l3h7djJnnvK3Ci
 eqpLnj8Bek91XVnL0De+G5LdcvZosu0XMwEXvImqkKPMCsR+1DtPOKb4fppfwCyN2rNxQNMijVH4E
 mTrm3189THKoG8n63sBXkAGFabQIXxa6vRgF2XP7o1aDdx9fhTRpZdWV3Zr1ufvrKhelXsFsLHw8C
 qJR5Yo0iOqa4ZhxRPAGMVbf0Yg1u48OiISuDE3t8BGlnYXre0RlDkLarjEdDLui0e23pMChUo/YBw
 n3WLEexw==;
Received: from [2001:4bb8:193:fd10:c6e8:3c08:6f8b:cbf0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4Tc-009QhA-1K; Mon, 23 Aug 2021 07:34:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/8] mtd_blkdevs: don't hold del_mtd_blktrans_dev in
 blktrans_{open, release}
Date: Mon, 23 Aug 2021 09:33:52 +0200
Message-Id: <20210823073359.705281-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210823073359.705281-1-hch@lst.de>
References: <20210823073359.705281-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

There is nothing that this protects against except for slightly reducing
the window when new opens can appear just before calling del_gendisk.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/mtd/mtd_blkdevs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 44bea3f65060..6b81a1c9ccbe 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -207,7 +207,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	if (!dev)
 		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
 
-	mutex_lock(&mtd_table_mutex);
 	mutex_lock(&dev->lock);
 
 	if (dev->open)
@@ -233,7 +232,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 unlock:
 	dev->open++;
 	mutex_unlock(&dev->lock);
-	mutex_unlock(&mtd_table_mutex);
 	blktrans_dev_put(dev);
 	return ret;
 
@@ -244,7 +242,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	module_put(dev->tr->owner);
 	kref_put(&dev->ref, blktrans_dev_release);
 	mutex_unlock(&dev->lock);
-	mutex_unlock(&mtd_table_mutex);
 	blktrans_dev_put(dev);
 	return ret;
 }
@@ -256,7 +253,6 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 	if (!dev)
 		return;
 
-	mutex_lock(&mtd_table_mutex);
 	mutex_lock(&dev->lock);
 
 	if (--dev->open)
@@ -272,7 +268,6 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 	}
 unlock:
 	mutex_unlock(&dev->lock);
-	mutex_unlock(&mtd_table_mutex);
 	blktrans_dev_put(dev);
 }
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
