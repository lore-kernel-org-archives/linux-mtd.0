Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC5EEB1053
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICTsf+SoMH2O06pVClm2Xl+mCFIAJwdbgcHBXYVwISs=; b=T0wE4ngLAvutq/
	XHGFbDkw5233B48BTYm8DdNTyYg1rqkGWLCHY6sY8cFGjHMnXl9dtp2nbLB5GeH4P1ubCsWdMHv7k
	Xe0AxF0Yf4OTUgHCImu+IXIaf8QAvHR8ZW+o/TlTYLFa5bNtitL+Dv9PwodkI46O+ugnf29AfhCdY
	lKsTbrxduZBKT0fwc7W5JB1I8To/xjByZ0Ciexg0deiKKZ694ERB3B/wv2TEKpQd3yEbB17Y0SL6j
	ko+uKvTUeWJ8wc38cDHDXftxZD3WAHRpwu/KrTu7fY2Wv3Xwz1MvtIms5vx3ADsgnt3sKJPDrZPAc
	gelJG3kA4dDdQnAJ93AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgc-00000009Kc2-2zCc;
	Tue, 10 Mar 2026 11:55:42 +0000
Received: from mail.avm.de ([212.42.244.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgP-00000009KMF-0qnn;
	Tue, 10 Mar 2026 11:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143723; bh=pg0bcAlKCqGzZYxxvjTHT3BjuiImw/JCztrCxw0OaYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bIWX9HTo18B4ZE3sIquR8sbft3qzxzntZILxo7B74pgnu0rbeOHxAC7dlzZUeUKhf
	 HyziuuxI8v1FJdI0XETgMVlTILYL71/sVzADfcPBmDn0JPtGKUshimXXHFg01f3FBK
	 jYVNQFVbnSBvARzQ5cTWzBurkew0k16ZhIWvNTOE=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006aa-2367-7f0000032729-7f0000019cb8-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:23 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:22 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:27 +0100
Subject: [PATCH 01/61] Coccinelle: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-1-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, 
 Nicolas Palix <nicolas.palix@imag.fr>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3942; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=pg0bcAlKCqGzZYxxvjTHT3BjuiImw/JCztrCxw0OaYk=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAXSiE/1KQSdimAccvhjPksfwMRe29ZGV0WmQ
 dc68UTm4wOJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAF0gAKCRA0LQZT0ays
 23P4B/sHBnCDcdVo4QHtyw/PgaWkSZpnGi/FADclDF/JNscwRsXCrFWzhKgn3xZ7GBKm9yEUANd
 kHYMMKsDVZ5Sq7xOrshFMfBSWpA+0BsCM8pKaxoj2QHBKIDA4UgN93hm4YvutplfF9/q6gdQOqR
 x0WpQkBc7InCLdKCwpXNhcL/HWVvBtzqT2nSOrbK1Rd5xcaVOko56aV82Fnst/bFUZLKttOBTCU
 bLU0LprdbSKp+PN7eyMO37tBs3H4QuuQgnRmZxd8L6mNXEFIpj0UqSFvKNrDWZBtTjurbiwItHZ
 +OYdOt4ryN9C08iNZEaNQULUxcRTzE4KumgPWWtIEShH9ICc
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143723-D8CB5E1F-6C1339D5/0/0
X-purgate-type: clean
X-purgate-size: 3944
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045529_723049_05E60E39 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

Find and convert uses of IS_ERR() plus NULL check to IS_ERR_OR_NULL().

There are several cases where `!ptr && WARN_ON[_ONCE](IS_ERR(ptr))` is
used:
- arch/x86/kernel/callthunks.c:215 WARN_ON_ONCE
- drivers/clk/clk.c:4561 WARN_ON_ONCE
- drivers/interconnect/core.c:793 WARN_ON
- drivers/reset/core.c:718 WARN_ON
The change is not 100% semantical equivalent as the warning will now
also happen when the pointer is NULL.

To: Julia Lawall <Julia.Lawall@inria.fr>
To: Nicolas Palix <nicolas.palix@imag.fr>
Cc: cocci@inria.fr
Cc: linux-kernel@vger.kernel.org

---
drivers/clocksource/mips-gic-timer.c:283 looks suspicious: ret != clk,
but Daniel Lezcano verified it as cottect.

There are some cases where the checks are part of a larger expression:
- mm/kmemleak.c:1095
- mm/kmemleak.c:1155
- mm/kmemleak.c:1173
- mm/kmemleak.c:1290
- mm/kmemleak.c:1328
- mm/kmemleak.c:1241
- mm/kmemleak.c:1310
- mm/kmemleak.c:1258
- net/netlink/af_netlink.c:2670
Thanks to Julia Lawall for the help to also handle them.

Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 scripts/coccinelle/api/is_err_or_null.cocci | 125 ++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/scripts/coccinelle/api/is_err_or_null.cocci b/scripts/coccinelle/api/is_err_or_null.cocci
new file mode 100644
index 0000000000000000000000000000000000000000..7a430eadccd9f9f28b1711d67dd87a817a45bd52
--- /dev/null
+++ b/scripts/coccinelle/api/is_err_or_null.cocci
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-only
+///
+/// Use IF_ERR_OR_NULL() instead of IS_ERR() plus a check for (not) NULL
+///
+// Copyright: (C) 2026 Philipp Hahn, FRITZ! Technology GmbH.
+// Confidence: High
+// Options: --no-includes --include-headers
+// Keywords: IS_ERR, IS_ERR_OR_NULL
+
+virtual patch
+virtual report
+virtual org
+
+@p1 depends on patch@
+expression E;
+@@
+(
+-	E != NULL && !IS_ERR(E)
++	!IS_ERR_OR_NULL(E)
+|
+-	E == NULL || IS_ERR(E)
++	IS_ERR_OR_NULL(E)
+|
+-	!IS_ERR(E) && E != NULL
++	!IS_ERR_OR_NULL(E)
+|
+-	IS_ERR(E) || E == NULL
++	IS_ERR_OR_NULL(E)
+)
+
+@p2 depends on patch@
+expression E;
+@@
+(
+-	E == NULL || WARN_ON(IS_ERR(E))
++	WARN_ON(IS_ERR_OR_NULL(E))
+|
+-	E == NULL || WARN_ON_ONCE(IS_ERR(E))
++	WARN_ON_ONCE(IS_ERR_OR_NULL(E))
+)
+
+@p3 depends on patch@
+expression E,e1;
+@@
+(
+-	e1 && E != NULL && !IS_ERR(E)
++	e1 && !IS_ERR_OR_NULL(E)
+|
+-	e1 || E == NULL || IS_ERR(E)
++	e1 || IS_ERR_OR_NULL(E)
+|
+-	e1 && !IS_ERR(E) && E != NULL
++	e1 && !IS_ERR_OR_NULL(E)
+|
+-	e1 || IS_ERR(E) || E == NULL
++	e1 || IS_ERR_OR_NULL(E)
+)
+
+@r1 depends on report || org@
+expression E;
+position p;
+@@
+(
+ 	E != NULL && ... && !IS_ERR@p(E)
+|
+ 	E == NULL || ... || IS_ERR@p(E)
+|
+ 	!IS_ERR@p(E) && ... && E != NULL
+|
+ 	IS_ERR@p(E) || ... || E == NULL
+)
+
+@script:python depends on report@
+p << r1.p;
+@@
+coccilib.report.print_report(p[0], "opportunity for IS_ERR_OR_NULL()")
+
+@script:python depends on org@
+p << r1.p;
+@@
+coccilib.org.print_todo(p[0], "opportunity for IS_ERR_OR_NULL()")
+
+@p4 depends on patch@
+identifier I;
+expression E;
+@@
+(
+-	(I = E) != NULL && !IS_ERR(I)
++	!IS_ERR_OR_NULL((I = E))
+|
+-	(I = E) == NULL || IS_ERR(I)
++	IS_ERR_OR_NULL((I = E))
+)
+
+@r2 depends on report || org@
+identifier I;
+expression E;
+position p;
+@@
+(
+*	(I = E) != NULL && ... && !IS_ERR@p(I)
+|
+*	(I = E) == NULL || ... || IS_ERR@p(I)
+)
+
+@script:python depends on report@
+p << r2.p;
+@@
+coccilib.report.print_report(p[0], "opportunity for IS_ERR_OR_NULL()")
+
+@script:python depends on org@
+p << r2.p;
+@@
+coccilib.org.print_todo(p[0], "opportunity for IS_ERR_OR_NULL()")
+
+@p5 depends on patch disable unlikely @
+expression E;
+@@
+-\( likely \| unlikely \)(
+(
+ IS_ERR_OR_NULL(E)
+|
+ !IS_ERR_OR_NULL(E)
+)
+-)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
