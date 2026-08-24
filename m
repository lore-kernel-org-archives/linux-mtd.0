Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4663AC5DF81
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2026 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lEEvbygmj64YFQ2NCJtGiZtmVC17srC02aB/fyq4Am0=; b=DzE5GI3MIqQD9P
	kg1ivpfMyXTVYwilNUBmOeU6s+7rpNYvDj8TOZb2e+5yPjV9CRkO5kAzoh/Kj4hr2n/4i1Bd6J/a5
	fq0OZ18CO/jQqDvcwaoPlhoEozmp+OQpA5CIvlr/LXoL23clr070Dti90UjUEs4Bsva4s5C0x8hBe
	ufxOfk/VO8mTpnZBsc4VSvzrRrJFqPEhrnQJkKZz38Mo+i3pKcURw9IBGqw/QIg1eEVwsM2pZ6jWV
	SLRYf9PwTwEJXtalqobTPdaTSS+/08aTkfOCbIpj18QMtSEPGOHgAh2UO61bZOBprz+ZftDO+GFUu
	q3kGyQT2hfeH2y/ldM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWpv-0000000Gx3z-1Q9p;
	Mon, 24 Aug 2026 15:43:47 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWpr-0000000Gx29-04Je
	for linux-mtd@lists.infradead.org;
	Mon, 24 Aug 2026 15:43:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso2440178b3a.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2026 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1787586220; x=1788191020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V46JzfDzhl+D94yGdlzJmpD/3wlHVTDt9SXujyPiV/Q=;
        b=0ls7IIbqGgdIwAVZj4SzWnpo0DTylChTvHltQ0rMwiGVpyc6dPxNezqzUDfZn2IENC
         CQabpqTF2v+6Lsy9VpvDCXTzScrw0fratpNTdMu9wrL6UJkeTyjUAPEa1uK0UQxcpBs3
         2DaM1Hve2VpqjA1HcNxKZTQ6hMZ/WIDw/+mrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586220; x=1788191020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V46JzfDzhl+D94yGdlzJmpD/3wlHVTDt9SXujyPiV/Q=;
        b=fcxGAe2WR7EmbxsV0PnqNd0IaKcR2jXl2xGbzD/r5O1OlSCmODaoRSvdvMUmZh/KgH
         B+Tj1BOGUvP0s+5aBEFjWToYXTMBkMlPd7Apl5uihX5G1spg0V8hS3NxRZ4FldjLt5ZG
         q0UUSGZ0YKJFyr4xFQ2lAzf0m0qMS2j8K7robTtqopB2kgRG2SzyasTU4wlP8w1i7XV3
         LIKqtLLelnWzrqw6K18zPDYFRg01Z4nhKRYVQRBDwkjr1L81gr8IL9YH1ovqAr1FhCc1
         av3i0tdrZx99G6LT7vlteiHVf6lfo5cMuGiJ9p+fGuxYWOWYO9+6+846MjP/XK2yZW3C
         2BYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrv1tZNMTxon0SCC0KeBUGfLIPkystjPOCmU9TvJqBoEGoSHf3Nr+mPmHe2qZFsYAWxTf7fy+j91wI=@lists.infradead.org
X-Gm-Message-State: AFuF++kYyvryYLZ+atD9JtwYbQNGqzjCsYJF37CiR09NMWkpes77UiLL
	QVCclbLtJ7FG4895H3zT9m9W5aOH4PH17utfi3FDojDNlqEvavHBsJim9F+5tHQuR2t6HXOL/6E
	AuJIpFXA=
X-Gm-Gg: AR+sD11GJaYQRzqDVeVcjSAYA2aEOEekgJ3c0F0yruCu60Ge2zD9T7qNfhE/83Oq23n
	VQipDoIhD+3X/TYHGIL2Z2/N7TsNA8nqbOHzAMSXTG9VdumvUR2sLgVBjvApIhk7HGbLfAHn+a0
	MsQAOLp37NWjp81gUFDOKPQNPF/gYgPChP0AtwVj+MMiTeohxq9UfH76I4pTWoc6fNFv25GktKG
	61L0zHw/tm70KrsLRzgZtZM8hn/9pPRihzP2/HfUFnNKo27cpfE7OktbW0iFK8UC3v4ZJbB3rSD
	GKJ4ghHMVf0yLvcZ/wVwCXfyWzJoua8fAWcz6LvUKrgqHQDq1rpvKHZFQj3RAHftTa4X7BGxHgw
	Km+BZPY+xo58Bppv5nz4sAxDogM9JvIIvCYGCdVhFj9KP35U6lV8HchzDJu5ICNB8M6/0k93NYc
	aLvRYBODgvMUoYxVYVmthWZpTs6gLB5YfNhqPqCgkrBMXb7NmJziUxXHwryTY7h9RoT8JmNDk1n
	gKaE2IrGAUOqUG3V7excgsvoF9/MSM6dzK7StEC+wMiNXWGISp0FsHfSpt2NP5tG+ewQP+EEWLQ
	1YqzpLPPp1yBWunxH2yNs1PexZ8zgYitnHYP1x3O03/MiFaJnzi1pA==
X-Received: by 2002:a05:6a00:1821:b0:84e:4d6:78fe with SMTP id d2e1a72fcca58-851f972a7f7mr44618198b3a.3.1787586219812;
        Mon, 24 Aug 2026 08:43:39 -0700 (PDT)
Received: from leesin ([147.46.121.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f14abb3sm2137739b3a.45.2026.08.24.08.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:43:39 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: dwmw2@infradead.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at
Cc: kees@kernel.org,
	linux-kernel@vger.kernel.org,
	eulgyukim@snu.ac.kr,
	jjy600901@snu.ac.kr
Subject: [BUG] kernel BUG in jffs2_sum_write_sumnode
Date: Tue, 25 Aug 2026 00:43:33 +0900
Message-ID: <20260824154335.2340665-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_084343_069501_DD5C567B 
X-CRM114-Status: GOOD (  21.22  )
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

We found a "kernel BUG in jffs2_sum_write_sumnode" on Linux v7.2.
The issue was found by our own race fuzzer. We have not analyzed the root cause,
so we do not have a proposed fix to offer.

To reproduce the race reliably, we applied the delay patch below to the
kernel and ran the C reproducer as root inside an x86_64 QEMU guest. The
crash log we observed, the delay patch and the reproducer are all included
below.

The following kernel config options are required to reproduce the issue:
    CONFIG_JFFS2_FS=y
    CONFIG_JFFS2_SUMMARY=y
    CONFIG_MTD=y
    CONFIG_MTD_MTDRAM=y
    CONFIG_MTD_BLOCK=y
    CONFIG_MTDRAM_TOTAL_SIZE=128
    CONFIG_MTDRAM_ERASE_SIZE=4
    CONFIG_KASAN=y

We hope this report is useful. Please let us know if any further
information would help.

Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>
Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>

Kernel delay patch:
==================================================================
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 1b833bbffcf5..7517c66c86e9 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -18,6 +18,8 @@
 #include <linux/pagemap.h>
 #include <linux/crc32.h>
 #include <linux/compiler.h>
+#include <linux/delay.h>
+#include <linux/sched.h>
 #include <linux/stat.h>
 #include "nodelist.h"
 #include "compr.h"
@@ -603,6 +605,9 @@ static int jffs2_garbage_collect_pristine(struct jffs2_sb_info *c,
 		  ref_offset(raw));
 
 	alloclen = rawlen = ref_totlen(c, c->gcblock, raw);
+	if (c->summary && c->nextblock && !c->summary->sum_num) {
+		mdelay(10);
+	}
 
 	/* Ask for a small amount of space (or the totlen if smaller) because we
 	   don't want to force wastage of the end of a block if splitting would
diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 3fb9f9807b66..7785bde6b795 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -14,6 +14,8 @@
 #include <linux/kernel.h>
 #include <linux/mtd/mtd.h>
 #include <linux/compiler.h>
+#include <linux/delay.h>
+#include <linux/string.h>
 #include <linux/sched/signal.h>
 #include <linux/string_choices.h>
 #include "nodelist.h"
@@ -84,6 +86,10 @@ int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 	minsize = PAD(minsize);
 
 	jffs2_dbg(1, "%s(): Requested 0x%x bytes\n", __func__, minsize);
+	if (c->summary && c->nextblock && !c->summary->sum_num &&
+	    strncmp(current->comm, "syzrepro1", 9) == 0) {
+		mdelay(80);
+	}
 	mutex_lock(&c->alloc_sem);
 
 	jffs2_dbg(1, "%s(): alloc sem got\n", __func__);
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 06e494797724..b7ac51a0cc95 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -17,6 +17,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/pagemap.h>
 #include <linux/crc32.h>
+#include <linux/delay.h>
 #include <linux/compiler.h>
 #include "nodelist.h"
 #include "summary.h"
@@ -207,6 +208,9 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 				}
 				/* update collected summary information for the current nextblock */
 				jffs2_sum_move_collected(c, s);
+				if (!c->summary->sum_num || !c->summary->sum_list_head) {
+					mdelay(10);
+				}
 				jffs2_dbg(1, "%s(): new nextblock = 0x%08x\n",
 					  __func__, jeb->offset);
 				c->nextblock = jeb;

==================================================================

C reproducer:
==================================================================
#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mount.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <sys/sysmacros.h>
#include <unistd.h>

#define SYSCHK(x) ({ long __r = (long)(x); if (__r == -1L) { perror(#x); exit(1); } __r; })

#define SECT 4096u
#define NBLK 32u
#define FLASH (SECT * NBLK)
#define GATE_FREE 160u
#define OTHER_FREE 128u
#define MNTPOINT "/syzrepro_mnt"
#define MTDBLK "/dev/mtdblock0"

static volatile int g_mounted, g_stop;
static unsigned g_wseq;
static unsigned int crc_tab[256];

static void crc_init(void)
{
	unsigned int i, k, c;

	for (i = 0; i < 256; i++) {
		for (c = i, k = 0; k < 8; k++)
			c = (c & 1) ? ((c >> 1) ^ 0xEDB88320u) : (c >> 1);
		crc_tab[i] = c;
	}
}

static unsigned int jcrc32(unsigned int crc, const void *p, size_t n)
{
	const unsigned char *b = p;

	while (n--)
		crc = crc_tab[(crc ^ *b++) & 0xff] ^ (crc >> 8);
	return crc;
}

static int img_read(unsigned char *img)
{
	int fd = open(MTDBLK, O_RDONLY);
	ssize_t r;

	if (fd < 0)
		return -1;
	ioctl(fd, BLKFLSBUF, 0);
	r = pread(fd, img, FLASH, 0);
	close(fd);
	return r == (ssize_t)FLASH ? 0 : -1;
}

static int img_write(const unsigned char *img)
{
	int fd = open(MTDBLK, O_RDWR);
	ssize_t w;

	if (fd < 0)
		return -1;
	w = pwrite(fd, img, FLASH, 0);
	fsync(fd);
	ioctl(fd, BLKFLSBUF, 0);
	close(fd);
	sync();
	return w == (ssize_t)FLASH ? 0 : -1;
}

static int build_fs(unsigned char *img, unsigned char *data)
{
	char name[256], path[600];
	unsigned i;
	int made = 0;

	memset(img, 0xff, FLASH);
	if (img_write(img) || mount("mtd0", MNTPOINT, "jffs2", 0, NULL))
		return -1;

	for (i = 0; i < 48; i++) {
		int fd;
		ssize_t w;

		memset(name, 'a' + (i % 26), 200);
		name[200] = 0;
		snprintf(path, sizeof(path), MNTPOINT "/%s%02u", name, i);
		fd = open(path, O_CREAT | O_WRONLY | O_TRUNC, 0644);
		if (fd < 0)
			break;
		w = write(fd, data, 4096);
		if (w == 4096)
			w = write(fd, data + 4096, 4096);
		fsync(fd);
		close(fd);
		if (w != 4096)
			break;
		made++;
	}
	sync();
	umount2(MNTPOINT, MNT_DETACH);
	return made > 0 ? 0 : -1;
}

/*
 * Wipe one eraseblock down to a single length-12 node so that, once mounted,
 * jffs2_sum_write_sumnode() is entered with nothing to write.
 */
static int scribble(unsigned char *img)
{
	unsigned b, k, tail[NBLK], junk = NBLK, best = 0, bestt = 0;
	unsigned char *p;
	unsigned int hdr;

	for (b = 0; b < NBLK; b++) {
		for (k = 0; k < SECT && img[b * SECT + SECT - 1 - k] == 0xff; k++)
			;
		tail[b] = k;
		if (k > bestt) {
			bestt = k;
			best = b;
		}
		if (k >= SECT - 16 && junk == NBLK)
			junk = b;
	}
	if (junk == NBLK)
		junk = best;

	for (b = 0; b < NBLK; b++)
		if (b != junk && tail[b] > OTHER_FREE)
			memset(img + b * SECT + SECT - tail[b], 0, tail[b] - OTHER_FREE);

	p = img + junk * SECT;
	memset(p, 0, SECT);
	p[0] = 0x85; p[1] = 0x19; p[2] = 0x03; p[3] = 0x20; p[4] = 12;
	hdr = jcrc32(0, p, 8);
	p[8] = hdr; p[9] = hdr >> 8; p[10] = hdr >> 16; p[11] = hdr >> 24;
	memset(p + SECT - GATE_FREE, 0xff, GATE_FREE);

	return img_write(img) ? -1 : (int)junk;
}

static void *writer(void *arg)
{
	int idx = (int)(long)arg;
	unsigned char *buf = malloc(8192);
	char nm[16], path[128];

	snprintf(nm, sizeof(nm), "syzrepro%d", idx);
	prctl(PR_SET_NAME, nm, 0, 0, 0);
	memset(buf, 0x5a, 8192);

	while (!g_stop) {
		int fd;

		if (!g_mounted) {
			usleep(2000);
			continue;
		}
		snprintf(path, sizeof(path), MNTPOINT "/w%d_%u", idx, (g_wseq++) & 31u);
		fd = open(path, O_CREAT | O_WRONLY | O_TRUNC, 0644);
		if (fd < 0) {
			usleep(3000);
			continue;
		}
		write(fd, buf, 4096);
		write(fd, buf, 4096);
		fsync(fd);
		close(fd);
		usleep(1000);
	}
	free(buf);
	return NULL;
}

int main(void)
{
	unsigned char *img = malloc(FLASH), *data = malloc(8192);
	pthread_t th;
	int i, it;

	prctl(PR_SET_NAME, "syzrepro0", 0, 0, 0);
	crc_init();
	for (i = 0; i < 8192; i++)
		data[i] = (i >> 4) & 0x0f;

	mkdir(MNTPOINT, 0755);
	mknod(MTDBLK, S_IFBLK | 0600, makedev(31, 0));
	umount2(MNTPOINT, MNT_DETACH);
	pthread_create(&th, NULL, writer, (void *)1L);

	for (it = 0; it < 25 && !g_stop; it++) {
		g_mounted = 0;
		umount2(MNTPOINT, MNT_DETACH);
		usleep(50000);

		if (build_fs(img, data) || img_read(img) || scribble(img) < 0 ||
		    mount("mtd0", MNTPOINT, "jffs2", 0, NULL)) {
			usleep(200000);
			continue;
		}

		usleep(1200000);
		g_mounted = 1;
		usleep(1200000);
		g_mounted = 0;
		usleep(50000);
		umount2(MNTPOINT, MNT_DETACH);
		usleep(50000);
	}

	g_stop = 1;
	pthread_join(th, NULL);
	umount2(MNTPOINT, MNT_DETACH);
	return 0;
}
==================================================================

Crash log:
==================================================================
kernel BUG at fs/jffs2/summary.c:868!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 2 UID: 0 PID: 404 Comm: syzrepro1 Not tainted 7.2.0-dirty #3 PREEMPT 
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:jffs2_sum_write_sumnode+0x1bb6/0x1bc0 fs/jffs2/summary.c:868
Code: 14 89 d9 80 e1 07 80 c1 03 38 c1 7c 08 48 89 df e8 ef a1 61 ff 8b 33 48 c7 c7 e0 c7 31 87 48 c7 c2 fb a0 ff 87 e8 8a 17 94 fe <0f> 0b cc cc cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffff888109cd74a0 EFLAGS: 00010246
RAX: 0000000000000044 RBX: ffff888106c93a00 RCX: 5e7574cf0ce16600
RDX: 0000000000000001 RSI: 0000000000000008 RDI: ffff888109cd7360
RBP: ffff888109cd7588 R08: ffff888109cd7367 R09: 1ffff1102139ae6c
R10: dffffc0000000000 R11: ffffed102139ae6d R12: ffff88810357dd84
R13: ffff88810bbc1aa0 R14: dffffc0000000000 R15: ffff88810bbc1990
FS:  000078a3c6f956c0(0000) GS:ffff888190840000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005bafe23d9b20 CR3: 0000000108312000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 jffs2_do_reserve_space+0x1c9/0xe50 fs/jffs2/nodemgmt.c:398
 jffs2_reserve_space_gc+0x45/0xb0 fs/jffs2/nodemgmt.c:232
 jffs2_garbage_collect_dirent+0x209/0x320 fs/jffs2/gc.c:882
 jffs2_garbage_collect_live+0x42a/0x2970 fs/jffs2/gc.c:574
 jffs2_garbage_collect_pass+0x141b/0x1af0 fs/jffs2/gc.c:466
 jffs2_reserve_space+0x4e5/0xae0 fs/jffs2/nodemgmt.c:177
 jffs2_do_create+0x52/0xbe0 fs/jffs2/write.c:454
 jffs2_create+0x1b4/0x300 fs/jffs2/dir.c:205
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
RIP: 0033:0x78a3c7091090
Code: 48 89 44 24 20 75 93 44 89 54 24 0c e8 a9 d7 f8 ff 44 8b 54 24 0c 89 da 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 38 44 89 c7 89 44 24 0c e8 fc d7 f8 ff 8b 44
RSP: 002b:000078a3c6f94d80 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000241 RCX: 000078a3c7091090
RDX: 0000000000000241 RSI: 000078a3c6f94e20 RDI: 00000000ffffff9c
RBP: 000078a3c6f94e20 R08: 0000000000000000 R09: 0000000000000075
R10: 00000000000001a4 R11: 0000000000000293 R12: 000078a3c6f94e20
R13: 0000000000000001 R14: 00007ffe30446b90 R15: 000078a3c6795000
==================================================================



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
