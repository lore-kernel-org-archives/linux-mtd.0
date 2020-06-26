Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3654C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:16:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5A920775
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:16:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YnJrtUAN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="stP8awSw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5A920775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rxRZtMMXUW6DPVHh3Me7dLRaXHCSRLvLFP1sM2yDPyo=; b=YnJrtUAN2QJQoSt4Mclcw7TVi
	Q/aftgVRcry85Te/NCxA3f6qW41swckViRvfQxWdcsOCZk3o9pNzFnYPRzp0umedB9vN+a4vcQkd6
	AFznF0HEyIvfdyVV3jXfOr7PWCX1H/m5nSHijUQ8MC9+2S4P62I1Q2uuBeX//1+moXVcVvVsEdJSt
	2a3IlqsYHN24T8ubz++c1Zc+SYeE9KMPJCgIe11QhUTmCWLmG6Qeebn7j4z/NcgNBWEq6IIYoLvCP
	w2Jr85W9v+1pCs527KC8QnJ5H3n6HjWyqldXv+HoWB2Id3B5AjDrsNnktKw2Rtg0BCafWJoEG1526
	yPZAsRJLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jonG1-0008BE-Mz; Fri, 26 Jun 2020 12:15:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomo4-0002pk-5k
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 11:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=oFvUtD7GbmnC0KRkgpu7JuoaYx5RgUlswPfZZVRrS/4=; b=stP8awSwPUBBo52obff6SE9rhU
 wD6oDo/zkiGkusoX0FjsCwBWt5RdIUS/yKRMlShgxBL4b9nv46NuLQN1bevHiB4waj6UHawC6RA7n
 bzESOzHXlOVaLrwWKjrcuLBbQMkXHiJzYJpenjd3/c320+TlEusmy8MptMXSrVMQ0M38GiqVZbKht
 VPj9PWK2vediz/Go0AF82gLxdXBlCJOWgf1lblIrq9hvy+y4R6Z+AJBc7vyV2oCo9l/+Sx13sleTy
 XJR6Z6AlNTppVtq2ncsY20SGAKFFFnPLs9bYpntRQoeO6EtOb2qSxO+muo18RcF0pMNyFSIlCJvOY
 K0Nva8/g==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomXe-0007oA-QS
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 11:29:28 +0000
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <torbenh@linutronix.de>)
 id 1jomXd-0001iD-4j; Fri, 26 Jun 2020 13:29:09 +0200
From: Torben Hohn <torben.hohn@linutronix.de>
To: richard@nod.at
Subject: [PATCH v2 2/4] ubifs: support authentication, for ro mount,
 when no key is given
Date: Fri, 26 Jun 2020 13:29:05 +0200
Message-Id: <20200626112907.13201-3-torben.hohn@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626112907.13201-1-torben.hohn@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_122912_353253_5590FAE5 
X-CRM114-Status: GOOD (  17.23  )
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
Cc: bigeasy@linutronix.de, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 s.hauer@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ubifs authentication requires a hmac key, even when a
filesystem is mounted read-only.

Implement ubifs_init_authentication_read_only(),
which only allocates the structures needed for validating
the hashes.

Call ubifs_init_authentication_read_only() when no
auth_key_name is specified, and the filesystem is to be
mounted read only.

Fixup __ubifs_exit_authentication() to free c->hmac_tfm only
when !c->ro_mount.

Signed-off-by: Torben Hohn <torben.hohn@linutronix.de>
---
 fs/ubifs/auth.c  | 61 +++++++++++++++++++++++++++++++++++++++++++++++-
 fs/ubifs/sb.c    |  4 ++++
 fs/ubifs/super.c | 19 ++++++++++++++-
 fs/ubifs/ubifs.h |  1 +
 4 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index cc5c0abfd536..52ce7a2218a5 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -248,6 +248,61 @@ int ubifs_sb_verify_signature(struct ubifs_info *c,
 	return err;
 }
 
+/**
+ * ubifs_init_authentication_read_only - init only the read_only parts
+ *
+ * @c: UBIFS file-system description object
+ *
+ * This function returns 0 for success or a negative error code otherwise.
+ */
+
+int ubifs_init_authentication_read_only(struct ubifs_info *c)
+{
+	int err;
+
+	if (!c->auth_hash_name) {
+		ubifs_err(c, "authentication hash name needed with authentication");
+		return -EINVAL;
+	}
+
+	c->auth_hash_algo = match_string(hash_algo_name, HASH_ALGO__LAST,
+					 c->auth_hash_name);
+	if ((int)c->auth_hash_algo < 0) {
+		ubifs_err(c, "Unknown hash algo %s specified",
+			  c->auth_hash_name);
+		return -EINVAL;
+	}
+
+	c->hash_tfm = crypto_alloc_shash(c->auth_hash_name, 0, 0);
+	if (IS_ERR(c->hash_tfm)) {
+		err = PTR_ERR(c->hash_tfm);
+		ubifs_err(c, "Can not allocate %s: %d",
+			  c->auth_hash_name, err);
+		goto out;
+	}
+
+	c->hash_len = crypto_shash_digestsize(c->hash_tfm);
+	if (c->hash_len > UBIFS_HASH_ARR_SZ) {
+		ubifs_err(c, "hash %s is bigger than maximum allowed hash size (%d > %d)",
+			  c->auth_hash_name, c->hash_len, UBIFS_HASH_ARR_SZ);
+		err = -EINVAL;
+		goto out_free_hash;
+	}
+
+	c->authenticated = true;
+
+	c->log_hash = ubifs_hash_get_desc(c);
+	if (IS_ERR(c->log_hash))
+		goto out_free_hash;
+
+	err = 0;
+out_free_hash:
+	if (err)
+		crypto_free_shash(c->hash_tfm);
+out:
+	return err;
+}
+
 /**
  * ubifs_init_authentication - initialize UBIFS authentication support
  * @c: UBIFS file-system description object
@@ -367,9 +422,13 @@ void __ubifs_exit_authentication(struct ubifs_info *c)
 	if (!ubifs_authenticated(c))
 		return;
 
-	crypto_free_shash(c->hmac_tfm);
 	crypto_free_shash(c->hash_tfm);
 	kfree(c->log_hash);
+
+	if (c->ro_mount)
+		return;
+
+	crypto_free_shash(c->hmac_tfm);
 }
 
 /**
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 4b4b65b48c57..d898ea5edd7c 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -583,6 +583,10 @@ static int authenticate_sb_node(struct ubifs_info *c,
 	if (ubifs_hmac_zero(c, sup->hmac)) {
 		err = ubifs_sb_verify_signature(c, sup);
 	} else {
+		if (!c->hmac_tfm) {
+			ubifs_err(c, "HMAC authenticated FS found, but no key given");
+			return -EINVAL;
+		}
 		err = ubifs_hmac_wkm(c, hmac_wkm);
 		if (err)
 			return err;
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7fc2f3f07c16..13175da14464 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1291,6 +1291,23 @@ static int mount_ubifs(struct ubifs_info *c)
 			err = -EINVAL;
 			goto out_free;
 		}
+	} else if (c->auth_hash_name) {
+		if (!c->ro_mount) {
+			ubifs_err(c, "auth_hash_name without auth_key_name, but no ro mount");
+			err = -EINVAL;
+			goto out_free;
+		}
+
+		if (IS_ENABLED(CONFIG_UBIFS_FS_AUTHENTICATION)) {
+			err = ubifs_init_authentication_read_only(c);
+			if (err)
+				goto out_free;
+		} else {
+			ubifs_err(c, "auth_hash_name, but UBIFS is built without"
+				  " authentication support");
+			err = -EINVAL;
+			goto out_free;
+		}
 	}
 
 	err = ubifs_read_superblock(c);
@@ -1383,7 +1400,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	 * in the superblock, we can update the offline signed
 	 * superblock with a HMAC version,
 	 */
-	if (ubifs_authenticated(c) && ubifs_hmac_zero(c, c->sup_node->hmac)) {
+	if (!c->ro_mount && c->authenticated && ubifs_hmac_zero(c, c->sup_node->hmac)) {
 		err = ubifs_hmac_wkm(c, c->sup_node->hmac_wkm);
 		if (err)
 			goto out_lpt;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 95ed45022e51..80e2800927ec 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1607,6 +1607,7 @@ static inline int ubifs_node_check_hash(const struct ubifs_info *c,
 		return 0;
 }
 
+int ubifs_init_authentication_read_only(struct ubifs_info *c);
 int ubifs_init_authentication(struct ubifs_info *c);
 void __ubifs_exit_authentication(struct ubifs_info *c);
 static inline void ubifs_exit_authentication(struct ubifs_info *c)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
