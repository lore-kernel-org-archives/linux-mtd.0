Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81894C77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 13:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcwBlrZ5WFCHnC/66TaGD7rCCftPZABrtxPwMT7x9dQ=; b=3460P6ms7WiJbS
	UlBVqSJLXBxBa6o+Vj/c8SrRDmbuPb31KRqiFIOjAEr7+nj5v8Fy5rKQiqLhfnkJjtMYRNMOmBZQj
	TfApaJJH8KeR0nNhWPL1Jw9RnwhFucuGg5VSzxXQt6yI2YvsJj/K8DcLXosIoLRaC/xkxeSlSN1C5
	EaaC22RHq6O94Br0KrIuAhjU9UrdnagbSJFXc3eq/lFl/kj+UxTjldZyR2KdLuTaf4XIM1IqG/YgF
	7uSBzMhYKoN5/xOhUvTsjal9zKVj5y7tXwx9VZiSbxw9VbtCXG+wYGgqDSwbGOPOW6tzscM4cKgIO
	N+wwEsWy/TIwB9wKHWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Rob-00ALL0-1g;
	Tue, 23 May 2023 13:12:37 +0000
Received: from smtp1.axis.com ([195.60.68.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1RoX-00ALIt-1K
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 13:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1684847553;
  x=1716383553;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=RUsNkf5+Wyu4/3oi86PLsyVVhLWM8zFhO0TpoHKYz90=;
  b=CjHPyInNxr+o/ALSwsTdb0I1WdN1VIcAXJ0CR3seK5OHfFUPtguYiePl
   KzvrUhtGeDAdTb7V5cxYgpPyV/K3wO9Z+U5Ov6Psip8Z+8W8Ptwl1W+X6
   AtElBXzdPt4hUcxT9LBcbF6OBkYx4oK229RxKEJwCrdMFPiaD3SsKxhdD
   QPj2mB1voa1jw6GZX1cHLlz+RcQcam2EJV3y9xTle+A5PIMR5NnZZCRMX
   NbO4kY9UpKurbWo5cloavt5oXvxuOnb6UhKPxfzYNDVYoB4KBalpOu/Pa
   hERL2iCcqNR/Y5MUJYq7babhGqIAlPQQ2v+HMs61dEpxo4QyY8Tm0SooI
   Q==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Date: Tue, 23 May 2023 15:12:16 +0200
Subject: [PATCH 1/2] ubi: block: Fix use-after-free of gendisk
MIME-Version: 1.0
Message-ID: <20230523-ubiblock-remove-v1-1-240bed75849b@axis.com>
References: <20230523-ubiblock-remove-v1-0-240bed75849b@axis.com>
In-Reply-To: <20230523-ubiblock-remove-v1-0-240bed75849b@axis.com>
To: Richard Weinberger <richard@nod.at>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_061233_762588_608AD675 
X-CRM114-Status: UNSURE (   9.18  )
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

Do not touch the gendisk after put_disk() to fix this use-after-free:

 ==================================================
 BUG: KASAN: slab-use-after-free in ubiblock_remove
 Read of size 4 by task ubiblock/361

 Call Trace:
 ubiblock_remove (drivers/mtd/ubi/block.c:459 drivers/mtd/ubi/block.c:483)
 vol_cdev_ioctl
 ...

 Allocated by task 358:
 __alloc_disk_node (block/genhd.c:1377)
 __blk_mq_alloc_disk (block/blk-mq.c:4093)
 ubiblock_create (drivers/mtd/ubi/block.c:397)
 vol_cdev_ioctl
 ...

 Freed by task 0:
 bdev_free_inode (block/bdev.c:337)
 i_callback
 rcu_core
 __do_softirq
 ...

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/mtd/ubi/block.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 3711d7f74600..70caec4606cd 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -448,13 +448,15 @@ int ubiblock_create(struct ubi_volume_info *vi)
 
 static void ubiblock_cleanup(struct ubiblock *dev)
 {
+	int first_minor = dev->gd->first_minor;
+
 	/* Stop new requests to arrive */
 	del_gendisk(dev->gd);
 	/* Finally destroy the blk queue */
 	dev_info(disk_to_dev(dev->gd), "released");
 	put_disk(dev->gd);
 	blk_mq_free_tag_set(&dev->tag_set);
-	idr_remove(&ubiblock_minor_idr, dev->gd->first_minor);
+	idr_remove(&ubiblock_minor_idr, first_minor);
 }
 
 int ubiblock_remove(struct ubi_volume_info *vi)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
