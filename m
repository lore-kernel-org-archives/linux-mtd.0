Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4078D10F28
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Nov 2024 18:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GjQEuu6uOHpcK/IjrCeORmp/vF+3QL7a7H+hc85+mxw=; b=RBxQUe0eENk6UR
	r2pkor1420yeS4eLg7HnSvO3hp4VnLJe6cONirU/haYcT37w5BFTWzUIdC/DugW9ZHSZTAFGp2xLk
	vXTqzGi7pG7FPfCNzplEd2/lSiHaE3W6aLo2fLqv0YosBgnfkCHkIAs2IrSVwAY22VaKYHj6joD/B
	Qph5yg1/Tf6fF98fOgcab/3Dc4c4TH7RaZr83/ZRqdZLEJSFko4uN4dozdj+BxqaYKaGs6ZpDPNtQ
	Ov4itj1FHmMmXWO+GQcqUS/PXbiPUeaZG6dg1CEzSgQW2JEVH3GJcOb3pE9qmM+di3hLw5opWW1fX
	0s2h5ZP6CN8zbT9KuzIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCkGG-00000007ggQ-0Jcz;
	Sun, 17 Nov 2024 18:44:40 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCkGB-00000007gdb-09AM
	for linux-mtd@lists.infradead.org;
	Sun, 17 Nov 2024 18:44:37 +0000
Received: from fpc.intra.ispras.ru (unknown [10.10.165.6])
	by mail.ispras.ru (Postfix) with ESMTPSA id 574F6518E77B;
	Sun, 17 Nov 2024 18:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 574F6518E77B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1731869069;
	bh=z83vOsND3dmU2lQdMai5FHCaNYTMGUxXC+d3JRYKOAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ifWoM0aZW9jsM3hf2l0UNIgHM7DMOleLcyN4dOwzuyjuCzoFHRjMqXvAnVy7G/Q2S
	 IoMbsXVH1VCcctIrAMdgjHVWJwSp8ggJq2XeTpvTxa2Wz25ePntE0gOLPrZ6JjeFPo
	 G5z22+bEsjoKLwZv1tVQ+O6OnpLAT83KqBiSlf5I=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	David Woodhouse <dwmw2@infradead.org>,
	Wang Yong <wang.yong12@zte.com.cn>,
	Lu Zhongjun <lu.zhongjun@zte.com.cn>,
	Yang Tao <yang.tao172@zte.com.cn>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] jffs2: initialize inocache earlier
Date: Sun, 17 Nov 2024 21:44:12 +0300
Message-Id: <20241117184412.366672-3-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241117184412.366672-1-pchelkin@ispras.ru>
References: <20241117184412.366672-1-pchelkin@ispras.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_104435_583846_767BDE10 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

Inside jffs2_new_inode() there is a small gap when jffs2_init_acl_pre() or
jffs2_do_new_inode() may fail e.g. due to a memory allocation error while
uninit inocache field is touched upon subsequent inode eviction.

general protection fault, probably for non-canonical address 0xdffffc0000000005: 0000 [#1] PREEMPT SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
CPU: 0 PID: 10592 Comm: syz-executor.1 Not tainted 5.10.209-syzkaller #0
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
RIP: 0010:jffs2_xattr_delete_inode+0x35/0x130 fs/jffs2/xattr.c:602
Call Trace:
 jffs2_do_clear_inode+0x4c/0x570 fs/jffs2/readinode.c:1418
 evict+0x281/0x6b0 fs/inode.c:577
 iput_final fs/inode.c:1697 [inline]
 iput.part.0+0x4df/0x6d0 fs/inode.c:1723
 iput+0x58/0x80 fs/inode.c:1713
 jffs2_new_inode+0xb12/0xdb0 fs/jffs2/fs.c:469
 jffs2_create+0x90/0x400 fs/jffs2/dir.c:177
 lookup_open.isra.0+0xead/0x1260 fs/namei.c:3169
 open_last_lookups fs/namei.c:3239 [inline]
 path_openat+0x96c/0x2670 fs/namei.c:3428
 do_filp_open+0x1a4/0x3f0 fs/namei.c:3458
 do_sys_openat2+0x171/0x420 fs/open.c:1186
 do_sys_open fs/open.c:1202 [inline]
 __do_sys_openat fs/open.c:1218 [inline]
 __se_sys_openat fs/open.c:1213 [inline]
 __x64_sys_openat+0x13c/0x1f0 fs/open.c:1213
 do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46

Initialize the inocache pointer to a NULL value while preparing an inode
in jffs2_init_inode_info(). jffs2_xattr_delete_inode() will handle it
later just fine.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 fs/jffs2/os-linux.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index 86ab014a349c..39b6565f10c9 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -55,6 +55,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 	f->metadata = NULL;
 	f->dents = NULL;
 	f->target = NULL;
+	f->inocache = NULL;
 	f->flags = 0;
 	f->usercompr = 0;
 }
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
