Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A6F607038D
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1zEbJrlJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDNjzw+h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zyo6KXI7XHBHiIGGzBsYDF+8E/0ubD0G+FcbPwGm0y0=; b=1zEbJrlJ4tx+S3obHU2UND/FTB
	hDGo1A4HcFADgNr0tSVP9gfMuv6h2pTeyuSxmgzPr1iQHtoG+6FGyfsyUiYesLmbwpsD2Scfth2jh
	UsJsH4NAnql2zIPDI41RpAsyJ7a2eHm1fzuRRoaSVvwrEkB4JLwcxKjKkSlVc3nutUA0fQ08Icdrf
	x3eHiXStUVLpbkjLdlZgJz48Xh0y0yQZSMa5vdE+NTPUnQUOk3aX8hhJ6xqZ9qQvhNX20XtrX85qG
	6EDYba75k2LSxqcUVpAf/Y/osSERFimKhZ47KoJi1U1mtBdbUvD1pEaSWdBmMkNEjGwAgem+s9l4B
	Rh/xHSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvxG-0000000HTqm-1qbA;
	Mon, 02 Nov 2026 17:36:22 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvxD-0000000HTqP-2VJe
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 17:36:20 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1269179a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2026 09:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640978; x=1794245778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElUJWOdoo11axaVjJS7g+O8dXrqVocWR0XYxanpNOCM=;
        b=KDNjzw+hWdtj21zTcFn6prLl3vWCh/Ns7wANfR1htt12fXUspvFLM0oeTousA5C9Y3
         d6WcQ0mtpndfC+M8V94Rwk9H2+X3I9lXA5H5sR3dyElRdQKTm3MU4SoLKSVD+7P5Kocz
         ZvwSOOhxFdgizoWPTtXekCg8GdSMhHrpzB0TrLnhc6Q7Nlas+zeADImSuszC9DmV0SYD
         kI7XiDMJ8n4UskaW0qbHDMkjgaIKM1G91g5Qoq8womj7AvCv2NucpwRWHDFTdwfwO1p1
         HBn2O4FsMguNeAqf1RbQaiiPVeMZyWZRUiQPgfNRdMlUyzaIxW5P/1SOU9SMDhRS89b+
         kPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640978; x=1794245778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElUJWOdoo11axaVjJS7g+O8dXrqVocWR0XYxanpNOCM=;
        b=i4DBHSZsEuS/r1ZQNx7dhFoUyDzwZDEPwUVVnb4dM5WpYqJp+kHogBb+YV1MT46dq1
         eBhNRpm8PibyPisGgogWG/ovZIJBH0oNMXISlCG49j1dvkNEM1ubkF6TXyuZfnJAzQcH
         3GmQ8vfbI/TACphIZkYgW/TDl1bBVlfkQOiPeXslIjrgefXUk8uNvxh3SUkn1fmJX1Dp
         S2RAqwzBtH42h+guqjbNg5SbfmyYV+IpGGRZuWWyqXLU9CPNg7/2XcDfNq57rUVzfld0
         t0qkHVYvCxWvyxnVNjNMG+acwi60h4rsolhD/H2QnzxIzBZpG22xrNkWE8MiEp2h9q/h
         qntQ==
X-Gm-Message-State: APuU4Z972i1sTfQjZ7WAOJK1cUiFhRNzSK9eMooSpHbsxbnV1Pq0FCJH
	XCmK9OpFGj1YSlH3qdl/jqIADggcu6KdCiIEGE1beha3gQlo9Kzm9LLCYi/3J/Vi
X-Gm-Gg: AYBFou1ptM+FArfi5xX3n+Nvf7vmJKCPXZV/a3TNFBsgJzgakv0Dt3seC9BtvjUF3B4
	xOz/ZnvbQ9Vmn1t3tJJjFEvaYjShqMsW8yKwtC0bIyrQswd/FLVii/NFCAn/PtPZpgwEeepTbY7
	CwkscZXgPOpK1uQEDhfgiIu8OJFlEYx2e2SXus6YF6agGbSlftvmnqn4iYKw+ALtF8pxsPwHxAJ
	heA+tm8tFUw564LyBg7j+EwcPRkjpocLN72eV2BAb2GmK3ECWGuys7YPWbU+e+arPvlwO2jrkeA
	cCV6eSEaOuctA6Zckd27Syavd1fMhsguFNroMpNTN8iVm8uQdpQoIDSSw6roG0D/+cB8+LKuAuM
	sQQDBlbGIGKImRSlJJx67VEkwz8ofEz8N77LIyPzWxLJjs81tJiKEUeUXbhz+vz3VhQOC1fJ6NB
	QYPMFYzqVRcpv8ZRvMoOqXn67LOjAyZGBJxJ0f87dQKQuFMl2eH5dPNqQMpapSKdlGujXmfqkqD
	cwxdx4wm7OIrjH76WRCJI+L45gFPQZKyi6XnNBNwNQnAuuBNWWH4XMkMh0aQ98rT9mQUfMo6CVn
	/Abx9livbKCfWYwGYw2nI8MbHs1ZyXnYd3EzaYrId7Gyu3567DyzX/LBNizizMGIXA==
X-Received: by 2002:a17:90b:3e89:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ae895362e9mr9184522a91.4.1793640978092;
        Mon, 02 Nov 2026 09:36:18 -0800 (PST)
Received: from localhost.localdomain ([61.255.248.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm142858a91.11.2026.11.02.09.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:36:17 -0800 (PST)
From: Song jeonghak <thdwjdgkr123@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song jeonghak <thdwjdgkr123@gmail.com>,
	syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] jffs2: keep alloc_sem held when a write retry cannot reserve space
Date: Tue,  3 Nov 2026 02:33:42 +0900
Message-ID: <20261102173342.314251-1-thdwjdgkr123@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_093619_651692_54A35F2A 
X-CRM114-Status: GOOD (  19.01  )
X-Spam-Score: 0.6 (/)
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When writing a node fails, jffs2_write_dnode() and jffs2_write_dirent()
retry once in a newly reserved area (jffs2_write_dnode() does not retry
for ALLOC_NORETRY). For allocation modes other than ALLOC_GC they first
drop f->sem and complete the current reservation, which releases
c->alloc_sem, and then call jffs2_reserve_space() again.

jffs2_reserve_space() returns with alloc_sem held only on success. If
the new reservation fails, both functions return an error without
holding alloc_sem. Their callers expect alloc_sem to still be held on
error and call jffs2_complete_reservation(), so alloc_sem is released
twice. syzbot reported:

  WARNING: bad unlock balance detected!
  syz-executor317/5670 is trying to release lock (&c->alloc_sem) at:
  jffs2_do_create+0x1ae/0xe00 fs/jffs2/write.c:474
  but there are no more locks to release!

As mutex_unlock() does not refuse an unlock from a task that does not
own the mutex, the second unlock can also release alloc_sem while
another task holds it. This follows from reading the code and was not
observed in testing.

Take alloc_sem again when the retry reservation fails, before f->sem is
taken again, so that the lock order documented in fs/jffs2/README.Locking
(alloc_sem before f->sem) is kept. jffs2_do_unlink() already takes
alloc_sem without a reservation in the same way. If the reservation was
interrupted by a signal, this waits for alloc_sem uninterruptibly, as
jffs2_reserve_space() itself does when it first takes it.

Tested with the syzbot reproducer on mtdram: the warning is gone while
the failing path is still reached. The jffs2_write_dirent() path was
checked by code review only.

Claude (Anthropic) was used to help with the root cause analysis, the
reproduction setup and drafting this changelog. The fix in
jffs2_write_dnode() was written by the submitter; the assistant adjusted
its comment and coding style and applied the same change to
jffs2_write_dirent().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=250fde257a3eebba4426
Cc: stable@vger.kernel.org
Signed-off-by: Song jeonghak <thdwjdgkr123@gmail.com>
---
Testing details: next-20261023 with lockdep, 128 KiB mtdram with 4 KiB
erase blocks. The warning was reported in 6 of 7 runs before the change
(the cause of the one miss was not identified) and in 0 of 3 runs after
it; in all three runs after the change the failed write and the -ENOSPC
from creat() are still seen and no other lockdep report appears. A basic
test on an empty mtdram device (mkdir, create, 20 KiB write, rename,
symlink, unlink, remount, filling the device to ENOSPC, remount) passes
before and after. Not tested on NAND flash.

Two pending patches, "jffs2: Fix a lock leak in jffs2_flash_writev()"
and "jffs2: fix wbuf_sem leak on summary failure in
jffs2_flash_writev()", handle a failure of jffs2_sum_add_kvec() inside
the write-buffer path in wbuf.c. This patch is independent of them: it
fixes the retry path in write.c, reached after any failed write whose
retry reservation then fails.

 fs/jffs2/write.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index cda9a361368e..0ac3220e7b05 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -147,6 +147,13 @@ struct jffs2_full_dnode *jffs2_write_dnode(struct jffs2_sb_info *c, struct jffs2
 
 				ret = jffs2_reserve_space(c, sizeof(*ri) + datalen, &dummy,
 							  alloc_mode, JFFS2_SUMMARY_INODE_SIZE);
+				/*
+				 * jffs2_reserve_space() drops alloc_sem on failure,
+				 * but our callers call jffs2_complete_reservation()
+				 * on error. Take it back, before f->sem.
+				 */
+				if (ret)
+					mutex_lock(&c->alloc_sem);
 				mutex_lock(&f->sem);
 			}
 
@@ -299,6 +306,9 @@ struct jffs2_full_dirent *jffs2_write_dirent(struct jffs2_sb_info *c, struct jff
 
 				ret = jffs2_reserve_space(c, sizeof(*rd) + namelen, &dummy,
 							  alloc_mode, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
+				/* See the comment in jffs2_write_dnode(). */
+				if (ret)
+					mutex_lock(&c->alloc_sem);
 				mutex_lock(&f->sem);
 			}
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
