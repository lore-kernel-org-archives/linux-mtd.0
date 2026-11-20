Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16B4606A32C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 01:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CUiUta5H;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=RHR1fnR1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L8c/OE7iWLj/aGQYJgrJrLQtT5ZkfGreg0r4ml2l8WY=; b=CUiUta5HymHUFg+JaE86UOJvPt
	d3A+wnEY0Cdv0yzkG+WesQT5Z3zLdRo4XXBcXu/HbmsJnDAU5WF2M3uIi5Wk2kwbtGqKXCz6G20uz
	cnhRvEvQQy+MHmZqzZg1/LhnL6sE4nvbhhtgG9Krl+Eh4KXhtcg5YsjRQC7qxyV3NZibzWO0zxRFE
	cUOshATNNCJkpu/Aumf8J/xqLIWdJ6PddtIOpAQNmTx149txWMq4afMt2HvUSiJDUS1njAxE8Eqxk
	dNnA5FAffx/98EfjFj9kOK0a1egogpEEhpIPDwyhsjC0SFxgGyWguhJPyiM2zd+/H81mKhEKIC9Pt
	qWV7KpHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUD3S-0000000DnCK-3jqy;
	Fri, 20 Nov 2026 01:04:42 +0000
Received: from out162-62-57-87.mail.qq.com ([162.62.57.87])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUD3Q-0000000DnAd-0l9B
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 01:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795136671; bh=45xLE3ij2k2Cw8yAuil/e/r7Lukwi6ue4Sth5/YZLOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RHR1fnR1OS3HYSjMJXkhtTxAmPpJb0VS5LllBrjxgwBYUAwPxBxAbYSuyOb6Ago9j
	 UfjGrkge7TKV1pQFT56lI5xvewHBzxX0Hb/fLhjQpgqNJpv/3cUfI+/F7MBDcpODMe
	 zwEvSl/5FXKZnRsN9K1t/uf0u90Bow5Lq1n6nONo=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 11DA96FC; Fri, 20 Nov 2026 09:04:29 +0800
X-QQ-mid: xmsmtpt1795136669tecd2y9o9
Message-ID: <tencent_7590135AEEA7D2DC2CE7F27E4DF5B8936208@qq.com>
X-QQ-XMAILINFO: Mu8aJQRa+GU4oS5wXc7gQDQW5b0P+ExAsTzgh2ai1cWhG7iLfIRLAy33BPFYzG
	 dBgYdG6IzRnl43qtw2KztjORTdkAB4fCggJW8ZfI9bT7dqRJ794tpC3wcidu7eRbuY9UcIil7lNk
	 KRjnVzlKfmHrgCzZoVTUavyxizODwQVzBseBTLVWmJ2kjLIGiaj/V5VquH02COZiZKwx9dGj72OD
	 XymkVce7ufXvYNjMTzAm7U+66hrhEF23s3H33/pQl/0RheAocaSlCJ7gyv21NCUWg6Za7A1T5csi
	 wxFV/SfttwHPmBEEr1iXuFjIukp4FTlwfjzj3LERK41hfQuFZ8QabmhCDx53z+oEH1EkVV98ymwj
	 GA2ctyVwxMacj1RjpuKdp0mafPmHEWSw9J80nTcvk9ZhRpJtQZcOEhvOULdWHfREyPfTY2CR1jO0
	 8EVYeu+CD/B04bEkz0aem6Lkc8MqT7QmAtGEkSPfgHcYA/y4QG9kWdHZlWSGmdyTjWg5pSc/rsh4
	 TYjZxSM6WLnXRZKcN+THYKbLqlIxvHmGXcKb7KLwfoutZv+uBEuScGnclazS5Dorj+LQ5RTycAEM
	 SjnZvTR3wDP4R7w/glqqkzOh1wOTIX12sncthG0B6Dqvhnkqh+s2mZ0JkDaVMaxdVOPBmMXQn49u
	 1cjunTGnQuOqC3OCufW67a/3SqavGJjbh2AYOmQEqrKHf/a2EaHd54qvnqhG32C0EKwWCXnfWjxH
	 gYFDV6JOFRfw68f7aCpc7ZzjJBpN0r+tfZhZFckTux8SuMOpUoroYql8zmeVG0mwC2+fpRVVSTmv
	 /6uvwYDl3i4TFpdrB/xLYCYjRAYKzX28z5M9jLom1hLL6GuGzB2YmBXJ1A9ehty1FvB4MITYbM8C
	 2i8L8F6nVSonAPtHK4uonkNftxUeAPJL9RdjcRje4fmT+MhRtxyGWgt2RlcdCpEKntUs4BtozrNa
	 J/S+EdadMbMW8K1uo+Ga83QbSfimGHAblH7kpfYsRbFVqYfOsLTVE3raRUSUqVQEclD9I7Q6DuAE
	 6oxv7iNajXw4kYLbygrmqSOutZEZReMsxg0/kJlw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com,
	luquijeffrey@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
Date: Fri, 20 Nov 2026 09:04:29 +0800
X-OQ-MSGID: <20261120010429.12330-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a7bfdf7.ed659fcc.23056a.007f.GAE@google.com>
References: <6a7bfdf7.ed659fcc.23056a.007f.GAE@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_170440_766707_B5641712 
X-CRM114-Status: GOOD (  10.31  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

#syz test

Hi Richard,

Gentle ping.  I posted a fix for this on 2026-11-03 [1]; it resubmits
Lucas Jeffrey's September patch with credit, as his thread had gone
quiet while the bug kept reproducing.

There has been no response so far, and the bug is still live -- 44
crashes recorded in the November monthly report [2].  The fix is a
one-liner clearing f->inocache in jffs2_init_inode_info(), consistent
with the other pointer fields there: a stale inocache survives slab
recycling after the previous mount's jffs2_free_ino_caches() and is
dereferenced by jffs2_xattr_delete_inode() on the evict() error path
when jffs2_new_inode() fails after jffs2_init_inode_info() but before
jffs2_do_new_inode() assigns a fresh inocache.

I've verified with the syzbot C reproducer under QEMU + KASAN: the UAF
triggers before the patch and is absent after it.  The patch is inlined
below so syzbot can re-verify on current master.

Note that the syzbot bisection points at an unrelated block2mtd commit
(7b09acdc "mtd: block2mtd: add support for an optional custom MTD
label"); the repro mounts jffs2 on block2mtd, so that looks like
bisection noise.

Could you take a look?

Thanks,
Shuai Liu

[1] https://lore.kernel.org/all/tencent_A21BAE90D8EE04A5FB98B4168BA73C695306@qq.com/
[2] https://lore.kernel.org/all/6afbd91e.e6a8accb.234e85.000a.GAE@google.com/

---
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


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
