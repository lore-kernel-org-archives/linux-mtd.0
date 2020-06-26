Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FFBC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:09:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA126206A1
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q9gJ00Lw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA126206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=44yk6NJtnPsWjEiuKkubOQuzxxQPRBzf+CMWx6NWZrk=; b=Q9gJ00LwVellgUEM2PEnu+Md+
	6loPgtoavxQhQKw8NasroQpdsZ/hYr0gC2lkylurPoz0gn1847w0039JPmAc4DwMgr8aCouqg/0D9
	gMFpKYGaVgIqI4wCUsCHIONDZLV9kgQwj4M0eLTNg/Vy9Jxq8Acq1w3uEHcwUcqf3wo4MchsIjA48
	lmrsGuYy/Yfo2fmU5IvFkBBJNflj4BDic95q3WHYP4ZoAFeY+rck6+P/3f5GemMaBwjON7nSDIjKf
	hnf2QhKKuWcgbo2mOL7vkR6kgr5aMhRQys2v6mrNoqA8GUwH8hkDUFIkI5FQlccuAkoqL8PIVm6v1
	rwzsptp6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jon9e-0005HO-4S; Fri, 26 Jun 2020 12:08:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomXh-0003gb-8a
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 11:29:32 +0000
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <torbenh@linutronix.de>)
 id 1jomXd-0001ii-MH; Fri, 26 Jun 2020 13:29:09 +0200
From: Torben Hohn <torben.hohn@linutronix.de>
To: richard@nod.at
Subject: [PATCH v2 3/4] ubifs: sprinkle ubifs_assert(c,
 !c->ro_mount) in hmac auth
Date: Fri, 26 Jun 2020 13:29:06 +0200
Message-Id: <20200626112907.13201-4-torben.hohn@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626112907.13201-1-torben.hohn@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
MIME-Version: 1.0
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

make sure that the hmac ubifs authentication code, which
uses the hmac is only called, for rw mounts.

This allows to ensure that we are not in the new
read only authentication mode, when the hmac is accessed.

Signed-off-by: Torben Hohn <torben.hohn@linutronix.de>
---
 fs/ubifs/auth.c    | 1 +
 fs/ubifs/gc.c      | 1 +
 fs/ubifs/journal.c | 8 ++++++++
 fs/ubifs/replay.c  | 1 +
 fs/ubifs/sb.c      | 1 +
 fs/ubifs/super.c   | 5 +++++
 fs/ubifs/ubifs.h   | 8 ++++++++
 7 files changed, 25 insertions(+)

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index 52ce7a2218a5..15a1a18a42ed 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -570,6 +570,7 @@ int ubifs_hmac_wkm(struct ubifs_info *c, u8 *hmac)
 	int err;
 	const char well_known_message[] = "UBIFS";
 
+	ubifs_assert(c, !c->ro_mount);
 	if (!ubifs_authenticated(c))
 		return 0;
 
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 62cb3db44e6e..8009ceb362d2 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -410,6 +410,7 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
 			moved = 1;
 		}
 
+		ubifs_assert(c, !c->ro_mount);
 		if (ubifs_authenticated(c) && moved) {
 			struct ubifs_auth_node *auth;
 
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index e5ec1afe1c66..5c23846f2d40 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -80,6 +80,7 @@ static inline void zero_trun_node_unused(struct ubifs_trun_node *trun)
 
 static void ubifs_add_auth_dirt(struct ubifs_info *c, int lnum)
 {
+	ubifs_assert(c, !c->ro_mount);
 	if (ubifs_authenticated(c))
 		ubifs_add_dirt(c, lnum, ubifs_auth_node_sz(c));
 }
@@ -278,7 +279,9 @@ static int write_head(struct ubifs_info *c, int jhead, void *buf, int len,
 	dbg_jnl("jhead %s, LEB %d:%d, len %d",
 		dbg_jhead(jhead), *lnum, *offs, len);
 
+	ubifs_assert(c, !c->ro_mount);
 	if (ubifs_authenticated(c)) {
+
 		err = ubifs_hash_nodes(c, buf, len, c->jheads[jhead].log_hash);
 		if (err)
 			return err;
@@ -572,6 +575,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 
 	len = aligned_dlen + aligned_ilen + UBIFS_INO_NODE_SZ;
 	/* Make sure to also account for extended attributes */
+	ubifs_assert(c, !c->ro_mount);
 	if (ubifs_authenticated(c))
 		len += ALIGN(host_ui->data_len, 8) + ubifs_auth_node_sz(c);
 	else
@@ -778,6 +782,8 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 	}
 
 	dlen = UBIFS_DATA_NODE_SZ + out_len;
+
+	ubifs_assert(c, !c->ro_mount);
 	if (ubifs_authenticated(c))
 		write_len = ALIGN(dlen, 8) + auth_len;
 	else
@@ -860,6 +866,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 		write_len += UBIFS_INO_NODE_SZ * ui->xattr_cnt;
 	}
 
+	ubifs_assert(c, !c->ro_mount);
 	if (ubifs_authenticated(c))
 		write_len += ALIGN(ilen, 8) + ubifs_auth_node_sz(c);
 	else
@@ -1572,6 +1579,7 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 	/* Must make reservation before allocating sequence numbers */
 	len = UBIFS_TRUN_NODE_SZ + UBIFS_INO_NODE_SZ;
 
+	ubifs_assert(c, !c->ro_mount);
 	if (ubifs_authenticated(c))
 		len += ALIGN(dlen, 8) + ubifs_auth_node_sz(c);
 	else
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index b69ffac7e415..a3a37c196f56 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -595,6 +595,7 @@ static int authenticate_sleb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	u8 hash[UBIFS_HASH_ARR_SZ];
 	u8 hmac[UBIFS_HMAC_ARR_SZ];
 
+	ubifs_assert(c, !c->ro_mount);
 	if (!ubifs_authenticated(c))
 		return sleb->nodes_cnt;
 
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index d898ea5edd7c..c2104235fb56 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -176,6 +176,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 		sup_flags |= UBIFS_FLG_BIGLPT;
 	sup_flags |= UBIFS_FLG_DOUBLE_HASH;
 
+	ubifs_assert(c, !c->ro_mount);
 	if (ubifs_authenticated(c)) {
 		sup_flags |= UBIFS_FLG_AUTHENTICATION;
 		sup->hash_algo = cpu_to_le16(c->auth_hash_algo);
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 13175da14464..b41ca9ee5763 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1447,6 +1447,7 @@ static int mount_ubifs(struct ubifs_info *c)
 		}
 
 		if (c->need_recovery) {
+			ubifs_assert(c, !c->ro_mount);
 			if (!ubifs_authenticated(c)) {
 				err = ubifs_recover_size(c, true);
 				if (err)
@@ -1457,6 +1458,7 @@ static int mount_ubifs(struct ubifs_info *c)
 			if (err)
 				goto out_orphans;
 
+			ubifs_assert(c, !c->ro_mount);
 			if (ubifs_authenticated(c)) {
 				err = ubifs_recover_size(c, false);
 				if (err)
@@ -1703,6 +1705,8 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		err = ubifs_write_rcvrd_mst_node(c);
 		if (err)
 			goto out;
+
+		ubifs_assert(c, !c->ro_mount);
 		if (!ubifs_authenticated(c)) {
 			err = ubifs_recover_size(c, true);
 			if (err)
@@ -1788,6 +1792,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		if (err)
 			goto out;
 
+		ubifs_assert(c, !c->ro_mount);
 		if (ubifs_authenticated(c)) {
 			err = ubifs_recover_size(c, false);
 			if (err)
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 80e2800927ec..79880cf0e1a0 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1650,6 +1650,8 @@ int __ubifs_node_insert_hmac(const struct ubifs_info *c, void *buf,
 static inline int ubifs_node_insert_hmac(const struct ubifs_info *c, void *buf,
 					  int len, int ofs_hmac)
 {
+	ubifs_assert(c, !c->ro_mount);
+
 	if (ubifs_authenticated(c))
 		return __ubifs_node_insert_hmac(c, buf, len, ofs_hmac);
 	else
@@ -1661,6 +1663,8 @@ int __ubifs_node_verify_hmac(const struct ubifs_info *c, const void *buf,
 static inline int ubifs_node_verify_hmac(const struct ubifs_info *c,
 					 const void *buf, int len, int ofs_hmac)
 {
+	ubifs_assert(c, !c->ro_mount);
+
 	if (ubifs_authenticated(c))
 		return __ubifs_node_verify_hmac(c, buf, len, ofs_hmac);
 	else
@@ -1677,6 +1681,8 @@ static inline int ubifs_node_verify_hmac(const struct ubifs_info *c,
  */
 static inline int ubifs_auth_node_sz(const struct ubifs_info *c)
 {
+	ubifs_assert(c, !c->ro_mount);
+
 	if (ubifs_authenticated(c))
 		return sizeof(struct ubifs_auth_node) + c->hmac_desc_len;
 	else
@@ -1694,6 +1700,8 @@ static inline int ubifs_shash_copy_state(const struct ubifs_info *c,
 					   struct shash_desc *src,
 					   struct shash_desc *target)
 {
+	ubifs_assert(c, !c->ro_mount);
+
 	if (ubifs_authenticated(c))
 		return __ubifs_shash_copy_state(c, src, target);
 	else
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
