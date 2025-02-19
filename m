Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00721C021B1
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 13:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4NKosgZEmKVA83u0v2LHZjfJlpej3iJ5KxXEUmTku8=; b=dUulv/ZU+n92T1
	qt2dn+hC95cIFfaNiJhemE5DmxlrhF7vyMgqBzUMGN7rBYupi4PdQyTU9INj7vGEd1t1rr4MNHtsd
	ovZVhCGRdfpwsd6SAmps1+GPj/nTHyjxCRjLGVDWnicmuv4bngCSl0cNfWAWuS5yT6fkxNlBjZIYx
	dMVAFHLq4+DTrbaHUuaffZHoQzELOa4PWjB0Ya0oLcva6wNG5jpcRJbiHDo6NCW8GLaWUasWCax4K
	DRjkraTYGygs6ziUAE9dIXVYqd6dKsahNzdJcieOXUEXGSJxV9gZkd8v4k3errEIEKZQ9KwqK2fV1
	zI1icADuhQeZ9WEj0GDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjkh-0000000CqbA-1Zrw;
	Wed, 19 Feb 2025 13:04:35 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjjF-0000000Cq8A-4AtD
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 13:03:07 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220d28c215eso98074215ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2025 05:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739970185; x=1740574985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yRx/1lBuZpxiEA2LG6EtF0eiB6bd6h92z+zKSvhsKs=;
        b=lURiYJFTzVOMQwKAHryf+t+yftFkDyG469EBR22Fp+11NMreopVNXLpuyXvQ+Ttwsu
         yzR2zK+4XZS6udhIms7Q1d6VAcehCBp49tGzryCupsJkE8bwhZCW6ZLjAcojMDhESQDa
         k9Knb+ZoEs4v6VfG9vL9+wj0hZwxyLBH5TLWg8Nxz21eeya+JfkJQPXUd+SWnfJBOtXm
         9MlbEB+iruw0h3HycHQGor39PC9dxzBtLiXgUs5pXn96n/OWX0HqVmoSRNN/CElrs2mc
         jbo7/CdUNNJIfGjt9cEGiVdlXFfeN29HrlztGr6FZLwJvVKDd0Cn3GOYXvwYC7B52Iro
         pIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739970185; x=1740574985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yRx/1lBuZpxiEA2LG6EtF0eiB6bd6h92z+zKSvhsKs=;
        b=w/ml7TCamCQLjxK9zTEjoKa1DesBtu8NwDJvWWkzHQFHIQ7HCLZiV8PrTqRNPL1tl6
         al5Riy+lJUO7kMz89vMIVOVis9V/n/vx5xtn2tv5qVScaQvk8ldudlaHATCVRF6kd0+x
         p3z91TSR/3yDEwJ8tge75jZ5WPGXQzl5jBgO85LglykA/FOWcmi2jWjGPUNb1U4PrMMv
         qnSTlKLgLFD0E7tDubfH3gO9Cjf99hpSwcXp63vHzayAFj1taWELSyhWv7nBaCBioC+u
         eVcYWzumy2CjEffqBayUFPPJez23DkPQqOPB9n5qPe44MbugK9FRZE08rHdjU5F+hROX
         DGig==
X-Forwarded-Encrypted: i=1; AJvYcCW3RAPoFdkZxqQkyuBKADdUvzlsrV4ywzlpMTNYbpGLqsFTCTR6L3uc0OV1OiD4fmrrNWgOXEICpPE=@lists.infradead.org
X-Gm-Message-State: AOJu0YypEBmzdhZrWatOV69GuP8ObYDDOffGW65ZjGbCQS6TjxcJwA5g
	bPPiKzqABK4FL4w+xzrjEAgBw1GjuStBIeBebsxIptPpPaT6RUT+
X-Gm-Gg: ASbGncubSTNNAOz4KeKXgFvO80AhKlhbCLF4nYp+lokMfdYznYrnsNWfNssWq/WGR5C
	XP141+ljRxzQGNpzkO/Z164WYwgvQUB3MkWsh+H6NvMVPd7/75rj6mpoZKk24Ne0hZ8bLxQFZTT
	K5+i/kCYaEhIXuNqkj7uMsWD+PDYuzZ29gCCJ7xHgPbzErwVW2pIaPF0dmHMNoIbMc5ZcfqNgpW
	jKy6YLj1s7izJ9FPm0IuZ6hhmaYlCLb0Gq8EoktZDPvTOO20t2JOeCWbmPxnMoWtchE6O6erW3W
	6Vq/PPBMVLaoH3u5S3xjlwm/JQNC
X-Google-Smtp-Source: AGHT+IESJJrdvOT07xmlY013pdCVtuCef6XTEeSXwBDJRJnp68eIZvzIENMkPhlTenVXyNrv0k2KGw==
X-Received: by 2002:a17:902:ce0d:b0:215:9894:5679 with SMTP id d9443c01a7336-22103c5f5e4mr309188685ad.0.1739970185044;
        Wed, 19 Feb 2025 05:03:05 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d7a5:133c:3d2:703a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22120093e41sm57503565ad.93.2025.02.19.05.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:03:03 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 mtd-utils 3/4] configure.ac: Add a check for execinfo and backtrace
Date: Wed, 19 Feb 2025 10:02:43 -0300
Message-Id: <20250219130244.2119582-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219130244.2119582-1-festevam@gmail.com>
References: <20250219130244.2119582-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_050306_030093_C107BBB4 
X-CRM114-Status: GOOD (  14.28  )
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

musl relies on an external execinfo library to provide backtrace
functionality. If musl cannot link to libexecinfo, the following link
error happens:

| /work/festevam/oe/poky/build/tmp/work/core2-64-poky-linux-musl/mtd-utils/2.3.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/14.2.0/ld: ubifs-utils/libubifs/mkfs_ubifs-io.o: in function `dump_stack':
| /usr/src/debug/mtd-utils/2.3.0/ubifs-utils/common/defs.h:71:(.text+0x25): undefined reference to `backtrace'
....
| collect2: error: ld returned 1 exit status
| make: *** [Makefile:2959: mkfs.ubifs] Error 1

Fix the problem by checking for backtrace support in libc first and if not
found, then check for backtrace support in the external libexecinfo.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Suggested-by: Khem Raj <raj.khem@gmail.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
Change since v3:
- None.

 configure.ac | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/configure.ac b/configure.ac
index 2a79ba820fc0..296901e61760 100644
--- a/configure.ac
+++ b/configure.ac
@@ -238,6 +238,17 @@ if test "x$need_cmocka" = "xyes"; then
 	PKG_CHECK_MODULES(CMOCKA, [cmocka], [], [cmocka_missing="yes"])
 fi
 
+AC_CHECK_FUNC([backtrace], [have_backtrace=yes], [have_backtrace=no])
+
+if test "x$have_backtrace" = "xno"; then
+    AC_CHECK_LIB([execinfo], [backtrace],
+        [LIBS="$LIBS -lexecinfo"
+         AC_DEFINE([HAVE_BACKTRACE], [1], [backtrace is available via libexecinfo])],
+        [AC_MSG_WARN([backtrace support not found])])
+else
+    AC_DEFINE([HAVE_BACKTRACE], [1], [backtrace is available via libc])
+fi
+
 AC_CHECK_HEADERS([execinfo.h])
 
 ##### produce summary on dependencies #####
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
