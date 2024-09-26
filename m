Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9657CDE036
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 20:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6VgDWLvYjSU1zZMc7mPBYeA135Xdbs3YR6ojYgYiuOg=; b=qLe44i5ZF2qamC
	k3ypKrhuBl3VIkdPtNxpQjut9xZF/jnszhhT1R0/68XsdnZwllargC6z2RQ9kaCKdGZHS9jOZY/oA
	8uk5ombwm03V6MZVQIpCmet3ddomeFEbW0az1Qv47IOpqRyK8ZkKwRKMfnXtUu+J1NuApNhJGb5wN
	An5L7xgHcmbkFgrl6xt+VvVeCNGPFwZ3avI0StIMGBnk8q2aI5vmFg1O6dhJQJrQ9QXK8RZjPOSOE
	3qd1CDTVbbeW2FhpnsU/B0PzLaMEBmDc5a5X09okzh+AQtWrjH2BKpBVNmlrGt2CwN83QrOlM/eGE
	24K2FVpwvRUWjVug6wew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stvFa-00000009Jtb-3Kn5;
	Thu, 26 Sep 2024 20:38:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stvFV-00000009Jsn-1Qgz
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 20:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727383081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7dC3f9Wu9U/IKSiNB3TDjh9vul0WcToya2Uw+Cxmobw=;
	b=Nys6bLFcfI4wAH4dCnaJPC8+96zuzEuEJXs3VfE8DS6WkJ5XV1EZeefLjiiCZeL4MhcQGw
	9rRxGVDLmZkFUYJoxGAZ2P6RIoFEE5jvjPeybD0KvnC/f1cyy8K+uTzZvDX1AJKLzvluyE
	hYivcvn6Bdo69gkPxMTNo/OjA3gAo/g=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-zwAbj_DwNtGaPEtzS7n5WQ-1; Thu, 26 Sep 2024 16:36:23 -0400
X-MC-Unique: zwAbj_DwNtGaPEtzS7n5WQ-1
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-82aa94d4683so159365039f.3
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 13:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727382982; x=1727987782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dC3f9Wu9U/IKSiNB3TDjh9vul0WcToya2Uw+Cxmobw=;
        b=XRW1XcGg2LC7gAFqTjgnbsaTjST2iWsrq2vcTfA0ud+XJUg+s9cPw1VTSxNiJJlai9
         t7iTyzYozoU2WWlDyAbPWQ4L3WDllZMhI3BtN5qsSs0WFdj12U0qZu1v/eCayRLREzEP
         375H1m96h5sOtSnU687c4adm1KZJSppPhx0Do0HkDvD3zTSHYKNC/V5e44J3jzWPt7Ei
         2IpcgXE8GWFOE3EZJqKJRculvCMGv/gQNMXEImmqMn5LV+LEEsX2KDGbT81GYZ0QYhhS
         PwVyAri2TcbSccAJVFdmO7NyrF0yOp5jYJW30dsJJujACRwmIeJlRcsGF1Tl8ZDp0g85
         92bg==
X-Gm-Message-State: AOJu0YyFe9u8kxuG45ypA7VS5J6VR/EEM+H3EMWL2GqG5O+rd6v1sXbS
	EkLYH4m4AM06EP7nV5xlrfo40h+xWPpBl+q05l7T57DOgdUHQPAqeJi/RC/G+QpRA5MS8pDVydO
	bDjgCZFJiCihIRF82kasGURYtaM2u841wDwMnf4d7XT2q1X3xEtz7Xq14DWEqH6tN8adN1b8CsA
	imrHqhzyEsGnaZXwsjd17NFCP0bjgFDVmNv75aq3s0wYQuzg==
X-Received: by 2002:a05:6e02:b49:b0:3a0:ae35:f2eb with SMTP id e9e14a558f8ab-3a3451aad68mr6896825ab.19.1727382982247;
        Thu, 26 Sep 2024 13:36:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtaAL3++B5rj8mVjtXohCmVnjVa3JsUZPfOXwwGDhgAN6wxJeVvKktsS5+pTis6ATxuxN8tQ==
X-Received: by 2002:a05:6e02:b49:b0:3a0:ae35:f2eb with SMTP id e9e14a558f8ab-3a3451aad68mr6896545ab.19.1727382981720;
        Thu, 26 Sep 2024 13:36:21 -0700 (PDT)
Received: from fedora-rawhide.sandeen.net (67-4-202-127.mpls.qwest.net. [67.4.202.127])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d8888c2b7csm119917173.103.2024.09.26.13.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 13:36:21 -0700 (PDT)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-mtd@lists.infradead.org
Cc: brauner@kernel.org,
	David Howells <dhowells@redhat.com>,
	Eric Sandeen <sandeen@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH] ubifs: Convert ubifs to use the new mount API
Date: Thu, 26 Sep 2024 15:36:04 -0500
Message-ID: <20240926203604.23622-1-sandeen@redhat.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_133805_573476_F9CD5A22 
X-CRM114-Status: GOOD (  29.85  )
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

From: David Howells <dhowells@redhat.com>

Convert the ubifs filesystem to the new internal mount API as the old
one will be obsoleted and removed.  This allows greater flexibility in
communication of mount parameters between userspace, the VFS and the
filesystem.

See Documentation/filesystems/mount_api.txt for more information.

Signed-off-by: David Howells <dhowells@redhat.com>
[sandeen: forward-port old patch]
Signed-off-by: Eric Sandeen <sandeen@redhat.com>
cc: Richard Weinberger <richard@nod.at>
cc: Zhihao Cheng <chengzhihao1@huawei.com>
cc: linux-mtd@lists.infradead.org
---
 fs/ubifs/super.c | 459 +++++++++++++++++++++--------------------------
 1 file changed, 204 insertions(+), 255 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 291583005dd1..cf2e9104baff 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -19,9 +19,9 @@
 #include <linux/module.h>
 #include <linux/ctype.h>
 #include <linux/kthread.h>
-#include <linux/parser.h>
+#include <linux/fs_context.h>
+#include <linux/fs_parser.h>
 #include <linux/seq_file.h>
-#include <linux/mount.h>
 #include <linux/math64.h>
 #include <linux/writeback.h>
 #include "ubifs.h"
@@ -963,7 +963,7 @@ static int check_volume_empty(struct ubifs_info *c)
  * Opt_no_bulk_read: disable bulk-reads
  * Opt_chk_data_crc: check CRCs when reading data nodes
  * Opt_no_chk_data_crc: do not check CRCs when reading data nodes
- * Opt_override_compr: override default compressor
+ * Opt_compr: override default compressor
  * Opt_assert: set ubifs_assert() action
  * Opt_auth_key: The key name used for authentication
  * Opt_auth_hash_name: The hash type used for authentication
@@ -976,54 +976,46 @@ enum {
 	Opt_no_bulk_read,
 	Opt_chk_data_crc,
 	Opt_no_chk_data_crc,
-	Opt_override_compr,
+	Opt_compr,
 	Opt_assert,
 	Opt_auth_key,
 	Opt_auth_hash_name,
 	Opt_ignore,
-	Opt_err,
 };
 
-static const match_table_t tokens = {
-	{Opt_fast_unmount, "fast_unmount"},
-	{Opt_norm_unmount, "norm_unmount"},
-	{Opt_bulk_read, "bulk_read"},
-	{Opt_no_bulk_read, "no_bulk_read"},
-	{Opt_chk_data_crc, "chk_data_crc"},
-	{Opt_no_chk_data_crc, "no_chk_data_crc"},
-	{Opt_override_compr, "compr=%s"},
-	{Opt_auth_key, "auth_key=%s"},
-	{Opt_auth_hash_name, "auth_hash_name=%s"},
-	{Opt_ignore, "ubi=%s"},
-	{Opt_ignore, "vol=%s"},
-	{Opt_assert, "assert=%s"},
-	{Opt_err, NULL},
+static const struct constant_table ubifs_param_compr[] = {
+	{ "none",		UBIFS_COMPR_NONE },
+	{ "lzo",		UBIFS_COMPR_LZO },
+	{ "zlib",		UBIFS_COMPR_ZLIB },
+	{ "zstd",		UBIFS_COMPR_ZSTD },
+	{}
 };
 
-/**
- * parse_standard_option - parse a standard mount option.
- * @option: the option to parse
- *
- * Normally, standard mount options like "sync" are passed to file-systems as
- * flags. However, when a "rootflags=" kernel boot parameter is used, they may
- * be present in the options string. This function tries to deal with this
- * situation and parse standard options. Returns 0 if the option was not
- * recognized, and the corresponding integer flag if it was.
- *
- * UBIFS is only interested in the "sync" option, so do not check for anything
- * else.
- */
-static int parse_standard_option(const char *option)
-{
+static const struct constant_table ubifs_param_assert[] = {
+	{ "report",	ASSACT_REPORT },
+	{ "read-only",	ASSACT_RO },
+	{ "panic",	ASSACT_PANIC },
+	{}
+};
 
-	pr_notice("UBIFS: parse %s\n", option);
-	if (!strcmp(option, "sync"))
-		return SB_SYNCHRONOUS;
-	return 0;
-}
+static const struct fs_parameter_spec ubifs_fs_param_spec[] = {
+	fsparam_flag	("fast_unmount",		Opt_fast_unmount),
+	fsparam_flag	("norm_unmount",		Opt_norm_unmount),
+	fsparam_flag	("bulk_read",			Opt_bulk_read),
+	fsparam_flag	("no_bulk_read",		Opt_no_bulk_read),
+	fsparam_flag	("chk_data_crc",		Opt_chk_data_crc),
+	fsparam_flag	("no_chk_data_crc",		Opt_no_chk_data_crc),
+	fsparam_enum	("compr",			Opt_compr, ubifs_param_compr),
+	fsparam_enum	("assert",			Opt_assert, ubifs_param_assert),
+	fsparam_string	("auth_key",			Opt_auth_key),
+	fsparam_string	("auth_hash_name",		Opt_auth_hash_name),
+	fsparam_string	("ubi",				Opt_ignore),
+	fsparam_string	("vol",				Opt_ignore),
+	{}
+};
 
 /**
- * ubifs_parse_options - parse mount parameters.
+ * ubifs_parse_param - parse a parameter.
  * @c: UBIFS file-system description object
  * @options: parameters to parse
  * @is_remount: non-zero if this is FS re-mount
@@ -1031,127 +1023,69 @@ static int parse_standard_option(const char *option)
  * This function parses UBIFS mount options and returns zero in case success
  * and a negative error code in case of failure.
  */
-static int ubifs_parse_options(struct ubifs_info *c, char *options,
-			       int is_remount)
+static int ubifs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 {
-	char *p;
-	substring_t args[MAX_OPT_ARGS];
-
-	if (!options)
-		return 0;
-
-	while ((p = strsep(&options, ","))) {
-		int token;
+	struct ubifs_info *c = fc->s_fs_info;
+	struct fs_parse_result result;
+	bool is_remount = (fc->purpose & FS_CONTEXT_FOR_RECONFIGURE);
+	int opt;
 
-		if (!*p)
-			continue;
+	opt = fs_parse(fc, ubifs_fs_param_spec, param, &result);
+	if (opt < 0)
+		return opt;
 
-		token = match_token(p, tokens, args);
-		switch (token) {
+	switch (opt) {
 		/*
 		 * %Opt_fast_unmount and %Opt_norm_unmount options are ignored.
 		 * We accept them in order to be backward-compatible. But this
 		 * should be removed at some point.
 		 */
-		case Opt_fast_unmount:
-			c->mount_opts.unmount_mode = 2;
-			break;
-		case Opt_norm_unmount:
-			c->mount_opts.unmount_mode = 1;
-			break;
-		case Opt_bulk_read:
-			c->mount_opts.bulk_read = 2;
-			c->bulk_read = 1;
-			break;
-		case Opt_no_bulk_read:
-			c->mount_opts.bulk_read = 1;
-			c->bulk_read = 0;
-			break;
-		case Opt_chk_data_crc:
-			c->mount_opts.chk_data_crc = 2;
-			c->no_chk_data_crc = 0;
-			break;
-		case Opt_no_chk_data_crc:
-			c->mount_opts.chk_data_crc = 1;
-			c->no_chk_data_crc = 1;
-			break;
-		case Opt_override_compr:
-		{
-			char *name = match_strdup(&args[0]);
-
-			if (!name)
-				return -ENOMEM;
-			if (!strcmp(name, "none"))
-				c->mount_opts.compr_type = UBIFS_COMPR_NONE;
-			else if (!strcmp(name, "lzo"))
-				c->mount_opts.compr_type = UBIFS_COMPR_LZO;
-			else if (!strcmp(name, "zlib"))
-				c->mount_opts.compr_type = UBIFS_COMPR_ZLIB;
-			else if (!strcmp(name, "zstd"))
-				c->mount_opts.compr_type = UBIFS_COMPR_ZSTD;
-			else {
-				ubifs_err(c, "unknown compressor \"%s\"", name); //FIXME: is c ready?
-				kfree(name);
-				return -EINVAL;
-			}
-			kfree(name);
-			c->mount_opts.override_compr = 1;
-			c->default_compr = c->mount_opts.compr_type;
-			break;
-		}
-		case Opt_assert:
-		{
-			char *act = match_strdup(&args[0]);
-
-			if (!act)
-				return -ENOMEM;
-			if (!strcmp(act, "report"))
-				c->assert_action = ASSACT_REPORT;
-			else if (!strcmp(act, "read-only"))
-				c->assert_action = ASSACT_RO;
-			else if (!strcmp(act, "panic"))
-				c->assert_action = ASSACT_PANIC;
-			else {
-				ubifs_err(c, "unknown assert action \"%s\"", act);
-				kfree(act);
-				return -EINVAL;
-			}
-			kfree(act);
-			break;
-		}
-		case Opt_auth_key:
-			if (!is_remount) {
-				c->auth_key_name = kstrdup(args[0].from,
-								GFP_KERNEL);
-				if (!c->auth_key_name)
-					return -ENOMEM;
-			}
-			break;
-		case Opt_auth_hash_name:
-			if (!is_remount) {
-				c->auth_hash_name = kstrdup(args[0].from,
-								GFP_KERNEL);
-				if (!c->auth_hash_name)
-					return -ENOMEM;
-			}
-			break;
-		case Opt_ignore:
-			break;
-		default:
-		{
-			unsigned long flag;
-			struct super_block *sb = c->vfs_sb;
-
-			flag = parse_standard_option(p);
-			if (!flag) {
-				ubifs_err(c, "unrecognized mount option \"%s\" or missing value",
-					  p);
-				return -EINVAL;
-			}
-			sb->s_flags |= flag;
-			break;
+	case Opt_fast_unmount:
+		c->mount_opts.unmount_mode = 2;
+		break;
+	case Opt_norm_unmount:
+		c->mount_opts.unmount_mode = 1;
+		break;
+	case Opt_bulk_read:
+		c->mount_opts.bulk_read = 2;
+		c->bulk_read = 1;
+		break;
+	case Opt_no_bulk_read:
+		c->mount_opts.bulk_read = 1;
+		c->bulk_read = 0;
+		break;
+	case Opt_chk_data_crc:
+		c->mount_opts.chk_data_crc = 2;
+		c->no_chk_data_crc = 0;
+		break;
+	case Opt_no_chk_data_crc:
+		c->mount_opts.chk_data_crc = 1;
+		c->no_chk_data_crc = 1;
+		break;
+	case Opt_compr:
+		c->mount_opts.compr_type = result.uint_32;
+		c->mount_opts.override_compr = 1;
+		c->default_compr = c->mount_opts.compr_type;
+		break;
+	case Opt_assert:
+		c->assert_action = result.uint_32;
+		break;
+	case Opt_auth_key:
+		if (!is_remount) {
+			kfree(c->auth_key_name);
+			c->auth_key_name = param->string;
+			param->string = NULL;
 		}
+		break;
+	case Opt_auth_hash_name:
+		if (!is_remount) {
+			kfree(c->auth_hash_name);
+			c->auth_hash_name = param->string;
+			param->string = NULL;
 		}
+		break;
+	case Opt_ignore:
+		break;
 	}
 
 	return 0;
@@ -2003,21 +1937,30 @@ static void ubifs_put_super(struct super_block *sb)
 	mutex_unlock(&c->umount_mutex);
 }
 
-static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
+static int ubifs_reconfigure(struct fs_context *fc)
 {
+	struct super_block *sb = fc->root->d_sb;
 	int err;
 	struct ubifs_info *c = sb->s_fs_info;
+	struct ubifs_info *reconf = fc->s_fs_info;
 
 	sync_filesystem(sb);
-	dbg_gen("old flags %#lx, new flags %#x", sb->s_flags, *flags);
+	dbg_gen("old flags %#lx, new flags %#x", sb->s_flags, fc->sb_flags);
 
-	err = ubifs_parse_options(c, data, 1);
-	if (err) {
-		ubifs_err(c, "invalid or unknown remount parameter");
-		return err;
-	}
+	/* Apply the mount option changes.
+	 *
+	 * [!] NOTE Replacing the auth_key_name and auth_hash_name is
+	 *     very dodgy without locking.  Previously it just leaked
+	 *     the old strings.  The strings only seem to be used
+	 *     during mounting, so don't reconfigure those.
+	 */
+	c->mount_opts		= reconf->mount_opts;
+	c->bulk_read		= reconf->bulk_read;
+	c->no_chk_data_crc	= reconf->no_chk_data_crc;
+	c->default_compr	= reconf->default_compr;
+	c->assert_action	= reconf->assert_action;
 
-	if (c->ro_mount && !(*flags & SB_RDONLY)) {
+	if (c->ro_mount && !(fc->sb_flags & SB_RDONLY)) {
 		if (c->ro_error) {
 			ubifs_msg(c, "cannot re-mount R/W due to prior errors");
 			return -EROFS;
@@ -2029,7 +1972,7 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 		err = ubifs_remount_rw(c);
 		if (err)
 			return err;
-	} else if (!c->ro_mount && (*flags & SB_RDONLY)) {
+	} else if (!c->ro_mount && (fc->sb_flags & SB_RDONLY)) {
 		if (c->ro_error) {
 			ubifs_msg(c, "cannot re-mount R/O due to prior errors");
 			return -EROFS;
@@ -2062,14 +2005,13 @@ const struct super_operations ubifs_super_operations = {
 	.evict_inode   = ubifs_evict_inode,
 	.statfs        = ubifs_statfs,
 	.dirty_inode   = ubifs_dirty_inode,
-	.remount_fs    = ubifs_remount_fs,
 	.show_options  = ubifs_show_options,
 	.sync_fs       = ubifs_sync_fs,
 };
 
 /**
  * open_ubi - parse UBI device name string and open the UBI device.
- * @name: UBI volume name
+ * @fc: The filesystem parameters
  * @mode: UBI volume open mode
  *
  * The primary method of mounting UBIFS is by specifying the UBI volume
@@ -2086,15 +2028,13 @@ const struct super_operations ubifs_super_operations = {
  * returns UBI volume description object in case of success and a negative
  * error code in case of failure.
  */
-static struct ubi_volume_desc *open_ubi(const char *name, int mode)
+static struct ubi_volume_desc *open_ubi(struct fs_context *fc, int mode)
 {
 	struct ubi_volume_desc *ubi;
+	const char *name = fc->source;
 	int dev, vol;
 	char *endptr;
 
-	if (!name || !*name)
-		return ERR_PTR(-EINVAL);
-
 	/* First, try to open using the device node path method */
 	ubi = ubi_open_volume_path(name, mode);
 	if (!IS_ERR(ubi))
@@ -2102,14 +2042,14 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 
 	/* Try the "nodev" method */
 	if (name[0] != 'u' || name[1] != 'b' || name[2] != 'i')
-		return ERR_PTR(-EINVAL);
+		goto invalid_source;
 
 	/* ubi:NAME method */
 	if ((name[3] == ':' || name[3] == '!') && name[4] != '\0')
 		return ubi_open_volume_nm(0, name + 4, mode);
 
 	if (!isdigit(name[3]))
-		return ERR_PTR(-EINVAL);
+		goto invalid_source;
 
 	dev = simple_strtoul(name + 3, &endptr, 0);
 
@@ -2121,7 +2061,7 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 	if (*endptr == '_' && isdigit(endptr[1])) {
 		vol = simple_strtoul(endptr + 1, &endptr, 0);
 		if (*endptr != '\0')
-			return ERR_PTR(-EINVAL);
+			goto invalid_source;
 		return ubi_open_volume(dev, vol, mode);
 	}
 
@@ -2129,59 +2069,11 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 	if ((*endptr == ':' || *endptr == '!') && endptr[1] != '\0')
 		return ubi_open_volume_nm(dev, ++endptr, mode);
 
-	return ERR_PTR(-EINVAL);
-}
-
-static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
-{
-	struct ubifs_info *c;
-
-	c = kzalloc(sizeof(struct ubifs_info), GFP_KERNEL);
-	if (c) {
-		spin_lock_init(&c->cnt_lock);
-		spin_lock_init(&c->cs_lock);
-		spin_lock_init(&c->buds_lock);
-		spin_lock_init(&c->space_lock);
-		spin_lock_init(&c->orphan_lock);
-		init_rwsem(&c->commit_sem);
-		mutex_init(&c->lp_mutex);
-		mutex_init(&c->tnc_mutex);
-		mutex_init(&c->log_mutex);
-		mutex_init(&c->umount_mutex);
-		mutex_init(&c->bu_mutex);
-		mutex_init(&c->write_reserve_mutex);
-		init_waitqueue_head(&c->cmt_wq);
-		init_waitqueue_head(&c->reserve_space_wq);
-		atomic_set(&c->need_wait_space, 0);
-		c->buds = RB_ROOT;
-		c->old_idx = RB_ROOT;
-		c->size_tree = RB_ROOT;
-		c->orph_tree = RB_ROOT;
-		INIT_LIST_HEAD(&c->infos_list);
-		INIT_LIST_HEAD(&c->idx_gc);
-		INIT_LIST_HEAD(&c->replay_list);
-		INIT_LIST_HEAD(&c->replay_buds);
-		INIT_LIST_HEAD(&c->uncat_list);
-		INIT_LIST_HEAD(&c->empty_list);
-		INIT_LIST_HEAD(&c->freeable_list);
-		INIT_LIST_HEAD(&c->frdi_idx_list);
-		INIT_LIST_HEAD(&c->unclean_leb_list);
-		INIT_LIST_HEAD(&c->old_buds);
-		INIT_LIST_HEAD(&c->orph_list);
-		INIT_LIST_HEAD(&c->orph_new);
-		c->no_chk_data_crc = 1;
-		c->assert_action = ASSACT_RO;
-
-		c->highest_inum = UBIFS_FIRST_INO;
-		c->lhead_lnum = c->ltail_lnum = UBIFS_LOG_LNUM;
-
-		ubi_get_volume_info(ubi, &c->vi);
-		ubi_get_device_info(c->vi.ubi_num, &c->di);
-	}
-	return c;
+invalid_source:
+	return ERR_PTR(invalf(fc, "Invalid source name"));
 }
 
-static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
+static int ubifs_fill_super(struct super_block *sb, struct fs_context *fc)
 {
 	struct ubifs_info *c = sb->s_fs_info;
 	struct inode *root;
@@ -2195,10 +2087,6 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 		goto out;
 	}
 
-	err = ubifs_parse_options(c, data, 0);
-	if (err)
-		goto out_close;
-
 	/*
 	 * UBIFS provides 'backing_dev_info' in order to disable read-ahead. For
 	 * UBIFS, I/O is not deferred, it is done immediately in read_folio,
@@ -2264,69 +2152,61 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	return err;
 }
 
-static int sb_test(struct super_block *sb, void *data)
+static int sb_test(struct super_block *sb, struct fs_context *fc)
 {
-	struct ubifs_info *c1 = data;
+	struct ubifs_info *c1 = fc->s_fs_info;
 	struct ubifs_info *c = sb->s_fs_info;
 
 	return c->vi.cdev == c1->vi.cdev;
 }
 
-static int sb_set(struct super_block *sb, void *data)
-{
-	sb->s_fs_info = data;
-	return set_anon_super(sb, NULL);
-}
-
-static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
-			const char *name, void *data)
+static int ubifs_get_tree(struct fs_context *fc)
 {
 	struct ubi_volume_desc *ubi;
-	struct ubifs_info *c;
+	struct ubifs_info *c = fc->s_fs_info;
 	struct super_block *sb;
 	int err;
 
-	dbg_gen("name %s, flags %#x", name, flags);
+	if (!fc->source || !*fc->source)
+		return invalf(fc, "No source specified");
+
+	dbg_gen("name %s, flags %#x", fc->source, fc->sb_flags);
 
 	/*
 	 * Get UBI device number and volume ID. Mount it read-only so far
 	 * because this might be a new mount point, and UBI allows only one
 	 * read-write user at a time.
 	 */
-	ubi = open_ubi(name, UBI_READONLY);
+	ubi = open_ubi(fc, UBI_READONLY);
 	if (IS_ERR(ubi)) {
-		if (!(flags & SB_SILENT))
-			pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
-			       current->pid, name, (int)PTR_ERR(ubi));
-		return ERR_CAST(ubi);
+		err = PTR_ERR(ubi);
+		if (!(fc->sb_flags & SB_SILENT))
+			errorf(fc, "UBIFS error (pid: %d): cannot open \"%s\", error %d",
+			       current->pid, fc->source, err);
+		return err;
 	}
 
-	c = alloc_ubifs_info(ubi);
-	if (!c) {
-		err = -ENOMEM;
-		goto out_close;
-	}
+	ubi_get_volume_info(ubi, &c->vi);
+	ubi_get_device_info(c->vi.ubi_num, &c->di);
 
 	dbg_gen("opened ubi%d_%d", c->vi.ubi_num, c->vi.vol_id);
 
-	sb = sget(fs_type, sb_test, sb_set, flags, c);
+	sb = sget_fc(fc, sb_test, set_anon_super_fc);
 	if (IS_ERR(sb)) {
 		err = PTR_ERR(sb);
-		kfree(c);
 		goto out_close;
 	}
 
 	if (sb->s_root) {
-		struct ubifs_info *c1 = sb->s_fs_info;
-		kfree(c);
 		/* A new mount point for already mounted UBIFS */
+		c = sb->s_fs_info;
 		dbg_gen("this ubi volume is already mounted");
-		if (!!(flags & SB_RDONLY) != c1->ro_mount) {
+		if (!!(fc->sb_flags & SB_RDONLY) != c->ro_mount) {
 			err = -EBUSY;
 			goto out_deact;
 		}
 	} else {
-		err = ubifs_fill_super(sb, data, flags & SB_SILENT ? 1 : 0);
+		err = ubifs_fill_super(sb, fc);
 		if (err)
 			goto out_deact;
 		/* We do not support atime */
@@ -2340,13 +2220,81 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 	/* 'fill_super()' opens ubi again so we must close it here */
 	ubi_close_volume(ubi);
 
-	return dget(sb->s_root);
+	fc->root = dget(sb->s_root);
+	return 0;
 
 out_deact:
 	deactivate_locked_super(sb);
 out_close:
 	ubi_close_volume(ubi);
-	return ERR_PTR(err);
+	return err;
+}
+
+static void ubifs_free_fc(struct fs_context *fc)
+{
+	struct ubifs_info *c = fc->s_fs_info;
+
+	if (c) {
+		kfree(c->auth_key_name);
+		kfree(c->auth_hash_name);
+		kfree(c);
+	}
+}
+
+static const struct fs_context_operations ubifs_context_ops = {
+	.free		= ubifs_free_fc,
+	.parse_param	= ubifs_parse_param,
+	.get_tree	= ubifs_get_tree,
+	.reconfigure	= ubifs_reconfigure,
+};
+
+static int ubifs_init_fs_context(struct fs_context *fc)
+{
+	struct ubifs_info *c;
+
+	c = kzalloc(sizeof(struct ubifs_info), GFP_KERNEL);
+	if (!c)
+		return -ENOMEM;
+
+	spin_lock_init(&c->cnt_lock);
+	spin_lock_init(&c->cs_lock);
+	spin_lock_init(&c->buds_lock);
+	spin_lock_init(&c->space_lock);
+	spin_lock_init(&c->orphan_lock);
+	init_rwsem(&c->commit_sem);
+	mutex_init(&c->lp_mutex);
+	mutex_init(&c->tnc_mutex);
+	mutex_init(&c->log_mutex);
+	mutex_init(&c->umount_mutex);
+	mutex_init(&c->bu_mutex);
+	mutex_init(&c->write_reserve_mutex);
+	init_waitqueue_head(&c->cmt_wq);
+	init_waitqueue_head(&c->reserve_space_wq);
+	atomic_set(&c->need_wait_space, 0);
+	c->buds = RB_ROOT;
+	c->old_idx = RB_ROOT;
+	c->size_tree = RB_ROOT;
+	c->orph_tree = RB_ROOT;
+	INIT_LIST_HEAD(&c->infos_list);
+	INIT_LIST_HEAD(&c->idx_gc);
+	INIT_LIST_HEAD(&c->replay_list);
+	INIT_LIST_HEAD(&c->replay_buds);
+	INIT_LIST_HEAD(&c->uncat_list);
+	INIT_LIST_HEAD(&c->empty_list);
+	INIT_LIST_HEAD(&c->freeable_list);
+	INIT_LIST_HEAD(&c->frdi_idx_list);
+	INIT_LIST_HEAD(&c->unclean_leb_list);
+	INIT_LIST_HEAD(&c->old_buds);
+	INIT_LIST_HEAD(&c->orph_list);
+	INIT_LIST_HEAD(&c->orph_new);
+	c->no_chk_data_crc = 1;
+	c->assert_action = ASSACT_RO;
+	c->highest_inum = UBIFS_FIRST_INO;
+	c->lhead_lnum = c->ltail_lnum = UBIFS_LOG_LNUM;
+
+	fc->s_fs_info = c;
+	fc->ops = &ubifs_context_ops;
+	return 0;
 }
 
 static void kill_ubifs_super(struct super_block *s)
@@ -2359,7 +2307,8 @@ static void kill_ubifs_super(struct super_block *s)
 static struct file_system_type ubifs_fs_type = {
 	.name    = "ubifs",
 	.owner   = THIS_MODULE,
-	.mount   = ubifs_mount,
+	.init_fs_context = ubifs_init_fs_context,
+	.parameters	= ubifs_fs_param_spec,
 	.kill_sb = kill_ubifs_super,
 };
 MODULE_ALIAS_FS("ubifs");
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
