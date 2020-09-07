Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED82C43461
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 14:57:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A1C5207DE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 14:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S2iPTC1s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A1C5207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lYZfnUuYApOuihCiiLRnx46JLuRQ85LMep8RjVDWYhI=; b=S2iPTC1sCynMRNB6XPkIkv/hy
	4ZSTJYn1OPHp1TLMgm32oICnyVmnGb3IbrZcyjAZTjvzys3RvVJMYr2RXeUolvl/RjomCPK4PIu5+
	LQpCDAyUF/MQUf8BKuW4DYCc7DAB949xAboftl+Dx9obAaEcIg8kCtSO3cGWLPDqxWYdVS1ZXqGkD
	l55QpMeXpDu8TNyQPafao/XpH+HXuM0MGnUuICAZKmVheATqKe0SE0SYfaETbLYXYgeOSxcjkVjh8
	zg5Ti/1m+kGaxKKLHuMOIYHM1JauvoOs6StUqNkVDUPVM3AJBmvQZlXSJTYcfy+8hwuBimZUTWJDa
	FKnxdiTyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFIZL-0002SV-0B; Mon, 07 Sep 2020 14:56:31 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFIZD-0002Oy-6c
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 14:56:27 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4ED6660006;
 Mon,  7 Sep 2020 14:56:14 +0000 (UTC)
Date: Mon, 7 Sep 2020 16:56:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [RESEND PATCH v12 2/2] mtd: rawnand: Add NAND controller
 support on Intel LGM SoC
Message-ID: <20200907165613.79f44c58@xps13>
In-Reply-To: <20200907152025.66c18f5e@xps13>
References: <20200817052709.47035-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200817052709.47035-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200907152025.66c18f5e@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_105623_341231_C6756657 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIE1vbiwg
NyBTZXAgMjAyMAoxNToyMDoyNSArMDIwMDoKCj4gSGkgTXVydWdhbiwKPiAKPiBBIGZldyBtb3Jl
IGNvbW1lbnRzIGJlbG93LCBidXQgSSBndWVzcyB0aGUgZHJpdmVyIGxvb2tzIGJldHRlciBub3cu
Cj4gCj4gPiArc3RydWN0IGVidV9uYW5kX2NvbnRyb2xsZXIgewo+ID4gKwlzdHJ1Y3QgbmFuZF9j
b250cm9sbGVyIGNvbnRyb2xsZXI7Cj4gPiArCXN0cnVjdCBuYW5kX2NoaXAgY2hpcDsKPiA+ICsJ
c3RydWN0IGRldmljZSAqZGV2Owo+ID4gKwl2b2lkIF9faW9tZW0gKmVidTsKPiA+ICsJdm9pZCBf
X2lvbWVtICpoc25hbmQ7Cj4gPiArCXN0cnVjdCBkbWFfY2hhbiAqZG1hX3R4Owo+ID4gKwlzdHJ1
Y3QgZG1hX2NoYW4gKmRtYV9yeDsKPiA+ICsJc3RydWN0IGNvbXBsZXRpb24gZG1hX2FjY2Vzc19j
b21wbGV0ZTsKPiA+ICsJdW5zaWduZWQgbG9uZyBjbGtfcmF0ZTsKPiA+ICsJc3RydWN0IGNsayAq
Y2xrOwo+ID4gKwl1MzIgbmRfcGFyYTA7Cj4gPiArCXU4IGNzX251bTsKPiA+ICsJc3RydWN0IGVi
dV9uYW5kX2NzIGNzW01BWF9DU107Cj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHN0
cnVjdCBlYnVfbmFuZF9jb250cm9sbGVyICpuYW5kX3RvX2VidShzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwKQo+ID4gK3sKPiA+ICsJcmV0dXJuIGNvbnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3QgZWJ1X25h
bmRfY29udHJvbGxlciwgY2hpcCk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyB1OCBlYnVfbmFu
ZF9yZWFkYihzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKSAgCj4gCj4gQ2FuJ3QgeW91IHByZWZpeCB3
aXRoIGludGVsXyBpbnN0ZWFkIG9mIGVidV8gPwoKQWN0dWFsbHkgbm90LCBhcyB0aGUgSVAgaXMg
c2hhcmVkIHdpdGggTUlQUyBJSVVDLCBqdXN0IGlnbm9yZSB0aGlzCmNvbW1lbnQuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
