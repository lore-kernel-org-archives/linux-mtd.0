Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073CBC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 10:27:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DAF7206E0
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 10:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EnAtC5Rm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DAF7206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lUMCBn7tSfmPNq9Zv9HTumXNZqEF7SUt9SjsHc0+8fw=; b=EnAtC5Rmhgx1F+yM2q6hMK0x6I
	QTqlbdSoadkUSzNwuFtvT3CP7KN2IOYrtiAOEVy2VZhPWFfnYoaECDuVHsqeC65sJoTu36LbITd8e
	yHlE9psbnnZU2nb6xS2dyTspd/S+9AgydCKgAX/HIzIcR18UTyM+vWkXz51Z3m8cUJ9VQcFH6Eo6v
	+N31meqjSkn+XtFHR9zSjgQwz098PYBNPOkIqSvZKSlvXpV8FKFgIrClf9tm52pOfBkLRlHHwqAi+
	6LKX0+IYYqwwM9CNj4IRujRsnVFjkVp/+6f4en1Yhr6vysEL4KE2WhU0SBHX9B7QBnGzdltg5zvKS
	4sfCOjfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khs0I-000825-S7; Wed, 25 Nov 2020 10:26:26 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khs0C-000816-Ug
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 10:26:24 +0000
Received: from [2a0a:edc0:0:900:2e4d:54ff:fe67:bfa5] (helo=ginster)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jbe@pengutronix.de>)
 id 1khs07-0000SM-JR; Wed, 25 Nov 2020 11:26:18 +0100
Received: from jbe by ginster with local (Exim 4.92)
 (envelope-from <jbe@ginster.office.stw.pengutronix.de>)
 id 1khs06-001Ojp-8Y; Wed, 25 Nov 2020 11:26:14 +0100
From: Juergen Borleis <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Wed, 25 Nov 2020 11:25:47 +0100
Message-Id: <20201125102547.333379-1-jbe@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:2e4d:54ff:fe67:bfa5
X-SA-Exim-Mail-From: jbe@pengutronix.de
Subject: [PATCH] mtd-utils: ubihealthd: this tool does not depend on UBIFS
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_052621_002783_7158E3B7 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: richard@nod.at, post@lespocky.de, Juergen Borleis <jbe@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The "need_getrandom" check and result is used only for the "ubihealthd".
This tool is very important to have it around at run-time, while the
corresponding "mkfs.ubifs" tool is still optional (think about offline
generated ubifs images).
Since compiling "mkfs.ubifs" adds more dependencies (various shared
libraries), buildsystems for embedded devices will add these shared
libraries to the root filesystem even if "mkfs.ubifs" isn't used or
installed.

Thus, handling both tools independently makes sense. The previous behavior
is kept, e.g. if UBIFS support is enabled, it enables "ubihealthd" as well.

Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
---
 configure.ac | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index bcea080..a5f6261 100644
--- a/configure.ac
+++ b/configure.ac
@@ -71,7 +71,6 @@ need_xattr="no"
 need_cmocka="no"
 need_selinux="no"
 need_openssl="no"
-need_getrandom="no"
 
 AM_COND_IF([UNIT_TESTS], [
 	need_cmocka="yes"
@@ -107,6 +106,9 @@ AM_COND_IF([INSTALL_TESTS],
 	[AC_SUBST(testbindir, ["\$libexecpath"])],
 	[AC_SUBST(testbindir, ["\".\""])])
 
+AC_ARG_ENABLE([ubihealthd],
+	[AS_HELP_STRING([--enable-ubihealthd], [Build the ubihealthd program])],
+	[need_getrandom="${enableval}"],[need_getrandom="auto"])
 
 AC_ARG_ENABLE([lsmtd],
 	[AS_HELP_STRING([--disable-lsmtd], [Do not build the lsmtd program])],
@@ -142,7 +144,7 @@ AM_COND_IF([BUILD_UBIFS], [
 	need_lzo="yes"
 	need_zstd="yes"
 	need_openssl="yes"
-	need_getrandom="yes"
+	AS_VAR_IF([need_getrandom], [auto], [need_getrandom="yes"])
 ])
 
 AM_COND_IF([BUILD_JFFSX], [
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
