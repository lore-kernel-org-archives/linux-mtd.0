Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0D3CA5FA5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZaOAGbZl7C3cmvzaGt/eQYPB/nlq6DTBsMgoEJ9HiQg=; b=zRgxfP+0uB/kMA
	yOTuh7982uGTKtuIaMJDVzvlOvwJ4Mg3UsxMxQyZRuFTWIAZGE5Q3Hr5TP9hfJSP4G+x0S3EOxoOQ
	8WPrGpLc7Iwf44fGZd5ciH2Jua8Pt8fqfR1E/3Pln5xNKrUdqXPzwgq5oUCOFp5uyrRQKQl9KA6IS
	XpdMdOL4F8LqknTMNSi8Fa0+zlpTeNUeeHqpKRkJ+qBpDphtLvjtZrv0tnA5gy0ku3VRxSA1JVUDQ
	dqlG/GgFSFDaHMmgZC6XUrFJ9A4RVKnDy3DUypOnsg2KRSzkVbeWlqo+4oOMmnr4LKYOVA4JiDPe4
	RalQrzpJcNqgdgXfvL+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVey-00000003MSb-0gEc;
	Tue, 29 Sep 2026 11:06:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVev-00000003MSR-3rvM
	for linux-mtd@bombadil.infradead.org;
	Tue, 29 Sep 2026 11:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QBEQM78Q0lpd+BWXfbu7jyyCFrPHGFRUJBbWz7Gkb10=; b=PvMx1kALYfbs8Cucb5QtZvOUv/
	pzeiaF+hmj2lp/MSAfkJ12c41fGzkL1J4cSiGCR3U0mzJqigyoqOeKlKXRKFI+XESYs+uM+Ztxohu
	F5zXq/KnCyQLVF6r8lTSyyxeKymuKXpiTvbIcQn0x+PtDjBE/THR6wrjV7Z+EsV5Srf5y/a5y2RIK
	G42MJ0tGhEYVonl31ufGsM/JncbJOhkr+p8zzylI09IdxNyOlCxxvjSzDDIMMISkKe4OgdoyLE7a2
	BQL5aOGc0WSzNTsgxvLhQ96sbUvsitid8hBQl2GTOqHOMgHJ8W0uOCNyZSho/vqUC2s4pnqd5HhR4
	iu/Ql58Q==;
Received: from m16.mail.163.com ([117.135.210.2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBVep-00000002XRx-2UJO
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 11:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=QB
	EQM78Q0lpd+BWXfbu7jyyCFrPHGFRUJBbWz7Gkb10=; b=g2yvNmPaDcESO65VSD
	QdKGJOEt6BaISf/r7Xx07zC98e65ipJatuwJD/3CDZem3qKL/Tml74DuAC+td2Dm
	XEUOCi9tErq1ROlA0GNPfxjT0aFKhw9RPLbEBqCGviFIWseWAtpQL2m7caAANIv3
	0vSOTjmn6dZfJE41HIijCCu8E=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3hBWEm7tqit_tBg--.40624S2;
	Tue, 29 Sep 2026 19:05:41 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] jffs2: fix wbuf_sem leak on summary failure in jffs2_flash_writev()
Date: Tue, 29 Sep 2026 19:05:38 +0800
Message-ID: <20260929110539.20-1-shxzhaosr@163.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgC3hBWEm7tqit_tBg--.40624S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF1fAr43Wr1UWF4xZry5Arb_yoW5KFyrpr
	9Iqr13Kr1vqF18ArnFyF48ZryDC39xJFZIgr1rW34UZan5Xr1Sga97tFy09Fs8CrsavFy2
	qF4kK3yjvayDZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeksDUUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbCxgWRz2q7m4VWrAAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_120600_656415_3450D48B 
X-CRM114-Status: GOOD (  15.29  )
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

When summary is enabled and jffs2_sum_add_kvec() fails (an allocation
failure while recording a summary entry), jffs2_flash_writev() returns
the error directly while still holding c->wbuf_sem write-locked.  No
later path releases it, so every subsequent read, write and GC blocks
on down_read()/down_write() and the filesystem becomes completely
unresponsive until remount or reboot.

Fix this the same way the wbuf recovery path already handles a lost
summary: disable summary collecting for the eraseblock with
jffs2_sum_disable_collecting() and let the write complete on the
normal path below, which releases the semaphore.  The summary is only
a mount-time optimization; the node data itself has already reached
the flash or wbuf, and a missing summary merely forces a full scan of
that eraseblock at the next mount.

An early version of this fix returned the error after unlocking (via
the shared outerr path).  That was rejected by runtime testing: with
retlen reset to 0 the allocator makes no progress, the retried write
lands on the same offset and trips the contiguity BUG() in
jffs2_link_node_ref().  Swallowing the summary error instead matches
the established recovery behavior and was verified clean.

Test comparison, same guest and test program in both runs (QEMU,
upstream 7.3.0-rc4, JFFS2 on nandsim, failslab fault injection
window-limited to jffs2_sum_add_kvec, fault count taken from the
failslab times counter):

- Deterministic 20+1+20 protocol: 20 clean 15-byte writes, 1 write
  with injection armed at probability 100, 20 clean writes, then
  umount/remount and readback of all 41 markers.
  - With this patch: exactly 1 fault fires during the armed write
    (times 1000000 -> 999999); all three writers exit 0 with no
    errors; file size 615 bytes and all 41 markers present both
    before and after remount; no BUG, oops, hung task or hang.
  - Pristine (unpatched) kernel: the same fault surfaces -ENOMEM
    ("Write of 83 bytes ... failed. returned -12"), then writer:79
    and kworker delayed_wbuf_sync both wedge in D state in
    jffs2_flash_writev -> down_write (hung task reports at 122s and
    245s, rw-semaphore "likely owned by task writer:79" itself);
    the D-state writer is unkillable and the test never completes.
- Endurance variant on the patched kernel (2 clean + 12 armed 256KiB
  block writes at probability 15 + 2 clean): 6 faults absorbed, all
  16 block markers present after remount, no anomalies.
- The original hang was first reproduced on 6.13 and re-confirmed on
  7.3.0-rc4 before the fix (writer + kworker D-state stacks in
  jffs2_flash_writev, same self-owned semaphore signature).

Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time improvement)")
Cc: stable@vger.kernel.org
Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
Tested-by: Shirong Zhao <shxzhaosr@163.com>
---
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 3b7803c75..7ed3fa2bf 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -904,8 +904,16 @@ int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs,

 	if (jffs2_sum_active()) {
 		int res = jffs2_sum_add_kvec(c, invecs, count, (uint32_t) to);
-		if (res)
-			return res;
+		if (res) {
+			/*
+			 * Summary recording failed (allocation failure).
+			 * The node data already reached the flash or wbuf;
+			 * disable summary for this eraseblock so the caller
+			 * still sees a successful write.  The semaphore is
+			 * released on the normal path below.
+			 */
+			jffs2_sum_disable_collecting(c->summary);
+		}
 	}

 	if (c->wbuf_len && ino)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
