Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B889CE7734F
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Sep 2023 05:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRQuIEtncuJoCeyis0BS2IGa7tCn7c+8SgdmgowYmCA=; b=GUVDqM5wBoOwho
	KMGLE4y4b/UB57/AxQOJHpAREPUnDGdacKZuwGXZJYNbTcVnkFes8pyewtIVjUT/UqEAXeeOjYIjq
	ZdSz2RHQHHToypZoQ6Qkxcd/SBA7TYnA5kctwOfurjldCRi3ZZJ5fXzp/EcVb9+TEZm+p/g52IeX9
	MKAQQvZZupPRwb9oNPIHHYPynJvqFt1MRkWyzWne7Rh/YsIpwnR7CcXOOqI6wnXYubPc+kdgd8AIn
	fYCyIQhA0PKUq4cmQ2W4v7UxuDggKKWYYPDALd+njLbxLVMRGlkjHwmqCIRS3nM1Rs2I/em1OJn6d
	JxACiZ/uVFOjtaEmbs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmS7U-008yOr-1o;
	Sat, 30 Sep 2023 05:02:24 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmS7R-008yNp-33
	for linux-mtd@lists.infradead.org;
	Sat, 30 Sep 2023 05:02:23 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-577fb90bb76so8247088a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 29 Sep 2023 22:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696050141; x=1696654941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFRp7G+qDWZEQApnHi6mmaUctO5D9NgBjXm6s7XGppI=;
        b=Lv6aNP8RoSYIS2mt7+Jy/Pys1XmiolnTNsQAbJgdcLikq78Sx8RgIAxQrfYXvdUswq
         AN+qOwAHn8TkzxCXLV6hbOusbXfr5LpoRFPzi62hjQlX4a3aCtd6QTV7TV0R0VP9gaXt
         tpihNys2+XF0eITReNkaCPkcuLeslhpGpIT001smhL6aeZjG0+AElIsnXsSI1s7aF7+I
         fNmM2hnBKW1qBegwZGBUX0QWSJ1rOegg0zFLfPlW5eyeto/RNpoZ2qiDDvBWq5udZTOp
         eCaYGLAhUxm07FbeGPOiz3eb8GqaeUeP+yyZWiprD1C/zMaLGNXbYQV50YMtstjOvk6A
         HlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696050141; x=1696654941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFRp7G+qDWZEQApnHi6mmaUctO5D9NgBjXm6s7XGppI=;
        b=BtvEhyfLQgw7x1G2ROt+Svlf4J5VUZLwKk69BmFdN6+aemrV8fXhzXM2Q+Seq0+Lop
         NDvz3mUj5CCJqBRxdbVih0VZyk0Vqeuuren0zVNVBfy2Gsh0+mm47CAeX5q52xZFC+vM
         AAwF1pMoMSTlgLqNxkJ6ZXeGPSGIRagBjdYnMEAtdTGGJWR3l0eXcW/TbGDeQorMErxc
         9gYIeH5nGFY3ThE152R0fz7reoUjmvfFgMvYe453m/3cnzVKZWc6BAkQZCPDF47ecHRz
         PJH3XoLdbabVk2L2F82bFTHnc4kji+dKwvBZG8vAqgV+n0n2cviOMklTa6YkLzLiMP8m
         dioQ==
X-Gm-Message-State: AOJu0YwCqfu5bzQwYhJARfqmRCxdBncFR/q7xwttJzgZcMLCF7XVz7iU
	UKQy+OgrphJ/R9Mn/LTq1JI=
X-Google-Smtp-Source: AGHT+IGpIQVcwPvUll8zQVvM7975BEjZofvows5C/41pz1gJI60bATTCFwi9O1QmSqWVIMqSSvJEIQ==
X-Received: by 2002:a05:6a21:998a:b0:14c:84e6:1ab4 with SMTP id ve10-20020a056a21998a00b0014c84e61ab4mr7099900pzb.33.1696050140965;
        Fri, 29 Sep 2023 22:02:20 -0700 (PDT)
Received: from wedsonaf-dev.home.lan ([189.124.190.154])
        by smtp.googlemail.com with ESMTPSA id y10-20020a17090322ca00b001c322a41188sm392136plg.117.2023.09.29.22.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 22:02:20 -0700 (PDT)
From: Wedson Almeida Filho <wedsonaf@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 25/29] ubifs: move ubifs_xattr_handlers to .rodata
Date: Sat, 30 Sep 2023 02:00:29 -0300
Message-Id: <20230930050033.41174-26-wedsonaf@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230930050033.41174-1-wedsonaf@gmail.com>
References: <20230930050033.41174-1-wedsonaf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_220221_984693_95D9E9AA 
X-CRM114-Status: GOOD (  13.23  )
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

From: Wedson Almeida Filho <walmeida@microsoft.com>

This makes it harder for accidental or malicious changes to
ubifs_xattr_handlers at runtime.

Cc: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
---
 fs/ubifs/ubifs.h | 2 +-
 fs/ubifs/xattr.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 4c36044140e7..8a9a66255e7e 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -2043,7 +2043,7 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 			size_t size);
 
 #ifdef CONFIG_UBIFS_FS_XATTR
-extern const struct xattr_handler *ubifs_xattr_handlers[];
+extern const struct xattr_handler * const ubifs_xattr_handlers[];
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 void ubifs_evict_xattr_inode(struct ubifs_info *c, ino_t xattr_inum);
 int ubifs_purge_xattrs(struct inode *host);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 349228dd1191..5e17e9591e6e 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -735,7 +735,7 @@ static const struct xattr_handler ubifs_security_xattr_handler = {
 };
 #endif
 
-const struct xattr_handler *ubifs_xattr_handlers[] = {
+const struct xattr_handler * const ubifs_xattr_handlers[] = {
 	&ubifs_user_xattr_handler,
 	&ubifs_trusted_xattr_handler,
 #ifdef CONFIG_UBIFS_FS_SECURITY
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
