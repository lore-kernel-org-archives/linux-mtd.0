Return-Path: <SRS0=bf65=3J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683BCC32771
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 22:35:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E84922522
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 22:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AiY72/BF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxGsA6XS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E84922522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcjcYIdnkqmK7ePaK37hpk3RlPJpJZPJxtosLoWpppQ=; b=AiY72/BFraquxN
	Ho0yn/zLHX4J0W10ETgxC4FRRFcbX8UQd8fguxoxunWjOxSrBT6b8zyXQvERfMCQEppWOZrEPcUBy
	T4/VaZtKxUPV5V7RAsDjWTEp0q6LetCSYKw++BYx8bGQogPtmxAbdD+30cZgdIKO/Og6XmXCN1oxn
	V+d3dQ3WMOOJPWOdEJS90pn1+1xfUnWD3BIGr1fBwnSF1w7RJhj3o6TKRbSx9mTYuOetqOByFnH1P
	ofMefwKgTKixVtahNQOTTLOSpX2fR/mubN5qGbQUKKJyCgnSp733gvvL5zLPi0+StCl2cnYl7gtNh
	MQBvWawKlZ1fxGyEKH/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itfdz-0000rd-1B; Mon, 20 Jan 2020 22:35:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itfch-0006r3-Jd
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2020 22:34:20 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE59C24654;
 Mon, 20 Jan 2020 22:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579559659;
 bh=a6AglMzuzSADbIykjFsh6WiXfUA9a8BSXSse5YpowJc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CxGsA6XSOH79/Ez1YYKFPwXEuecFLee2D4d34j5HPAbu0KJ494XC9qdVSW62bCxh/
 gg3un57dpwbCJT0BoaNxddQ6mXy41R5m3H+nmpvn5XDzbEb64fyS8RSpBsVTkZZBTi
 etgWdPATptkXqIamnw2Ms4bOtO2E8kcWZ4mwWCDc=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v5 5/6] ubifs: allow both hash and disk name to be provided in
 no-key names
Date: Mon, 20 Jan 2020 14:32:00 -0800
Message-Id: <20200120223201.241390-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120223201.241390-1-ebiggers@kernel.org>
References: <20200120223201.241390-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_143419_670968_A2E7CF39 
X-CRM114-Status: GOOD (  13.83  )
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
Cc: Daniel Rosenberg <drosen@google.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

In order to support a new dirhash method that is a secret-keyed hash
over the plaintext filenames (which will be used by encrypted+casefolded
directories on ext4 and f2fs), fscrypt will be switching to a new no-key
name format that always encodes the dirhash in the name.

UBIFS isn't happy with this because it has assertions that verify that
either the hash or the disk name is provided, not both.

Change it to use the disk name if one is provided, even if a hash is
available too; else use the hash.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/dir.c     | 4 +---
 fs/ubifs/journal.c | 4 ++--
 fs/ubifs/key.h     | 1 -
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5f937226976a6..ef85ec167a843 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -225,9 +225,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 		goto done;
 	}
 
-	if (nm.hash) {
-		ubifs_assert(c, fname_len(&nm) == 0);
-		ubifs_assert(c, fname_name(&nm) == NULL);
+	if (fname_name(&nm) == NULL) {
 		if (nm.hash & ~UBIFS_S_KEY_HASH_MASK)
 			goto done; /* ENOENT */
 		dent_key_init_hash(c, &key, dir->i_ino, nm.hash);
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index a38e18d3ef1d7..3bf8b1fda9d74 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -588,7 +588,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 
 	if (!xent) {
 		dent->ch.node_type = UBIFS_DENT_NODE;
-		if (nm->hash)
+		if (fname_name(nm) == NULL)
 			dent_key_init_hash(c, &dent_key, dir->i_ino, nm->hash);
 		else
 			dent_key_init(c, &dent_key, dir->i_ino, nm);
@@ -646,7 +646,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	ubifs_add_auth_dirt(c, lnum);
 
 	if (deletion) {
-		if (nm->hash)
+		if (fname_name(nm) == NULL)
 			err = ubifs_tnc_remove_dh(c, &dent_key, nm->minor_hash);
 		else
 			err = ubifs_tnc_remove_nm(c, &dent_key, nm);
diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
index afa704ff5ca08..8142d9d6fe5da 100644
--- a/fs/ubifs/key.h
+++ b/fs/ubifs/key.h
@@ -150,7 +150,6 @@ static inline void dent_key_init(const struct ubifs_info *c,
 	uint32_t hash = c->key_hash(fname_name(nm), fname_len(nm));
 
 	ubifs_assert(c, !(hash & ~UBIFS_S_KEY_HASH_MASK));
-	ubifs_assert(c, !nm->hash && !nm->minor_hash);
 	key->u32[0] = inum;
 	key->u32[1] = hash | (UBIFS_DENT_KEY << UBIFS_S_KEY_HASH_BITS);
 }
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
