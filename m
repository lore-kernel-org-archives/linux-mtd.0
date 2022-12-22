Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FC5C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Dec 2022 19:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+h75JKX7gOl0QvydJUhoCuJl+FAesgulFdAQ3CtRQU=; b=Qdg/PzshXrk523
	Q1prQnfOGkL5TN5t7HTqK/ZUHahW0NsClmKk38mCCqB8JSZZ6NXWoxCCMRH4wPf8tH7onQHpNUzWT
	NTVxNwzjmAhiNcXnaRHd8d9EmyTPTpcW42OVcEiyqfAiZBkifXt7kwRNeZJ1KOwTsyxkD7wy1lo9l
	ho0kInaDPACBRKA62udieg4AynJZjQvOIVtQPYH2vRemGRrM78SFYi+QGCQOPJelZUwbNv8ZAhI7c
	XTibvarAKXsmUJkfo1JiO591akUF2vtcCo/71rmGFBcjmXaZn6FH94e8//7SiswNIawS/lQKTA2ES
	UGPhIgqcqZ+mmFj+vwog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RNu-00G007-AO; Thu, 22 Dec 2022 19:37:42 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RJy-00Fx1O-7J
	for linux-mtd@lists.infradead.org; Thu, 22 Dec 2022 19:33:40 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1p8RJw-0004VD-2o;
	Thu, 22 Dec 2022 20:33:37 +0100
Date: Thu, 22 Dec 2022 19:33:31 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/2] mtd: ubi: block: wire-up device parent
Message-ID: <b60c5e252c34d12754cde09b25d3028690aa12e3.1671737443.git.daniel@makrotopia.org>
References: <cover.1671737443.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1671737443.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_113338_332528_30C49511 
X-CRM114-Status: GOOD (  13.13  )
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

ubiblock devices were previously only identifyable by their name, but
not connected to their parent UBI volume device e.g. in sysfs.
Properly parent ubiblock device as descendant of a UBI volume device
to reflect device model hierachy.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/block.c | 2 +-
 drivers/mtd/ubi/kapi.c  | 1 +
 include/linux/mtd/ubi.h | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index d725215ae66e5..e99b29ba48dc4 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -455,7 +455,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	list_add_tail(&dev->list, &ubiblock_devices);
 
 	/* Must be the last step: anyone can call file ops from now on */
-	ret = add_disk(dev->gd);
+	ret = device_add_disk(vi->dev, dev->gd, NULL);
 	if (ret)
 		goto out_destroy_wq;
 
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 0fce99ff29b58..5db653eacbd45 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -79,6 +79,7 @@ void ubi_do_get_volume_info(struct ubi_device *ubi, struct ubi_volume *vol,
 	vi->name_len = vol->name_len;
 	vi->name = vol->name;
 	vi->cdev = vol->cdev.dev;
+	vi->dev = &vol->dev;
 }
 
 /**
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 7d48ea368c5e5..a529347fd75b2 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -110,6 +110,7 @@ struct ubi_volume_info {
 	int name_len;
 	const char *name;
 	dev_t cdev;
+	struct device *dev;
 };
 
 /**
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
