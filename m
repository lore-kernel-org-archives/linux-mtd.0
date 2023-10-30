Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA759C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Oct 2023 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XH4mx4QB5R9DVAfylIwMouh/Gx8u8GdoyLoaa4zimsQ=; b=m/MyTQBlb7+IOl
	m1WbtOvcuQRXciytrjbIquyetq5AIoHiBzu41SgOVN5oXrQ/CjipBXXD3SiPwGXOCF1/Zp3WpcSeF
	p19Zf9TtAPIeb2x/1ZwddE6QqdDOZh2/A4nuHVqM4DDYc6LDiA7idk7zMuuqYC80BxtV68YMu3z76
	TN476HQ1yQCCcGI4inKBbVELPAHY2Fx1KPP6h7+9xl6+Zq2TpW8HS270vdMFHSKuLJ8MJ8JT3uxu4
	BEGFWCZBU06S+FQwv8r10yTYEx3qn/rNkghlWkKCMnNeBYFzt3x8VSVMGMM4di2fpjpnmspHnWUgx
	80tGX/a2/8NI8LlGQvVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSpU-003Rsx-2z;
	Mon, 30 Oct 2023 14:01:20 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSpQ-003RsW-2R;
	Mon, 30 Oct 2023 14:01:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: axboe@kernel.dk,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	zhongjinghua@huawei.com,
	yukuai1@huaweicloud.com
Subject: [PATCH 2/2] block: dev_t components are unsigned
Date: Mon, 30 Oct 2023 15:01:06 +0100
Message-Id: <20231030140106.1393384-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030140106.1393384-1-hch@lst.de>
References: <20231030140106.1393384-1-hch@lst.de>
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

... thus mark the major, first_minor and minors fields in struct gendisk
as such.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c          | 4 ++--
 include/linux/blkdev.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index cc32a0c704eb84..ceeb30518db696 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -180,7 +180,7 @@ void blkdev_show(struct seq_file *seqf, off_t offset)
 	spin_lock(&major_names_spinlock);
 	for (dp = major_names[major_to_index(offset)]; dp; dp = dp->next)
 		if (dp->major == offset)
-			seq_printf(seqf, "%3d %s\n", dp->major, dp->name);
+			seq_printf(seqf, "%3u %s\n", dp->major, dp->name);
 	spin_unlock(&major_names_spinlock);
 }
 #endif /* CONFIG_PROC_FS */
@@ -896,7 +896,7 @@ static ssize_t disk_range_show(struct device *dev,
 {
 	struct gendisk *disk = dev_to_disk(dev);
 
-	return sprintf(buf, "%d\n", disk->minors);
+	return sprintf(buf, "%u\n", disk->minors);
 }
 
 static ssize_t disk_ext_range_show(struct device *dev,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index eef450f259828d..3ecf928d6325b6 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -130,9 +130,9 @@ struct gendisk {
 	 * major/first_minor/minors should not be set by any new driver, the
 	 * block core will take care of allocating them automatically.
 	 */
-	int major;
-	int first_minor;
-	int minors;
+	unsigned int major;
+	unsigned int first_minor;
+	unsigned int minors;
 
 	char disk_name[DISK_NAME_LEN];	/* name of major driver */
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
