Return-Path: <SRS0=xoN1=N6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE91C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 21:52:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAD8E60FDA
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 21:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAD8E60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=geh+Y+rYNw2ruMABcX1QOVp2ImJk/VNlbaIDuUfqhPk=; b=39xieq7MThgX3F
	MzognsuawXoAols0y02zRok5IO/cy3qYWQOJ4C0u/g/8uybXyT4bJuTHdDGv9HkAfFR4QPQ3OnxhX
	EHZomEKPw8glAe2p/fIoQdLMy/CaIrYYnZA0rCPDHUfxmK2hf3NkOgd81j8V+zaI8cukJOQXHCn1W
	b62UCfMwBHK/SYqG8pFGPiU3qot17vy1Kf0+rVMjWUIIxbm1Is6jLjzro/7kQ3wsXMdXl6kuiBQmB
	RAalfGYTLoPGuNrrMA6WHEDlojuZyl0GPj8nTAacSSoiUI/4Km96DeBf+U5oMn4i1xYKI5iC75xSL
	ylTVwYaq0yOBSHYZ4N8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO5UL-007e4g-LB; Wed, 08 Sep 2021 21:52:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO5Te-007dwH-7B
 for linux-mtd@lists.infradead.org; Wed, 08 Sep 2021 21:51:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B4BA60FDA;
 Wed,  8 Sep 2021 21:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631137889;
 bh=i6jyH8PvgB9yhUYtCQiIMlEe2F7QGBiOJVd7oI0isaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uc0ABPV3twDuxLbMd8GxOBFitN/d4dzY/uDlYPFrSwJ2ssdr1If877Acir+VjZZ8n
 Nt/1rGsencho7jBMorqXtpxbbAGOew+veyR+teonjCszMDWx75NRw2lv/M/1JDvZgE
 p6ecHZl1/g/3/8zg5mkWJqIhBqONxZnc+NctmDqqVS45hJ+/JP9bsKIhSTIVU4hLJT
 mC6a5VpUhXm37nyOBu54PPLjy8QaT9GOey4LjQfuAp8Nz0dM8f7Qgw9gHni6eqO2Hr
 br4oThTq/jK3hdSY3kuxtu/Qxx8lyhEc545uStdAaEsUArmfAqD5pOq6M2Ok1P+Rq6
 Y/EuKsKzzo1Ug==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] f2fs: report correct st_size for encrypted symlinks
Date: Wed,  8 Sep 2021 14:50:32 -0700
Message-Id: <20210908215033.1122580-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210908215033.1122580-1-ebiggers@kernel.org>
References: <20210908215033.1122580-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_145130_349133_E01E4DFE 
X-CRM114-Status: GOOD (  10.82  )
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

commit 461b43a8f92e68e96c4424b31e15f2b35f1bbfa9 upstream.

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after f2fs_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: cbaf042a3cc6 ("f2fs crypto: add symlink encryption")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20210702065350.209646-4-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/namei.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index e20a0f9e6845..edc80855974a 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1219,9 +1219,18 @@ static const char *f2fs_encrypted_get_link(struct dentry *dentry,
 	return target;
 }
 
+static int f2fs_encrypted_symlink_getattr(const struct path *path,
+					  struct kstat *stat, u32 request_mask,
+					  unsigned int query_flags)
+{
+	f2fs_getattr(path, stat, request_mask, query_flags);
+
+	return fscrypt_symlink_getattr(path, stat);
+}
+
 const struct inode_operations f2fs_encrypted_symlink_inode_operations = {
 	.get_link       = f2fs_encrypted_get_link,
-	.getattr	= f2fs_getattr,
+	.getattr	= f2fs_encrypted_symlink_getattr,
 	.setattr	= f2fs_setattr,
 #ifdef CONFIG_F2FS_FS_XATTR
 	.listxattr	= f2fs_listxattr,
-- 
2.33.0.153.gba50c8fa24-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
