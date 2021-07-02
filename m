Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5C3C11F69
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 06:56:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E57861156
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 06:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E57861156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79kHT+AhRK2vMxXVIoyp1OaRd1xK8CvEGoxQoievdNw=; b=x6JcSmDRQCAsSf
	XDmAXIxxL+fBB+/TJ/1cCoUgtlBG7iPD8kBPbga+fAnu6uAcM8DEHn6vB4xQGEaLll+4wxt0z0DlD
	AWSTfNIlCXGeUr6KE+4aOUSJ4Af7yenjUi71u2pLvKiyEPjzEjgNlj1tKG3cpe7hI/XGSHAfdoCtI
	yEX9FEhcF9L6vufhB/kDTY8qD/+vme23Nx5M7Z8r26OVnLiVtb0EhFVKsbTcWEJJRKoMHmwoUME5P
	67ntO8FS5D21CrZUhYPHby7qBwL732q94BT/4SzpbCQoHYpewsMWGjrZO3hmhRzEvvFC77b6EOm6/
	EiQN1NQo1CJFG2YIUUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzD5V-002JF2-5v; Fri, 02 Jul 2021 06:55:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzD4e-002Ire-5b
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 06:54:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 659D461413;
 Fri,  2 Jul 2021 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625208891;
 bh=oytk1FqAK/cRWx3e72Lrjf5gkgDm1h+IK3FE/F4jrDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fBRQEhrJJ96bGUI9d8xd7QPa3WJ5ACNQiNFFlLiciyLDX/+kJJiMK4kdY7t2a/Hu8
 L/JOKII31seusjSyqQH0p0zJVYGN3K/WIcgd4EvZ76bvtCnhC2R1Qi/gBZ1nIw4M5l
 /qtnEb4tJYlMpY81DoSUpGC6zCG/nQqQ/+GfV7vfTFAIkkyWTE3QNeeLSLVuC6wUlG
 ZFUirevxfCcRDTK+uQT13qFXoBgPqyIzKhznOb6tw3I87oy1lri67ZPC8T7fSxItPB
 ZiksVnwYTJeunNRiKmM8dyfsMgSZAi9iigVse/a8GYIuCo22x+3oUZcck+67uOfckh
 4dfuQHiZ4sTjQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH 3/5] f2fs: report correct st_size for encrypted symlinks
Date: Thu,  1 Jul 2021 23:53:48 -0700
Message-Id: <20210702065350.209646-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702065350.209646-1-ebiggers@kernel.org>
References: <20210702065350.209646-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_235452_286143_0F4B4CB9 
X-CRM114-Status: GOOD (  11.48  )
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

From: Eric Biggers <ebiggers@google.com>

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after f2fs_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: cbaf042a3cc6 ("f2fs crypto: add symlink encryption")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/namei.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index a9cd9cf97229..e2d540ae2293 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1305,9 +1305,19 @@ static const char *f2fs_encrypted_get_link(struct dentry *dentry,
 	return target;
 }
 
+static int f2fs_encrypted_symlink_getattr(struct user_namespace *mnt_userns,
+					  const struct path *path,
+					  struct kstat *stat, u32 request_mask,
+					  unsigned int query_flags)
+{
+	f2fs_getattr(mnt_userns, path, stat, request_mask, query_flags);
+
+	return fscrypt_symlink_getattr(path, stat);
+}
+
 const struct inode_operations f2fs_encrypted_symlink_inode_operations = {
 	.get_link	= f2fs_encrypted_get_link,
-	.getattr	= f2fs_getattr,
+	.getattr	= f2fs_encrypted_symlink_getattr,
 	.setattr	= f2fs_setattr,
 	.listxattr	= f2fs_listxattr,
 };
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
