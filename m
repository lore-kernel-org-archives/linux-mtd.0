Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BB8C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:32:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 074B660F44
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 074B660F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/GCTP7h+VmYZC+MhDIa8QYzwOYhorramy+xNRCkmK8=; b=gQRfAAw7dtEgoM
	sFLWDgV0dxr1+axs8cEbGG8a/LxlHUG0TnAreXWY/Y6Je1WGNYfGAeXwtyV50vsggXInQ5p4bMSyU
	XtWkZGWw8JoejIL28fZSG4d6wi+q7+ws3tl8xd1/yKWGCuFeP/P9dwKTbmrjRbZGXXzznCXRLOsIi
	TWTRZVTy5B9X7Z2jS52dRMGjaJ0r4o8fUO/O33xd53GV17JhGFPXgTlg5jx6V2DJtCpiOmoLXiNyg
	GPfn2nXgzPYxQ1nykRwddOiW9xjPWjucYMvWKbuyL1Wl0Av8k1oZiHkuMLNHGvOCmITCl4M6hw8qn
	e2V61ZB+jMPRaZTyD6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbWgA-0096fw-7w; Fri, 15 Oct 2021 23:31:58 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWej-0095v5-Ct; Fri, 15 Oct 2021 23:30:29 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, jejb@linux.ibm.com, martin.petersen@oracle.com,
 agk@redhat.com, snitzer@redhat.com, colyli@suse.de,
 kent.overstreet@gmail.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, roger.pau@citrix.com, geert@linux-m68k.org,
 ulf.hansson@linaro.org, tj@kernel.org, hare@suse.de, jdike@addtoit.com,
 richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
 krisman@collabora.com, chris.obbard@collabora.com, thehajime@gmail.com,
 zhuyifei1999@gmail.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com, linux-mtd@lists.infradead.org
Cc: linux-scsi@vger.kernel.org, dm-devel@redhat.com,
 linux-bcache@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 7/9] um/drivers/ubd_kern: add error handling support for
 add_disk()
Date: Fri, 15 Oct 2021 16:30:26 -0700
Message-Id: <20211015233028.2167651-8-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015233028.2167651-1-mcgrof@kernel.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
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

ubd_disk_register() never returned an error, so just fix
that now and let the caller handle the error condition.

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 arch/um/drivers/ubd_kern.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index fefd343412c7..69d2d0049a61 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -855,8 +855,8 @@ static const struct attribute_group *ubd_attr_groups[] = {
 	NULL,
 };
 
-static void ubd_disk_register(int major, u64 size, int unit,
-			      struct gendisk *disk)
+static int ubd_disk_register(int major, u64 size, int unit,
+			     struct gendisk *disk)
 {
 	disk->major = major;
 	disk->first_minor = unit << UBD_SHIFT;
@@ -873,7 +873,7 @@ static void ubd_disk_register(int major, u64 size, int unit,
 
 	disk->private_data = &ubd_devs[unit];
 	disk->queue = ubd_devs[unit].queue;
-	device_add_disk(&ubd_devs[unit].pdev.dev, disk, ubd_attr_groups);
+	return device_add_disk(&ubd_devs[unit].pdev.dev, disk, ubd_attr_groups);
 }
 
 #define ROUND_BLOCK(n) ((n + (SECTOR_SIZE - 1)) & (-SECTOR_SIZE))
@@ -920,10 +920,15 @@ static int ubd_add(int n, char **error_out)
 	blk_queue_write_cache(ubd_dev->queue, true, false);
 	blk_queue_max_segments(ubd_dev->queue, MAX_SG);
 	blk_queue_segment_boundary(ubd_dev->queue, PAGE_SIZE - 1);
-	ubd_disk_register(UBD_MAJOR, ubd_dev->size, n, disk);
+	err = ubd_disk_register(UBD_MAJOR, ubd_dev->size, n, disk);
+	if (err)
+		goto out_cleanup_disk;
+
 	ubd_gendisk[n] = disk;
 	return 0;
 
+out_cleanup_disk:
+	blk_cleanup_disk(disk);
 out_cleanup_tags:
 	blk_mq_free_tag_set(&ubd_dev->tag_set);
 out:
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
