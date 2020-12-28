Return-Path: <SRS0=5rSU=GA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC300C433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 19:14:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81E42229EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 19:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81E42229EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1EjFvKGRmBSpeJ6A5iSLJ7ogFA815XC1JFp0jJH8EdQ=; b=KRwBEUq+1xTsQrK/hQmc9SKjw
	TOp3xnPgcv8FnMUPecuRd2WbyK8+y4O7rQymFIj/zZ4sg8BCtTjU7DirFCtCxdenMoAyV0t7q464i
	lZNIyweEWdjAAjJ2xUMv47W2bZTOdwVLxWYTH+J1sa2E7jx/bupXOX+4l+px4pI/G8j0vl9dBGZyG
	EwUHz7PJNSWP4jFBFysnXtaST11BsDUYG+wLQdqCxJxDd3VOBidc68+OvclexEAdZjRf7tIUvS3Qx
	Bys2APtMbS9LjNg9yb7qAgHWJrw+CkShZ8uQsH6Im0+u8JbbVeSlbqELRNvz/uJE+CPlSro9GMt4J
	iQmi+7VNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktxxO-00016U-81; Mon, 28 Dec 2020 19:13:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktxxF-00013d-Vm
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2020 19:13:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A51022B2C;
 Mon, 28 Dec 2020 19:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609182797;
 bh=IXmvQye9ZM3vzPLg/kY4jseJxfvpVBcbyPuNjzHTWF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jQya9WijPGAu5QKp6aRvs3aDB653D8Hv76AV5phKUMDyWFMiaAg4MHTwjj1RBt+7M
 iyq/ZgVltry9M+5t2oZs30wMF/G6NKjpDSCP1XT4ZmTnB067VauLZvLoC91sIZm7iw
 rkxpkiOCBwKY6rs/hwNhLjIlse4VYM8/FyBwuFDsCrFl3caRxhXwwvflQNIoNXRn5N
 ZDtjg/qlyXGK7W8/kndpbTOxYKbUJvmR7QFeuUdu+YQ1SZCDndIiP2EQkHPrLdN9kJ
 gfuDSlv09IpTCUmUEzasmBHTocNpQCUBmrVFqWHIx7yE7hUOJk8jOcu73YMA8+60hO
 KxlKk0BLmhKuA==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Subject: [PATCH 4.19 3/4] f2fs: prevent creating duplicate encrypted filenames
Date: Mon, 28 Dec 2020 11:12:10 -0800
Message-Id: <20201228191211.138300-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228191211.138300-1-ebiggers@kernel.org>
References: <20201228191211.138300-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_141318_278591_EE139C39 
X-CRM114-Status: GOOD (  11.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

commit bfc2b7e8518999003a61f91c1deb5e88ed77b07d upstream.

As described in "fscrypt: add fscrypt_is_nokey_name()", it's possible to
create a duplicate filename in an encrypted directory by creating a file
concurrently with adding the directory's encryption key.

Fix this bug on f2fs by rejecting no-key dentries in f2fs_add_link().

Note that the weird check for the current task in f2fs_do_add_link()
seems to make this bug difficult to reproduce on f2fs.

Fixes: 9ea97163c6da ("f2fs crypto: add filename encryption for f2fs_add_link")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20201118075609.120337-4-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/f2fs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 53ffa6fe207a3..aacd8e11758ca 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2857,6 +2857,8 @@ bool f2fs_empty_dir(struct inode *dir);
 
 static inline int f2fs_add_link(struct dentry *dentry, struct inode *inode)
 {
+	if (fscrypt_is_nokey_name(dentry))
+		return -ENOKEY;
 	return f2fs_do_add_link(d_inode(dentry->d_parent), &dentry->d_name,
 				inode, inode->i_ino, inode->i_mode);
 }
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
