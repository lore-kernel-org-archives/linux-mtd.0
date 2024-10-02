Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE5FCF6D3E
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 17:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iJRFZy6LMsVdwFzYwlriheNhPpCxhEdVVJzBO/kJhJw=; b=1cEB4WnyqWhqqZ
	5PB2tqhiIO7kKMiYiZPKxpXYWS9Q3qNarYJ+VQljdOvURiGtg1vrTtWaRS9pvnn2N/7aw6fJwxxf6
	NCYAd8oIm2LH2yvK7OHTha8ill/36WT0+FTDBcpMocVh+9w5q9rJT6OLk+h5oiRFIBh7DfiybHrmf
	gu0grgi3KjyW3BA5VKhvIqDsDuCJM98VChZb6bg8tbHpV7uD+pe1BZg9L57R7F+t6TppfPb47BjKV
	JxW1lQuaG3WXmkwWcg/zzcSt+faG2cQRGavLu5r+f4a2VURuQWy0qXQzA4klD9qa3rIu4iDJeGXQL
	7p1A4QcwYYyA2AOCcBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw2id-0000000700n-1lAj;
	Wed, 02 Oct 2024 17:00:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw2gf-00000006zYL-37pq
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 16:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727888332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SrG4ZJV4b7B0ncPme1R/BFWse1wBh6XhiullcAFOMtc=;
	b=NlcdmpDWTcf0mtqLe6H/fAPRuR6q8BAejFLTG5jsDXdOGcLsRNETDZc9PX5Ve23zrnkx9u
	roC2uL3fyI5bisyKYh+GVzf8FM9n/X1nM2FksALY9IT94cN9Hv9BEpyiSxGzh4x8xc3kqG
	hKEbAorbAPbTxWQXCeeFG8wmlX9qfKY=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-g-ZK8jWYNDmxcm5lHythTg-1; Wed, 02 Oct 2024 12:58:50 -0400
X-MC-Unique: g-ZK8jWYNDmxcm5lHythTg-1
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a343c444afso15495ab.1
        for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2024 09:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727888329; x=1728493129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrG4ZJV4b7B0ncPme1R/BFWse1wBh6XhiullcAFOMtc=;
        b=Ccb6LVup9eAZFkmMmD7JAWssHeNxAb9aik9H+7As8e3PtioLDdXUTDTBkqdrBvSA05
         jni0cidN+FogFjQ4BR2p5GH1sXWv3S7QhdmvJmASg3Lb95d+wW5Db7pIiaSitHfznd3H
         gmtQM3m0ySk2sV2Umo1ODgPl4QiFl3BwBVacJWBryPIGU2vuHeuaWM1ZYgB7amg6giH1
         hvkZYRQRuTb7iu6bNz6JMN+Zzt21Qzubhh5DEV7alzosMMG8365oi1AjbbBVOTzOJtTC
         xqNDJ+GOOTzr2bITz5n5UWsUObcQ/QpXGg5FTPSpFfn35wegadw74rraPhofqhWa2CPe
         lsMg==
X-Gm-Message-State: AOJu0YzllmsFl2y/nPfBUc7bHtCWYM5SHnQRGqloOBuCkdMx3/P+eh6j
	70enIUks6uuxwfyMl59xNXlunyjw+nVzqTF2Sh8OepRPadJ0ekMD+tQEoITUZ9GPEly6sJSduUQ
	tF1mDJjWmfZatKf2T0b3NTxwSndTpq91mYlabAo/Dw+mgFnnfc+CV/JN9W5dAjWpKg3INrf/vt+
	dYyNmIhlCCsW3YN3RRg0nsgUo+ZW9NRkml9TR+6qXMSG61p0eO
X-Received: by 2002:a05:6e02:1a04:b0:3a0:9d2b:2420 with SMTP id e9e14a558f8ab-3a36596e397mr33296065ab.25.1727888329238;
        Wed, 02 Oct 2024 09:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlb98qzsttSb89vDg8RyRF3FJdptvFSW+ptQ3NWid4OmEHv9tUG2PYdpK8wT2flXJYrk2RdA==
X-Received: by 2002:a05:6e02:1a04:b0:3a0:9d2b:2420 with SMTP id e9e14a558f8ab-3a36596e397mr33295695ab.25.1727888328649;
        Wed, 02 Oct 2024 09:58:48 -0700 (PDT)
Received: from fedora-rawhide.sandeen.net (67-4-202-127.mpls.qwest.net. [67.4.202.127])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d888862f68sm3154847173.71.2024.10.02.09.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 09:58:48 -0700 (PDT)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-mtd@lists.infradead.org
Cc: brauner@kernel.org,
	David Howells <dhowells@redhat.com>,
	Eric Sandeen <sandeen@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH V2] ubifs: Convert ubifs to use the new mount API
Date: Wed,  2 Oct 2024 11:58:34 -0500
Message-ID: <20241002165834.868046-1-sandeen@redhat.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_095853_998622_E1E0639B 
X-CRM114-Status: GOOD (  29.65  )
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
Co-developed-by: Eric Sandeen <sandeen@redhat.com>
[sandeen: forward-port old patch, use dedicated context struct]]
Signed-off-by: Eric Sandeen <sandeen@redhat.com>
cc: Richard Weinberger <richard@nod.at>
cc: Zhihao Cheng <chengzhihao1@huawei.com>
cc: linux-mtd@lists.infradead.org
---
 fs/ubifs/super.c | 399 ++++++++++++++++++++++++-----------------------
 1 file changed, 203 insertions(+), 196 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 291583005dd1..3fb308b6e167 100644
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
@@ -981,177 +981,120 @@ enum {
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
+	{ "none",	UBIFS_COMPR_NONE },
+	{ "lzo",	UBIFS_COMPR_LZO },
+	{ "zlib",	UBIFS_COMPR_ZLIB },
+	{ "zstd",	UBIFS_COMPR_ZSTD },
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
+	fsparam_flag	("fast_unmount",	Opt_fast_unmount),
+	fsparam_flag	("norm_unmount",	Opt_norm_unmount),
+	fsparam_flag	("bulk_read",		Opt_bulk_read),
+	fsparam_flag	("no_bulk_read",	Opt_no_bulk_read),
+	fsparam_flag	("chk_data_crc",	Opt_chk_data_crc),
+	fsparam_flag	("no_chk_data_crc",	Opt_no_chk_data_crc),
+	fsparam_enum	("compr",		Opt_override_compr, ubifs_param_compr),
+	fsparam_enum	("assert",		Opt_assert, ubifs_param_assert),
+	fsparam_string	("auth_key",		Opt_auth_key),
+	fsparam_string	("auth_hash_name",	Opt_auth_hash_name),
+	fsparam_string	("ubi",			Opt_ignore),
+	fsparam_string	("vol",			Opt_ignore),
+	{}
+};
+
+struct ubifs_fs_context {
+	struct ubifs_mount_opts mount_opts;
+	char *auth_key_name;
+	char *auth_hash_name;
+	unsigned int no_chk_data_crc:1;
+	unsigned int bulk_read:1;
+	unsigned int default_compr:2;
+	unsigned int assert_action:2;
+};
 
 /**
- * ubifs_parse_options - parse mount parameters.
- * @c: UBIFS file-system description object
- * @options: parameters to parse
- * @is_remount: non-zero if this is FS re-mount
+ * ubifs_parse_param - parse a parameter.
+ * @fc: the filesystem context
+ * @param: the parameter to parse
  *
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
+	struct ubifs_fs_context *ctx = fc->fs_private;
+	struct fs_parse_result result;
+	bool is_remount = (fc->purpose & FS_CONTEXT_FOR_RECONFIGURE);
+	int opt;
 
-	while ((p = strsep(&options, ","))) {
-		int token;
+	opt = fs_parse(fc, ubifs_fs_param_spec, param, &result);
+	if (opt < 0)
+		return opt;
 
-		if (!*p)
-			continue;
-
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
+		ctx->mount_opts.unmount_mode = 2;
+		break;
+	case Opt_norm_unmount:
+		ctx->mount_opts.unmount_mode = 1;
+		break;
+	case Opt_bulk_read:
+		ctx->mount_opts.bulk_read = 2;
+		ctx->bulk_read = 1;
+		break;
+	case Opt_no_bulk_read:
+		ctx->mount_opts.bulk_read = 1;
+		ctx->bulk_read = 0;
+		break;
+	case Opt_chk_data_crc:
+		ctx->mount_opts.chk_data_crc = 2;
+		ctx->no_chk_data_crc = 0;
+		break;
+	case Opt_no_chk_data_crc:
+		ctx->mount_opts.chk_data_crc = 1;
+		ctx->no_chk_data_crc = 1;
+		break;
+	case Opt_override_compr:
+		ctx->mount_opts.compr_type = result.uint_32;
+		ctx->mount_opts.override_compr = 1;
+		ctx->default_compr = ctx->mount_opts.compr_type;
+		break;
+	case Opt_assert:
+		ctx->assert_action = result.uint_32;
+		break;
+	case Opt_auth_key:
+		if (!is_remount) {
+			kfree(ctx->auth_key_name);
+			ctx->auth_key_name = param->string;
+			param->string = NULL;
 		}
+		break;
+	case Opt_auth_hash_name:
+		if (!is_remount) {
+			kfree(ctx->auth_hash_name);
+			ctx->auth_hash_name = param->string;
+			param->string = NULL;
 		}
+		break;
+	case Opt_ignore:
+		break;
 	}
 
 	return 0;
@@ -2003,21 +1946,27 @@ static void ubifs_put_super(struct super_block *sb)
 	mutex_unlock(&c->umount_mutex);
 }
 
-static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
+static int ubifs_reconfigure(struct fs_context *fc)
 {
+	struct ubifs_fs_context *ctx = fc->fs_private;
+	struct super_block *sb = fc->root->d_sb;
 	int err;
 	struct ubifs_info *c = sb->s_fs_info;
 
 	sync_filesystem(sb);
-	dbg_gen("old flags %#lx, new flags %#x", sb->s_flags, *flags);
+	dbg_gen("old flags %#lx, new flags %#x", sb->s_flags, fc->sb_flags);
 
-	err = ubifs_parse_options(c, data, 1);
-	if (err) {
-		ubifs_err(c, "invalid or unknown remount parameter");
-		return err;
-	}
+	/*
+	 * Apply the mount option changes.
+	 * auth_key_name and auth_hash_name are ignored on remount.
+	 */
+	c->mount_opts		= ctx->mount_opts;
+	c->bulk_read		= ctx->bulk_read;
+	c->no_chk_data_crc	= ctx->no_chk_data_crc;
+	c->default_compr	= ctx->default_compr;
+	c->assert_action	= ctx->assert_action;
 
-	if (c->ro_mount && !(*flags & SB_RDONLY)) {
+	if (c->ro_mount && !(fc->sb_flags & SB_RDONLY)) {
 		if (c->ro_error) {
 			ubifs_msg(c, "cannot re-mount R/W due to prior errors");
 			return -EROFS;
@@ -2029,7 +1978,7 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 		err = ubifs_remount_rw(c);
 		if (err)
 			return err;
-	} else if (!c->ro_mount && (*flags & SB_RDONLY)) {
+	} else if (!c->ro_mount && (fc->sb_flags & SB_RDONLY)) {
 		if (c->ro_error) {
 			ubifs_msg(c, "cannot re-mount R/O due to prior errors");
 			return -EROFS;
@@ -2062,14 +2011,13 @@ const struct super_operations ubifs_super_operations = {
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
+ * @fc: The filesystem context
  * @mode: UBI volume open mode
  *
  * The primary method of mounting UBIFS is by specifying the UBI volume
@@ -2086,15 +2034,13 @@ const struct super_operations ubifs_super_operations = {
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
@@ -2102,14 +2048,14 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 
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
 
@@ -2121,7 +2067,7 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 	if (*endptr == '_' && isdigit(endptr[1])) {
 		vol = simple_strtoul(endptr + 1, &endptr, 0);
 		if (*endptr != '\0')
-			return ERR_PTR(-EINVAL);
+			goto invalid_source;
 		return ubi_open_volume(dev, vol, mode);
 	}
 
@@ -2129,7 +2075,8 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 	if ((*endptr == ':' || *endptr == '!') && endptr[1] != '\0')
 		return ubi_open_volume_nm(dev, ++endptr, mode);
 
-	return ERR_PTR(-EINVAL);
+invalid_source:
+	return ERR_PTR(invalf(fc, "Invalid source name"));
 }
 
 static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
@@ -2181,9 +2128,10 @@ static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
 	return c;
 }
 
-static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
+static int ubifs_fill_super(struct super_block *sb, struct fs_context *fc)
 {
 	struct ubifs_info *c = sb->s_fs_info;
+	struct ubifs_fs_context *ctx = fc->fs_private;
 	struct inode *root;
 	int err;
 
@@ -2195,9 +2143,18 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 		goto out;
 	}
 
-	err = ubifs_parse_options(c, data, 0);
-	if (err)
-		goto out_close;
+	/* Copy in parsed mount options */
+	c->mount_opts		= ctx->mount_opts;
+	c->auth_key_name	= ctx->auth_key_name;
+	c->auth_hash_name	= ctx->auth_hash_name;
+	c->no_chk_data_crc	= ctx->no_chk_data_crc;
+	c->bulk_read		= ctx->bulk_read;
+	c->default_compr	= ctx->default_compr;
+	c->assert_action	= ctx->assert_action;
+
+	/* ubifs_info owns auth strings now */
+	ctx->auth_key_name = NULL;
+	ctx->auth_hash_name = NULL;
 
 	/*
 	 * UBIFS provides 'backing_dev_info' in order to disable read-ahead. For
@@ -2264,41 +2221,38 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
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
 	struct ubifs_info *c;
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
+		err = PTR_ERR(ubi);
+		if (!(fc->sb_flags & SB_SILENT))
 			pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
-			       current->pid, name, (int)PTR_ERR(ubi));
-		return ERR_CAST(ubi);
+			       current->pid, fc->source, err);
+		return err;
 	}
 
 	c = alloc_ubifs_info(ubi);
@@ -2306,10 +2260,11 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 		err = -ENOMEM;
 		goto out_close;
 	}
+	fc->s_fs_info = c;
 
 	dbg_gen("opened ubi%d_%d", c->vi.ubi_num, c->vi.vol_id);
 
-	sb = sget(fs_type, sb_test, sb_set, flags, c);
+	sb = sget_fc(fc, sb_test, set_anon_super_fc);
 	if (IS_ERR(sb)) {
 		err = PTR_ERR(sb);
 		kfree(c);
@@ -2321,12 +2276,12 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 		kfree(c);
 		/* A new mount point for already mounted UBIFS */
 		dbg_gen("this ubi volume is already mounted");
-		if (!!(flags & SB_RDONLY) != c1->ro_mount) {
+		if (!!(fc->sb_flags & SB_RDONLY) != c1->ro_mount) {
 			err = -EBUSY;
 			goto out_deact;
 		}
 	} else {
-		err = ubifs_fill_super(sb, data, flags & SB_SILENT ? 1 : 0);
+		err = ubifs_fill_super(sb, fc);
 		if (err)
 			goto out_deact;
 		/* We do not support atime */
@@ -2340,13 +2295,14 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
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
 }
 
 static void kill_ubifs_super(struct super_block *s)
@@ -2356,10 +2312,61 @@ static void kill_ubifs_super(struct super_block *s)
 	kfree(c);
 }
 
+static void ubifs_free_fc(struct fs_context *fc)
+{
+	struct ubifs_fs_context *ctx = fc->fs_private;
+
+	if (ctx) {
+		kfree(ctx->auth_key_name);
+		kfree(ctx->auth_hash_name);
+		kfree(ctx);
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
+	struct ubifs_fs_context *ctx;
+
+	ctx = kzalloc(sizeof(struct ubifs_fs_context), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	if (fc->purpose != FS_CONTEXT_FOR_RECONFIGURE) {
+		/* Iniitialize for first mount */
+		ctx->no_chk_data_crc = 1;
+		ctx->assert_action = ASSACT_RO;
+	} else {
+		struct ubifs_info *c = fc->root->d_sb->s_fs_info;
+
+		/*
+		 * Preserve existing options across remounts.
+		 * auth_key_name and auth_hash_name are not remountable.
+		 */
+		ctx->mount_opts		= c->mount_opts;
+		ctx->bulk_read		= c->bulk_read;
+		ctx->no_chk_data_crc	= c->no_chk_data_crc;
+		ctx->default_compr	= c->default_compr;
+		ctx->assert_action	= c->assert_action;
+	}
+
+	fc->ops = &ubifs_context_ops;
+	fc->fs_private = ctx;
+
+	return 0;
+}
+
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
