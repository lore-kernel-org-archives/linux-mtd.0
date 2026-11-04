Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C90606A31B
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2026 19:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bODUJACb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQ1knA5q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vkBlHDNKwq73tb6Y/G9rk+4lvaZxAwLdXtFOCXGntXc=; b=bODUJACbSKLmAQ0wR43zMp+GCs
	qfEYVtb9rq43zMqgQQwq+4Jl1fpULYY8eGRjQEvgE7pMJhQbQ7wvjgY8zr8kOdEdjfAFc7D6m0VFh
	BZTI6T92nT3j6+sj+7ESuqPy+M/rppPCK3WPxzoHSyyLcbTs9/a1gRbQu2N1gZwYEomlOF/QLxP6Y
	kAzoh9t1ayxTs3wYD8DD/3QRVeluXot5DRIzfCHU3JfvedQtXGTltWrKBhpTlu0XIRXIJJbQDeBYK
	PqK+T+/sTyQPaOAFdM7jozvJQRuCnQgZP79FfMbQ+4BRMegSRi6+JfRVSXbM+8UEy/dpJvuVNwHkR
	1HOAM3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgPa-00000006XA8-3x9l;
	Wed, 04 Nov 2026 19:12:42 +0000
Received: from mail-dy2-x09.google.com ([2607:f8b0:4864:36::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgPY-00000006X9N-0ezp
	for linux-mtd@lists.infradead.org;
	Wed, 04 Nov 2026 19:12:41 +0000
Received: by mail-dy2-x09.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso492974eec.0
        for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2026 11:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819559; x=1794424359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2eBasa7agXmVq6bqhWG9P4J2rj64c5jg7X5XSFiq59I=;
        b=ZQ1knA5qPmBukMPwyxKDPJKHwJJlolsDjStMIS99K5m5A33UaMhFoQRZXlhJhhh6kB
         50v9kDya6ULZWT7N7vjvlva0GeiBkWPGrPzf8anaVqdAfJd4p6mBS2czhHOFUlwv+Aak
         ynf+3ktdswfoTUFqBQFqwRpM4f7Gy6GinCna8sdgHYNIypRaljiNwbnG5+eX8SuHVpbK
         FxgNmsc5m6HaVbHy97G3p96XVveIe68o8bMRVn7k1qC6q92s/f5ftQniGa+8EKJw8iHs
         aNHNr1XHOwe98jURe5J3lGl4vT4ThgsUBmCtWSIH/mq2E/hPPO5eS23d0ShZKpLiS9ji
         9xgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819559; x=1794424359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eBasa7agXmVq6bqhWG9P4J2rj64c5jg7X5XSFiq59I=;
        b=vY0ki6HLwHvOB2dseFcVkZy/bnKEXPQdG47HJVMAGZNfCwcmpHnCJP95nnjsg5Sroe
         utdUVvT6yXB/952K5l1Rzddgda5tpBIiuPz24HN1qJAr6fySL2ae/Sx8yy/WzBGTlVhb
         r5d9SwaSGIaq38JxmjQhVC+XFoZRbmd3JvHGd5CghzFaMVc3Pf0I1MKIfmwd0qRKxY9d
         OFkF6v6tLCGVva5YZf0pSpltR0DKlTU4xGchBCSculMGrg7m2Z3AS7JLTszjoGyjRh7s
         k99aoFp9KCsxJP0jyPeAjBF++kbpAB7Gy04n1RLdXsGeA40XV+ws0F58EC4FzY3RNlZP
         QC4A==
X-Forwarded-Encrypted: i=1; AKwUvBzygct7c/ecdP+wzG1A6q5CvBh8+TQUbs5yhdgBqsP+qLfBDkkmgU92tW1xASDLTAugXKYK+eoEA6w=@lists.infradead.org
X-Gm-Message-State: APuU4Z9M/NZ77+DwXuL4+bH2m4fP6q0+0Iq2OxBf9yfDgzvsHRAzgqhW
	YAkBVxxEq4E0YGL0jZu64VTWahRAREfgF0gujwcm3vxE47mwrUXzzbfnBQJBYLmvEWQ=
X-Gm-Gg: AYBFou2D8AUYO7ewKLkgxBA+klmn8qgHlx4Thy6Ta4oRQZwlaPlmBuPUlsJGO9j84VB
	YYOoUiI1kjUS+2HDS71ZZojcosBWVMq7zjmYhWtL6JjsWsgHq3FKkE3a2bqOMXAEixTkg9HDMGg
	kL6qQFCio6mwzef6FXr7JBxypGjjDYsdvDXFq9/k8Y2luJq60R3Os8RACJDiFRilum9WtmgunYP
	L4j1lk2qf0KqlPENkAt5hpY0ka8LBBtZ/wRqnyS4vifjqcf/LKV6d64U8+te7AJE/ZjT/KNe1W7
	RVPp4Hx3E8nJ0jKLfBaRhvO3xCIIHBHG9O6JnhHmMPGRGTJEfS9kylo9JCB60hZxrr2C/VwYisK
	sfwR820C31lzzGgMNQHTR6099tZy7ggF3Hf966Hu4AyIxuHk7kmlX7gnkYxEWsdwMOH3BgUB835
	Lvi3OwhV1ttrKGiFb2pNBPLsqn98uC6r0IiSfFUnLEvx4r3IlRilTpFTTRiwBjZx92j6lP0OZ2d
	bP8+7FdIIyttV6r7Xo+wcoK9DN6vP3q+lgcjk2glXslt4KhkRb9VEsGYbRf8q9vprVLCmHvCa7H
	+vmNwH1qx2/8wBG4MfTu3W/NgkWQx2SD2KeNeL4Gi1U7A1p+4N+EWy2eEFxDBScMJle6g8qr7te
	eZ2+Gq8dWoPjC7fV/mJwl/SY1w/5A49shjHcpzA==
X-Received: by 2002:a05:7301:6189:20b0:358:ec5c:bef1 with SMTP id 5a478bee46e88-36a42425486mr23614256eec.39.1793819558461;
        Wed, 04 Nov 2026 11:12:38 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dad72dc52sm1916864eec.0.2026.11.04.11.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:12:38 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: richard@nod.at
Cc: chengzhihao1@huawei.com,
	lin.nan@h3c.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] ubifs: account for short copies in ubifs_write_end
Date: Wed,  4 Nov 2026 19:11:31 +0000
Message-ID: <20261104191132.89515-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_111240_199570_3D0BB0F7 
X-CRM114-Status: GOOD (  15.49  )
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
---
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
