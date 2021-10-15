Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0569C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:58:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A42666109E
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A42666109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AU49R/H7/TvH5BLsHCdbcQqcZBlXn1KkLL5AWexhy6g=; b=Q+hXY1+rN5uDDR
	eAgn8MY06bAKV81TOia18KvX2vBBtyBIDRYLRO15GbkAutxwuhAE53zyuKFu72hQR97dhWt/mBzhV
	0A+hVElLYUkVW0J+vfP5V0nsq81vsbzBKbl7drJHmCc4aIEIOFq7b8yRdiG75aKxBE0tkxbnVEz7y
	hfeayRNPvFOEJgLfFL/gSUeqMus/m+KkkVsxEiLh/xLW2W8cFtc8ucxv2Wj3JkEeiNJ3M0r2AC2J7
	uuxi9KKs1htbODhWSp5BQpFyhxMDxBgRwxwHqC9UwI1EtX/d8bW2lOXw32Bo8DOljaf53K/6XGirc
	2HH+GzoRT8MQxjjp9cvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbX5P-009EsL-0M; Fri, 15 Oct 2021 23:58:03 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWzt-009C3F-AU; Fri, 15 Oct 2021 23:52:21 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, geoff@infradead.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, jim@jtan.com,
 minchan@kernel.org, ngupta@vflare.org, senozhatsky@chromium.org,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 dan.j.williams@intel.com, vishal.l.verma@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me
Cc: linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 10/13] ps3disk: add error handling support for add_disk()
Date: Fri, 15 Oct 2021 16:52:16 -0700
Message-Id: <20211015235219.2191207-11-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015235219.2191207-1-mcgrof@kernel.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
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
 drivers/block/ps3disk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
index 8d51efbe045d..3054adf77460 100644
--- a/drivers/block/ps3disk.c
+++ b/drivers/block/ps3disk.c
@@ -467,9 +467,13 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 		 gendisk->disk_name, priv->model, priv->raw_capacity >> 11,
 		 get_capacity(gendisk) >> 11);
 
-	device_add_disk(&dev->sbd.core, gendisk, NULL);
-	return 0;
+	error = device_add_disk(&dev->sbd.core, gendisk, NULL);
+	if (error)
+		goto fail_cleanup_disk;
 
+	return 0;
+fail_cleanup_disk:
+	blk_cleanup_disk(gendisk);
 fail_free_tag_set:
 	blk_mq_free_tag_set(&priv->tag_set);
 fail_teardown:
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
