Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7224C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 04:14:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55BD822204
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 04:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FjqNlA0V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjOZn/iF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55BD822204
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QG05gZAvHdFcajl9ms6qCTUMqc20p9GYi8PQX6V+bC8=; b=FjqNlA0Vzk76dZ8QKlF+V05AR
	M5YkNu4hbZ5TBZwu52nmhqzTJdEGlK8lE0oKmnI8ZYjGRwLmDIZEO+HQuhx5P2V1e7fB6Ixab938w
	rCNKsE6BxGFYIJFAMLzLIU4Ea40gF4AyGX/sQ7w2OiNMtXxDirkUFWNnntXdbudV7ufA4GsIAmUir
	XoRwCMp6OnrV/jzzqACY4tm23LDIzWTReIMzwnwl7WU+GrfXOMrIWNl6I3FimhIFFSYnWUeLGOZIm
	tVFZa82difv1JsF6kmDQLbmCu0iCBQn4iiRwS1ynrxN9v3BtKX++wFjzX+c6RuRLggJEnAbbJ7h7q
	D0i1OTwfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIlIa-0001M1-Vm; Thu, 17 Sep 2020 04:13:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIlIE-0001Em-UL
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 04:13:13 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9750121D41;
 Thu, 17 Sep 2020 04:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600315989;
 bh=pcuDTH9STD/mcWVjY9xk4V3olh0O7QdLKYJXVZYhQo8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WjOZn/iFKAnidcOCFe+ysawmOaq+wZI9ahIoTC+JpTCuGheF3T5BHxOwXh1kL3zCZ
 3bymu2kDogYINSoFHUgY+sOPCKrKs0XS/Hi5wozjy5gL6kj6NUPkMa8IZcCNDveVRT
 WvDDwm829kBpdreaI9WfPgzWgY3w2UuXhMRU3Kk4=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v3 06/13] fscrypt: adjust logging for in-creation inodes
Date: Wed, 16 Sep 2020 21:11:29 -0700
Message-Id: <20200917041136.178600-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917041136.178600-1-ebiggers@kernel.org>
References: <20200917041136.178600-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_001311_070272_A141CA97 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Now that a fscrypt_info may be set up for inodes that are currently
being created and haven't yet had an inode number assigned, avoid
logging confusing messages about "inode 0".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/crypto.c  | 4 +++-
 fs/crypto/keyring.c | 9 +++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 9212325763b0f..4ef3f714046aa 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -343,9 +343,11 @@ void fscrypt_msg(const struct inode *inode, const char *level,
 	va_start(args, fmt);
 	vaf.fmt = fmt;
 	vaf.va = &args;
-	if (inode)
+	if (inode && inode->i_ino)
 		printk("%sfscrypt (%s, inode %lu): %pV\n",
 		       level, inode->i_sb->s_id, inode->i_ino, &vaf);
+	else if (inode)
+		printk("%sfscrypt (%s): %pV\n", level, inode->i_sb->s_id, &vaf);
 	else
 		printk("%sfscrypt: %pV\n", level, &vaf);
 	va_end(args);
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index e74f239c44280..53cc552a7b8fd 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -817,6 +817,7 @@ static int check_for_busy_inodes(struct super_block *sb,
 	struct list_head *pos;
 	size_t busy_count = 0;
 	unsigned long ino;
+	char ino_str[50] = "";
 
 	spin_lock(&mk->mk_decrypted_inodes_lock);
 
@@ -838,11 +839,15 @@ static int check_for_busy_inodes(struct super_block *sb,
 	}
 	spin_unlock(&mk->mk_decrypted_inodes_lock);
 
+	/* If the inode is currently being created, ino may still be 0. */
+	if (ino)
+		snprintf(ino_str, sizeof(ino_str), ", including ino %lu", ino);
+
 	fscrypt_warn(NULL,
-		     "%s: %zu inode(s) still busy after removing key with %s %*phN, including ino %lu",
+		     "%s: %zu inode(s) still busy after removing key with %s %*phN%s",
 		     sb->s_id, busy_count, master_key_spec_type(&mk->mk_spec),
 		     master_key_spec_len(&mk->mk_spec), (u8 *)&mk->mk_spec.u,
-		     ino);
+		     ino_str);
 	return -EBUSY;
 }
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
