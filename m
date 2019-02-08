Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2623C169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:12:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C95A217D8
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:12:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdVAlzCi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C95A217D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ycovXatk4wfFBO4p78a1yx95D6zgDNAIuxoRqcogSao=; b=pdVAlzCiHkYzn6
	ihFYsafCsePDvi/TNAvcZRb8hSiA3VjaCVcFs39juFHMSM8Pu3A00E1wMYWoglYHVfl8/TLuBBAnG
	/bVM6h8UTna9VqOUw2kMMSnAOEKfiFtzY29BbgF8onGrINVgXmnv9f3aEkhT/X6kwPSl0x5ibBhsu
	9G1Ph8K2JRuftIdXUWSn2w40q4rBQUbj1MjAimQ7xozEgC3O8S9fSpQ0w9K3FysNX2vQSikju12vR
	RCiBO6NqdbPQm5eiBpDKiBvScaOjSVtaQ+NVchIhFxKOadZBqNnsgIq2Ubj4DXYaLeYFwlpZ27YyG
	XadUPtK7PLnCuAt1jyHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsAdu-0006Kb-KZ; Fri, 08 Feb 2019 18:12:50 +0000
Received: from gateway34.websitewelcome.com ([192.185.150.114])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsAdr-0006Jg-Co
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 18:12:48 +0000
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id CFCB6684F1C
 for <linux-mtd@lists.infradead.org>;
 Fri,  8 Feb 2019 12:09:12 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id sAaOgZrx6dnCesAaOgZmuG; Fri, 08 Feb 2019 12:09:12 -0600
X-Authority-Reason: nr=8
Received: from [189.250.49.191] (port=57562 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1gsAaN-004Dmm-Vw; Fri, 08 Feb 2019 12:09:12 -0600
Date: Fri, 8 Feb 2019 12:09:11 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: phram: Mark expected switch fall-throughs
Message-ID: <20190208180911.GA32525@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.49.191
X-Source-L: No
X-Exim-ID: 1gsAaN-004Dmm-Vw
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.49.191]:57562
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 21
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_101247_474689_28D2B4D6 
X-CRM114-Status: UNSURE (   8.02  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cgpkcml2ZXJzL210ZC9kZXZpY2Vz
L3BocmFtLmM6IEluIGZ1bmN0aW9uIOKAmHBhcnNlX251bTY04oCZOgpkcml2ZXJzL210ZC9kZXZp
Y2VzL3BocmFtLmM6MTQ5OjExOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJv
dWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgICBzaGlmdCArPSAxMDsKICAgICB+fn5+
fn5efn5+fgpkcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmM6MTUwOjQ6IG5vdGU6IGhlcmUKICAg
IGNhc2UgJ00nOgogICAgXn5+fgpkcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmM6MTUxOjExOiB3
YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0
aHJvdWdoPV0KICAgICBzaGlmdCArPSAxMDsKICAgICB+fn5+fn5efn5+fgpkcml2ZXJzL210ZC9k
ZXZpY2VzL3BocmFtLmM6MTUyOjQ6IG5vdGU6IGhlcmUKICAgIGNhc2UgJ2snOgogICAgXn5+fgoK
V2FybmluZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKClRoaXMg
cGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsaW5nCi1XaW1wbGlj
aXQtZmFsbHRocm91Z2guCgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0
YXZvQGVtYmVkZGVkb3IuY29tPgotLS0KIGRyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYyB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9kZXZpY2VzL3BocmFtLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKaW5kZXgg
OWVlMDRiNWY5MzExLi44YTg2MjdjMzBhZWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2Rldmlj
ZXMvcGhyYW0uYworKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKQEAgLTE0Nyw4ICsx
NDcsMTAgQEAgc3RhdGljIGludCBwYXJzZV9udW02NCh1aW50NjRfdCAqbnVtNjQsIGNoYXIgKnRv
a2VuKQogCQkJc3dpdGNoICh0b2tlbltsZW4gLSAyXSkgewogCQkJY2FzZSAnRyc6CiAJCQkJc2hp
ZnQgKz0gMTA7CisJCQkJLyogZmFsbCB0aHJvdWdoICovCiAJCQljYXNlICdNJzoKIAkJCQlzaGlm
dCArPSAxMDsKKwkJCQkvKiBmYWxsIHRocm91Z2ggKi8KIAkJCWNhc2UgJ2snOgogCQkJCXNoaWZ0
ICs9IDEwOwogCQkJCXRva2VuW2xlbiAtIDJdID0gMDsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
