Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3019C3600C
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Mar 2025 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YGeJK/WgjFVoEvVnMuHNnEX2eI9u3ouxZ6LBQKFSeaU=; b=TvNiZb0z74A4He
	h7zhIKCtVukUeJJCmrfWe9nSqt14IAw94joCay6mR5Ew2lZA6WCIO1sK0plzSPm7B+YPcBP8aXlPA
	jzkPbSym/iaWgD7BwkB+2BrPTg6u8VieBBUFBOXxH9FSsKeNFHua1n6ThCjKFwLRZbrZhnFMybfyg
	IopP5b/R5LUFhyHQ9H/FyYBIhrT+arIA6IAqGD1hNjUhxg/YrnO8P93Yfaf596pK9I9V3nRhbKDfq
	40Xb6CPsnjWRPI0tS5X5CWfkziOCg7WtMz+1tZpur/gWfi3F050UkL/n2Lx0a2Ntq/Y0B9yPOepJt
	/nZ16hZqL/1+Kk7XcoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7Hc-00000006VJo-0UcS;
	Tue, 25 Mar 2025 16:37:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7Ck-00000006Ukx-3UdC
	for linux-mtd@bombadil.infradead.org;
	Tue, 25 Mar 2025 16:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xtjQNCIG90SkONBmw2cPQ+VxbDhw9iY6/7ps8Q1kb8g=; b=eSqisGGPJdSgvFKMobqgQU0oSa
	aAcYM7Fmd19MVlCswTalge8T/CbCnXTOX+JI1MyOzdBzGzirn07DVHzuiI06ELT9i601hu+NRGbqS
	Qh+RhpFGmKK4hN+SaMl5BIpKBlfyG9DJ61ck3XnU3sIEHs/cpLJySIvt1vH5DO0q+rQUpdNzuB1wf
	h7bCYiLZA7S8AhBf4g7401qIYMOJ0IuTLSQhjskQIya9a4M4Xv2j/Us+ImeKhEOIZUySKBBqzcEKr
	iq2yx4Yxi7QXHjITYKtfCFiTt3OExPXkq+TtXFesn/KWHVO0r+iYRXNJI9otGLCmOW3Bvy3IVRw+5
	WcP0/Y5A==;
Received: from mail.ispras.ru ([83.149.199.84])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7Cf-00000005ej7-1o0z
	for linux-mtd@lists.infradead.org;
	Tue, 25 Mar 2025 16:32:40 +0000
Received: from fedora.intra.ispras.ru (unknown [10.10.165.13])
	by mail.ispras.ru (Postfix) with ESMTPSA id 4161C448787A;
	Tue, 25 Mar 2025 16:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 4161C448787A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1742920349;
	bh=xtjQNCIG90SkONBmw2cPQ+VxbDhw9iY6/7ps8Q1kb8g=;
	h=From:To:Cc:Subject:Date:From;
	b=IFWRq18xmsCHUVqvKa7vP77Ae03kPGXNyvbr33sDvejaQOUZiEnIwgVm7sloBCkNh
	 ACyuNMbQ/EdaLzr9MpGbAB6oFmHrhIetXs4QH+sTk2cIyCUl49rRkkURmEdd6GJgSc
	 zrN+6Vc4R6fsIE2EfmP4Ll3oxPFOwrWqNd97DEdk=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] jffs2: check jffs2_prealloc_raw_node_refs() result in few other places
Date: Tue, 25 Mar 2025 19:32:13 +0300
Message-ID: <20250325163215.287311-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_163237_797633_DE0E9E1B 
X-CRM114-Status: GOOD (  10.89  )
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

Fuzzing hit another invalid pointer dereference due to the lack of
checking whether jffs2_prealloc_raw_node_refs() completed successfully.
Subsequent logic implies that the node refs have been allocated.

Handle that. The code is ready for propagating the error upwards.

KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 1 PID: 5835 Comm: syz-executor145 Not tainted 5.10.234-syzkaller #0
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
RIP: 0010:jffs2_link_node_ref+0xac/0x690 fs/jffs2/nodelist.c:600
Call Trace:
 jffs2_mark_erased_block fs/jffs2/erase.c:460 [inline]
 jffs2_erase_pending_blocks+0x688/0x1860 fs/jffs2/erase.c:118
 jffs2_garbage_collect_pass+0x638/0x1a00 fs/jffs2/gc.c:253
 jffs2_reserve_space+0x3f4/0xad0 fs/jffs2/nodemgmt.c:167
 jffs2_write_inode_range+0x246/0xb50 fs/jffs2/write.c:362
 jffs2_write_end+0x712/0x1110 fs/jffs2/file.c:302
 generic_perform_write+0x2c2/0x500 mm/filemap.c:3347
 __generic_file_write_iter+0x252/0x610 mm/filemap.c:3465
 generic_file_write_iter+0xdb/0x230 mm/filemap.c:3497
 call_write_iter include/linux/fs.h:2039 [inline]
 do_iter_readv_writev+0x46d/0x750 fs/read_write.c:740
 do_iter_write+0x18c/0x710 fs/read_write.c:866
 vfs_writev+0x1db/0x6a0 fs/read_write.c:939
 do_pwritev fs/read_write.c:1036 [inline]
 __do_sys_pwritev fs/read_write.c:1083 [inline]
 __se_sys_pwritev fs/read_write.c:1078 [inline]
 __x64_sys_pwritev+0x235/0x310 fs/read_write.c:1078
 do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x67/0xd1

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 2f785402f39b ("[JFFS2] Reduce visibility of raw_node_ref to upper layers of JFFS2 code.")
Fixes: f560928baa60 ("[JFFS2] Allocate node_ref for wasted space when skipping to page boundary")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---

Similar to https://lore.kernel.org/linux-mtd/20250307163409.13491-2-a.sadovnikov@ispras.ru/
but touches two remaining places.

 fs/jffs2/erase.c | 4 +++-
 fs/jffs2/scan.c  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index ef3a1e1b6cb0..fda9f4d6093f 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -425,7 +425,9 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
 			.totlen =	cpu_to_je32(c->cleanmarker_size)
 		};
 
-		jffs2_prealloc_raw_node_refs(c, jeb, 1);
+		ret = jffs2_prealloc_raw_node_refs(c, jeb, 1);
+		if (ret)
+			goto filebad;
 
 		marker.hdr_crc = cpu_to_je32(crc32(0, &marker, sizeof(struct jffs2_unknown_node)-4));
 
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 29671e33a171..62879c218d4b 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -256,7 +256,9 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 
 		jffs2_dbg(1, "%s(): Skipping %d bytes in nextblock to ensure page alignment\n",
 			  __func__, skip);
-		jffs2_prealloc_raw_node_refs(c, c->nextblock, 1);
+		ret = jffs2_prealloc_raw_node_refs(c, c->nextblock, 1);
+		if (ret)
+			goto out;
 		jffs2_scan_dirty_space(c, c->nextblock, skip);
 	}
 #endif
-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
