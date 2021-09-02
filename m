Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A7DC83028
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 17:43:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0557F61101
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 17:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0557F61101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wk5pVXSGvjNeuYTNpcosw7NnpP8kqkH/u7OQSXfEhOc=; b=Pp0NFGoBF3lG97
	HpYfhGHhPeSwE4aloOLueBAXm0/U23M7lThi3mi4Umx4TgSD7x83OWu8d73xXvC48bsx0tIWDXVIw
	g+1Im9QmDCo6Yj8Ro9Zh/ukX9XjyNd2rOZaAbSJarygjX01UGq/6ayzRNCmRzEo6mKqjvW9woPdoi
	zqp2VxX+hqi4X+VHqdEr6RGqmRFvPefeFdBaOxg8mrlX2BNE0zBTFh3SrIqtjEhbbaPUHe9mRv7ri
	PcYfoO1ZXhs4gw/yTlqL/UAB/SE9dYFEh+WQFJGGWEsBJ0EwAKjDQgjsSdotEjqc/T03EbDTG+Vbg
	E3qiANtg8mBwKM4712HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLqkH-00AAA8-3f; Thu, 02 Sep 2021 17:43:25 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mLqi1-00A9FE-Rh; Thu, 02 Sep 2021 17:41:05 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
 atulgopinathan@gmail.com, hare@suse.de, maximlevitsky@gmail.com,
 oakad@yahoo.com, ulf.hansson@linaro.org, colin.king@canonical.com,
 shubhankarvk@gmail.com, baijiaju1990@gmail.com, trix@redhat.com,
 dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@de.ibm.com, oberpar@linux.ibm.com,
 tj@kernel.org
Cc: linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 2/9] ms_block: add error handling support for add_disk()
Date: Thu,  2 Sep 2021 10:40:58 -0700
Message-Id: <20210902174105.2418771-3-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902174105.2418771-1-mcgrof@kernel.org>
References: <20210902174105.2418771-1-mcgrof@kernel.org>
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

Contrary to the typical removal which delays the put_disk()
until later, since we are failing on a probe we immediately
put the disk on failure from add_disk by using
blk_cleanup_disk().

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/memstick/core/ms_block.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 4a4573fa7b0f..86c626933c1a 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -2156,10 +2156,14 @@ static int msb_init_disk(struct memstick_dev *card)
 		set_disk_ro(msb->disk, 1);
 
 	msb_start(card);
-	device_add_disk(&card->dev, msb->disk, NULL);
+	rc = device_add_disk(&card->dev, msb->disk, NULL);
+	if (rc)
+		goto out_cleanup_disk;
 	dbg("Disk added");
 	return 0;
 
+out_cleanup_disk:
+	blk_cleanup_disk(msb->disk);
 out_free_tag_set:
 	blk_mq_free_tag_set(&msb->tag_set);
 out_release_id:
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
