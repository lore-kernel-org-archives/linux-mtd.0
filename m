Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2314FC433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:32:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D09C20848
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:32:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1cTmbKie";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uQjZ6R/T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D09C20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5bfA+GqNHNlozqyBYsVIlOYOxcLaJE0vL0sNlVxoz88=; b=1cTmbKieWVvHXPuRjnALaC8x6
	+kidxDiohLZQ2mBt/HoB9nU1Y/Ew6m/rl0BLlq6FnBmWVY8jpFvJl2M3mTUmysJ9Yw3aZ9JuR20bi
	TIXS6zBCsTRBsR/siQu2Pt6esqLYzJ/EhFLVQEhj1oqKBeTu7kS1bOlHhXqs0Ay+zBz3i6OtbgAeO
	m2fcNZyJu0TzaO//e8m2Ak/anyV/i0jji38MHWS2D+qvv20kaeGxraNAKLVA5Mt0v7pN1/8qplm8C
	YhHniM554EKNgxc6ANSjMK+JStUK0JQuxx+q9DibwrVPFSUW+jfliT5NzJI127q4Z4IQW1antrvA+
	wLrhvDvOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTPpm-0008Bc-Pn; Fri, 16 Oct 2020 13:31:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTPpk-0008B5-Oz
 for linux-mtd@merlin.infradead.org; Fri, 16 Oct 2020 13:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+NkbxqmYZkb3NvJTMPdsdcushUdMVZQRBEUzMmtHWk8=; b=uQjZ6R/TzgscHJ8tmNGZKQJCHg
 eD7wfjH4jqdCszcLHnK7RLgnIyIFUmWoVF5Ergpqw1VS2gnc4m51BuaqTJ9F77AwaWl53TR9LtSsY
 OBd5nic8mwUHSu30wbMYWOWxR6vgHB46uDVASQN2TNe9VXBW1GJVrmyjvrdSKVi/o7Ua1/IThwtFA
 y37trwOis4fFELclJ6Q7/nB7iqVymZwwXjsggblzEUx7sn3XV0RuQPYvhTOM9VSzukD+GXsrbQrex
 kavZaG/12oaErh9ScSPnXaLNPedf8Tvsm7aaErFJvW1wL5Wos3pCsa+/5X3Ecrwu8zsHvSSG4NsP3
 6lZfYebw==;
Received: from 213-225-9-134.nat.highway.a1.net ([213.225.9.134]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTPpj-0003ON-7X; Fri, 16 Oct 2020 13:31:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH 4/9] pstore/blk: remove __unregister_pstore_blk
Date: Fri, 16 Oct 2020 15:20:42 +0200
Message-Id: <20201016132047.3068029-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016132047.3068029-1-hch@lst.de>
References: <20201016132047.3068029-1-hch@lst.de>
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fold __unregister_pstore_blk into its only caller, and merge the
two identical calls to __unregister_pstore_device that exist in the
caller now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/pstore/blk.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 7f8368e94b3604..3a2214ecf942ae 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -388,19 +388,6 @@ static int __register_pstore_blk(void)
 	return ret;
 }
 
-static void __unregister_pstore_blk(unsigned int major)
-{
-	struct pstore_device_info dev = { .read = psblk_generic_blk_read };
-	void *holder = blkdev;
-
-	lockdep_assert_held(&pstore_blk_lock);
-	if (psblk_bdev && MAJOR(psblk_bdev->bd_dev) == major) {
-		__unregister_pstore_device(&dev);
-		psblk_put_bdev(psblk_bdev, holder);
-		psblk_bdev = NULL;
-	}
-}
-
 /* get information of pstore/blk */
 int pstore_blk_get_config(struct pstore_blk_config *info)
 {
@@ -430,16 +417,14 @@ late_initcall(pstore_blk_init);
 
 static void __exit pstore_blk_exit(void)
 {
+	struct pstore_device_info dev = { };
+
 	mutex_lock(&pstore_blk_lock);
+	if (pstore_zone_info)
+		dev.read = pstore_zone_info->read;
+	__unregister_pstore_device(&dev);
 	if (psblk_bdev)
-		__unregister_pstore_blk(MAJOR(psblk_bdev->bd_dev));
-	else {
-		struct pstore_device_info dev = { };
-
-		if (pstore_zone_info)
-			dev.read = pstore_zone_info->read;
-		__unregister_pstore_device(&dev);
-	}
+		psblk_put_bdev(psblk_bdev, blkdev);
 	mutex_unlock(&pstore_blk_lock);
 }
 module_exit(pstore_blk_exit);
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
