Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37AA606A334
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 05:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ep5QQrl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=l7xl29oB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2dBMOeCttrVaKLW/LXZtP7+8qtYlEbetk1BfxeaGjNY=; b=4ep5QQrlEIzgk7+rICSp7zpYMa
	1PhF6km662UKA1QF6gxOL2HFYTqtEFBgUsKwpGFCsWtAAwRo2G79KVkeZscYWhhCpyG/aBzm9PM7f
	NH8FSvteqRSxvpw63AwqlXD7S9zmP6Xs3dOatM7ybaVrY8EEYnVKXv/ivBHt8dgCnzHEsWiG1fOsP
	7mQuzaBtjwdF7SsANa/hfj4/AWgbgORz19az6bWWkCuSMYSmbyjKYbXDfXhxE36Lb9JxIfNNFD/Ot
	bZDH9Nd6GXm+hx9EjZEfz4sjvKNgVAfvlRFtpMQGYXNKCnGQy7lyz+Y9zrLTvcyhLhpX/D+RlrOS0
	UEni4oXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBkS-00000004baz-0jXe;
	Tue, 17 Nov 2026 05:28:52 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBkO-00000004baL-294l
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 05:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794893320; bh=2hOiWlxzK3aL96INQ3Sfam4C/pUNmjoawEgHh6mRKgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l7xl29oB6/HsHEd+Dj80iRgLEkeft4xzHC/V+yuHX2niXPkMwrEIEuiN2d9+i5mIT
	 2QN6uj4X4/hnS56Qo082hhK5Ne61aZNxvHsm0DWP16AHnCVkiq8ftD+WXXXXGZwZNK
	 hbB88Ot0KXzVSsso38IIMdxTQjXmh5WQ6dMg0qOw=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 725B424E; Tue, 17 Nov 2026 13:28:37 +0800
X-QQ-mid: xmsmtpt1794893317tdsa74kf8
Message-ID: <tencent_B9AEB406CBA2FC785312AE8158D20489FB06@qq.com>
X-QQ-XMAILINFO: NVJ0hJNx7N5SWYMTtMeA3lkGAmWCORElAgIzEAkOoeoXTTmvN5gURaNIq57s5+
	 MRBCLWQTvNeqIei6VwDTed4KW3cAzX5wDk2NpE+yUhq0nDZ6pXp38WSX22BR8Z9HeAZLRD2UAMQC
	 3wA4q0LOgLAwA/8mN+EQyvDHst95phAdxuruyE5Kh+6YCsyXotB5/8Vk6dB+9iU09ASqfxUIf7ev
	 m2tYS4MfXkuTyPBKC0t7SW4An5ycH4PQKZRTRpzKtFvFeW1rKjH2E9PPkN9c1edVVdT0BgbBFb5f
	 84izC2Z2JiEjXeLvBPjm+BKS9XdOjDx/Sujltxgs/mYBgYPqpNrs2MvmhLHrHwFEqNZOMHGyplOQ
	 SDx5WciYzVVQRxeHMsFvvmKn85W7poPCIZCdd7mREz7jgcm8aALLQEU8SlWOLDJeba8thgZS2t+Z
	 JYdlJfNzvXcC9uMihtqJo78vVdZx7HCnyXwgN4U21xK0YVG/wv4Q9FKYbDKSzWpcDeuYwtf2LrZh
	 gcau6qbLZi3M1RiRZ2FlQRZCFJghZWGoQoiyaL2lPPjOaoSCzXkOqOo6kbdrNHkE9odN1a8tTTMe
	 Gnl0mOc7SSSAVs7ukwGOt9KT8g+AAcj6CTTe7oQd+qr9r1mol0RGzuO1/98mvvL4Aq5wyZ8MXEON
	 KkufnrAPAKuKe4PflBEg9pkTh8z0UdUznvzFUZtI2KcL9NQgltaZL1mxz1HZVESLM5zXtK6yhExC
	 27AdR2BZtBZJ5+xn/O6vPR8ArtN3AoeBUEgyM/9uiS7FVe8VXQOy0y36bRSWAU9VdsWI7dXkMs3Y
	 ZDisrqRIoZQOsbI58WGiNRZR3T3GKwWLiifesB/7dTAM8300DoXeY+yokH3mc5LB6Vdyttdji4jA
	 q01QMqy7bc7XxVYmzyFf26JaqnerP6jmhsYsgk8vrv6YECfaUiaZOgqs6LbMbeIURRQnPYInkTHR
	 cby3qyNOtGUHXOHvrZdiuulB0rohUXTvSdu5aj4RsCs9hYKpeN9Jb2SQqw9rXT/73o2xPicih9mF
	 exMlxo5pHTP4k3EcFQA04cxGfZ+fGqy42sOUuIytGDXKvIik46TF3cGWylfg8awSASXS+45gwIoz
	 w3lZHw
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	syzbot+c66e7044aa73c620d862@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] mtd: blktrans: keep reclaim out of the ->release paths
Date: Tue, 17 Nov 2026 13:28:37 +0800
X-OQ-MSGID: <20261117052837.132886-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6afb28e0.d140b701.164b01.0001.GAE@google.com>
References: <6afb28e0.d140b701.164b01.0001.GAE@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_212849_094010_52900315 
X-CRM114-Status: GOOD (  16.64  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

blktrans_release() invokes tr->release() while holding dev->lock, and
translators can walk down into the flash driver from there:
mtdblock_release() flushes its write cache via write_cached_data() ->
erase_write() -> mtd_erase(), and concat_erase() allocates a struct
erase_info with GFP_KERNEL. del_mtd_blktrans_dev() calls ->release()
under the same lock on the device removal path.

Reclaim from those allocations can recurse back into the same block
queue and deadlock. lockdep reports the full cycle when a write to the
concat device is flushed at last close:

    init/1 is trying to acquire lock:
      fs_reclaim, at: __kmalloc_cache_noprof
    but task is already holding lock:
      &mtdblk->cache_mutex, at: mtdblock_release

    Chain exists of:
      fs_reclaim --> &new->lock --> &mtdblk->cache_mutex

    the existing dependency chain (in reverse order) is:
      fs_reclaim -> q_usage_counter(io) -> elevator_lock
        -> set->srcu -> new->lock -> mtdblk->cache_mutex

    Call Trace:
       concat_erase
       mtd_erase
       erase_write
       write_cached_data
       mtdblock_release
       blktrans_release
       bdev_release

The io path is already protected: mtd_queue_rq() disables reclaim
across dispatch with memalloc_noio_save(), because translators may
allocate while processing requests under dev->lock and the srcu read
side. ->release() runs under the same locks, so give it the same
treatment in blktrans_release() and del_mtd_blktrans_dev().

Verified with mtdram + block2mtd + concat + mtdblock on QEMU
(CONFIG_PROVE_LOCKING): writing through /dev/mtdblockN and closing
the fd produces the warning above on the unpatched kernel and stays
silent with this patch, with the readback still succeeding.

Reported-by: syzbot+c66e7044aa73c620d862@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c66e7044aa73c620d862
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 drivers/mtd/mtd_blkdevs.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 42f250344f0cd..be4ead01f5210 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -233,6 +233,7 @@ static int blktrans_open(struct gendisk *disk, blk_mode_t mode)
 static void blktrans_release(struct gendisk *disk)
 {
 	struct mtd_blktrans_dev *dev = disk->private_data;
+	unsigned int noio_flags;
 
 	mutex_lock(&dev->lock);
 
@@ -242,8 +243,12 @@ static void blktrans_release(struct gendisk *disk)
 	module_put(dev->tr->owner);
 
 	if (dev->mtd) {
-		if (dev->tr->release)
+		if (dev->tr->release) {
+			/* Reclaim must not recurse into I/O while releasing the device. */
+			noio_flags = memalloc_noio_save();
 			dev->tr->release(dev);
+			memalloc_noio_restore(noio_flags);
+		}
 		__put_mtd_device(dev->mtd);
 	}
 unlock:
@@ -410,6 +415,7 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 {
 	unsigned long flags;
 	unsigned int memflags;
+	unsigned int noio_flags;
 
 	lockdep_assert_held(&mtd_table_mutex);
 
@@ -435,8 +441,11 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 		then put mtd device, and don't touch it again */
 	mutex_lock(&old->lock);
 	if (old->open) {
-		if (old->tr->release)
+		if (old->tr->release) {
+			noio_flags = memalloc_noio_save();
 			old->tr->release(old);
+			memalloc_noio_restore(noio_flags);
+		}
 		__put_mtd_device(old->mtd);
 	}
 

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
