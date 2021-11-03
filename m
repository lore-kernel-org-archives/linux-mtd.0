Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FD3C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:13:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63CB560FC2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63CB560FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ai7myeeqvFiNEAczgpJpxtx1u8rJOloICYX3Pnm6jdA=; b=yJKtmCnYG+ANm+
	eDYEXNhdB3a+CHqj6Ujp2wWT0Lh7iw4Dx4VeZ9zmD+wkMCfA++RqtfJaDd1YL4d+zKoJ/CEcp9Yqg
	hKf23EenngxO0X//iB2+v+K1doHpngudj1SMxN4nfWECnQOfFVhqMddL9n2ihRumtaB4LDp8+8x4q
	KtJhVo41pxz8CXlp5cSoq74KxK/1lXvPEI1WlZ+B73FN4FUiSt3NlWpREO8xboV+1+5E/M3Fa6BAr
	84ueJ6dqM96ZXslAB8e21FhziQhV+f7/aEZvBraWUCVdM7XSjGbLmNqr3tpIa4zJQg+rZAUP4K1g7
	Zz4Cx7MReNkSZ+POIE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKlM-0068l4-1o; Wed, 03 Nov 2021 18:13:28 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miKkt-0068XM-Vf; Wed, 03 Nov 2021 18:12:59 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, hch@lst.de, penguin-kernel@i-love.sakura.ne.jp,
 dan.j.williams@intel.com, vishal.l.verma@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, richard@nod.at, miquel.raynal@bootlin.com,
 vigneshr@ti.com, efremov@linux.com, song@kernel.org,
 martin.petersen@oracle.com, hare@suse.de, jack@suse.cz,
 ming.lei@redhat.com, tj@kernel.org, mcgrof@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] floppy: address add_disk() error handling on probe
Date: Wed,  3 Nov 2021 11:12:57 -0700
Message-Id: <20211103181258.1462704-4-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103181258.1462704-1-mcgrof@kernel.org>
References: <20211103181258.1462704-1-mcgrof@kernel.org>
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

We need to cleanup resources on the probe() callback registered
with __register_blkdev(), now that add_disk() error handling is
supported. Address this.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/floppy.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 3873e789478e..255e88efb535 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4522,6 +4522,7 @@ static void floppy_probe(dev_t dev)
 {
 	unsigned int drive = (MINOR(dev) & 3) | ((MINOR(dev) & 0x80) >> 5);
 	unsigned int type = (MINOR(dev) >> 2) & 0x1f;
+	int err = 0;
 
 	if (drive >= N_DRIVE || !floppy_available(drive) ||
 	    type >= ARRAY_SIZE(floppy_type))
@@ -4529,10 +4530,20 @@ static void floppy_probe(dev_t dev)
 
 	mutex_lock(&floppy_probe_lock);
 	if (!disks[drive][type]) {
-		if (floppy_alloc_disk(drive, type) == 0)
-			add_disk(disks[drive][type]);
+		err = floppy_alloc_disk(drive, type);
+		if (err == 0) {
+			err = add_disk(disks[drive][type]);
+			if (err)
+				goto err_out;
+		}
 	}
 	mutex_unlock(&floppy_probe_lock);
+	return;
+
+err_out:
+	blk_cleanup_disk(disks[drive][type]);
+	disks[drive][type] = NULL;
+	mutex_unlock(&floppy_probe_lock);
 }
 
 static int __init do_floppy_init(void)
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
