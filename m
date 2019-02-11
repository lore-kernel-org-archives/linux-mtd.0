Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D15C169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:30:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD7D2229E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LEpUvjcQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHTmzwqO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AD7D2229E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVFUvmryh0hO7Pe0oe4++vkvfih6ub4iSCIp27Hwt8g=; b=LEpUvjcQPmdnJl
	pgrRwliTQVIGi2Tl2FxeN6uzkWyoZC2v3npVZThFPD0hpO7L+WLwIFpFv2ZRqfLF7bHAW8hgpJTrd
	O5y3KrjsEtWikZSd5AGnkx+IXsw3Ucqzpovwjn3L3ZSPI2urdbwnTuM7o98QH8BthVbpO8l9+8Ys2
	B88KfqWsseOwBnyPF9Q6EEDF3LYPfGLq5eDAflph+HSmRv3l6HIxgaN2dlD6LxWeH+5RsbSU//pam
	GkE7ZDzz5saq2EF8m9lW9ani2hxZTrDgGjm7fDm6Ju+kza2VIM+kt686rQP9uRESvkfpxoRv+sHnk
	qDCffSaEos3rSqIaZrrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtFPg-00016o-Dl; Mon, 11 Feb 2019 17:30:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtFOk-0007Gl-QU
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 17:29:41 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A0F4222A4;
 Mon, 11 Feb 2019 17:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549906178;
 bh=EAE5XTp2CnZtPTu38eM/2/yI4Xw18GQgFMm3/m3KB8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IHTmzwqOLeP3vsvuXl1B6MAKnM3/9Md/Ms6o7izCjd4LViDs4k6M+8JXLciu5iVne
 FQZDmdI6p3PbHkCdArAP4Q8RhLvWt/IcYJJ2VMFnG9aie92OdqeqOjN04pbAjUjY9F
 bN3Aa74FhUm7lm53iUnUaHPs/G5rgKEmmSYmE/Mo=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH v2 04/20] fs: add ->s_master_keys to struct super_block
Date: Mon, 11 Feb 2019 09:27:22 -0800
Message-Id: <20190211172738.4633-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211172738.4633-1-ebiggers@kernel.org>
References: <20190211172738.4633-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_092938_872030_17618962 
X-CRM114-Status: GOOD (  12.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Add an ->s_master_keys keyring to 'struct super_block'.  New fscrypt
ioctls will allow adding and removing encryption keys from this keyring.
This will enable solving multiple interrelated problems with how fscrypt
keys are provided and managed currently, including:

- Making the key status (which is currently per-process) match the
  filesystem-level status of which encrypted files are "unlocked".

- Supporting a proper API to remove encryption keys, "locking" the
  corresponding encrypted files.

- Caching an HMAC transform for each master key, allowing the use of
  HKDF while still retaining good performance.

- Preventing denial of service via keyctl_invalidate().

Similar to the existing ->s_cop, the keyring is added to the VFS-level
superblock struct rather than separately to the ext4, f2fs, and ubifs
superblock structs so that it can be used by the shared code in
fs/crypto/.  To minimize overhead, the keyring will only be allocated if
userspace actually adds a key; otherwise will stay NULL.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/super.c         | 3 +++
 include/linux/fs.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/fs/super.c b/fs/super.c
index 48e25eba8465..7ca05dda905c 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -291,6 +291,9 @@ static void __put_super(struct super_block *s)
 		security_sb_free(s);
 		put_user_ns(s->s_user_ns);
 		kfree(s->s_subtype);
+#ifdef CONFIG_FS_ENCRYPTION
+		key_put(s->s_master_keys);
+#endif
 		call_rcu(&s->rcu, destroy_super_rcu);
 	}
 }
diff --git a/include/linux/fs.h b/include/linux/fs.h
index ba7889bb9ef6..70d929ac89f9 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1405,6 +1405,7 @@ struct super_block {
 	const struct xattr_handler **s_xattr;
 #ifdef CONFIG_FS_ENCRYPTION
 	const struct fscrypt_operations	*s_cop;
+	struct key		*s_master_keys; /* master crypto keys in use */
 #endif
 	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
 	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
