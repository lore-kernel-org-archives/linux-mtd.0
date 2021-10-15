Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D873C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:31:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C7C46120C
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C7C46120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8hlNCG4yDaH8Z7yk32NSfhuTbOj+4bWCv2iNOZjJsg=; b=zcSFhoU+OvZeY4
	qD5A21I2kG/8JFlgK5tEWk3jc7Myy/+s56Ny3Q4dmSl3QEt/I1Q2qmVHXm5R4q0sX/KK3m2kLHABb
	aBYqXot/ovRAy7njy/tnvZSJSVrgQXCS6b+/pG0uxY2Fti7hC9CMSVp5KDiqJzbi8LxVPmgnbL3bT
	ckJ2Ax/+5BPRh3NRNlU4XqPWl9rA2YtPakkQiIqq8Lp11J8tgdx2gF6BmG3SpRLLttLWPE1IlcjG4
	1x5v3c9/rI8iGQ7pP+pnFcnlKJ5YKw4ddyWobnl6YwtGtTz46w8EpymO7TmzbGtH2CWm8zFh4Fh/F
	M0He3oIjokoqbEgu6rnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbWeq-0095xR-94; Fri, 15 Oct 2021 23:30:36 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWej-0095ut-6A; Fri, 15 Oct 2021 23:30:29 +0000
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
 Luis Chamberlain <mcgrof@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/9] scsi/sd: add error handling support for add_disk()
Date: Fri, 15 Oct 2021 16:30:20 -0700
Message-Id: <20211015233028.2167651-2-mcgrof@kernel.org>
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

As with the error handling for device_add() we follow the same
logic and just put the device so that cleanup is done via the
scsi_disk_release().

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/scsi/sd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index a646d27df681..d69f2e626e76 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3457,7 +3457,13 @@ static int sd_probe(struct device *dev)
 		pm_runtime_set_autosuspend_delay(dev,
 			sdp->host->hostt->rpm_autosuspend_delay);
 	}
-	device_add_disk(dev, gd, NULL);
+
+	error = device_add_disk(dev, gd, NULL);
+	if (error) {
+		put_device(&sdkp->dev);
+		goto out;
+	}
+
 	if (sdkp->capacity)
 		sd_dif_config_host(sdkp);
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
