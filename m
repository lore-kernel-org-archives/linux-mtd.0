Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C929C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 06:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE3E92147A
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 06:55:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BgHEFL3C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="diJFhY6d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE3E92147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVFUvmryh0hO7Pe0oe4++vkvfih6ub4iSCIp27Hwt8g=; b=BgHEFL3CrA3XVf
	tdOHPyhoA87wn9pQq57cMYtskyClEz9PSrzu014M0Be7++w7BaOm/u6HGbuoYjFFvR0el9m4e0OaY
	Ajmd87H3Wuukt0cy4zXXibE1jZnnvAVlp0Nks1GbFHGc4oo8Mzr3R2IyFFUAVyY/jGoD5El5UnNhr
	v1XC5leOw2Xwi8qHg91J4CU1YrMAMvcW/viVwg3q9XZTqo/nrP2A98LB8ioy6wpNJWNNahCUn0JgU
	s8wqU6YiOcxEhJtbLyqBZcz85AcPKTNwFjfGMJR9BMsIz11e0mPuxFH1wV7zZwf8yxZ8AW7GAkN3W
	Ss44DSGrJ+XUtgXs4Gww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwLnJ-0005CM-WF; Wed, 20 Feb 2019 06:55:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwLm9-0002sk-5M
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 06:54:43 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DCE421902;
 Wed, 20 Feb 2019 06:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550645676;
 bh=EAE5XTp2CnZtPTu38eM/2/yI4Xw18GQgFMm3/m3KB8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=diJFhY6dLH0Dao/th1lkNUKKvEvbFZyhwa0pRQqTdLURLjOuFOzI9H36owjcrgnv1
 HosGAZyoE1kBdKPzCE7bsYTBMfH1uTReq4NiPK7sgy1xkiXpJPPEmQrHuKJZs7e468
 HHoVkJDK+coNjLB53VsVBqqq6cVIY4daK8Kq9GCg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH v3 04/18] fs: add ->s_master_keys to struct super_block
Date: Tue, 19 Feb 2019 22:52:35 -0800
Message-Id: <20190220065249.32099-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220065249.32099-1-ebiggers@kernel.org>
References: <20190220065249.32099-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_225437_510861_EBD02CE1 
X-CRM114-Status: GOOD (  12.15  )
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
Cc: linux-ext4@vger.kernel.org, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
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
