Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C90BCCA46C
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 02:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AtIReeu26h3XUsA241+eIL14zXyrg7/dsN53w8NVFpE=; b=U0BpwWvT49wguD
	VOevl3MJtiPR3Dx2vQNeSXegyadJZ9oKWRKfkj4T4LvzTPk443oZj7B4DDudFULcLCEIw4dFjdDft
	MuF4+a5pTq7t74hVNe29SldXNZMmXHO4KgA5fS4Wq7oT72ThctADX+hWM4zeZAJ5KI1U7O/pRRV8D
	kL+PmtV9FupiwOwxJONjXiGMPjFNkKryhEAqQdC4CnuAKQYLJwJ5i0fQ5j9cG+haRiv88DVEiaKwP
	CAAE4YoyidhIQhJF/HZapUlVgPTqB8KoPPj9pgYfDlHfGP8lQ2evVUxE4A4pUbNYCMKe4o4Akh/ZH
	QU60nv8hlntyKdOailxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHu36-00000004L3Q-13bt;
	Sat, 17 Oct 2026 02:21:28 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHu34-00000004L2d-0JW6
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 02:21:27 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xHu2u-00HRgx-OL;
	Fri, 16 Oct 2026 22:21:16 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] ubifs: drop the obsolete ULONG_MAX assertion on the wbuf timer delta
Date: Fri, 16 Oct 2026 22:21:16 -0400
Message-ID: <20261017022116.792684-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_192126_120465_1F105EA3 
X-CRM114-Status: GOOD (  16.45  )
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

On a 32-bit kernel, once root sets vm.dirty_writeback_centisecs to 4295
or more (43 s; raised on flash-based systems to reduce wear), the next
journal write of every mounted UBIFS file system fails its write-buffer
timer assertion and, with the default assert=read-only, switches the file
system to read-only mode:

  UBIFS error (ubi0:0 pid 1): ubifs_assert_failed: UBIFS assert failed: delta <= ULONG_MAX, in fs/ubifs/io.c:516
  UBIFS warning (ubi0:0 pid 1): ubifs_ro_mode.part.0: switched to read-only mode, error -22

The create, write, unlink or fsync that started the timer returns EROFS
and so does every later one until the file system is remounted; with
assert=panic the machine crashes instead. 64-bit kernels are not
affected. The assertion has been reachable since v4.10, when the timer
started to follow the sysctl.

new_wbuf_timer_nolock() computes the timer slack as

	delta = dirty_writeback_interval * 10^6 ns

in an unsigned long long and asserts delta <= ULONG_MAX. On 32-bit
ULONG_MAX is 4294967295, exceeded from 4295 centiseconds on. The check
dates from commit 2a35a3a8ab3e ("UBIFS: set write-buffer timout to 3-5
seconds"), when hrtimer_start_range_ns() took the slack as an unsigned
long and the value was a compile-time constant that could only be checked
against truncation. Commit da8b44d5a9f8 ("timer: convert timer_slack_ns
from unsigned long to u64") widened the parameter to u64, so nothing is
truncated any more, and commit 1b7fc2c0069f ("ubifs: Use
dirty_writeback_interval value for wbuf timer") then derived the value
from the sysctl, which has no upper bound. The assertion no longer guards
anything and fails on a legitimate setting.

Remove it. The timer is started with the full 64-bit slack exactly as
before.

Tested on a riscv32 QEMU kernel with UBIFS on an mtdram-backed UBI
volume: after "vm.dirty_writeback_centisecs = 4295" the first
open(O_CREAT) fails with EROFS and the assertion is logged; with this
patch the open and fsync succeed and the log is clean. 4294 works on
both.

Found while reviewing the users of dirty_writeback_interval for the
formal verification of the periodic writeback code.

Fixes: 1b7fc2c0069f ("ubifs: Use dirty_writeback_interval value for wbuf timer")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    The write-buffer timer start is the only user of the value in fs/ubifs; the
    softlimit next to it, ms_to_ktime(dirty_writeback_interval * 10), is a 32-bit
    product on all architectures and wraps above 429496729 centiseconds (49.7 days),
    the same wrap that fs/fs-writeback.c has at its two msecs_to_jiffies() sites;
    that is a separate issue of the sysctl's range, not touched here.
    
    Reproducer (32-bit kernel, any UBIFS mount, root):
    
      sysctl -w vm.dirty_writeback_centisecs=4295
      touch /mnt/ubifs/f
    
    Before: touch fails with EROFS; the log shows "UBIFS assert failed: delta <=
    ULONG_MAX, in fs/ubifs/io.c:516" and "switched to read-only mode, error -22";
    every later write to the file system fails with EROFS until it is remounted.
    After: touch succeeds, nothing is logged. 4294 works on both; a 64-bit kernel
    never trips the assertion.
    
    Run here as a freestanding init on qemu-system-riscv32 (-M virt,
    CONFIG_MTD_MTDRAM=y with a 16 MiB device and 128 KiB erase blocks,
    CONFIG_MTD_UBI=y, CONFIG_UBIFS_FS=y, "ubi.mtd=0" on the command line): the init
    creates a 4 MiB dynamic UBI volume with UBI_IOCMKVOL, mounts "ubi0:v" (UBIFS
    formats the empty volume), creates /mnt/a at 4294 (ok, fsync ok), sets 4295 and
    creates /mnt/b: open returns -30 unpatched, 0 patched.

 fs/ubifs/io.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 6c6d68242779..da4eb0a82e62 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -513,7 +513,6 @@ static void new_wbuf_timer_nolock(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 	delta *= 10ULL * NSEC_PER_MSEC / 10ULL;
 
 	ubifs_assert(c, !hrtimer_active(&wbuf->timer));
-	ubifs_assert(c, delta <= ULONG_MAX);
 
 	if (wbuf->no_timer)
 		return;

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
