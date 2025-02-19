Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802D5C021B1
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 00:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXjNEMpL+osqNQVh9eK1PBXdRKOXAgwe2Vh1IcHJDOM=; b=4H1yWdryZYHQCL
	k9FfBnueCR3C+/IEftqrFkjJWXQob/5eXAp0hmpxRDujUQyVpCwi294I6jEJANmP5QhAcQHPYmSt+
	l86tYVW+qjUBYqeFPPPnftivsY6mK5oe9VE867AIVfHDmwllSQOm40m1NYvMmyKIzLrh9QacsP8gV
	uPwmg5Wb2fpIBC5+NC+r4BFOWYQlNxu/CXbQIvaRWJNOTmTO/gCuRO8u+mjA1RTllWlVq0I9y9OLK
	/zpydDwZ/Zacr11Xj7cPvnWGjLlCeT6tZu5RO7mU4cjTTNa/sOU38DLwjikDpsevJpTCrMIr9W3Ll
	jbfKym13jUxFb7D/N4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkY2M-0000000AMid-1giU;
	Wed, 19 Feb 2025 00:34:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkY2J-0000000AMgr-3jZO
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 00:34:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-220f4dd756eso83304985ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 16:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739925239; x=1740530039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXUOxLWwVS0aGA5KIQveEBzdA/JIANBBEmz0GZbP66Y=;
        b=NFNQztgvnAyLvH/RQfs0HfNfOFAO3nAt1FDnlykvD73JyZPE+6YTLY5ENqI12RXTR8
         tC71DWUW5z/NN/svjGRTCHJTk47DlbkMYxVzgO0XCeywnnKFT8wsVXryOkNYMTRMTG6k
         dlPXdlTG2+3KUnjHQS6phKHwKie6O5mi58S6robXE3M8TI7XEdP2QpONJ9iLNsR7ikoC
         zIUpRRYM+qjlAReKCZ2HvXvyHC9dTH3vMzNcH1Fa8gMWcbEpgHPUqzy6AMd6kzUVHhJ0
         KZhf+U2X9XCsXkVz8o5BZveekWvpR+OEr8D7AHRn/h0br81ZDvcxILFxnyoRIlVz3KKC
         Ra3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739925239; x=1740530039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXUOxLWwVS0aGA5KIQveEBzdA/JIANBBEmz0GZbP66Y=;
        b=uxEOX4Cb+bnb8IZOn48YOBiXQUN+penl6xHyNZlw/dMbuor1i4Bam2mXZj0dvJT+Pt
         oZ7pkql63hnX0i1LWVV9F5bYdSCCRKHNJmBWjfHze43+MNGH1FEk0hXMTWd9b5awZd1k
         dFCmGxgshrOiM5vfL6jqDoGCg32ArJHJzjFk6PtjiESG1CheCZDMumB7Rxp9HpWEAdOq
         LvEch0ovSZmlwUdG+RWDsGNNc8wUULQ1a+sse6JbVmdiIQuKIvKSwe5fwjwC/T/8wiK8
         hBtW4F3IlA8utxGJdo/hMpOArGbu1bmS2cAHjsZ2PQtSaC5jGSrKNzkCCaeuGL/peHHI
         nZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCU18fwmjds8HOSAlxFxTeDUTuYlMRAJFsMs001aOX114UV0kto0idsgEvxcN83JRa6VQjQVhjvsl2U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyX2o/Dtf9rWU4ejsNA5M6mX2FHNbGnZqq4mxqUEk08cnoKxG2
	pO6Ce8NTe8tJCaMQVcG3F9Uq5jyGwl5klP8F1NumfbWQGxTFRY24xePnmw==
X-Gm-Gg: ASbGncu7satU2o4366zuEo8sA1LEyySQ1I8Tt/qGubl7lSUB3vFGKFWfaihHdActhaO
	9wc4rbg+P/ZevaNoN5MPgUwMYjJYS58IBTDEVL0AunNsx9Nbybp/dzlVHeUWfW2nTQ/GF6olnMW
	oY9E7EbVTfPQ3yeMMzgA1/gIYW1M3y/8TJWXn2UG3KkR3vJ76qocvIkmyK4PRkFYlr/3QucK8ek
	Rpi4TKm60lVOFJmkKRA2qUyyD2bKBiHbfVtZ8J+Qgrc6nK75s+yo8v+117Vxszwq8D0e3TAHQBq
	9NHMJA8hpZIYeQXOXBv7UDkFZ+QgKg==
X-Google-Smtp-Source: AGHT+IGpTw9h91a49rKbsIj+yuXPKUQ7u/nVuKPo6iD58HhtplRIRN0QWpRB7s0cbmI9f7p+bzZF1A==
X-Received: by 2002:a05:6a00:13a6:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73261900ec3mr24610931b3a.24.1739925238888;
        Tue, 18 Feb 2025 16:33:58 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9d59:514f:431d:4a45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e34bsm10965017b3a.108.2025.02.18.16.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 16:33:58 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 mtd-utils 3/4] configure.ac: Add a check for execinfo and backtrace
Date: Tue, 18 Feb 2025 21:33:28 -0300
Message-Id: <20250219003329.2078308-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219003329.2078308-1-festevam@gmail.com>
References: <20250219003329.2078308-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_163359_931264_EB288729 
X-CRM114-Status: GOOD (  14.47  )
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
---
Change since v2:
- Check for backtrace support in libc first and if not
found, then check libexecinfo. (Khem)

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
