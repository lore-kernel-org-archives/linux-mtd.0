Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41257C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:29:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 116E360FC0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 116E360FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ry++vr2ZTNhD+Xz7b5T2OrOF9AMceP9vcFC65cibNtA=; b=fpNqlMIQldoASi
	5ktlLXk0XZsT/6Df5osNsWsC2RVFhUs9/fkl/+rKH3+pE6rJT4UpOtCqcUFsGTFlGQgWzoOkfEl00
	akx0nRvfJuVjUph+Gqg7gHZsLIDXBKYX1KhqYaO9GsrWcPNduJ0728UDfpschDhxwDgKsWAbjb/F9
	O/9XkvY2wxnbNVahSWGfnos+hgpnuLwWtS15K6JEkXtRjPfDh4WGRYutuQ5gPSlPSYhTYKwAgOgJT
	eCD2OQ4DIH9OH0vx1jGtqvC0iItZ5VvJau4UgjAW+duYGAPAQLu24VL+JonxQMTpBDMd26HWAXBE7
	EI7T86Y3GaFIGZmLo++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUz7L-004f3V-Do; Mon, 27 Sep 2021 22:28:59 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyhl-004Utz-PR; Mon, 27 Sep 2021 22:02:33 +0000
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
Subject: [PATCH v2 4/6] s390/block/dasd_genhd: add error handling support for
 add_disk()
Date: Mon, 27 Sep 2021 15:02:30 -0700
Message-Id: <20210927220232.1071926-5-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220232.1071926-1-mcgrof@kernel.org>
References: <20210927220232.1071926-1-mcgrof@kernel.org>
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

Be sure to call dasd_gendisk_free() on error.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/s390/block/dasd_genhd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/s390/block/dasd_genhd.c b/drivers/s390/block/dasd_genhd.c
index fa966e0db6ca..80673dbfb1f9 100644
--- a/drivers/s390/block/dasd_genhd.c
+++ b/drivers/s390/block/dasd_genhd.c
@@ -33,7 +33,7 @@ int dasd_gendisk_alloc(struct dasd_block *block)
 {
 	struct gendisk *gdp;
 	struct dasd_device *base;
-	int len;
+	int len, rc;
 
 	/* Make sure the minor for this device exists. */
 	base = block->base;
@@ -79,7 +79,13 @@ int dasd_gendisk_alloc(struct dasd_block *block)
 	dasd_add_link_to_gendisk(gdp, base);
 	block->gdp = gdp;
 	set_capacity(block->gdp, 0);
-	device_add_disk(&base->cdev->dev, block->gdp, NULL);
+
+	rc = device_add_disk(&base->cdev->dev, block->gdp, NULL);
+	if (rc) {
+		dasd_gendisk_free(block);
+		return rc;
+	}
+
 	return 0;
 }
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
