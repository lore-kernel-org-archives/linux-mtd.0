Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5276AC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:49:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F1920719
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:49:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V5i5srLt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Nx+h2rhZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F1920719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4SD7z+lYnFNOY9BHC4y/aEy8jlxTgBDsaVefOtQ1XVY=; b=V5i5srLtD0ypKtPEpwovW0GXk
	ZuV4dTYZILpMaIj7p1s8EJdE/5riPvPoApLKH2BO/ak6J4pwcoluHeQH3bYnkBVHmROsZCFv99f8N
	5tmh9brcwfykMJwo70LyqNI3+0lP4ARVTQ5LfwyvMCDPlVnKiq6N5HLTYzfQSLznhFJQUtA2pEPau
	yh/fVvEyrUPZdDfRfpsp+jy6xgpLETKFjRwpKG8fBzEx9qgZIPkBJYJb+D0V5qlnSwwJtjuRnWY8y
	ozPNWY79O/O9yLTr6Ilp2UHhHdyqyfPjvF50M2pqXrEwSRAlLafzcs/dUgOpaMpvlbv3xrn00D7Qa
	EBWgfRLdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJ96-0008Gv-Ty; Wed, 18 Nov 2020 08:48:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8T-0007zr-Uz
 for linux-mtd@merlin.infradead.org; Wed, 18 Nov 2020 08:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=AZC0zIud/sy36HL3UqpdhruuJxaP+dAsE+XWl7N2xio=; b=Nx+h2rhZg/HvIdxi/V4Jhb3r0u
 Ha9RMCfuFy1DcNiHVfggBRgvESO9x7+pxSBvldUugXJje0PXHGlc4RwDDAg7KizNUutdw1Oz6YYyv
 GW4iMGk2/W7s5u9pbxqjoSdBjJixbVkMGKI4sJ3RWvWoE3K0iOy/pbqDa1e1ML4CIGcPuaXqz2g9g
 GWC0Sp67FA+/219oiqS3gSXWZE8BQ1pE8WMHKNGls47Mx8ZIwmqDOxT3eb3qNMpqy/o6N2LhYhPo2
 rajpeTK4bPGzZuMUv7onhX7MqP2bpqaR14FcEdjZKriDz9DBejg943e2dL+oCaa6VfesI9rxujAcy
 PLSuDG6w==;
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8S-0007lc-Hx; Wed, 18 Nov 2020 08:48:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/20] init: refactor devt_from_partuuid
Date: Wed, 18 Nov 2020 09:47:48 +0100
Message-Id: <20201118084800.2339180-9-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
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
Cc: linux-bcache@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The code in devt_from_partuuid is very convoluted.  Refactor a bit by
sanitizing the goto and variable name usage.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 init/do_mounts.c | 68 ++++++++++++++++++++++--------------------------
 1 file changed, 31 insertions(+), 37 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index aef2f24461c7f1..afa26a4028d25e 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -105,13 +105,10 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
  */
 static dev_t devt_from_partuuid(const char *uuid_str)
 {
-	dev_t res = 0;
 	struct uuidcmp cmp;
 	struct device *dev = NULL;
-	struct gendisk *disk;
-	struct hd_struct *part;
+	dev_t devt = 0;
 	int offset = 0;
-	bool clear_root_wait = false;
 	char *slash;
 
 	cmp.uuid = uuid_str;
@@ -120,52 +117,49 @@ static dev_t devt_from_partuuid(const char *uuid_str)
 	/* Check for optional partition number offset attributes. */
 	if (slash) {
 		char c = 0;
+
 		/* Explicitly fail on poor PARTUUID syntax. */
-		if (sscanf(slash + 1,
-			   "PARTNROFF=%d%c", &offset, &c) != 1) {
-			clear_root_wait = true;
-			goto done;
-		}
+		if (sscanf(slash + 1, "PARTNROFF=%d%c", &offset, &c) != 1)
+			goto clear_root_wait;
 		cmp.len = slash - uuid_str;
 	} else {
 		cmp.len = strlen(uuid_str);
 	}
 
-	if (!cmp.len) {
-		clear_root_wait = true;
-		goto done;
-	}
+	if (!cmp.len)
+		goto clear_root_wait;
 
-	dev = class_find_device(&block_class, NULL, &cmp,
-				&match_dev_by_uuid);
+	dev = class_find_device(&block_class, NULL, &cmp, &match_dev_by_uuid);
 	if (!dev)
-		goto done;
-
-	res = dev->devt;
+		return 0;
 
-	/* Attempt to find the partition by offset. */
-	if (!offset)
-		goto no_offset;
+	if (offset) {
+		/*
+		 * Attempt to find the requested partition by adding an offset
+		 * to the partition number found by UUID.
+		 */
+		struct hd_struct *part;
 
-	res = 0;
-	disk = part_to_disk(dev_to_part(dev));
-	part = disk_get_part(disk, dev_to_part(dev)->partno + offset);
-	if (part) {
-		res = part_devt(part);
-		put_device(part_to_dev(part));
+		part = disk_get_part(dev_to_disk(dev),
+				     dev_to_part(dev)->partno + offset);
+		if (part) {
+			devt = part_devt(part);
+			put_device(part_to_dev(part));
+		}
+	} else {
+		devt = dev->devt;
 	}
 
-no_offset:
 	put_device(dev);
-done:
-	if (clear_root_wait) {
-		pr_err("VFS: PARTUUID= is invalid.\n"
-		       "Expected PARTUUID=<valid-uuid-id>[/PARTNROFF=%%d]\n");
-		if (root_wait)
-			pr_err("Disabling rootwait; root= is invalid.\n");
-		root_wait = 0;
-	}
-	return res;
+	return devt;
+
+clear_root_wait:
+	pr_err("VFS: PARTUUID= is invalid.\n"
+	       "Expected PARTUUID=<valid-uuid-id>[/PARTNROFF=%%d]\n");
+	if (root_wait)
+		pr_err("Disabling rootwait; root= is invalid.\n");
+	root_wait = 0;
+	return 0;
 }
 
 /**
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
