Return-Path: <SRS0=GNss=DD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5C9C2D0A8
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Sep 2020 21:20:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF6121531
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Sep 2020 21:20:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yIbt+CWL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fishpost-de.20150623.gappssmtp.com header.i=@fishpost-de.20150623.gappssmtp.com header.b="shOc33Rj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EF6121531
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fishpost.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QP+uw5orC0KkJX2RTJ+2ytLVaLzZXd0aQOhHaqyt/Sc=; b=yIbt+CWLHFs9EC+knARt9yuKM0
	use+94yn8T1InvgDShPzNJkKrFgIVPcUFDWSCo9fLJkEvUxVbeXcCsdzt76XDMds8gxi+MdQNgayB
	hGyXT33XC8LIm62arKiUA93oAZPd2yINL7tET57kpVSA76wQaAW/biqm+GIJuixUK3T6eSLV1zndC
	iM4RB/5A609FB9wd7C6RPz+ZW0679+/WsNrOSbp8jpD4RbSm94a+7upnwiLF3mdlm+mkwGEO65xv5
	+oU4ubK9Nj+c3S5gJqjYg9Ef1/WErD2d55MNht4KnSKHd5zn2RcOCrl8tEsMJs0EepQDAnywlvipu
	RsO1SsEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMHb4-0003pt-O7; Sat, 26 Sep 2020 21:19:10 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMHay-0003pY-16
 for linux-mtd@lists.infradead.org; Sat, 26 Sep 2020 21:19:04 +0000
Received: by mail-ej1-x642.google.com with SMTP id o8so3218387ejb.10
 for <linux-mtd@lists.infradead.org>; Sat, 26 Sep 2020 14:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fishpost-de.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DBUwrR8mU+wS+GgErMYTfmfawWYf6/TXCdPTGqBOWus=;
 b=shOc33Rj3PFLt58wVQnyyPbXmnMU/yQq6+DXZZ5JWzfKoUDUoMazmgMcnzSRGGRLuo
 zVVSrjKPVPg/dergLNEk7SGgX2vEh3mvq8NQ6t7Jyzhs+G03Kc27sk38biKVeYH/nW3l
 rp3WrjUeTqJrdyVOsOVK29YLQ6YPLWitY3Parfd+W4w9aGJbUQ05K9gNni+roHq+5r5h
 jHGLPx4wkO9tNeL3B1NHOSynv/2HQaPPSjjUfriirb5l5bxaOML2uF6HQP5nCjnKbogU
 KDpS0yYsDlXri5UUND+9SSrW4JhyLdM7+RFW6RJ5wZ/qWyyj9EXOINiinWv1hN7p/vFI
 kV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DBUwrR8mU+wS+GgErMYTfmfawWYf6/TXCdPTGqBOWus=;
 b=OA7WKJOmeijEasEVB8BPq+gMJchvNbikm8AtN1xVPoAX3VE8IouAB16QD1u+Vc6x0Q
 BKf1sCL7N0wM3Q+agVPN+bNUphlc1qgU0vy6yURhpdqV5/hY2bnJH+PP4+Z5tO6NuGgH
 FS9dZLt8yQpMk5X12PV8fV/V2fuC/Xgl8Kz4jaZRi4XuYofyJr0DUzveTxRKnZ9GVAhx
 L8yPB/sfN/kM6u9+Vk/jrGcQ8Z8NDvLX8PQQlTmsJGcNSY5Dob/qeFhl8rfQR/1mSu/p
 t0EjcTMAy48EfsU/xYpNraCw2jUtxMZ8X1xXaTB5v0/ZHPYKE4CS2o+zosgD1axMt7CZ
 hatw==
X-Gm-Message-State: AOAM5309s1mjomhw05NjYvipAiq43GiI3fVNPXjhOxkYFJ3uDLY1HH6J
 Yqi2lEuZQ+ARa0EG4bLLTlS20erE1OVSNg==
X-Google-Smtp-Source: ABdhPJx7H/WHk1/NI5eT7bpOevvC7GAPpGGLjLvVjxq+TyCV/2kK01+1xtj7EVUKVOyNm+KYUI5iJQ==
X-Received: by 2002:a17:906:f747:: with SMTP id
 jp7mr8541241ejb.22.1601155140588; 
 Sat, 26 Sep 2020 14:19:00 -0700 (PDT)
Received: from thinkbage.fritz.box
 (p200300d06f2b7d000ffa48e2e03d4a90.dip0.t-ipconnect.de.
 [2003:d0:6f2b:7d00:ffa:48e2:e03d:4a90])
 by smtp.gmail.com with ESMTPSA id k21sm5349170edv.31.2020.09.26.14.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 14:19:00 -0700 (PDT)
From: Bastian Germann <bastiangermann@fishpost.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] misc-utils: Add fectest to build system
Date: Sat, 26 Sep 2020 23:18:54 +0200
Message-Id: <20200926211854.482-1-bastiangermann@fishpost.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_171904_200660_4280E346 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: Bastian Germann <bastiangermann@fishpost.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

8f627247f6("mtd-utils: move libmtd source files to lib/ subdirectory")
removed fectest.c from the build system 10 years ago.  Add it again.

Signed-off-by: Bastian Germann <bastiangermann@fishpost.de>
---
 .gitignore               | 1 +
 misc-utils/Makemodule.am | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 488b35c..7feddda 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,6 +20,7 @@
 #
 doc_loadbios
 docfdisk
+fectest
 flash_erase
 flash_lock
 flash_otp_dump
diff --git a/misc-utils/Makemodule.am b/misc-utils/Makemodule.am
index 2289252..9a86f6f 100644
--- a/misc-utils/Makemodule.am
+++ b/misc-utils/Makemodule.am
@@ -16,6 +16,9 @@ serve_image_LDADD = libmtd.a
 recv_image_SOURCES = misc-utils/recv_image.c
 recv_image_LDADD = libmtd.a
 
+fectest_SOURCES = misc-utils/fectest.c
+fectest_LDADD = libmtd.a
+
 flash_lock_SOURCES = misc-utils/flash_lock.c
 
 flash_unlock_SOURCES = misc-utils/flash_unlock.c
@@ -35,7 +38,7 @@ flash_erase_LDADD = libmtd.a
 
 MISC_BINS = \
 	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
-	serve_image recv_image flash_erase flash_lock \
+	serve_image recv_image fectest flash_erase flash_lock \
 	flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
 	flash_otp_write flashcp mtdpart
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
