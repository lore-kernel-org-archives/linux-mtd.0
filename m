Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDABC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:34:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6510261056
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6510261056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UeOOJyQZuFQ5Bl9XHs9d1d9r4LhOIK3KiGQZaeJxmV8=; b=pLK7Bv6IB3JsQn
	TnvCDLiSGw2D/3p2kJMCSar7WklDCUTPeBTS/jt98BoNSQKlWOP8Qo6ihCYzlLA6qkHLnIN3lrnlT
	AgaXEfy/1c4tzDpSkNHc0Qq5r78WoJzPlWyVnG6Bk9QPOZeVhrwmZaV9Q06et0T1IeQVu7n4JY+Ni
	qkR+FIYGDOD43hy1cBCg8GLLQbd76z+nMY5W4YC92PyCipz06PbT0nXINxV9jgy25RsNyvn99Xyul
	Crxh/p5xwM7bwgsUAuapfjeQWjC3js/DI4HTqZhU2v21Ar7AxsISoI6IlAsTceLZb49dGSdw7r1dk
	NEn/HJZ/jCKw4jrFRkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbWic-0097dL-5e; Fri, 15 Oct 2021 23:34:30 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWej-0095uv-7C; Fri, 15 Oct 2021 23:30:29 +0000
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
Subject: [PATCH 2/9] scsi/sr: add error handling support for add_disk()
Date: Fri, 15 Oct 2021 16:30:21 -0700
Message-Id: <20211015233028.2167651-3-mcgrof@kernel.org>
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

Just put the cdrom kref and have the unwinding be done by
sr_kref_release().

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/scsi/sr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index 115f7ef7a5de..4e5515848fa6 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -728,7 +728,12 @@ static int sr_probe(struct device *dev)
 	dev_set_drvdata(dev, cd);
 	disk->flags |= GENHD_FL_REMOVABLE;
 	sr_revalidate_disk(cd);
-	device_add_disk(&sdev->sdev_gendev, disk, NULL);
+
+	error = device_add_disk(&sdev->sdev_gendev, disk, NULL);
+	if (error) {
+		kref_put(&cd->kref, sr_kref_release);
+		goto fail;
+	}
 
 	sdev_printk(KERN_DEBUG, sdev,
 		    "Attached scsi CD-ROM %s\n", cd->cdi.name);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
