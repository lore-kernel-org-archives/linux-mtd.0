Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD01F606A33E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 03:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hLAmslis;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=EpTH5Lgw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ijbPkZ6gVeANnbF992gkeCM35iWwJoOROlJR3W/Wa/A=; b=hLAmslis3PsPR6S+37+cWrkpOW
	rqT59Lurlj/QPejzCe8vG4oXtlctdxtoFMcDdq+oTolpJdg58+sMU6YudOb9XUr4sSWDZeOKXHejf
	jYZI1DoMw/2zXaPAvsCRW7xHnNddBSN5iMjZ2MnQLhwv3KRtEaYUff2BIpYYYtDv7NFtwCdcj73Rt
	4Tyy9xa4pJ0zzeokLHJ68vnxcEShvh+Uus17NoxYi4mly0x/uikhfwo3ief5ai4Tg8cyyVjT/clL3
	+khdlww8mkHb55ONn4Z527c2hOjJw2iWzFYsp8+xoIJVCnqzP4eF52Ymq5/S81VDeYqe+Tq+TMtDS
	jPv4NrCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOo8u-00000007ftD-2InP;
	Thu, 05 Nov 2026 03:28:00 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOo8q-00000007fsr-2mQ5
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 03:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793849269; bh=WSnrvizyH/3Y4hnKNO/DGtg+xlXa8ybuP1DvPmB6OUE=;
	h=From:To:Cc:Subject:Date;
	b=EpTH5LgwDT4Pe8TTIzp4m1q5T1pZ+Nrq0/zKnJv4yiuh5lz6oG5oRtWJWjch3BSUE
	 w9SwkNmxxE4n55HAACdWkB7DsAN4TPmjplAduZ4YJpYQ/RTDUfJX6lizxSMZW/hyUa
	 6a+mScQ2NF6HhicSLScDzb5dJTuw2KtDPPqhjscQ=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 6EE1A02E; Thu, 05 Nov 2026 11:27:46 +0800
X-QQ-mid: xmsmtpt1793849266trffmrav4
Message-ID: <tencent_FAA58958D0E5079A7E70B1C4382752DC9509@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XFyWHgECT7Dl52DKp48LaCrLuTclpE9nXcDcZUhjtaMRgrIkjAa
	 y4zioyv0iX1ThnS4/YK3i8PCbZcUHARJYYGYBTcpcYnTTgayrlB/wJ2TSl+xojXRaxAZJxYsMIsH
	 8YplLfL3VUqb3tdh0t08sfigQfCa+11mw2GigfQ6EDj2yyfyNUAgIMReoXIu1+Su0Xa5W551I4cg
	 MfanyBYyp4Z63K2bP83GarHqXTxjQaUc88gOGzBAYuexogq8PROTKSs+HzDUSyQT1Qf2ftOd20FR
	 HWh78a9X2VsY/UDENztR89KNmxgz2j6dROnqykFjxSlhxZOZENwCayy0vO9bmHYiG1fH2bBm4Sw5
	 mrXd2iIlJtP2HN4E/pSNzyCgKd4qawTli1iHQOd5F5pn+a7WzMbsvd8hAGs9EJZGNEzMJGthlQxy
	 F1L+kaCDBw3pAFZFW3fzvrnBI4JFWWQefiYDTmtV9/85n4ve8EvRHiIQQ4xFApAWOTotiZMRDbRf
	 M0CIE/t7X7LkC/azCXGOu+jjyYnWaWD2vGFpkTPEW3lpsieCQM/6f/Y0VdLhsrIvdCoYJSImNrFH
	 xsJc6N5hmwjdDjNgqKlXTnYYssYGKTxOL15MVSXVttDEODApLztmE1azJqAvBABjta5ldFzT8o9e
	 UZ5Hc3h1xpaXt0wG2Xtobkbmyf0/3ykgLpf31m/xF7WoiqN7MPVWEQmTSIMXSAoADd4ctl8DQdW0
	 MnlQePzGV9ElE7zwmnKlsLxfdaBclBeMWEEDP14LfajbrbqDhasMeNjaLWXUHz+9kWu1AVvj6h5d
	 dkR8q9+e7Y8U6HvVwlelVICgE8GVcHS9I7c2lvyaGDOBXcI1S55Z9a8jfwalHlmyuzjrfDlBgQcl
	 w7RYjGjDh9eyRNfo98XlbdCKasDtK/lPZgu7xgG/v8IXVBb782O+f/YIl2tGOGWVMpBNNeXHi7yv
	 cS/abw6JWbHawcM2e6HvdZ6KbdwRWQb0zZGu6fKgvytE2lwNRkYPLl3KvKups+G2QnUtmUuAxT4A
	 l9UqlgcGgkUUVTOiu26FHO0gF/6oau3bVHjaURqhMLUo4hLWyGWUxnHnPTFCiifQIyKPjQGEyym8
	 TMyasg0yTrYJZkUw7KdYsZEN/SV+N1PUHLNKzN
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org,
	richard@nod.at,
	linux-kernel@vger.kernel.org,
	syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com,
	me@eltavine.com,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] jffs2: fix kernel BUG in jffs2_sum_write_sumnode on empty summary
Date: Thu,  5 Nov 2026 11:27:46 +0800
X-OQ-MSGID: <20261105032746.19827-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_192757_022508_A2B5636C 
X-CRM114-Status: GOOD (  15.12  )
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

When the first write after mounting does not fit into the remaining
space of the nextblock, jffs2_do_reserve_space() closes the block via
the summary path and calls jffs2_sum_write_sumnode() to write out the
collected summary information. However, if no node has been written
into the nextblock since it was selected during mount, the summary
collection is legitimately empty and jffs2_sum_write_sumnode() hits
BUG() on the empty-collection check.

This is reachable with a crafted filesystem image: the only partially
dirty eraseblock picked as nextblock at scan time has too little free
space (e.g. 140 bytes) for the first reservation including the summary
frame, so the block gets closed before anything was written into it:

  jffs2: warning: (4872) jffs2_sum_write_sumnode: Empty summary info!!!
  kernel BUG at fs/jffs2/summary.c:868!
  Call Trace:
   jffs2_sum_write_sumnode
   jffs2_do_reserve_space
   jffs2_reserve_space
   jffs2_symlink+0x172
   vfs_symlink
   filename_symlinkat
   __x64_sys_symlink

An empty collection is a valid state: there is nothing to summarize for
a block that the kernel has not written to in this cycle. Instead of
BUG(), disable summary collection for this block and return. The caller
then falls back to the existing non-summary restart path
(JFFS2_SUMMARY_NOSUM_SIZE) and either uses the remaining space without
summary reservation or closes the block.

Reported-by: syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0727f46a0571de01bf93
Link: https://lore.kernel.org/linux-mtd/20261015145341.34322-1-me@eltavine.com/
Suggested-by: eltavine <me@eltavine.com>
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 fs/jffs2/summary.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 4521a7723f30..1e4a19df4c49 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -864,8 +864,17 @@ int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
 		goto out;
 
 	if (!c->summary->sum_num || !c->summary->sum_list_head) {
-		JFFS2_WARNING("Empty summary info!!!\n");
-		BUG();
+		/* Nothing was written into this block since it became the
+		 * nextblock, e.g. when the first write after mounting does
+		 * not fit into the remaining space of the block. There is no
+		 * summary information to write out, disable summary
+		 * collection for this block and let the caller fall back to
+		 * the non-summary path.
+		 */
+		dbg_summary("empty summary info for jeb at 0x%08x\n",
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
