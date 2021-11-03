Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B786C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 23:07:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C5E604DC
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 23:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6C5E604DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebNdN3tesoAWUsdhoi3P/5i++m0mVUHixtAXXi+VzbQ=; b=D7JWLMfpZgzxh5
	TrcTSuIjep9WW/ywv5hU9QXbyrqICVy6jjwjIayrf2Pt+NKFIltytd23srFZOEf6OPeH2hbvkv/Ff
	+MKoeOTfDzPDlbw5LKkWodb42SfKGnhTHxP3U0C6QcNuPKQDjv3SqO0vEGkmW4eq5vY696cXAJKuy
	YhUbryIyA7UxSJcydMjqLhBNjd2qaz6rVlF6D60wXGYb7PcUBAQ2sHmRRCjiKDwbokuiYtpreYAwg
	ZdKedVC3co/+bnqUe29ADLUnRzbN/GaLnmgfXnvxVCYpDasElC0WcwzKkk7irJi8h6U6EtpDqgIdc
	YcyqBWH0zM+x/0cJ4XNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miPLP-006ttO-St; Wed, 03 Nov 2021 23:06:59 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miPJ8-006seZ-Ne; Wed, 03 Nov 2021 23:04:38 +0000
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
Subject: [PATCH v5 08/14] block/sunvdc: add error handling support for
 add_disk()
Date: Wed,  3 Nov 2021 16:04:31 -0700
Message-Id: <20211103230437.1639990-9-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103230437.1639990-1-mcgrof@kernel.org>
References: <20211103230437.1639990-1-mcgrof@kernel.org>
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

We re-use the same free tag call, so we also add a label for
that as well.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/sunvdc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index 4d4bb810c2ae..6f45a53f7cbf 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -826,8 +826,8 @@ static int probe_disk(struct vdc_port *port)
 	if (IS_ERR(g)) {
 		printk(KERN_ERR PFX "%s: Could not allocate gendisk.\n",
 		       port->vio.name);
-		blk_mq_free_tag_set(&port->tag_set);
-		return PTR_ERR(g);
+		err = PTR_ERR(g);
+		goto out_free_tag;
 	}
 
 	port->disk = g;
@@ -879,9 +879,17 @@ static int probe_disk(struct vdc_port *port)
 	       port->vdisk_size, (port->vdisk_size >> (20 - 9)),
 	       port->vio.ver.major, port->vio.ver.minor);
 
-	device_add_disk(&port->vio.vdev->dev, g, NULL);
+	err = device_add_disk(&port->vio.vdev->dev, g, NULL);
+	if (err)
+		goto out_cleanup_disk;
 
 	return 0;
+
+out_cleanup_disk:
+	blk_cleanup_disk(g);
+out_free_tag:
+	blk_mq_free_tag_set(&port->tag_set);
+	return err;
 }
 
 static struct ldc_channel_config vdc_ldc_cfg = {
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
