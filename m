Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A010E77357
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Sep 2023 05:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJwyPQmDWzu8BRkJi/VU3pL93odIqFsKETkSAmgCnkg=; b=rPDAEvM6fkhdAJ
	0LCKtTLYMJVokiXNIe13ExIWn+irlp/ar4yKo+RUIeOccVNCVJbbO/vU19fOjPcpk3c0wnMAbH8ax
	DQ/N/9Tkh8wePlkBuC6+AQHJ++T82/BHVlulEuwTsL8KrkUMRYgPh7SIDT4ITFRv+a/Re6fPpJC6g
	SxglRSnhzv4u/0lIv/KHoax2nxck8CSbMmxWt3v13xHSU6OsPODcu2Ac5pGEd4TeNOPt6MHVmFhvn
	diMjXcHM/+3Cd5wxyfZ/S348EnBRywwMqvLQ8AvfV4+XqyyPLMgzjMO+rWv3pIzxAQxD2mg8cV4IT
	XmUJwirhG6m1Ot/GIPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmS6w-008yKF-0R;
	Sat, 30 Sep 2023 05:01:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmS6t-008y9I-0T
	for linux-mtd@lists.infradead.org;
	Sat, 30 Sep 2023 05:01:48 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c5db4925f9so10285765ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 29 Sep 2023 22:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696050106; x=1696654906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oH9OE0TWxgoHAH6ZcW6POZxSiYPCkmArEwnHUlA64Qc=;
        b=Dzw2ZtooEQiyP7u7rTmsJdHuMXKmtAsnxFHWQaA7NyM+ML8nWSYbYayi0C6aBqac0E
         2U/4IyCfF4uJjpclIgkJmWm3tvg2XpMHokbC5H3dDmJ2EklI8vaRa4/NIB+dJfLQ3+ek
         E/21CYwz1Si2px1Y1/uVF3tAggBBlQxNWNlAqJLDBOMBZcrhqr1wKeaw+rlQYvSt5Bih
         9z16dISx5o7SBBsCc+QPzhw3ewbZ5bwgdK3cjnOnCl031XfWqpEXcJ+kx/3bLiUUSSi1
         YKnYqjsOI10W/5pEzcaWx4ZZXAz0tgpupdn2uSVPrXWZdBzPWHwooWU0vVP1DOt2Q95u
         PK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696050106; x=1696654906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oH9OE0TWxgoHAH6ZcW6POZxSiYPCkmArEwnHUlA64Qc=;
        b=Hv5KvwGnFO2zXpxXXwQoByCzczSAge8FDcgL0/RQLVrwAKkPk7EHw84JnDOsczPV8R
         n+lt1XH2DPd3GI1lo69OkvixSuxqIj9uULAaZEihdOrShrq2CDPn8LkiZbc2UXc2K6C5
         0o6RykWkQvKvgrAZr07Tnf2FHxZbWYdJD6N9BhHNmirmBSGljopgkoJZ0dtHkEvK6Gzu
         YG/qEa3FAIYJJshwSP/bv7UXVVsCHqtQA0X0C77q7nspSqDJ00rYDtTiQa4GuVx+ZPg3
         UVTrEKE/giREJekqwwSjH7Uk+BXOY5rWTITrqY/QmukD/tiwEFP5d5od8aXuGgOxTBL1
         ntpg==
X-Gm-Message-State: AOJu0YwvzT61LE3vUVg9/kQCb6X9RG39wRVeYFrrCmOoNh6dacdy0jVK
	gUH7VM+ZaoqBNUdCRQLniLI=
X-Google-Smtp-Source: AGHT+IHAzgG2FCKLymM5welKmJ5/CePC/XSaVTDjJbbILvZOuVR8hRdcHee/TCME5wh9arWVsysT6g==
X-Received: by 2002:a17:903:41d1:b0:1c3:432f:9f69 with SMTP id u17-20020a17090341d100b001c3432f9f69mr11026355ple.23.1696050105710;
        Fri, 29 Sep 2023 22:01:45 -0700 (PDT)
Received: from wedsonaf-dev.home.lan ([189.124.190.154])
        by smtp.googlemail.com with ESMTPSA id y10-20020a17090322ca00b001c322a41188sm392136plg.117.2023.09.29.22.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 22:01:45 -0700 (PDT)
From: Wedson Almeida Filho <wedsonaf@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 15/29] jffs2: move jffs2_xattr_handlers to .rodata
Date: Sat, 30 Sep 2023 02:00:19 -0300
Message-Id: <20230930050033.41174-16-wedsonaf@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230930050033.41174-1-wedsonaf@gmail.com>
References: <20230930050033.41174-1-wedsonaf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_220147_185909_9FF3DAA2 
X-CRM114-Status: GOOD (  15.12  )
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
jffs2_xattr_handlers at runtime.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
---
 fs/jffs2/xattr.c | 2 +-
 fs/jffs2/xattr.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 3b6bdc9a49e1..00224f3a8d6e 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -920,7 +920,7 @@ struct jffs2_xattr_datum *jffs2_setup_xattr_datum(struct jffs2_sb_info *c,
  * do_jffs2_setxattr(inode, xprefix, xname, buffer, size, flags)
  *   is an implementation of setxattr handler on jffs2.
  * -------------------------------------------------- */
-const struct xattr_handler *jffs2_xattr_handlers[] = {
+const struct xattr_handler * const jffs2_xattr_handlers[] = {
 	&jffs2_user_xattr_handler,
 #ifdef CONFIG_JFFS2_FS_SECURITY
 	&jffs2_security_xattr_handler,
diff --git a/fs/jffs2/xattr.h b/fs/jffs2/xattr.h
index 1b5030a3349d..7e7de093ec0a 100644
--- a/fs/jffs2/xattr.h
+++ b/fs/jffs2/xattr.h
@@ -94,7 +94,7 @@ extern int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname
 extern int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
 			     const char *buffer, size_t size, int flags);
 
-extern const struct xattr_handler *jffs2_xattr_handlers[];
+extern const struct xattr_handler * const jffs2_xattr_handlers[];
 extern const struct xattr_handler jffs2_user_xattr_handler;
 extern const struct xattr_handler jffs2_trusted_xattr_handler;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
