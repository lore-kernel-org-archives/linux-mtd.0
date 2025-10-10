Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A38ACCD183
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 03:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:To:From:
	MIME-Version:Content-Type:Reply-To:Message-ID:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z/MpOig4w6Bc3/fuaRBadxOtBAt4tJJcFIQpgUsdv4A=; b=1H0xjXvson48kprj005ForXnH2
	0IDrhtj4eFe2puNNRcpdS/Zag7EplH13XrPGdaHnI9kH171MaRdlFObLBYPX8FxyoN3bszXQZXnMw
	3eSKacc24TSgeMDG+1q/3itPBtWFmrDmKxGRNZYrij0upjIku0i+VdjeWP1c64HRjjdcWFAuHKCXw
	hkWwjMAn3pGpHQ0Jr482xgiYMGGLiosmULC07MwD6vlnGoeQ76QfRffmR4To6zEi+j3NxYA75Dusm
	FaiI6AAzu2YP89ssIhKqLW/A7Z1R/9yuobC4b5J9Mp5yQmx7m7P9vh0W3QxAlC+K0lWO5KEwSsfQY
	uMcz/cWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73Xr-00000007Xuj-3mEI;
	Fri, 10 Oct 2025 03:11:51 +0000
Received: from out28-127.mail.aliyun.com ([115.124.28.127])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73Xp-00000007XtO-153X
	for linux-mtd@lists.infradead.org;
	Fri, 10 Oct 2025 03:11:51 +0000
Received: from DESKTOP-OPP4T4E(mailfrom:Michael@vic-infomarketresearch.com fp:SMTPD_---.ewWD1iP_1760065880 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 10 Oct 2025 11:11:37 +0800
Content-Type: multipart/mixed; boundary="===============1690901373=="
MIME-Version: 1.0
From: Michael <Michael@vic-infomarketresearch.com>
To: marketkkyplus@163.com
Cc: marketkkyplus@163.com
Subject: =?utf-8?q?Non-volatile_Memory_Express_=28NVM=29?=
Date: Fri, 10 Oct 2025 03:11:02 -0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_201149_437486_4A81720F 
X-CRM114-Status: UNSURE (   0.95  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
Message-ID: <20251010031102.VxDHlMPZiYMSMsu2d7LrXSWqWImozk7SHX3jKey7kJ4@z>

--===============1690901373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

RGVhci4KCldlIGhhdmUgcmVsZWFzZWQgYSByZXBvcnQgb24gdGhlIGxhdGVzdCBOb24tdm9sYXRp
bGUgTWVtb3J5IEV4cHJlc3MgKE5WTSkgbWFya2V0IHJlc2VhcmNoLgpQbHMgZmVlbCBmcmVlIHRv
IGNvbnRhY3QgQWJieUB2aWNtYXJrZXRyZXNlYXJjaC5jb20gaWYgeW91IGFyZSBpbnRlcmVzdGVk
IGluIGl0LiBBIHNhbXBsZSByZXBvcnQgd2lsbCBiZSBzZW50IHRvIHlvdS4KClRoZSBmb2xsb3dp
bmcgbWFudWZhY3R1cmVycyBhcmUgY292ZXJlZCBpbiB0aGlzIHJlcG9ydDoKU2Ftc3VuZwpLSU9Y
SUEKV2VzdGVybiBEaWdpdGFsCk1pY3JvbgpTSyBIeW5peApZTVRDCk1hY3Jvbml4CldpbmJvbmQK
R2lnYURldmljZQpDeXByZXNzClRTTUMKR2xvYmFsRm91bmRyaWVzClVNQwpTTUlDCkhIR3JhY2UK
4oCm4oCmCgpCZXN0IHJlZ2FyZHMgLyBNaXQgZnJldW5kbGljaGVuIEdyw7zDn2VuIC8g5q2k6Ie0
5pWs5oSPLApBYmJ5

--===============1690901373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1690901373==--

