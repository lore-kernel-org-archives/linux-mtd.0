Return-Path: <SRS0=aBH3=RZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379C3C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 22:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 052402190A
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 22:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EsvAr15F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNu8iEd3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 052402190A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DVWt7UYCajMi88wxFjQ1306ekIbgFxfTBlRO7Y1dDkE=; b=EsvAr15FReanyO
	81hDTUaC0RQ4bQ3/tXfSf6SRAWtselzbpPW6SbKTADh2sQUHDiio8t0Ega5iqAzCc6fHzVSkJ15SP
	IkF/4X294QdSECLctW9wy21u31jxE3BoICk86PX9pzXoEpT0Yi4whrlmQioBQKHVu6TdCpcJsTbvj
	ruOahi9BePT8fAYx2yqoVozPnwNaSd4fz1kBPifHh1m/J5dyymeCw6Y0VC1p6hVXMXSp/YfhmcW9P
	OyoY0dBNXhXk71c9uMgCbVoF3XdHY7jtS1gaOzOHBZRW1ExlRPyHfyYss+HRbdxxardz91P/fF0Dt
	v5MbWHp5/WluMdlBzIIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7SMx-0006Hr-S2; Fri, 22 Mar 2019 22:10:31 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7SMv-0006HS-8m
 for linux-mtd@lists.infradead.org; Fri, 22 Mar 2019 22:10:30 +0000
Received: by mail-pg1-x544.google.com with SMTP id p6so2403884pgh.9
 for <linux-mtd@lists.infradead.org>; Fri, 22 Mar 2019 15:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=1iKqD1ucN45IcW6wn6xqJB3PQ7tx9hiUKga7iqSy8Fo=;
 b=oNu8iEd3HGy90AG4P3Ha/ryRQ1OHUj2cEnCMAxScR++M7DR97urKTrTt6gTu4JDKzr
 V/kac9zm8buGhGcAk/+hZOJfULhjOB4jM6zAGyqKal/sqWb0t8JozLLbgfG1f9GRpUSP
 /eBSY6J5vKdbdpLHxItqz7cDT2hzM1cFSYE5TGJ4TjBnATC2r++SWLZUeTw1ezI1RzYL
 jPC/dFQkzYRQm0+x2/oQULOj0CdovEvTakhUh1MvtgPIBX6dt6PJCTDbgUTlHGF3S1Q+
 898kMRW3mqZTd6KbqqpBNXu9BpqefeRgYkGkWBIs7tUmGM0KDbJbwHDyRNG2ea0057/I
 Y1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=1iKqD1ucN45IcW6wn6xqJB3PQ7tx9hiUKga7iqSy8Fo=;
 b=F+4GgyPBxys9RwWDijBsmAXOjLD3TZR38EVnFQi5SOvHcHjr2YbNX15ZYT/ISrkMwB
 dGuAIc84M1QnQ8C3GZFLufrLiFB61ve2l2uFm+JiSvsSu5i92nJNspN1NYdfJRp6e3W2
 xuPS6bDSAhKYYZbalmx1Du2XTk8/lT7JxAzQ5khYOUfD2aKt6olx5LUHAW8qZImtJnGx
 C9Mv5Y69JH1c+YRvyKFu/fjiGxyUUialqItYjEVdGCxaKU5oFfRK+WusnxhwVIsNGFrr
 L/RUbDs/8k8NWNEgRRJOsu8rOSCG5gmMrFQi8WdDRKkUxLG0FtR9iwqr0rofJFsfoaLP
 dJEQ==
X-Gm-Message-State: APjAAAXEb0E8lUvqkgnjKsplEcgNH7lepanlDGQ9gkbAap9dHbVzkPfL
 vsYepjeK33oM2pFZaVL0KlaDWI2qg5M=
X-Google-Smtp-Source: APXvYqyXQ9geD+0hj3lSdj7CuG/licv3br7cmSOuIvZ9S1W6JJcf4EionWr5CJu1q4oKN4TztTtc6A==
X-Received: by 2002:a63:5541:: with SMTP id f1mr11332970pgm.38.1553292627746; 
 Fri, 22 Mar 2019 15:10:27 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.168.123])
 by smtp.gmail.com with ESMTPSA id j6sm13007298pfe.79.2019.03.22.15.10.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Mar 2019 15:10:27 -0700 (PDT)
Date: Sat, 23 Mar 2019 03:40:21 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH] fs: fix warning about Using plain integer as NULL pointer
Message-ID: <20190322221021.GA24814@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_151029_335986_E1A108E4 
X-CRM114-Status: GOOD (  11.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sparse warning below:

sudo make C=2 CF=-D__CHECK_ENDIAN__ M=fs

CHECK   fs/f2fs/data.c
fs/f2fs/data.c:426:47: warning: Using plain integer as NULL pointer
CHECK   fs/notify/fdinfo.c
fs/notify/fdinfo.c:53:87: warning: Using plain integer as NULL pointer
 CHECK   fs/ubifs/xattr.c
fs/ubifs/xattr.c:615:58: warning: Using plain integer as NULL pointer

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 fs/f2fs/data.c     | 2 +-
 fs/notify/fdinfo.c | 2 +-
 fs/ubifs/xattr.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 97279441..15a2381 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -423,7 +423,7 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 
 void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type)
 {
-	__submit_merged_write_cond(sbi, NULL, 0, 0, type, true);
+	__submit_merged_write_cond(sbi, NULL, NULL, 0, type, true);
 }
 
 void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
diff --git a/fs/notify/fdinfo.c b/fs/notify/fdinfo.c
index 1e2bfd2..ef83f40 100644
--- a/fs/notify/fdinfo.c
+++ b/fs/notify/fdinfo.c
@@ -50,7 +50,7 @@ static void show_mark_fhandle(struct seq_file *m, struct inode *inode)
 	f.handle.handle_bytes = sizeof(f.pad);
 	size = f.handle.handle_bytes >> 2;
 
-	ret = exportfs_encode_inode_fh(inode, (struct fid *)f.handle.f_handle, &size, 0);
+	ret = exportfs_encode_inode_fh(inode, (struct fid *)f.handle.f_handle, &size, NULL);
 	if ((ret == FILEID_INVALID) || (ret < 0)) {
 		WARN_ONCE(1, "Can't encode file handler for inotify: %d\n", ret);
 		return;
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index f5ad1ed..066a566 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -612,7 +612,7 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
 	int err;
 
 	err = security_inode_init_security(inode, dentry, qstr,
-					   &init_xattrs, 0);
+					   &init_xattrs, NULL);
 	if (err) {
 		struct ubifs_info *c = dentry->i_sb->s_fs_info;
 		ubifs_err(c, "cannot initialize security for inode %lu, error %d",
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
