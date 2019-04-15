Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E89CC10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 08:21:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E7AE20674
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 08:21:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CKIgypNY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=schinagl.nl header.i=@schinagl.nl header.b="RdV04alN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E7AE20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=schinagl.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JOJLw6IRUVhbHpxn+91YtE9tg1mb0Yz7Ek42SiYAKg=; b=CKIgypNYLQnVZk
	rNV9HTjZKvzrOlRY4eWTY8es4qVE/W/+FZkL5FpjBRS2PZYBiNhuaWyA+Frt9Cx2bA9K/SDqhrGmq
	ZeAak+UFp7z5Rrk5RA956kt3tRXJiCl3fDcoxo4XrSWro3j0CXQuwwxokhBQ45SdpZDVPb4kkTMFV
	QRe1Zt7aMFMNOcwtBy0C9ltU+NNShszX0CD6VqL5/vW6oGZqz/DUr0qFO3R0wo7ODTa+JDxvZGGFL
	bXoU2hUntrggh/YG+OjPTJWabLQRJ2U2/rLqN58PA5kp7UPOi1oFQt0Fgp5VzmWvEQnMY1DnfHJ1D
	hS97qmm7ZJ8ZFyKtmvZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFwrW-0001C1-6p; Mon, 15 Apr 2019 08:21:10 +0000
Received: from 7of9.schinagl.nl ([62.251.20.244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFwr3-0000ZW-Pd
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2019 08:20:45 +0000
Received: from 3of9.evbox.com (90-145-215-130.bbserv.nl [90.145.215.130])
 by 7of9.schinagl.nl (Postfix) with ESMTPA id 3F80FEE2613;
 Mon, 15 Apr 2019 10:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=schinagl.nl; s=7of9;
 t=1555316440; bh=rKtlWGFQF0416AT0jBhPkY0XdpsvdfkoGyd3JkO/pYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RdV04alNR7aJtN+44ax0p3KzsDAEdaNAXn/h7naWrNLeCyNJIeh84D+nN9vvMiW7h
 iDm/fvJIwuOUzPCVOFY3AnHL7iDEJ1/G5JtWT93zcUdgK9SluOUgtPQhnkDOMH7Vwr
 spGKvNzWzPWOPV0GHy3qqLKZCLa0hzNXErxSMINY=
From: Olliver Schinagl <oliver@schinagl.nl>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] unittests: Define the use of _GNU_SOURCE
Date: Mon, 15 Apr 2019 10:20:31 +0200
Message-Id: <20190415082031.600-4-oliver@schinagl.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190415082031.600-1-oliver@schinagl.nl>
References: <20190415082031.600-1-oliver@schinagl.nl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_012041_994907_C671C3F8 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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
Cc: Olliver Schinagl <oliver@schinagl.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The unittest suite actually makes use of some _GNU extensions during the
build (loff_t for example). So lets enable this in the makefile.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 tests/unittests/Makemodule.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unittests/Makemodule.am b/tests/unittests/Makemodule.am
index b7ae575..df1041d 100644
--- a/tests/unittests/Makemodule.am
+++ b/tests/unittests/Makemodule.am
@@ -6,7 +6,7 @@ ubilib_test_CPPFLAGS = -O0 --std=gnu99 $(CMOCKA_CFLAGS) -I$(top_srcdir)/include
 mtdlib_test_SOURCES = tests/unittests/libmtd_test.c lib/libmtd.c lib/libmtd_legacy.c
 mtdlib_test_LDADD = $(CMOCKA_LIBS)
 mtdlib_test_LDFLAGS = -Wl,--wrap=open -Wl,--wrap=close -Wl,--wrap=ioctl -Wl,--wrap=read -Wl,--wrap=lseek -Wl,--wrap=write
-mtdlib_test_CPPFLAGS = -O0 --std=gnu99 $(CMOCKA_CFLAGS) -I$(top_srcdir)/lib/ -I$(top_srcdir)/include -DSYSFS_ROOT='"$(top_srcdir)/tests/unittests/sysfs_mock"'
+mtdlib_test_CPPFLAGS = -O0 -D_GNU_SOURCE --std=gnu99 $(CMOCKA_CFLAGS) -I$(top_srcdir)/lib/ -I$(top_srcdir)/include -DSYSFS_ROOT='"$(top_srcdir)/tests/unittests/sysfs_mock"'
 
 TEST_BINS = \
 	ubilib_test \
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
