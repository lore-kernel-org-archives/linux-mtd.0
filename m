Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BA3606A31C
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 03:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zrUITb9d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NKlhimWC3YxYRkBhWX+W39yonKH9YbZrkN9mIQErVjM=; b=zrUITb9dIxjXvMnQrpjxHVcFvU
	pKj+yoBd9BQhavQYZi2QElwUs7fnCZsY/mVpkiYWGFi4Kvj9H8BFbjKJO3TzfgLnHXG0lN/neP5/Q
	N/6QwGL9hhxm9nX4gaEQOXmX4JP+CxDPiigdNCgpiM7mxexMtIVL31QQ6olmXYo4bmm4NbI9Z6j8N
	oOC8ChZpCJu1SMP56cOJ5KCRk5egS4yTjhB0gNaXlsd5iZq0v5S/LCkO+bxov8btaIyEI6Uk1RqKI
	PLPV37sF91w23onlW8UGilfpoX1LCriMQ+wz/+TKqEVKW/5KU82CW1HcIHpT0aGfWHfvjcAXN6vW+
	Gin7J8NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMdXb-0000000AleV-32jB;
	Fri, 30 Oct 2026 03:44:31 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMdXX-0000000AldQ-3j3f
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 03:44:29 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jG6R73PgXz8Xrrd;
	Fri, 30 Oct 2026 11:44:19 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 69U3i57m012676;
	Fri, 30 Oct 2026 11:44:05 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 30 Oct 2026 11:44:06 +0800 (CST)
X-Zmail-TransId: 2afb6ae41286f05-83c2a
X-Mailer: Zmail v1.0
Message-ID: <20261030114406371EZw_orIqSRlCTxnz_L39Z@zte.com.cn>
Date: Fri, 30 Oct 2026 11:44:06 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <richard@nod.at>, <linux-mtd@lists.infradead.org>
Cc: <chengzhihao1@huawei.com>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSB1YmlmczogcHJvcGFnYXRlIHViaWZzX3NoYXNoX2NvcHlfc3RhdGUoKSBlcnJvcnM=?=
X-MAIL: mse-fl2.zte.com.cn 69U3i57m012676
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 30 Oct 2026 11:44:19 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE41293.002/4jG6R73PgXz8Xrrd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_204428_095261_8F4DAD13 
X-CRM114-Status: GOOD (  10.34  )
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

ubifs_shash_copy_state() duplicates the rolling hash state with
crypto_shash_export() and crypto_shash_import().  The export buffer is
allocated with kmalloc(), so the function can fail with -ENOMEM, and
crypto_shash_import() can fail as well.

Five callers ignore the return value.  The target descriptor then has no
valid state, and the crypto_shash_final() that follows computes a digest
from uninitialized data.  When preparing an auth node this stores a
wrong HMAC on the media, so the affected journal head no longer
authenticates after a remount.  During replay it makes the verification
of a valid image fail with -EPERM, and in replay_bud() and
add_replay_bud() it leaves the replay hash state inconsistent with the
media, which corrupts the auth nodes written by later commits.

Check the error at all five call sites and propagate it.  In
add_replay_bud() the descriptor belongs to the new bud, so free it on
the added error path.

Fixes: 6a98bc4614de ("ubifs: Add authentication nodes to journal")
Fixes: da8ef65f9573 ("ubifs: Authenticate replayed journal")
Cc: stable@vger.kernel.org
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index 1f770795ee70..62dfacfb6d6b 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -70,7 +70,10 @@ int ubifs_prepare_auth_node(struct ubifs_info *c, void *node,
 		SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);

 		hash_desc->tfm = c->hash_tfm;
-		ubifs_shash_copy_state(c, inhash, hash_desc);
+
+		err = ubifs_shash_copy_state(c, inhash, hash_desc);
+		if (err)
+			return err;

 		err = crypto_shash_final(hash_desc, hash);
 		if (err)
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index c6edcbf35ebc..42cadf558a4f 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -412,7 +412,11 @@ int ubifs_log_start_commit(struct ubifs_info *c, int *ltail_lnum)
 					 UBIFS_REF_NODE_SZ);
 		if (err)
 			goto out;
-		ubifs_shash_copy_state(c, c->log_hash, c->jheads[i].log_hash);
+
+		err = ubifs_shash_copy_state(c, c->log_hash,
+					     c->jheads[i].log_hash);
+		if (err)
+			goto out;
 	}

 	ubifs_pad(c, buf + len, ALIGN(len, c->min_io_size) - len);
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 263045e05cf1..0b82c67a2dcc 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -566,10 +566,14 @@ authenticate_sleb_hash(struct ubifs_info *c,
 		       struct shash_desc *log_hash, u8 *hash)
 {
 	SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
+	int err;

 	hash_desc->tfm = c->hash_tfm;

-	ubifs_shash_copy_state(c, log_hash, hash_desc);
+	err = ubifs_shash_copy_state(c, log_hash, hash_desc);
+	if (err)
+		return err;
+
 	return crypto_shash_final(hash_desc, hash);
 }

@@ -694,8 +698,10 @@ static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 		goto out;
 	}

-	ubifs_shash_copy_state(c, b->bud->log_hash,
-			       c->jheads[b->bud->jhead].log_hash);
+	err = ubifs_shash_copy_state(c, b->bud->log_hash,
+				     c->jheads[b->bud->jhead].log_hash);
+	if (err)
+		goto out;

 	/*
 	 * The bud does not have to start from offset zero - the beginning of
@@ -915,7 +921,9 @@ static int add_replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
 		goto out;
 	}

-	ubifs_shash_copy_state(c, c->log_hash, bud->log_hash);
+	err = ubifs_shash_copy_state(c, c->log_hash, bud->log_hash);
+	if (err)
+		goto out_free_log_hash;

 	ubifs_add_bud(c, bud);

@@ -924,6 +932,8 @@ static int add_replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
 	list_add_tail(&b->list, &c->replay_buds);

 	return 0;
+out_free_log_hash:
+	kfree(bud->log_hash);
 out:
 	kfree(bud);
 	kfree(b);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
