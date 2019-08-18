Return-Path: <SRS0=Slyc=WO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31EFC3A589
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 17:00:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEEF92183E
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 17:00:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dTR/F4yM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho/0ZAQ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEEF92183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Qphrs3HbiIDS8Az7kNv1cKX4lDbRpxgWEgjbgLF288Q=; b=dTR/F4yMSvm/gVu01T34BX/5kn
	DAKj1AMb+X9N6T4teiaaa6tLYrFqsNaDQsNt2vofR2a74icu8qQoGwX0z/KI3mvj1m4Q4KN/ZN+WE
	8ffFHBD+hnD5omzcN7BEami6X6kvhTkYTmo/WlgFEixRskieyuTTgv/Xyc6bpqDB5xPTL1Df53lJ9
	DTS2zJOrV0C+frTEAFTBqj0j5KSfMyrqx7J9ltUQN01XjWRn0xYdEv9KdmUNMx4sM4RzE3MwmPWpL
	ga22yNeRlQGG/+Pa7Sj+b4JW3TvJ0t3TcKkvq5I+J4lIF+4XMeDTN8ORFQEQQ7dmcMrxk8akJJKTn
	XhwXHzig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzOX5-0007rs-Sf; Sun, 18 Aug 2019 16:59:55 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzOWv-0007g2-EZ
 for linux-mtd@lists.infradead.org; Sun, 18 Aug 2019 16:59:47 +0000
Received: by mail-pg1-x543.google.com with SMTP id e11so5505956pga.5
 for <linux-mtd@lists.infradead.org>; Sun, 18 Aug 2019 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hcDJouypjtfHakqyyqAP9XhBSp/6phxQjTvkkHXeS8Q=;
 b=ho/0ZAQ1HuBLAksSZugEnf6GEEUUwx2c7MSMuYwFEq19+6+nW6wgHJuJCYWYim53+c
 u7rSUABUkgvn2R22ED0deEqUbRE+FNspV4WzfNzRamxvI1UX6V/AjBvRoeUZyeJPkmaI
 HkQbe0hIHTJtii+Aib1Q5rGf7k7V+7yIp5pGqQbrX2B+d1apq92LrCGLJT1YlG1OBaf2
 Ih4gR4TLnn9SHFarM/5nVQzc54Agvl6UAxCVm4Ubx92SRAMD9FzmUggN0T6G7/8orJSk
 QgFDS3I4GLJpdyY5bFXh8qvaRIMJ4YKEmO3fbsPu4vzz2U97Qz9+l1ommUAS6hCW0Wzd
 /+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hcDJouypjtfHakqyyqAP9XhBSp/6phxQjTvkkHXeS8Q=;
 b=lQUoFJ3JN0seR4ctXt45QJwxfiUgtQ1dR7NGLNSHHIt44Z3wmDBrAJ7cHqRMBpRFwa
 K4U5Sv2TVAoFL+ppGPX8VXyLqdAV6PyygeytNOc9oqg5IvI2rn2HoqQdlFjHJRYEb+xy
 gfrRP8z1CwHnre9u5Lf9FW2Q+0obyerdUO7/27ToUwo7RnQzJpKR7/sASxhg0psBWrei
 IHTObDq63DrBAM3oTSboqUYEhspF7Al4tAjQ+2WWIJc02hDnupmGzEwJ2MMihQBWYzX7
 lxpArBJrqSy4qbAbqf+/SAk/JIb3JZNBremimTewr/Ggm1YKcNcTnzK4mBf24FxS7tfi
 gS1Q==
X-Gm-Message-State: APjAAAWvL9wFfcMS3sZ86qDnnYZzuBJj7j8kg9Brhx6Uz/DF81XJYgs7
 AcmWoYXs0EZ8kUImDGoVktM=
X-Google-Smtp-Source: APXvYqxbzXhppEsQPWOFxWOWxonZW01Tf6ODgmsFYoPy528tWmObH2OS0FTzK14N9zOjR2ueP6B+qw==
X-Received: by 2002:a17:90a:5288:: with SMTP id
 w8mr17181277pjh.61.1566147584902; 
 Sun, 18 Aug 2019 09:59:44 -0700 (PDT)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id b136sm15732831pfb.73.2019.08.18.09.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 09:59:44 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 06/20] fs: Fill in max and min timestamps in superblock
Date: Sun, 18 Aug 2019 09:58:03 -0700
Message-Id: <20190818165817.32634-7-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190818165817.32634-1-deepa.kernel@gmail.com>
References: <20190818165817.32634-1-deepa.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_095945_536969_084B8FB9 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, al@alarsen.net,
 linux-mtd@lists.infradead.org, darrick.wong@oracle.com, y2038@lists.linaro.org,
 richard@nod.at, codalist@coda.cs.cmu.edu, hch@infradead.org, coda@cs.cmu.edu,
 linux-ext4@vger.kernel.org, salah.triki@gmail.com, dushistov@mail.ru,
 arnd@arndb.de, reiserfs-devel@vger.kernel.org, aivazian.tigran@gmail.com,
 jaharkes@cs.cmu.edu, luisbg@kernel.org, nico@fluxnic.net,
 linux-xfs@vger.kernel.org, jack@suse.com, linux-fsdevel@vger.kernel.org,
 phillip@squashfs.org.uk, dwmw2@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fill in the appropriate limits to avoid inconsistencies
in the vfs cached inode times when timestamps are
outside the permitted range.

Even though some filesystems are read-only, fill in the
timestamps to reflect the on-disk representation.

Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
Cc: aivazian.tigran@gmail.com
Cc: al@alarsen.net
Cc: coda@cs.cmu.edu
Cc: darrick.wong@oracle.com
Cc: dushistov@mail.ru
Cc: dwmw2@infradead.org
Cc: hch@infradead.org
Cc: jack@suse.com
Cc: jaharkes@cs.cmu.edu
Cc: luisbg@kernel.org
Cc: nico@fluxnic.net
Cc: phillip@squashfs.org.uk
Cc: richard@nod.at
Cc: salah.triki@gmail.com
Cc: shaggy@kernel.org
Cc: linux-xfs@vger.kernel.org
Cc: codalist@coda.cs.cmu.edu
Cc: linux-ext4@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: jfs-discussion@lists.sourceforge.net
Cc: reiserfs-devel@vger.kernel.org
---
 fs/befs/linuxvfs.c       | 2 ++
 fs/bfs/inode.c           | 2 ++
 fs/coda/inode.c          | 3 +++
 fs/cramfs/inode.c        | 2 ++
 fs/efs/super.c           | 2 ++
 fs/ext2/super.c          | 2 ++
 fs/freevxfs/vxfs_super.c | 2 ++
 fs/jffs2/fs.c            | 3 +++
 fs/jfs/super.c           | 2 ++
 fs/minix/inode.c         | 2 ++
 fs/qnx4/inode.c          | 2 ++
 fs/qnx6/inode.c          | 2 ++
 fs/reiserfs/super.c      | 3 +++
 fs/romfs/super.c         | 2 ++
 fs/squashfs/super.c      | 2 ++
 fs/ufs/super.c           | 7 +++++++
 fs/xfs/xfs_super.c       | 2 ++
 17 files changed, 42 insertions(+)

diff --git a/fs/befs/linuxvfs.c b/fs/befs/linuxvfs.c
index 462d096ff3e9..64cdf4d8e424 100644
--- a/fs/befs/linuxvfs.c
+++ b/fs/befs/linuxvfs.c
@@ -893,6 +893,8 @@ befs_fill_super(struct super_block *sb, void *data, int silent)
 	sb_set_blocksize(sb, (ulong) befs_sb->block_size);
 	sb->s_op = &befs_sops;
 	sb->s_export_op = &befs_export_operations;
+	sb->s_time_min = 0;
+	sb->s_time_max = 0xffffffffffffll;
 	root = befs_iget(sb, iaddr2blockno(sb, &(befs_sb->root_dir)));
 	if (IS_ERR(root)) {
 		ret = PTR_ERR(root);
diff --git a/fs/bfs/inode.c b/fs/bfs/inode.c
index 5e97bed073d7..f8ce1368218b 100644
--- a/fs/bfs/inode.c
+++ b/fs/bfs/inode.c
@@ -324,6 +324,8 @@ static int bfs_fill_super(struct super_block *s, void *data, int silent)
 		return -ENOMEM;
 	mutex_init(&info->bfs_lock);
 	s->s_fs_info = info;
+	s->s_time_min = 0;
+	s->s_time_max = U32_MAX;
 
 	sb_set_blocksize(s, BFS_BSIZE);
 
diff --git a/fs/coda/inode.c b/fs/coda/inode.c
index 59a9a29ade0a..e07b5f2ceccc 100644
--- a/fs/coda/inode.c
+++ b/fs/coda/inode.c
@@ -223,6 +223,9 @@ static int coda_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_magic = CODA_SUPER_MAGIC;
 	sb->s_op = &coda_super_operations;
 	sb->s_d_op = &coda_dentry_operations;
+	sb->s_time_gran = 1;
+	sb->s_time_min = S64_MIN;
+	sb->s_time_max = S64_MAX;
 
 	error = super_setup_bdi(sb);
 	if (error)
diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index 2ee89a353d64..c304ae8357ef 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -599,6 +599,8 @@ static int cramfs_finalize_super(struct super_block *sb,
 
 	/* Set it all up.. */
 	sb->s_flags |= SB_RDONLY;
+	sb->s_time_min = 0;
+	sb->s_time_max = 0;
 	sb->s_op = &cramfs_ops;
 	root = get_cramfs_inode(sb, cramfs_root, 0);
 	if (IS_ERR(root))
diff --git a/fs/efs/super.c b/fs/efs/super.c
index 867fc24dee20..4a6ebff2af76 100644
--- a/fs/efs/super.c
+++ b/fs/efs/super.c
@@ -257,6 +257,8 @@ static int efs_fill_super(struct super_block *s, void *d, int silent)
 	if (!sb)
 		return -ENOMEM;
 	s->s_fs_info = sb;
+	s->s_time_min = 0;
+	s->s_time_max = U32_MAX;
  
 	s->s_magic		= EFS_SUPER_MAGIC;
 	if (!sb_set_blocksize(s, EFS_BLOCKSIZE)) {
diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index 44eb6e7eb492..baa36c6fb71e 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -1002,6 +1002,8 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 
 	sb->s_maxbytes = ext2_max_size(sb->s_blocksize_bits);
 	sb->s_max_links = EXT2_LINK_MAX;
+	sb->s_time_min = S32_MIN;
+	sb->s_time_max = S32_MAX;
 
 	if (le32_to_cpu(es->s_rev_level) == EXT2_GOOD_OLD_REV) {
 		sbi->s_inode_size = EXT2_GOOD_OLD_INODE_SIZE;
diff --git a/fs/freevxfs/vxfs_super.c b/fs/freevxfs/vxfs_super.c
index a89f68c3cbed..578a5062706e 100644
--- a/fs/freevxfs/vxfs_super.c
+++ b/fs/freevxfs/vxfs_super.c
@@ -229,6 +229,8 @@ static int vxfs_fill_super(struct super_block *sbp, void *dp, int silent)
 
 	sbp->s_op = &vxfs_super_ops;
 	sbp->s_fs_info = infp;
+	sbp->s_time_min = 0;
+	sbp->s_time_max = U32_MAX;
 
 	if (!vxfs_try_sb_magic(sbp, silent, 1,
 			(__force __fs32)cpu_to_le32(VXFS_SUPER_MAGIC))) {
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 25736676a456..05fe6cf5f1ac 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -591,6 +591,9 @@ int jffs2_do_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_blocksize = PAGE_SIZE;
 	sb->s_blocksize_bits = PAGE_SHIFT;
 	sb->s_magic = JFFS2_SUPER_MAGIC;
+	sb->s_time_min = 0;
+	sb->s_time_max = U32_MAX;
+
 	if (!sb_rdonly(sb))
 		jffs2_start_garbage_collect_thread(c);
 	return 0;
diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index f4e10cb9f734..b2dc4d1f9dcc 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -503,6 +503,8 @@ static int jfs_fill_super(struct super_block *sb, void *data, int silent)
 
 	sb->s_fs_info = sbi;
 	sb->s_max_links = JFS_LINK_MAX;
+	sb->s_time_min = 0;
+	sb->s_time_max = U32_MAX;
 	sbi->sb = sb;
 	sbi->uid = INVALID_UID;
 	sbi->gid = INVALID_GID;
diff --git a/fs/minix/inode.c b/fs/minix/inode.c
index f96073f25432..7cb5fd38eb14 100644
--- a/fs/minix/inode.c
+++ b/fs/minix/inode.c
@@ -277,6 +277,8 @@ static int minix_fill_super(struct super_block *s, void *data, int silent)
 
 	/* set up enough so that it can read an inode */
 	s->s_op = &minix_sops;
+	s->s_time_min = 0;
+	s->s_time_max = U32_MAX;
 	root_inode = minix_iget(s, MINIX_ROOT_INO);
 	if (IS_ERR(root_inode)) {
 		ret = PTR_ERR(root_inode);
diff --git a/fs/qnx4/inode.c b/fs/qnx4/inode.c
index 922d083bbc7c..e8da1cde87b9 100644
--- a/fs/qnx4/inode.c
+++ b/fs/qnx4/inode.c
@@ -201,6 +201,8 @@ static int qnx4_fill_super(struct super_block *s, void *data, int silent)
 	s->s_op = &qnx4_sops;
 	s->s_magic = QNX4_SUPER_MAGIC;
 	s->s_flags |= SB_RDONLY;	/* Yup, read-only yet */
+	s->s_time_min = 0;
+	s->s_time_max = U32_MAX;
 
 	/* Check the superblock signature. Since the qnx4 code is
 	   dangerous, we should leave as quickly as possible
diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index 0f8b0ff1ba43..345db56c98fd 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -429,6 +429,8 @@ static int qnx6_fill_super(struct super_block *s, void *data, int silent)
 	s->s_op = &qnx6_sops;
 	s->s_magic = QNX6_SUPER_MAGIC;
 	s->s_flags |= SB_RDONLY;        /* Yup, read-only yet */
+	s->s_time_min = 0;
+	s->s_time_max = U32_MAX;
 
 	/* ease the later tree level calculations */
 	sbi = QNX6_SB(s);
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index ab028ea0e561..d69b4ac0ae2f 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1976,6 +1976,9 @@ static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
 		goto error_unlocked;
 	}
 
+	s->s_time_min = 0;
+	s->s_time_max = U32_MAX;
+
 	rs = SB_DISK_SUPER_BLOCK(s);
 	/*
 	 * Let's do basic sanity check to verify that underlying device is not
diff --git a/fs/romfs/super.c b/fs/romfs/super.c
index 4636f867b9e8..338ac8521e65 100644
--- a/fs/romfs/super.c
+++ b/fs/romfs/super.c
@@ -477,6 +477,8 @@ static int romfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_maxbytes = 0xFFFFFFFF;
 	sb->s_magic = ROMFS_MAGIC;
 	sb->s_flags |= SB_RDONLY | SB_NOATIME;
+	sb->s_time_min = 0;
+	sb->s_time_max = 0;
 	sb->s_op = &romfs_super_ops;
 
 #ifdef CONFIG_ROMFS_ON_MTD
diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 0311171af72d..e2d6566371ec 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -186,6 +186,8 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		(u64) le64_to_cpu(sblk->id_table_start));
 
 	sb->s_maxbytes = MAX_LFS_FILESIZE;
+	sb->s_time_min = 0;
+	sb->s_time_max = U32_MAX;
 	sb->s_flags |= SB_RDONLY;
 	sb->s_op = &squashfs_super_ops;
 
diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index 4ed0dca52ec8..1da0be667409 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -843,6 +843,10 @@ static int ufs_fill_super(struct super_block *sb, void *data, int silent)
 
 	sb->s_maxbytes = MAX_LFS_FILESIZE;
 
+	sb->s_time_gran = NSEC_PER_SEC;
+	sb->s_time_min = S32_MIN;
+	sb->s_time_max = S32_MAX;
+
 	switch (sbi->s_mount_opt & UFS_MOUNT_UFSTYPE) {
 	case UFS_MOUNT_UFSTYPE_44BSD:
 		UFSD("ufstype=44bsd\n");
@@ -861,6 +865,9 @@ static int ufs_fill_super(struct super_block *sb, void *data, int silent)
 		uspi->s_fshift = 9;
 		uspi->s_sbsize = super_block_size = 1536;
 		uspi->s_sbbase =  0;
+		sb->s_time_gran = 1;
+		sb->s_time_min = S64_MIN;
+		sb->s_time_max = S64_MAX;
 		flags |= UFS_TYPE_UFS2 | UFS_DE_44BSD | UFS_UID_44BSD | UFS_ST_44BSD | UFS_CG_44BSD;
 		break;
 		
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index f9450235533c..d3b10900fc24 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -1663,6 +1663,8 @@ xfs_fs_fill_super(
 	sb->s_maxbytes = xfs_max_file_offset(sb->s_blocksize_bits);
 	sb->s_max_links = XFS_MAXLINK;
 	sb->s_time_gran = 1;
+	sb->s_time_min = S32_MIN;
+	sb->s_time_max = S32_MAX;
 	sb->s_iflags |= SB_I_CGROUPWB;
 
 	set_posix_acl_flag(sb);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
