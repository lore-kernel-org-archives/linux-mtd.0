Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3BB606A328
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2026 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kSIF4ZS+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=xhZa5zyD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XPv7RJ/pTfoOr5ac/odC0cAq5SkeiWXySIcFyVcV9WY=; b=kSIF4ZS+Iz72o++mfmTA2lM5ac
	RQJe32FueTu6uYIYg/8hd6jyVKXjYwjYMkZe3HpbpspElcYBv6oH5mLKllx4rUJmwVOVJ2V2Fj0+g
	tAr88+PQkPHGxjn8092AFDsM1hAlovzZfyUP0JVRkBzcJXLgxBgnDYU1SwNkjzqLX9XU+k266nF9a
	s6+eut+PTXKozGjeTw+prf1ITtawSnWoiptQ67+RiWdbcbTGFSXXgNQF69VIVnnA4bLB6KEEQ8yKy
	qOaeDvI8LkWj09hOS3ZdX9Exrk8994L3mokrCgD69hq9x8C1lRTSohLDDU1kYl/Zj7iWnLv3zoIUP
	wrA1PqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEpz-0000000BV9A-22ka;
	Fri, 06 Nov 2026 07:58:15 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEpt-0000000BV8l-48N1
	for linux-mtd@lists.infradead.org;
	Fri, 06 Nov 2026 07:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793951882; bh=N6IDFcqBT66Ly0mje/ldO2xjtUcjknZLvpb4a2Ah/h0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xhZa5zyDbr5HPXgRGg1FVidmH0ZxHc9an8PMxPY65XRPRaiHVbGFZzwq6uktWmsoI
	 6tYohRjn4d50GkLYoaoKVrd/WqBZ+u4TxFDrEgxEIciRLYLoz1+WINUdTTkNgqd1ws
	 eiMWIoim0Dykfhw27jUFue76agOzI+CeD9K1wz1U=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id E7B38225; Fri, 06 Nov 2026 15:57:59 +0800
X-QQ-mid: xmsmtpt1793951879tivh0zjg2
Message-ID: <tencent_9EF27B4D21B82E623513AEEE6ED2F92C7D08@qq.com>
X-QQ-XMAILINFO: OATpkVjS499ug70r33O1iL5s+mMR3MjVq8p9aUJ5tubQwsA1Fuqm0IezGzcTN9
	 X5aYwm/Sd1IArjjm+2fYkjUa+5/buca2pyh2KvE+g7gkaSDeQfQ2xkvvL4Tvo/7SjlOfjV7crtyh
	 VdwgxmWl99qvHr+DwNnWm/I/78d4Lvt5FMTwQaDuTFacZKA3z9QbW0wa1o+cVYwAFuB/ncFZIy5u
	 DJFKjr+PJtH9hqYnGY2u9iR7sFdTNtTUSpR3WsiStLOXMU0X+clA78DRzAxW3gFom7ZsSRXK7Dcc
	 pDON58VYG0o9cp5Ub9trM6AzsBOWFLlcwx7lQ61jgAkzozTSNB7RvYNn8znG72SmctgYmPiAbQw9
	 K4QCsoT6N3Hn6+ir3bVAnYtyKELchllRQkcRhlJOOqHyn2Kv67uE99Z4t2BqtyaX+iEYnYPHFWct
	 luAyQ+IwVwPnKRGwYpc9N/piAwP+3KY8KbvLYwuP72CfJO0gGJKgi8rxmfymZ/4BHlNbSn7Zordu
	 p/e7ZcP/wTMdMmnuD/i1W35OlK0/mNCS+RzcacyUHE4DT5ypZeMvIMYrIAzXYp9fIoxVC5k2KD4D
	 oXN8CUlyN5HgUsJXx6po4Y+Rw5SbaD1FZYJ/z7pMvVcXDeKaBDzQln2gT/CVQPoLIaGHwrLtHO7C
	 eZqivDqBqhSX8Cb4IKUG15rtUP45qJu1y/SiPCnyDXZWEJIZWBqgoqMghLaxCZ1qXG3g+qnF21a8
	 HMUWdNELJdTpLjeC7DApZzKbuT+F5MKspJ4o3iB5f/DDUCk2jSbMTfoyoBYybaZEjstpjR4NoLEe
	 7bCCvh8wPw61H30aH9uaRsSuNgTjHe+uE1hl+y3+x/UlonKuoL9KAn9QsioyRgQW+NicpzNFjJ1E
	 15X/Zm00EAmwfoZfa82rl/IANDrdgYgOIrgoevQ0mNU5y4ka1ZIthzZllzXui0EFlLoBx9BEOFOp
	 Dp10WhHRtYhOYgEms9M79727uDNeRbR9YHw1mq7sSX5Bkwn2JRf1b97inm61+QHWVOpzVMsnSN7Z
	 F61CLbOKdkKrue7eZ8QYBbU9UzjwvTfqP3e8pyver1gPs0kLurKfIdhx/jB57UvP4BBAB0NFjP9X
	 pEIi/Ho1+G2rdHehw=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org,
	richard@nod.at,
	linux-kernel@vger.kernel.org,
	syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com,
	syzbot+48f2d47f83a4c223ad14@syzkaller.appspotmail.com,
	syzbot+e4484dcf0982d86ca2e1@syzkaller.appspotmail.com,
	me@eltavine.com,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH v2] jffs2: fix kernel BUG in jffs2_sum_write_sumnode on empty summary
Date: Fri,  6 Nov 2026 15:57:58 +0800
X-OQ-MSGID: <20261106075758.671859-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179393007518.5660.257036208046697688@eltavine.com>
References: <179393007518.5660.257036208046697688@eltavine.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_235811_743022_13D03AA7 
X-CRM114-Status: GOOD (  13.64  )
X-Spam-Score: -1.9 (-)
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

From: eltavine <me@eltavine.com>

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
Signed-off-by: Shuai Liu <847807867@qq.com>
---

Changes in v2:
  - Credit eltavine as the code author per his request, restoring his
    original comment and debug wording, and carry his Fixes: tag, the
    additional syzbot reports and the stable Cc from his RFC. (eltavine)
  - Runtime-verified on x86_64 QEMU (block2mtd backing store, KASAN
    kernel): the syzbot C reproducer hits the BUG 2/2 runs on the
    unpatched kernel, and completes cleanly on the patched kernel.

 fs/jffs2/summary.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 4521a7723f306..4a07b7911b210 100644
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
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
