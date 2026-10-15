Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D4BCC6B33
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 14:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EfVYKde7LIaCE7bDy26xQ+VetFURANK61HqltlFNeB4=; b=YPOzgNAG6O0mwo
	nkNDldd8NVXsAX/ID2f+nWNBLK7wS+IQWYUavUtxTiQlUKuLY/4ojDkX57Z1zkG9F7HMpCog+fgYW
	rlPDiwhrlyrZDWgNVFMawgq6LStH3+70ryXvM162+FuZWVHfJsZb19Jha/puCm4ArjBLm6TdytAjG
	QFn0q5BNzmFJ4x2S1a/XDixLfMASXsaBYXBkpxioS2zZTk3dpqbgLAQEVwOZoWKwaNLZubj7bk42f
	y6sjzqagKqHeXY3MWb1jPR2Y3hx/0+hepuPiyofuXFBYnvgargV1y+TrLbV/JanAbcfxBuMMfPnwQ
	/TTvxWst+OdG8ELY8TFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMqW-00000000S9u-0q8k;
	Thu, 15 Oct 2026 14:54:16 +0000
Received: from out-2z4y-a152.jellyfish.systems ([198.54.127.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMqS-00000000S7L-0x9r
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 14:54:14 +0000
Received: from localhost.localdomain (unknown [188.253.121.98])
	(using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA512)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j5B0W6htzz2x98;
	Thu, 15 Oct 2026 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eltavine.com;
	s=spacemail; t=1792076033;
	bh=v20J6Lj3iauircsktxZXY7nk0wbgpGdU6Gg01D0XwZg=;
	h=From:To:Cc:Subject:Date:From;
	b=BMWL15PQp2x6A+290OewB5aYU5xZCWpCVCDMDZbuD103TKtkPJ0bdnydWY8jybPnD
	 WUXnfeEVpmZQKmLyOvSK9MDeISQb4KpHrpS19LLDNXQUqFHFltOc0RvI1BjpL0bg9r
	 ZCp8CbTeucr4bFCdpnJc+qOA+XSqXv4AQwKRErtVZNsqVXB/G6wHV/2YALRyPeaHnD
	 yAe58FtAZybg+uHESZP3C7mRBobf00g45LIx246urKKDJ5i4vxPRDdJfrArQ6+UREy
	 tUV34nbSqK7hjVq8AOo3oCLdyqDF2hpMPT2526QVBjp6Fyc6jKr9h27KNFAGKE1YZz
	 iJgOXobfP/rxg==
From: eltavine <me@eltavine.com>
To: Richard Weinberger <richard@nod.at>,
	David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Leonid Arapov <arapovl839@gmail.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com,
	syzbot+48f2d47f83a4c223ad14@syzkaller.appspotmail.com,
	syzbot+e4484dcf0982d86ca2e1@syzkaller.appspotmail.com
Subject: [RFC PATCH] jffs2: disable empty summaries instead of calling BUG()
Date: Thu, 15 Oct 2026 22:53:41 +0800
Message-ID: <20261015145341.34322-1-me@eltavine.com>
MIME-Version: 1.0
X-Envelope-From: me@eltavine.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_075412_679544_2480C962 
X-CRM114-Status: GOOD (  12.56  )
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

With CONFIG_JFFS2_SUMMARY enabled, jffs2_do_reserve_space() tries to
write out the current block's summary when a node and its summary
overhead do not fit. jffs2_sum_write_sumnode() assumes that at least
one summary entry has been collected and calls BUG() otherwise.

An empty summary is a valid state. For example, the syzbot reproducer
mounts an image whose selected nextblock contains only a cleanmarker
and padding, leaving 140 bytes free and no summary entries. Creating
a symlink needs 128 bytes for its inode node, but reserving another
60 bytes for the summary reaches the BUG():

  kernel BUG at fs/jffs2/summary.c:868!

Large pristine-node GC reservations and xattr updates that fail after
reserving space can also leave a newly selected block with an empty
summary and reach the same check.

Disable summary collection for the block and return through the
existing exit path. jffs2_do_reserve_space() then retries the
reservation without summary overhead, following the existing fallback
for a summary that does not fit. Use dbg_summary() for this valid
condition.

The block is scanned normally on the next mount. The on-flash format
and xattr size limits are unchanged.

Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time improvement)")
Reported-by: syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0727f46a0571de01bf93
Reported-by: syzbot+48f2d47f83a4c223ad14@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=48f2d47f83a4c223ad14
Reported-by: syzbot+e4484dcf0982d86ca2e1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e4484dcf0982d86ca2e1
Cc: stable@vger.kernel.org
Signed-off-by: eltavine <me@eltavine.com>
---
Validation: Built fs/jffs2/ in an arm64 Linux VM with GCC 13.3 (W=1),
with and without summary support; the latter warns about unused vecs
in writev.c. Not runtime-tested.

I'm working from an arm64 Mac and don't have a physical Linux test
machine available. Sorry for the limited testing; I'd appreciate
review and help running the reproducer:)

 fs/jffs2/summary.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 4521a7723f30..4a07b7911b21 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -864,8 +864,11 @@ int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
 		goto out;
 
 	if (!c->summary->sum_num || !c->summary->sum_list_head) {
-		JFFS2_WARNING("Empty summary info!!!\n");
-		BUG();
+		/* Nothing collected yet, e.g. freshly opened jeb */
+		dbg_summary("empty summary, disabling it for jeb at 0x%08x\n",
+			    jeb->offset);
+		jffs2_sum_disable_collecting(c->summary);
+		goto out;
 	}
 
 	datasize = c->summary->sum_size + sizeof(struct jffs2_sum_marker);

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
