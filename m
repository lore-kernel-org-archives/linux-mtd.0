Return-Path: <SRS0=6coP=MY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39009C4338F
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 23:46:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D718960720
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 23:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D718960720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PW/2IPTj93qjKUDxij04kk359l1D55M/gaX0y5hM2Cw=; b=RMzXb0UyjHyFTx
	h+PdfCKKHFVnS3ThcZZsZea856pWhnLgyrzl9hy5pRg3QUgUOWm3mPRmRo0CKV036jfypMKN3zub5
	+TRiVCP4vwFwgWwuiIEzwhkHOXKxE94rEhSK7o3kuM5X+gEnNFbFFHtefKXa1vqfDd7b6/gHxPA9o
	Qr1v6dgq4DoGAl0mjnI13KhoTzyz55RdANcEx5+np9XmZUzP1jHAyKhqK9ttcqqeXwfFLh22aFZrH
	afjwojhnLTQNXE81QUaYhfsB89ezBXmr/q2+zE8zML7tGJAQC2IpcAM6PNo6/QPyvvqn3A5ASetYw
	MsG41OD9dgM9xsJnKgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAL9i-00EOn5-BP; Sun, 01 Aug 2021 23:46:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAL98-00EOfg-82
 for linux-mtd@lists.infradead.org; Sun, 01 Aug 2021 23:45:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 93EF11F424CD
From: Ezequiel Garcia <ezequiel@collabora.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 3/3] mtdblock: Warn if the added for a NAND device
Date: Sun,  1 Aug 2021 20:45:05 -0300
Message-Id: <20210801234509.18774-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210801234509.18774-1-ezequiel@collabora.com>
References: <20210801234509.18774-1-ezequiel@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_164530_457589_A9D6728D 
X-CRM114-Status: GOOD (  11.28  )
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

There is a surprisingly large number of tutorials
that suggest using mtdblock to mount SquashFS filesystems
on flash devices, including NAND devices.

This approach is suboptimal than using UBI. If the flash device
is NAND, this is specially true, due to wear leveling, bit-flips and
badblocks. In this case UBI is strongly preferred, so be nice to users
and print a warning suggesting to consider UBI block, if mtdblock
is added for a NAND device.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Untracked files not listed
---
 drivers/mtd/mtdblock.c    | 4 ++++
 drivers/mtd/mtdblock_ro.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index b2d5ed1cbc94..7c02643f862f 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -332,6 +332,10 @@ static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	if (!(mtd->flags & MTD_WRITEABLE))
 		dev->mbd.readonly = 1;
 
+	if (mtd_type_is_nand(mtd))
+		pr_warn("%s: MTD device '%s' is NAND, please consider using UBI block devices instead.\n",
+			tr->name, mtd->name);
+
 	if (add_mtd_blktrans_dev(&dev->mbd))
 		kfree(dev);
 }
diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index fb5dc89369de..a438e2f6089c 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -60,6 +60,10 @@ static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	dev->tr = tr;
 	dev->readonly = 1;
 
+	if (mtd_type_is_nand(mtd))
+		pr_warn("%s: MTD device '%s' is NAND, please consider using UBI block devices instead.\n",
+			tr->name, mtd->name);
+
 	if (add_mtd_blktrans_dev(dev))
 		kfree(dev);
 }
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
