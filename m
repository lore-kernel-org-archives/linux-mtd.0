Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B30C432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 09:41:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A1861026
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 09:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33A1861026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yiQAN9oILwEmtEB3wB7SEhvRM/vM3dq1DqRGVLYVD+I=; b=E5HUsAPg0kaG5E
	3CElUaFwl27+oHMLmqw874flkAj9MTNT4l3CuwpzflfrpKiP1CT30PA82L4qGvMquT9FLKZo08Nex
	XQMQyrDWH91VEtHOqVyDdWaqnJwdfQag8sB0TGZ31S7IWi0JTJFstuAIrh1wLuxbijOMuc/3vCGdi
	8eF7xsu9Ey3MHQDNy9g3gICJhq7WTYPvqRQsjS8QURQFAqkdKgcHkwOnaZ76/bKdb8sUeldHY8VxB
	2R9kf2aXLySiCL89oUURS/ZvQaHh9g1a8b/bmA5Ww2vmSP+jsB4eBGi6sD0DGQYciXM0HwNp8NpmC
	icYVyPyo5zO7LNjSc2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLMjc-004xDl-ML; Wed, 01 Sep 2021 09:40:44 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLM31-004h4O-4s
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 08:56:47 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id AA76C440F5F;
 Wed,  1 Sep 2021 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1630486600; bh=TxjzjQtf4bQ+evPXvTO3z5LgUgh5BSHhEV02iklQWMU=;
 h=From:To:Cc:Subject:Date;
 b=ASSjxemDoZ/T3V6EMtzKnHSeX3Z5R1hH/nbwbDF157qqVl4dWHCfcUgg4Pzjiax1C
 w1LwntMqdHiIWZbX9uA9dBydFK5BdTPR47gXea1/0izeFZussiuiMejg9yaVtYqmF8
 bRPXkVFpiPEwluXHnM2wmqc7bNeoDRXOqorhXRKZ+CuagXsJbNQwv49WlepSakKxPr
 sdXUlkIn43/gfgiAHYj5eI23jUwFhSP/duw+gqRkUVe6gmW8BJHaLNiZ22a1cTQxJy
 AiIj9s/BqlxSTez4rIeBrRoU3ZSisqqMDYBk9InL3vFlvS9zxhSfpZL0MHxR3TbH73
 +pu1PPvCZNAMA==
From: Sean Nyekjaer <sean@geanix.com>
To: richard@nod.at,
	boris.brezillon@bootlin.com,
	miquel.raynal@bootlin.com
Cc: Sean Nyekjaer <sean@geanix.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: ubi: io: add retries mtd_write
Date: Wed,  1 Sep 2021 10:56:37 +0200
Message-Id: <20210901085637.210572-1-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_015643_414424_D833C5E1 
X-CRM114-Status: GOOD (  13.22  )
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

Fix "Device or resource busy" when resuming from suspend. Sometimes ubi
tries to call mtd_write before the rawnand is resumed.

So add 3 retries to the mtd_write call:
PM: suspend devices took 0.030 seconds
ubi0 warning: ubi_io_write: error -16 while writing 4096 bytes to PEB 1762:94208, written 0 bytes
Disabling non-boot CPUs ...
ubi0 warning: ubi_io_write: error -16 while writing 4096 bytes to PEB 1762:94208, written 0 bytes
ubi0 warning: ubi_io_write: error -16 while writing 4096 bytes to PEB 1762:94208, written 0 bytes
PM: resume devices took 0.110 seconds
OOM killer enabled.
Restarting tasks ... done.
PM: suspend exit

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---

Some explanation/discussion here:
http://lists.infradead.org/pipermail/linux-mtd/2021-July/087390.html

 drivers/mtd/ubi/io.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 0e3a76a9e2f8..fc01ee429358 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -89,6 +89,7 @@
 #include <linux/crc32.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include "ubi.h"
 
 static int self_check_not_bad(const struct ubi_device *ubi, int pnum);
@@ -235,7 +236,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		 int len)
 {
-	int err;
+	int err, retries = 0;
 	size_t written;
 	loff_t addr;
 
@@ -281,8 +282,16 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	}
 
 	addr = (loff_t)pnum * ubi->peb_size + offset;
+retry:
 	err = mtd_write(ubi->mtd, addr, len, &written, buf);
 	if (err) {
+		if (retries++ < UBI_IO_RETRIES) {
+			ubi_warn(ubi, "error %d while writing %d bytes to PEB %d:%d, written %zd bytes",
+				 err, len, pnum, offset, written);
+			mdelay(10); yield();
+			goto retry;
+		}
+
 		ubi_err(ubi, "error %d while writing %d bytes to PEB %d:%d, written %zd bytes",
 			err, len, pnum, offset, written);
 		dump_stack();
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
