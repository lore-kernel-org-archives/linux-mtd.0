Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDFF606A33F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 06:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hP4bfcjB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Xgdafn92
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QFbc9mbbKT/RJ56XNwxwtpF1xTm40mpkFMYsO5fzAYI=; b=hP4bfcjB3d8gC6A6s+Eant7bB8
	fuPjv/f3nSr2lA4bM3yAtcqNSNAaxJSfTxQ77CZ8JNw6SMYS8XH8S/Wqqx0wiuLtugo+6hCGXDiw9
	Isg9QjndKlDEI5sRHysh7Oyt2GJp2WrzD6WEqI4M/hX8vVrz6WUnQnrsajw9rwsHYtSnW7wMSYJgs
	DMKIDZ5aRN2kzSRpO7BhPl/DQqUokjn6N7zJg/B7tRq8MgPfmZGVYoCiovLdwMt6Oe/6Dp15q7B7M
	MNPlcpKhNj2tyX15JRUcDFpDpzFEE2VsCz2I9K4t1s+5/mvhwnsegSwhncM5B5HkWG0brgsiO1k8R
	loz9iV8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCN9-00000004eL2-0Xne;
	Tue, 17 Nov 2026 06:08:51 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCN5-00000004eK6-3Lak
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 06:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794895723; bh=MDJECPrb826/6xAxoygTt3Udx1+QzGisBpJ6SVP0Utw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Xgdafn92FDtoY3Tj4Cdn0Xck2lmiLcSHvkz4m4hFoRiQHyhaYun58L8PDK5YuZgN0
	 7Zv6wr2HsFdyDa6LCyeI6ZzuL/FvZqhUWa7tqk8LjoJ9eyMwj7qAzU4hDPytpWj2XZ
	 CtXqiyAy+STwzQAj+C3cNsxEyG3U9vyco+qIGIf0=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 2271163B; Tue, 17 Nov 2026 14:08:39 +0800
X-QQ-mid: xmsmtpt1794895719tqdrgppmn
Message-ID: <tencent_9B9358CCE5C39B1E7017C4B42600DC95A409@qq.com>
X-QQ-XMAILINFO: MYj4oRzRRyycxhvlKZDxFhfr7inOMQUNTAB/9vulSPLRxB3M41nGRFNiiabTeA
	 rk0iStyxyiVDRNjxHxafpBVaXedWkXfe4R7lOHTml7+x3EyCkA16pAtOHIKVoKp/WbhkmqsjlpYX
	 IhBhmgeG0v56pHcQxX3o6Zhht9m0xAv791SYo2SKRcqBZZJPdcIhYVmHGd6fEgSBmrDD9wEZDdh7
	 wbWMZBLzlwQtnEBfTu66qJ63UcFeoS24/mneBCJn/wVOZqtSwBEOhWSgiWJagjrwZh4Jmb+sZHZQ
	 5EmqHz4fMGleeI9U8ddyhYaxoMzyjum995GR66GT/Nc1kGMDXmBqUklNvlyJa+Llr52oGBXCrb3d
	 OY3Eo2U27t+aikbfN3s1yE06F2Z6mv/IbdZ1OGeK5qL5Y2Yai0O3QROogPtLgLyyOIdmjCv4dQ/w
	 CxlKtrrmn7I2avGuXFJmSNgqMfOjeu3Igm+lJ53oLHsgeXL8HK4PRA873vd6x3CHx/NDgM9E+AmC
	 nJVPl9wrzkPx4qmC0bkUqlnYyCXihBpLlGGrrB/6EaV5rqDCRI+0qIPnW67I1w3InqYY4VMEyKxg
	 dfj7la5rv6H7CVs6bHtHiwaNloSxXng+w1+5eJTwB7TpKLauBvHXHHtTliTB6Ln3ZlBO/SMF27S8
	 WNy8aMJ5g1VywEGfswLMIbLszWBt07WgernJ+82DxPLHEkwWQdJZ/4qCCRqa1jqtaXxCEBF11tfy
	 t9LKcozXFl6aouHSx2h7Q1aq14KFqG5oqZPt6KjylpMRsn0SdJ7PiFkwOloczRWIaOpJL2Vf/yaJ
	 i1EMxpzh6YNCwJ9sQ6taSmokBS0mSjo23loGBg1dYGlHKiSGm5pm2Q477hs/xK0ndKxQcNYRtHCS
	 YHWFeGmkO1T13siDzdm2yXQCegby5+b5u6goYAQ9NVurv8cU8o65/N7q+9G5ssWOrGCE1Yi6TRRf
	 b1mvtkGsIsL1AsEAikbIc7tFyyAb4ZcB6k6GsQRR3ESaFwaODUv2fDiX7UDcKmh3mhPmwwtzHIr1
	 ow4+f3Sr37tUz2XIHxI6KY+ws3oO28nPNUeNNDd8tdcI6PjdExrOv4N3IhjX8GekdiWxnbEU+ZDv
	 gMaJ3ZavlArnnfQ3FGcBLh7/ao52hGz/QEqNRzpke81r1rTpE=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	syzbot+c66e7044aa73c620d862@syzkaller.appspotmail.com,
	sashiko-bot@kernel.org,
	linux-kernel@vger.kernel.org,
	847807867@qq.com
Subject: [PATCH v2] mtd: blktrans: keep reclaim out of the ->release paths
Date: Tue, 17 Nov 2026 14:08:38 +0800
X-OQ-MSGID: <20261117060838.186252-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-218218@kernel.org>
References: <sashiko-outbox-218218@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_220848_404980_D85F512F 
X-CRM114-Status: GOOD (  18.06  )
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
Fixes: 048d87199566 ("mtd: blktrans: Hotplug fixes")
Signed-off-by: Shuai Liu <847807867@qq.com>
---

Changes in v2:
  - Add Fixes tag pointing to 048d87199566 ("mtd: blktrans: Hotplug fixes"),
    which made ->release() run under dev->lock and added the ->release()
    call to del_mtd_blktrans_dev() (Sashiko)

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
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
