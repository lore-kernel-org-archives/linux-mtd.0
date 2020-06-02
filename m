Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A0BC433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 14:38:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2098B205CB
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 14:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pwxI5zRG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2098B205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rockwellcollins.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VSUwsFRdbf7XGMxE8NTtRhShDzv8mAc+Lbl2nFnLgEQ=; b=pwx
	I5zRGcJNim7sUef/GxjCs5RZEoZxStymsGNkoavNgrEEHuVWnn36+kH150KC1Ro+3mVh7MUkSVak5
	X+fjCcJInsx/MwItcByQ+ojFV/PkF4H3B6t3nfDb6Xw9Fqy0y799OBYzhT7VzkPxY/27S+7pl4cWs
	WD1K2kBHuxnfHGWe8MHMgQwqc0CEb1wh4b59fFUGUDAqJeWVKL8iBah25dTxNtIuw4z+2SFtTNIh1
	XtJmDETA5l3LO79OBQ6CclQSlH5MvypH96JEzbb5qdgXDD0hk5YkpZTV4lfiHs0jXZHW13fXT1tSF
	c+077xbzCiLa3BBGwpC0WgAjJim74qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg832-0000Oe-0B; Tue, 02 Jun 2020 14:37:48 +0000
Received: from da1vs04.rockwellcollins.com ([205.175.227.52])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg7zS-0003aS-RE
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2020 14:34:09 +0000
IronPort-SDR: F1Hg54IqbbK7W6WrKo/B4dawbF283jQqzXKwRVeAxBbCPnZmesHmrtYnG/aUTsp6FfU17JXAJE
 V4QSQRa4AgXahOTCNUySgI0NqkETQk9bapq3vyarnnWoQUu/QjL+vPAfSPGjgIzaF7MsC5rdY2
 KD4oY+HJSz8Ug5ajLZdiWuhuho68SMDa8yKgj0N4J2O6BlC9W0KfjH6a6cnKcBugQOXRUbEK6A
 F/hE2YMwePvvZsPuyLY5Wt5/hozWhXJajumeq77CNUTWqSaygohk9uYZYbxTckVpZnhUjkhox6
 hVA=
Received: from ofwda1n02.rockwellcollins.com (HELO
 crulimr01.rockwellcollins.com) ([205.175.227.14])
 by da1vs04.rockwellcollins.com with ESMTP; 02 Jun 2020 09:34:04 -0500
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 6503D60290;
 Tue,  2 Jun 2020 09:34:04 -0500 (CDT)
From: Matt Weber <matthew.weber@rockwellcollins.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mtdconcat: map through panic write handler
Date: Tue,  2 Jun 2020 09:34:03 -0500
Message-Id: <20200602143403.13465-1-matthew.weber@rockwellcollins.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_073406_964996_A7F275D7 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Allows a mtdconcat's subdevice->_panic_write to be used for
capturing a mtdoops dump.

Note: The ->_panic_write is mapped through from the first chip
      that is part of the concat virtual device.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 drivers/mtd/mtdconcat.c | 44 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index cbc5925e6440..af99a5af601e 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -116,6 +116,48 @@ concat_read(struct mtd_info *mtd, loff_t from, size_t len,
 	return -EINVAL;
 }
 
+static int
+concat_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
+	     size_t * retlen, const u_char * buf)
+{
+	struct mtd_concat *concat = CONCAT(mtd);
+	int err = -EINVAL;
+	int i;
+	for (i = 0; i < concat->num_subdev; i++) {
+		struct mtd_info *subdev = concat->subdev[i];
+		size_t size, retsize;
+
+		if (to >= subdev->size) {
+			size = 0;
+			to -= subdev->size;
+			continue;
+		}
+		if (to + len > subdev->size)
+			size = subdev->size - to;
+		else
+			size = len;
+
+		err = mtd_panic_write(subdev, to, size, &retsize, buf);
+		if (err == -EOPNOTSUPP) {
+			printk(KERN_ERR "mtdconcat: Cannot write from panic without panic_write\n");
+			return;
+		}
+		if (err)
+			break;
+
+		*retlen += retsize;
+		len -= size;
+		if (len == 0)
+			break;
+
+		err = -EINVAL;
+		buf += size;
+		to = 0;
+	}
+	return err;
+}
+
+
 static int
 concat_write(struct mtd_info *mtd, loff_t to, size_t len,
 	     size_t * retlen, const u_char * buf)
@@ -660,6 +702,8 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 		concat->mtd._block_isbad = concat_block_isbad;
 	if (subdev[0]->_block_markbad)
 		concat->mtd._block_markbad = concat_block_markbad;
+	if (subdev[0]->_panic_write)
+		concat->mtd._panic_write = concat_panic_write;
 
 	concat->mtd.ecc_stats.badblocks = subdev[0]->ecc_stats.badblocks;
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
