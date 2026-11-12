Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78349606A336
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mRsa6xxE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HCWHbo+2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=++V1JIfBElk8VeDnBoqDzjTcL3Xzivcg5glqaAdnVRI=; b=mRsa6xxETVlymu12cgvvbRkyzt
	9H508YGefpEmLFvsQuQ+8CuyWxbnbaHFjPdTO+qTBsDnYObLP+QdU4Wcg8ak5S5aewQhTQJdeZMJd
	dL4FXhnk4eOdU2pLn0HTe/DXxeK0knFkNqOvcYZOTrvnVg4jDFT3BMT4kUepoZB0BonNoT3iZEhrM
	NoF6LNXMr+ZYv3WwxOfP7tN7aOQ8VhHEUeK6fm6old6NMh8nalwvArDQDfQnPjIKvmtoq1izyl4fP
	zHbeaXaXMHIieG5+J1FZ5T4HHomE4n47rCNc+/yQn2FToHoaZNnGZQI9MtovXByaYqjVzde6stIS4
	AYTCOb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVKI-0000000A9zc-213c;
	Thu, 12 Nov 2026 13:58:54 +0000
Received: from mail-qk2-x09.google.com ([2607:f8b0:4864:34::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVKG-0000000A9yJ-0CUn
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 13:58:53 +0000
Received: by mail-qk2-x09.google.com with SMTP id af79cd13be357-930f7b1eb68so401641985a.0
        for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2026 05:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794491930; x=1795096730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7uERjd+vF+nyqQq83zM6wcEGnCLDigeochUNNaCH1w=;
        b=HCWHbo+2eqhec153CLA8XLRFp7KQUA6e1QF2HZ2jfkeE4xh4jFhSP195dap4Xp1XFZ
         yyugPCINo/yDTwu2kJvqwpifh1sx1UErz/pmyFPAxoAn81QLA2sxuH0rRZHvZiUXlLNG
         66RUrr3mOnrrrLz3vhVZW66OOsLMj39shmfIlqaZ1p+chURwMPdH+/Y5R7q5V1maqRyx
         YngilbeKV6n4BLBW++KZIO7F4/8F6WZMwWHfgwg9rXaqbLiJZuB55vqDF168HNgLDO//
         V1Qg0JoqO3gfkwM72GisFVwulRB0MK8QoqCG9Bzjzre7zDKeI109YIbna8hZSrGh66hE
         4I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491930; x=1795096730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7uERjd+vF+nyqQq83zM6wcEGnCLDigeochUNNaCH1w=;
        b=hGAsKprzPhdSlkl68qVhDMPQVMuacT9kCCaGNcjBNo2L5ToyWg/K4LqsJMCKa0hrhT
         rdYCFEJmTu/6+ItozydIWtF2ySbnYieW8AoNWeCLEAlO0nH9fNgCbdorHIJWCyKNgn62
         DDyMVaPFrSWqn0Gb3DdCctLLve/BdeVXoMW3SRS6DLIekdP4Kc7AHVrNu1BaMOOfdvLB
         mbLBqxfKsyDClCzolWJidq6p6D3aWQea4A6hU4AEWNadY1SvE0ZHE5RDHNJZ4TxPPOda
         Kkak1+tWPdhhwukgAYovAOo2Ajzgai32VK65dlNzI8+x/WIP2pjKuggbMjkyaajkTr1T
         gpSg==
X-Forwarded-Encrypted: i=1; AL+hErH/yCYH+BmFNgJGLfRfA9IsH0r+3AkXibGb6N7PU4qWVdwRFsfpMAjh463fnhzCXf+wYK+/4oBAoHk=@lists.infradead.org
X-Gm-Message-State: APuU4Z+Zy/2+VoIhhORiX5h81G7u7epG9LWplj1BOxJ9l9Qec4wMd1EO
	F0OOotvFE2X9BoDu13G38GiUP3uKHdY/ERL7KtepErfRREXUkoq+7/r8
X-Gm-Gg: AYBFou1HNQPOZBbxNAwqF9Smu/Bw2Tm/4c2ouHJojmu4HRGKLALv1k5orEjrk14y4Jw
	Q11WZNK4tH59BVpb2YALv0YL4Fzct+821Z8Qf2VAUjSB5+cjem41OVIFxQzHpciOJPGyPdwr+6r
	AcN7wR4CO9CIHY+2h7qMvRF62EnjcTHc/yyL6i3mRxzzbOMRJYJC4CWPpSEIIA3qAlK8108Symn
	c6/ttGCcv9rJKoF3AhV4y8HZbzaq8e7wya9kbgMv2hdTs4g62eZmTV+rgKgaoEDuaJEPKKuaY3q
	4LlvpZL3UJAn07bgULOOxjBPRr91JivEOPmFRA/H1Ovjcu48Fcg2c97Hcspp06j6HRpEClEexye
	5laOk8j/ukSzsPqBhn3trCZQsRb0dUrw43Nm40kLzMWtZAiZ8PkAUe1HyL3Yj+k750wjJlEQxMU
	5IIyMN/fgqMEl8VFJ0Ceqm0BalPf4SC9Cezot6GHxwUXbxjaJJbd9P2sQnpXZYa9pSgT2JHp8s6
	Z+c4wP4yiEy+EZrKcCPyx/dqpOE4Ex8AXwj2d3RiimGYr8XrokFzMFQhgG7hE5u6K0EsfvS7M0X
	VnFAazArx+fMqfwAbBfX9K8uR1dfidDsNYsUu1f+q/kbA3RFYs+QswXK/g4Cz4v40y1po9ik+e5
	1vPiLqifcyiBA08pQOpAprSpNxOfICVkDVA/ELA==
X-Received: by 2002:a05:620a:28d4:b0:93c:c96c:a592 with SMTP id af79cd13be357-947affd32ddmr914915185a.36.1794491930088;
        Thu, 12 Nov 2026 05:58:50 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f20176493sm4610686d6.5.2026.11.12.05.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:58:49 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: richard@nod.at
Cc: chengzhihao1@huawei.com,
	lin.nan@h3c.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] ubifs: account for short copies in ubifs_write_end
Date: Thu, 12 Nov 2026 13:58:39 +0000
Message-ID: <20261112135839.6451-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_055852_098857_74EAB12C 
X-CRM114-Status: GOOD (  15.30  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ubifs_write_end() updates i_size and ui_size to pos + len even when
fewer bytes were copied. A one-byte write at EOF from an unreadable
buffer can fail with EFAULT while extending the file by one byte.
Partial writes can also extend the file past the last byte copied.

Use pos + copied for size updates and cancel the budget when no data
was copied. Keep the appending decision based on the requested length
to match the inode budgeting and ui_mutex locking in ubifs_write_begin().
If a short copy ends within the old size, release any unused inode budget
without reducing the size, and still unlock ui_mutex.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Link: https://lore.kernel.org/linux-mtd/20261027061226.3506517-1-lin.nan@h3c.com/
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
Changes in v2
- Add Zhihao Cheng's Reviewed-by.

v1 posted at https://lore.kernel.org/r/20261104191132.89515-1-dennylin0707@gmail.com

 fs/ubifs/file.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 99dd52715ee..8ebd3f4cddf 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -523,8 +523,8 @@ static int ubifs_write_end(const struct kiocb *iocb,
 	struct inode *inode = mapping->host;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
-	loff_t end_pos = pos + len;
-	int appending = !!(end_pos > inode->i_size);
+	loff_t end_pos = pos + copied;
+	int appending = !!(pos + len > inode->i_size);
 
 	dbg_gen("ino %llu, pos %llu, pg %lu, len %u, copied %d, i_size %lld",
 		inode->i_ino, pos, folio->index, len, copied, inode->i_size);
@@ -552,6 +552,11 @@ static int ubifs_write_end(const struct kiocb *iocb,
 		goto out;
 	}
 
+	if (unlikely(!copied)) {
+		cancel_budget(c, folio, ui, appending);
+		goto out;
+	}
+
 	if (len == folio_size(folio))
 		folio_mark_uptodate(folio);
 
@@ -562,14 +567,18 @@ static int ubifs_write_end(const struct kiocb *iocb,
 	}
 
 	if (appending) {
-		i_size_write(inode, end_pos);
-		ui->ui_size = end_pos;
-		/*
-		 * We do not set @I_DIRTY_PAGES (which means that
-		 * the inode has dirty pages), this was done in
-		 * filemap_dirty_folio().
-		 */
-		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
+		if (end_pos > inode->i_size) {
+			i_size_write(inode, end_pos);
+			ui->ui_size = end_pos;
+			/*
+			 * We do not set @I_DIRTY_PAGES (which means that
+			 * the inode has dirty pages), this was done in
+			 * filemap_dirty_folio().
+			 */
+			__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
+		} else if (!ui->dirty) {
+			ubifs_release_dirty_inode_budget(c, ui);
+		}
 		ubifs_assert(c, mutex_is_locked(&ui->ui_mutex));
 		mutex_unlock(&ui->ui_mutex);
 	}

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.50.1 (Apple Git-155)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
