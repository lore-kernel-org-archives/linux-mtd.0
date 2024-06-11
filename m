Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF94C25B76
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2024 05:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaGaMv+lTWX8IA7q3nqh97Xf/zjvvMwD+Rs8jMXwjts=; b=4CDSfdTCIZCIqs
	SRHFJw00UifPmBZNO+eOL6+7J+3Gk29MB1gX80TLIaxTVdLfdwMsCCvGuez6BW0h7O3J3qPYF5DVz
	TnOr0KEtKBw17B/zhikesn0HQGbvqY22EkPE62DAiAWQlEWMucASeKp9jgHVqjED9W/LBVjh52Kh/
	nTLDDHjQLwmAhqPkV+qV9fms+8BQ6F8hJSkd5wKB0V4pIGMvxpTsp5KFBq6Eq4SkuROO/zGe7MJ//
	/N0gRyuAp6+CaUwM11GkxA4GY0Ip/GmMpXh29MY4JwN7pWKEfpPN/Wt5DG3A6LAoVAi+MFksXLdK5
	tzWKkFZq9iiE50Bnm95w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtv2-00000007Qq6-29Fb;
	Tue, 11 Jun 2024 05:19:40 +0000
Received: from 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtux-00000007Qnu-0nLE;
	Tue, 11 Jun 2024 05:19:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: [PATCH 01/26] sd: fix sd_is_zoned
Date: Tue, 11 Jun 2024 07:19:01 +0200
Message-ID: <20240611051929.513387-2-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
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

Since commit 7437bb73f087 ("block: remove support for the host aware zone
model"), only ZBC devices expose a zoned access model.  sd_is_zoned is
used to check for that and thus return false for host aware devices.

Fixes: 7437bb73f087 ("block: remove support for the host aware zone model")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sd.h     | 7 ++++++-
 drivers/scsi/sd_zbc.c | 7 +------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/sd.h b/drivers/scsi/sd.h
index 726f1613f6cb56..65dff3c2108926 100644
--- a/drivers/scsi/sd.h
+++ b/drivers/scsi/sd.h
@@ -222,9 +222,14 @@ static inline sector_t sectors_to_logical(struct scsi_device *sdev, sector_t sec
 
 void sd_dif_config_host(struct scsi_disk *sdkp, struct queue_limits *lim);
 
+/*
+ * Check if we support a zoned model for this device.
+ *
+ * Note that host aware devices are treated as conventional by Linux.
+ */
 static inline int sd_is_zoned(struct scsi_disk *sdkp)
 {
-	return sdkp->zoned == 1 || sdkp->device->type == TYPE_ZBC;
+	return sdkp->device->type == TYPE_ZBC;
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index f685838d9ed214..422eaed8457227 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -598,13 +598,8 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, struct queue_limits *lim,
 	u32 zone_blocks = 0;
 	int ret;
 
-	if (!sd_is_zoned(sdkp)) {
-		/*
-		 * Device managed or normal SCSI disk, no special handling
-		 * required.
-		 */
+	if (!sd_is_zoned(sdkp))
 		return 0;
-	}
 
 	/* READ16/WRITE16/SYNC16 is mandatory for ZBC devices */
 	sdkp->device->use_16_for_rw = 1;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
