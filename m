Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D05606A31A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s75BS811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/Ihl8b51Kvnxjg2Zyd3crY+QdWwKSSizuLuAZE1XuRY=; b=s75BS811vnAeD+ypcMI74ydE9U
	DCtA3M0/DzUNtigLB8/kWn4L/ojrT9hT41CJaQJKcnb1ti1VarSMdhqYEw/kXYIlHoqfAnKIkFSx9
	lczMkQjfQm6dTvdkMfSMMBuBcHWHLbVduAmfqbIYLhJ4YwRN6+xObTCKvOnNW/3lDLoNuAEWEeY6V
	Owt+EaCyHJWQ3FxSrBF1tHv9r1/fMniWlHmPP7+Qut6ZL1XbwnyLgT9PlbkOnDyOaH48XzY5d/B90
	mMCm/GSWi1vj+qfjVFqq1t1qayQ1Jfkh+CpFs+dd0+OhhzG6D9i6GOBhtkMsBB8/1p9D4nHL61Sae
	5ryumJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLm2-00000008lDd-1T6V;
	Thu, 29 Oct 2026 08:46:14 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLly-00000008lCV-0yox
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 08:46:13 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jFd9h5HF4z5PkGk;
	Thu, 29 Oct 2026 16:46:00 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 69T8jlsK055908;
	Thu, 29 Oct 2026 16:45:47 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 29 Oct 2026 16:45:49 +0800 (CST)
X-Zmail-TransId: 2afa6ae307bda81-28cfc
X-Mailer: Zmail v1.0
Message-ID: <20261029164549455vmvRvpHkZ8cVjNxAzoyoO@zte.com.cn>
Date: Thu, 29 Oct 2026 16:45:49 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <richard@nod.at>, <linux-mtd@lists.infradead.org>
Cc: <chengzhihao1@huawei.com>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSB1YmlmczogZml4IGZzY3J5cHRfbmFtZSBsZWFrIHdoZW4gcHVyZ2luZyB4YXR0cnMgZmFpbHPCoA==?=
X-MAIL: mse-fl1.zte.com.cn 69T8jlsK055908
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 29 Oct 2026 16:46:00 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE307C8.001/4jFd9h5HF4z5PkGk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_014610_598918_BE570845 
X-CRM114-Status: UNSURE (   6.62  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shao Mingyin <shao.mingyin@zte.com.cn>

ubifs_unlink() and ubifs_rmdir() call fscrypt_setup_filename() and
then ubifs_purge_xattrs().  For an encrypted directory the former
allocates the buffer holding the encrypted on-disk name, and every
later error path of both functions releases it through the out_fname
label.  The purge failure path returns directly instead, so that
buffer is leaked.

ubifs_purge_xattrs() only does real work when the inode claims more
xattrs than UBIFS allows, in which case it deletes them one by one.
That can fail, for example with -ENOSPC from ubifs_budget_space() or
with an I/O error.  Every such failed unlink() or rmdir() then leaks
one buffer of up to NAME_MAX bytes, so repeated attempts leak memory
without bound.

Jump to the existing cleanup label instead.  do_rename() is not
affected: it purges the xattrs before it calls
fscrypt_setup_filename().

Fixes: 9ca2d7326444 ("ubifs: Limit number of xattrs per inode")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index c67954f6bee0..73594d476fe3 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -846,7 +846,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)

 	err = ubifs_purge_xattrs(inode);
 	if (err)
-		return err;
+		goto out_fname;

 	sz_change = CALC_DENT_SIZE(fname_len(&nm));

@@ -955,7 +955,7 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)

 	err = ubifs_purge_xattrs(inode);
 	if (err)
-		return err;
+		goto out_fname;

 	sz_change = CALC_DENT_SIZE(fname_len(&nm));

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
