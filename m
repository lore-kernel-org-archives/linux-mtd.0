Return-Path: <SRS0=tiqS=UL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C06C31E46
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 15:21:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 348C120874
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 15:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NA2sSIHT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvV+IALD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 348C120874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EcC44j1/CXVPiyFhVA9AIAIFctkLHWLnr0qaiIsukNg=; b=NA2sSIHTLsm6Qc
	ZjrhHifnVT9BSSlGbOvzMz8Bolfhw2E+TIpzQ0EHFt5fCYVCmdY8CC+gDbyzuPY6r/FMVegSfWV5M
	8S7kej/5HELBfsrJX+KBn4oBSr0kUBRO29f9rjhojzgogI8XGlXPoM8HNMyfLbZdiFmYaPU+8zLWI
	O0cBYcZTq1ckAufBchxKY3NUNViQ7crWGJTA3av24kaWEkJFwE09V1OsbhYPQdL7gslNZTtPTklZ3
	bgRFi77Np0kMu7IksRizlskLntYoGjZMs3TCg0jD3PCTHLCFDGGPKDPf5qIvpOXGrzENkFVnp0lB7
	cHzsRsAINV0xK+Pz8xdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb544-0004Br-Fi; Wed, 12 Jun 2019 15:21:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb540-0004BI-AI
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2019 15:21:26 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56A6C20874;
 Wed, 12 Jun 2019 15:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560352883;
 bh=6Nfp7fJDMTqfCeIijjYOe6WIsDjLVF2KMWaqPHeyzIE=;
 h=Date:From:To:Cc:Subject:From;
 b=CvV+IALD62j/4vVA3AcA1MkO13SbQTUCzv1XcGzZBoONU2OMFJOL65Vb6GD7nRyFX
 8q2uhfd+ZJhUQHv4OOTv4aaq3pMR+GOoRqN4MEsAiWRMSF1HKPbGRmP11MgnyBoYAw
 P4z4gIoml+F7kltGQyiKQJaOTDVLcYBYkxcGj5j8=
Date: Wed, 12 Jun 2019 17:21:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH] ubifs: no need to check return value of debugfs_create
 functions
Message-ID: <20190612152120.GA17450@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_082124_394098_3100CA67 
X-CRM114-Status: GOOD (  18.06  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/ubifs/debug.c | 167 ++++++++++++-----------------------------------
 fs/ubifs/debug.h |   4 +-
 fs/ubifs/super.c |   9 +--
 3 files changed, 45 insertions(+), 135 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 3a2613038e88..57e6fcb043ca 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2812,115 +2812,69 @@ static const struct file_operations dfs_fops = {
  * dbg_debugfs_init_fs - initialize debugfs for UBIFS instance.
  * @c: UBIFS file-system description object
  *
- * This function creates all debugfs files for this instance of UBIFS. Returns
- * zero in case of success and a negative error code in case of failure.
+ * This function creates all debugfs files for this instance of UBIFS.
  *
  * Note, the only reason we have not merged this function with the
  * 'ubifs_debugging_init()' function is because it is better to initialize
  * debugfs interfaces at the very end of the mount process, and remove them at
  * the very beginning of the mount process.
  */
-int dbg_debugfs_init_fs(struct ubifs_info *c)
+void dbg_debugfs_init_fs(struct ubifs_info *c)
 {
 	int err, n;
 	const char *fname;
-	struct dentry *dent;
 	struct ubifs_debug_info *d = c->dbg;
 
-	if (!IS_ENABLED(CONFIG_DEBUG_FS))
-		return 0;
-
 	n = snprintf(d->dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DIR_NAME,
 		     c->vi.ubi_num, c->vi.vol_id);
 	if (n == UBIFS_DFS_DIR_LEN) {
 		/* The array size is too small */
 		fname = UBIFS_DFS_DIR_NAME;
-		dent = ERR_PTR(-EINVAL);
-		goto out;
+		return;
 	}
 
 	fname = d->dfs_dir_name;
-	dent = debugfs_create_dir(fname, dfs_rootdir);
-	if (IS_ERR_OR_NULL(dent))
-		goto out;
-	d->dfs_dir = dent;
+	d->dfs_dir = debugfs_create_dir(fname, dfs_rootdir);
 
 	fname = "dump_lprops";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c, &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_dump_lprops = dent;
+	d->dfs_dump_lprops = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c,
+						 &dfs_fops);
 
 	fname = "dump_budg";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c, &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_dump_budg = dent;
+	d->dfs_dump_budg = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c,
+					       &dfs_fops);
 
 	fname = "dump_tnc";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c, &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_dump_tnc = dent;
+	d->dfs_dump_tnc = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c,
+					      &dfs_fops);
 
 	fname = "chk_general";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_chk_gen = dent;
+	d->dfs_chk_gen = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
+					     d->dfs_dir, c, &dfs_fops);
 
 	fname = "chk_index";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_chk_index = dent;
+	d->dfs_chk_index = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
+					       d->dfs_dir, c, &dfs_fops);
 
 	fname = "chk_orphans";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_chk_orph = dent;
+	d->dfs_chk_orph = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
+					      d->dfs_dir, c, &dfs_fops);
 
 	fname = "chk_lprops";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_chk_lprops = dent;
+	d->dfs_chk_lprops = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
+						d->dfs_dir, c, &dfs_fops);
 
 	fname = "chk_fs";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_chk_fs = dent;
+	d->dfs_chk_fs = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
+					    d->dfs_dir, c, &dfs_fops);
 
 	fname = "tst_recovery";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_tst_rcvry = dent;
+	d->dfs_tst_rcvry = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
+					       d->dfs_dir, c, &dfs_fops);
 
 	fname = "ro_error";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_ro_error = dent;
-
-	return 0;
-
-out_remove:
-	debugfs_remove_recursive(d->dfs_dir);
-out:
-	err = dent ? PTR_ERR(dent) : -ENODEV;
-	ubifs_err(c, "cannot create \"%s\" debugfs file or directory, error %d\n",
-		  fname, err);
-	return err;
+	d->dfs_ro_error = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
+					      d->dfs_dir, c, &dfs_fops);
 }
 
 /**
@@ -2929,8 +2883,7 @@ int dbg_debugfs_init_fs(struct ubifs_info *c)
  */
 void dbg_debugfs_exit_fs(struct ubifs_info *c)
 {
-	if (IS_ENABLED(CONFIG_DEBUG_FS))
-		debugfs_remove_recursive(c->dbg->dfs_dir);
+	debugfs_remove_recursive(c->dbg->dfs_dir);
 }
 
 struct ubifs_global_debug_info ubifs_dbg;
@@ -3006,75 +2959,38 @@ static const struct file_operations dfs_global_fops = {
  *
  * UBIFS uses debugfs file-system to expose various debugging knobs to
  * user-space. This function creates "ubifs" directory in the debugfs
- * file-system. Returns zero in case of success and a negative error code in
- * case of failure.
+ * file-system.
  */
-int dbg_debugfs_init(void)
+void dbg_debugfs_init(void)
 {
-	int err;
 	const char *fname;
-	struct dentry *dent;
-
-	if (!IS_ENABLED(CONFIG_DEBUG_FS))
-		return 0;
 
 	fname = "ubifs";
-	dent = debugfs_create_dir(fname, NULL);
-	if (IS_ERR_OR_NULL(dent))
-		goto out;
-	dfs_rootdir = dent;
+	dfs_rootdir = debugfs_create_dir(fname, NULL);
 
 	fname = "chk_general";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
-				   &dfs_global_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	dfs_chk_gen = dent;
+	dfs_chk_gen = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir,
+					  NULL, &dfs_global_fops);
 
 	fname = "chk_index";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
-				   &dfs_global_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	dfs_chk_index = dent;
+	dfs_chk_index = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
+					    dfs_rootdir, NULL, &dfs_global_fops);
 
 	fname = "chk_orphans";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
-				   &dfs_global_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	dfs_chk_orph = dent;
+	dfs_chk_orph = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
+					   dfs_rootdir, NULL, &dfs_global_fops);
 
 	fname = "chk_lprops";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
-				   &dfs_global_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	dfs_chk_lprops = dent;
+	dfs_chk_lprops = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
+					     dfs_rootdir, NULL, &dfs_global_fops);
 
 	fname = "chk_fs";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
-				   &dfs_global_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	dfs_chk_fs = dent;
+	dfs_chk_fs = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir,
+					 NULL, &dfs_global_fops);
 
 	fname = "tst_recovery";
-	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
-				   &dfs_global_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	dfs_tst_rcvry = dent;
-
-	return 0;
-
-out_remove:
-	debugfs_remove_recursive(dfs_rootdir);
-out:
-	err = dent ? PTR_ERR(dent) : -ENODEV;
-	pr_err("UBIFS error (pid %d): cannot create \"%s\" debugfs file or directory, error %d\n",
-	       current->pid, fname, err);
-	return err;
+	dfs_tst_rcvry = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
+					    dfs_rootdir, NULL, &dfs_global_fops);
 }
 
 /**
@@ -3082,8 +2998,7 @@ int dbg_debugfs_init(void)
  */
 void dbg_debugfs_exit(void)
 {
-	if (IS_ENABLED(CONFIG_DEBUG_FS))
-		debugfs_remove_recursive(dfs_rootdir);
+	debugfs_remove_recursive(dfs_rootdir);
 }
 
 void ubifs_assert_failed(struct ubifs_info *c, const char *expr,
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 64c6977c189b..c6c8f1b62af5 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -309,9 +309,9 @@ int dbg_leb_unmap(struct ubifs_info *c, int lnum);
 int dbg_leb_map(struct ubifs_info *c, int lnum);
 
 /* Debugfs-related stuff */
-int dbg_debugfs_init(void);
+void dbg_debugfs_init(void);
 void dbg_debugfs_exit(void);
-int dbg_debugfs_init_fs(struct ubifs_info *c);
+void dbg_debugfs_init_fs(struct ubifs_info *c);
 void dbg_debugfs_exit_fs(struct ubifs_info *c);
 
 #endif /* !__UBIFS_DEBUG_H__ */
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 04b8ecfd3470..2429906bd681 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1477,9 +1477,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_infos;
 
-	err = dbg_debugfs_init_fs(c);
-	if (err)
-		goto out_infos;
+	dbg_debugfs_init_fs(c);
 
 	c->mounting = 0;
 
@@ -2364,9 +2362,7 @@ static int __init ubifs_init(void)
 	if (err)
 		goto out_shrinker;
 
-	err = dbg_debugfs_init();
-	if (err)
-		goto out_compr;
+	dbg_debugfs_init();
 
 	err = register_filesystem(&ubifs_fs_type);
 	if (err) {
@@ -2378,7 +2374,6 @@ static int __init ubifs_init(void)
 
 out_dbg:
 	dbg_debugfs_exit();
-out_compr:
 	ubifs_compressors_exit();
 out_shrinker:
 	unregister_shrinker(&ubifs_shrinker_info);
-- 
2.22.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
