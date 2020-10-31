Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B183C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:22:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE30920756
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sP3gx5Gb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SbajBFLZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE30920756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mqJpHcNFsvcdI3tHRbssiuL/0jTG3kF01IixNc7VeoY=; b=sP3gx5GbaaqtpqlcWmdpjBNFo
	7DhDCY7U+JvV5EuVTq7I9qirY+c7Q5TSDu8k8VEs8paVj6Ft7prQvvjE/+OUXLM1DO8ETo8Mjjkwh
	m2oLFuwON79Yn0yB+Sk8L1skzltpn7kzZu+EXFsd9Dfj3GaiEcqrGvD7NkPNDO/efMsuZir/kxrVb
	39R8+QVQ0whuPzPY3flgQBoeIdQVgaWNg4PvWcenFslO3m2f2dkff+2iq30xE5sH/7QjyWRJcvDYi
	WnkaWiY01JJqNzHwqEdg0atnC2LPzU/zGeeEv2AC2O2s9TT/b/Lo15UND7wCXLbYlkBkg/wEPTj/l
	Keg2bQdmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYn5X-0005pB-PN; Sat, 31 Oct 2020 09:22:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYn5W-0005ou-G3
 for linux-mtd@merlin.infradead.org; Sat, 31 Oct 2020 09:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3MSvK9iNSy+DFtMSDiSadE/QmhEKeo+2u5OIDmRr7vM=; b=SbajBFLZzxSbqHTnfyUDYuOs9Q
 AlPTPMQiJMVpCj4HUo+9SAYnxuk256+8XFZq6L3QIAbl55avttLUr1mYwtiSc3wyQJbjJxqOe4XVN
 DarPmrRVAn0nxozPoBogGFe891rSl6V7IyXzu8wp1f/YteqWLA00iRfmtsyzrQ6zfEytVMBZvoYyY
 SafyPEGeBDFIK+daVu/yiKf3LyaiWMcHPfAh0aBzuxHv55ltSEk0/A1E9/g8wnFmNqsS1AWyGGIDA
 7KYCHxbB3ra4Gz9MWNDrjYa8H/Yp4R+3rt1Dic5t+ctBW18UOx7BCpdNMBr8f6fdlWfTwm/dsO/Nl
 UQRskgqA==;
Received: from 089144193201.atnat0002.highway.a1.net ([89.144.193.201]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYn5U-0008II-Mm; Sat, 31 Oct 2020 09:22:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 10/11] block: remove set_device_ro
Date: Sat, 31 Oct 2020 09:58:09 +0100
Message-Id: <20201031085810.450489-11-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201031085810.450489-1-hch@lst.de>
References: <20201031085810.450489-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-raid@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fold set_device_ro into its only remaining caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c         | 7 -------
 block/ioctl.c         | 2 +-
 include/linux/genhd.h | 1 -
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 0a273211fec283..a487590b365e89 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1843,13 +1843,6 @@ static void set_disk_ro_uevent(struct gendisk *gd, int ro)
 	kobject_uevent_env(&disk_to_dev(gd)->kobj, KOBJ_CHANGE, envp);
 }
 
-void set_device_ro(struct block_device *bdev, int flag)
-{
-	bdev->bd_part->policy = flag;
-}
-
-EXPORT_SYMBOL(set_device_ro);
-
 void set_disk_ro(struct gendisk *disk, int flag)
 {
 	struct disk_part_iter piter;
diff --git a/block/ioctl.c b/block/ioctl.c
index 96cb4544736468..04255dc5f3bff3 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -371,7 +371,7 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
 		if (ret)
 			return ret;
 	}
-	set_device_ro(bdev, n);
+	bdev->bd_part->policy = n;
 	return 0;
 }
 
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 38f23d75701379..f232f26d7c777b 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -304,7 +304,6 @@ extern void del_gendisk(struct gendisk *gp);
 extern struct gendisk *get_gendisk(dev_t dev, int *partno);
 extern struct block_device *bdget_disk(struct gendisk *disk, int partno);
 
-extern void set_device_ro(struct block_device *bdev, int flag);
 extern void set_disk_ro(struct gendisk *disk, int flag);
 
 static inline int get_disk_ro(struct gendisk *disk)
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
