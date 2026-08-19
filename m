Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739AEC5DF85
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2026 18:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zv2BpIiusg3W3J01EVNUBh81g4M6/HuZ+O/h2/fR5eU=; b=y6/mAIFtuIVW6p
	e61HhBfTCFXfyGj3XddvdVBV8TxyFvFfc5IZMGyAYAHDddbMCnOS0lkax92bTGWZPFdCx51KZhara
	OK9izlEt+nQHl62GktxzRXw3ekAwnPdHxoUa/acHHxA9LdkNFw5TLb7cx2TYc/uuwQoc63meLpOD3
	c8rT/Sa5TQf+3gdlnqQSDG6BmOwzuZ/a84QN4vbE2Duos5z5j08P0GarHjafI2HFcwocmLLx3ggfW
	GKOJOKLSnWbG4VuuFpNwvNJRs3V7xQdpcYgX/YtlALC1Jjywdk4mdHriYEovDiHgkABUR99Ayi4EC
	FjTT46OffW3mqaUQkhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwl1Q-0000000AN2X-2x2M;
	Wed, 19 Aug 2026 18:28:20 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwl1M-0000000AN1f-0Qx8
	for linux-mtd@lists.infradead.org;
	Wed, 19 Aug 2026 18:28:19 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1627217a91.3
        for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2026 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1787164092; x=1787768892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCUsoGIYtqoSfLQt+6fWMLj4uwLgP6LTijckWZ+P42g=;
        b=PvHHderm4p78CCBNuc1IW97FYlLqtmVZxRtz1/LosRpwQl7x4sembmtlziGNbT3UHn
         JhlLv4eBhUlwEqX4V5hRvqIZrMAy0HcWzbfCzzWVIOeaZLoVIjQ/ZQOVDEsBLDlt2Ayl
         oLHXqWYi6akVNJOrIHdChDVcdHNKb75dMDFzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787164092; x=1787768892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCUsoGIYtqoSfLQt+6fWMLj4uwLgP6LTijckWZ+P42g=;
        b=Z91N4UeRnaESLyDkgJMUbABxMr1+SpVcd90b0stSVo5VCqJ5jc25Y4XES+1ges/YQP
         ONAyDR8qEh5Q0tyOXhhpWptM1K+TfX/Afs9g2PdmhaHfvZnYMFK/DjnjFNbUCT+yO5yH
         xPVuTFYFBNe2eTFJXw1yOu5l0dWicof2JbxkIjm2BMH7BeiUersPYyDgh7jFF6WZftM5
         yFAG8gYwG/5Yg1Zq0N1tgWp+lo1LL6B8LupH0R5h3R2KaOIG9g6UYX/iAboDW8NgtQd3
         E00+ivWn2RqAis+7+MFzUfWZO3PQ/ZoDf8B150XfObKBhO1dNP230jN5bjx1iel4eGOT
         /ZHA==
X-Forwarded-Encrypted: i=1; AHgh+RqvctXrd3Dwl+vnIC2Tp6cdj0Qz07U0w1jUCvry1sR/u7gyKzXn7Xx3Y7sKBqFwgzIY0Mg0BLncQAg=@lists.infradead.org
X-Gm-Message-State: AFuF++lGpcB2JOfmA1SzwYpZGNHAWrYdOvzCqP4bqG8g/fEuqO7SX/JS
	Oc11HiZ8XGReIOepcy7AmKMyM3eubmBye7RxL0x+P975GisnZWfloGKt+2XHB2I3V78=
X-Gm-Gg: AR+sD11BaiSm19FgyFP1NRDjKUpVHT8HlrbX3FOxJV0DUeOYaA69qMUQlCznokh6RnO
	bcoaiSaTlpW6IIVz9NuqDTS823X9sxRC+I26dU1E6lc9vf5kVetS6K7UVus8W23nV1dtNIN4xfS
	pDtwEPOHbtYiS2fXXl7yfjpK5BF6E03fwhhxlsY07fe8z0GOapVcO9QyIS4l+R0ndHQDHv3w9A0
	pAtqdFUKj8jfbCuycFOYlnyBZzcg2c69DlPr/d4NjfNBSzH/B60//5CdcNFzXCWEWEg8wQuL/jx
	3dPdARoQhPFIYtstHCwfceiCrr6TZQ2W+0GhwrPgpWzcBozkv5i/4Ci/bXY62NYCrW4opoJziqn
	pF2oQ/1m9IDIXZ7yGCgvjPGkL+KsrPcnKY9L6i/+gqpj1xkT3G3jBAtvL4d5/fjJeOzl26C7vOv
	+LAICL8ntLnbdCGIWIr7q2U/rF+yKf64gtY4GgLEeneyxs1wwH2oG4hVnrF/szCAYweG/FjbPO4
	XZhUgZc0AkUNDAZX/5zI5iwyN8qcbAk6KKXOsOJF0v+TnGfY4r0MecoGaFSVn99F0qu4BzoOHj+
	ckNRj449KDlcjKOCEvMAEOVtj0li5UMQQ1aNjeIDj9KqusnyYZv/rA==
X-Received: by 2002:a17:90b:4cc5:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-39580ed0a57mr12937409a91.8.1787164092014;
        Wed, 19 Aug 2026 11:28:12 -0700 (PDT)
Received: from leesin ([147.46.121.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f9ab4b4sm3441189a91.8.2026.08.19.11.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 11:28:11 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: dwmw2@infradead.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at
Cc: kees@kernel.org,
	linux-kernel@vger.kernel.org,
	eulgyukim@snu.ac.kr,
	jjy600901@snu.ac.kr
Subject: [BUG] general protection fault in jffs2_xattr_delete_inode
Date: Thu, 20 Aug 2026 03:28:04 +0900
Message-ID: <20260819182805.4020838-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_112816_483946_A12E49AE 
X-CRM114-Status: GOOD (  17.59  )
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

Hello,

We found a "general protection fault in jffs2_xattr_delete_inode" on Linux v7.2.
The issue was found by our own race fuzzer. We have not analyzed the root cause,
so we do not have a proposed fix to offer.

To reproduce the race reliably, we applied the delay patch below to the
kernel and ran the C reproducer as root inside an x86_64 QEMU guest. The
crash log we observed, the delay patch and the reproducer are all included
below.

The following kernel config options are required to reproduce the issue:
    CONFIG_MTD=y
    CONFIG_MTD_MTDRAM=y
    CONFIG_MTDRAM_TOTAL_SIZE=128
    CONFIG_MTDRAM_ERASE_SIZE=4
    CONFIG_MTD_BLOCK=y
    CONFIG_JFFS2_FS=y
    CONFIG_JFFS2_FS_XATTR=y
    CONFIG_DEBUG_FS=y
    CONFIG_FAULT_INJECTION=y
    CONFIG_FAILSLAB=y
    CONFIG_FAULT_INJECTION_DEBUG_FS=y
    CONFIG_KASAN=y

We hope this report is useful. Please let us know if any further
information would help.

Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>
Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>

Kernel delay patch:
==================================================================
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 6ada8369a762..32c2aaae80d5 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -25,6 +25,7 @@
 #include <linux/vmalloc.h>
 #include <linux/vfs.h>
 #include <linux/crc32.h>
+#include <linux/delay.h>
 #include "nodelist.h"
 
 static int jffs2_flash_setup(struct jffs2_sb_info *c);
@@ -433,6 +434,9 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
 
 	c = JFFS2_SB_INFO(sb);
 
+	if (strncmp(current->comm, "syzrepro1", 9) == 0) {
+		mdelay(10);
+	}
 	inode = new_inode(sb);
 
 	if (!inode)
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index cda9a361368e..9e7886c5b95a 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -12,6 +12,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kernel.h>
+#include <linux/sched.h>
 #include <linux/fs.h>
 #include <linux/crc32.h>
 #include <linux/pagemap.h>

==================================================================

C reproducer:
==================================================================
#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mount.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <unistd.h>

#define SYSCHK(x) ({ long __r = (long)(x); if (__r == -1L) { perror(#x); exit(1); } __r; })

#define JM   "/root/jm"
#define DIR0 JM "/d0"
#define DIR1 JM "/d1"
#define DBG  "/sys/kernel/debug"

static volatile int stop_all;

static void knob(const char *path, const char *val)
{
	int fd = SYSCHK(open(path, O_WRONLY));

	write(fd, val, strlen(val));
	close(fd);
}

static void *th_victim(void *arg)
{
	char p[128];
	unsigned i = 0;
	int fd;

	prctl(PR_SET_NAME, "syzrepro0", 0, 0, 0);
	while (!stop_all) {
		snprintf(p, sizeof(p), DIR0 "/v%u", i++ & 31u);
		fd = open(p, O_RDWR | O_CREAT | O_EXCL, 0600);
		if (fd >= 0)
			close(fd);
		else if (errno == ENOSPC || errno == EIO)
			sched_yield();
		unlink(p);
	}
	return NULL;
}

static void *th_inject(void *arg)
{
	char p[128], nb[16];
	unsigned nth = 1, i = 0;
	int ffd, len, fd;

	prctl(PR_SET_NAME, "syzrepro1", 0, 0, 0);
	ffd = SYSCHK(open("/proc/thread-self/fail-nth", O_RDWR));

	while (!stop_all) {
		snprintf(p, sizeof(p), DIR1 "/t%u", i++ & 15u);
		unlink(p);

		len = snprintf(nb, sizeof(nb), "%u", nth);
		if (write(ffd, nb, len) != len)
			break;

		fd = syscall(SYS_openat, AT_FDCWD, p, O_RDWR | O_CREAT | O_EXCL, 0777);
		write(ffd, "0", 1);

		if (fd >= 0) {
			close(fd);
			unlink(p);
		} else if (errno == ENOSPC || errno == EIO) {
			sched_yield();
		}
		if (++nth > 32)
			nth = 1;
	}
	close(ffd);
	return NULL;
}

static void *th_churn(void *arg)
{
	long idx = (long)arg;
	char nm[16], *p;
	int k, fd;

	snprintf(nm, sizeof(nm), "syzrepro%ld", idx);
	prctl(PR_SET_NAME, nm, 0, 0, 0);

	p = malloc(4008);
	p[0] = '/';
	memset(p + 1, 'a' + (int)(idx & 7), 3998);
	p[3999] = 0;

	while (!stop_all) {
		for (k = 0; k < 256; k++) {
			fd = syscall(SYS_openat, AT_FDCWD, p, O_RDONLY, 0);
			if (fd >= 0)
				close(fd);
		}
	}
	free(p);
	return NULL;
}

int main(void)
{
	pthread_t th[4];
	char p[128];
	int i, fd;

	mkdir(DBG, 0755);
	if (mount("none", DBG, "debugfs", 0, NULL) != 0 && errno != EBUSY)
		SYSCHK(-1);
	knob(DBG "/failslab/ignore-gfp-wait", "N");
	knob(DBG "/failslab/verbose", "1");
	knob(DBG "/failslab/probability", "0");
	knob(DBG "/failslab/cache-filter", "N");

	mkdir(JM, 0777);
	if (mount("mtd0", JM, "jffs2", 0, NULL) != 0 &&
	    mount("/dev/mtdblock0", JM, "jffs2", 0, NULL) != 0)
		SYSCHK(-1);
	mkdir(DIR0, 0777);
	mkdir(DIR1, 0777);

	for (i = 0; i < 4; i++) {
		snprintf(p, sizeof(p), DIR1 "/w%d", i);
		fd = open(p, O_RDWR | O_CREAT | O_EXCL, 0600);
		if (fd >= 0)
			close(fd);
		unlink(p);
	}

	pthread_create(&th[0], NULL, th_victim, NULL);
	pthread_create(&th[1], NULL, th_inject, NULL);
	pthread_create(&th[2], NULL, th_churn, (void *)2L);
	pthread_create(&th[3], NULL, th_churn, (void *)3L);

	sleep(165);
	stop_all = 1;
	for (i = 0; i < 4; i++)
		pthread_join(th[i], NULL);
	return 0;
}
==================================================================

Crash log:
==================================================================
name failslab, interval 1, probability 0, space 0, times 0
FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times 0
FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times 0
Oops: general protection fault, probably for non-canonical address 0xec8c888c8c8c8c91: 0000 [#1] SMP KASAN PTI
KASAN: maybe wild-memory-access in range [0x6464646464646488-0x646464646464648f]
CPU: 3 UID: 0 PID: 402 Comm: syzrepro1 Not tainted 7.2.0-dirty #2 PREEMPT 
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:jffs2_xattr_delete_inode+0x38/0x300 fs/jffs2/xattr.c:602
Code: 41 55 41 54 53 48 83 ec 50 48 89 3c 24 48 85 f6 74 2a 49 89 f6 49 bd 00 00 00 00 00 fc ff df 48 8d 5e 28 48 89 d8 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 90 02 00 00 83 3b 00 74 14 48 83 c4 50
RSP: 0018:ffff888104ad7918 EFLAGS: 00010203
RAX: 0c8c8c8c8c8c8c91 RBX: 646464646464648c RCX: 0000000000000001
RDX: 0000000000000001 RSI: 6464646464646464 RDI: ffff888108260000
RBP: dffffc0000000000 R08: ffff888104ad7987 R09: 1ffff1102095af30
R10: dffffc0000000000 R11: ffffed102095af31 R12: 1ffff11022349cfc
R13: dffffc0000000000 R14: 6464646464646464 R15: 1ffff11022349ce8
FS:  00007863627186c0(0000) GS:ffff88815e8ac000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000786362717f78 CR3: 000000010795c000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 jffs2_do_clear_inode+0x4d/0x2f0 fs/jffs2/readinode.c:1418
 evict+0x353/0x700 fs/inode.c:825
 jffs2_new_inode+0x443/0xce0 fs/jffs2/fs.c:-1
 jffs2_create+0x87/0x300 fs/jffs2/dir.c:182
 lookup_open fs/namei.c:4508 [inline]
 open_last_lookups fs/namei.c:4608 [inline]
 path_openat+0xe3c/0x29b0 fs/namei.c:4860
 do_file_open+0x19d/0x360 fs/namei.c:4892
 do_sys_openat2+0x9a/0x100 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0xf8/0x130 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf7/0x370 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x78636301e829
Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7 15 0d 00 f7 d8 64 89 01 48
RSP: 002b:0000786362717df8 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 000078636301e829
RDX: 00000000000000c2 RSI: 0000786362717e10 RDI: 00000000ffffff9c
RBP: 0000000000000001 R08: 0000000000000075 R09: 0000000000000037
R10: 00000000000001ff R11: 0000000000000246 R12: 0000786362717e10
R13: 0000000000000027 R14: 0000000000000004 R15: 0000786362717e00
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:jffs2_xattr_delete_inode+0x38/0x300 fs/jffs2/xattr.c:602
Code: 41 55 41 54 53 48 83 ec 50 48 89 3c 24 48 85 f6 74 2a 49 89 f6 49 bd 00 00 00 00 00 fc ff df 48 8d 5e 28 48 89 d8 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 90 02 00 00 83 3b 00 74 14 48 83 c4 50
RSP: 0018:ffff888104ad7918 EFLAGS: 00010203
RAX: 0c8c8c8c8c8c8c91 RBX: 646464646464648c RCX: 0000000000000001
RDX: 0000000000000001 RSI: 6464646464646464 RDI: ffff888108260000
RBP: dffffc0000000000 R08: ffff888104ad7987 R09: 1ffff1102095af30
R10: dffffc0000000000 R11: ffffed102095af31 R12: 1ffff11022349cfc
R13: dffffc0000000000 R14: 6464646464646464 R15: 1ffff11022349ce8
FS:  00007863627186c0(0000) GS:ffff88815e8ac000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000786362717f78 CR3: 000000010795c000 CR4: 00000000000006f0
----------------
Code disassembly (best guess):
   0:	41 55                	push   %r13
   2:	41 54                	push   %r12
   4:	53                   	push   %rbx
   5:	48 83 ec 50          	sub    $0x50,%rsp
   9:	48 89 3c 24          	mov    %rdi,(%rsp)
   d:	48 85 f6             	test   %rsi,%rsi
  10:	74 2a                	je     0x3c
  12:	49 89 f6             	mov    %rsi,%r14
  15:	49 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%r13
  1c:	fc ff df
  1f:	48 8d 5e 28          	lea    0x28(%rsi),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 90 02 00 00    	jne    0x2c7
  37:	83 3b 00             	cmpl   $0x0,(%rbx)
  3a:	74 14                	je     0x50
  3c:	48 83 c4 50          	add    $0x50,%rsp
==================================================================



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
