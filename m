Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709A2C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 10:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43EDC60E0C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 10:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43EDC60E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfnrk5/1GipDLyciXoF9a6emGyQyIEMc+3Fz22WHFPQ=; b=KCoyzF6+0D3Vek
	EZJK/13qtisGcImH3iyHgwAfuqX+JFw78PzRzOGBi0AikzUyVhno8vPdNKDk62QgU4Q1pK2ofHSnd
	RO0EUmWq43z9vfWnX1DKgGWBDVL3JlZkVkpQ7QFn4jp5i9arDqeALH/d9VaYW3lFInMxRMAGjof/H
	T2LsyfDqRtrHqlL/hTRURp5hPYtzBSxyqrtXKVXe9wtwATCTvZXO0IhWcTP8t8VEyS2bGkfij3Ych
	7FeC+/S681aMJyDbaomBLKvEdXg6T21I/Z6hgNLU0Wr/sXkflFLXsWjjr8C8W3TAQvN77cFkNNM7U
	KCq8jXz+dyZ4vZyWrtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZsat-008rRh-FG; Mon, 11 Oct 2021 10:31:43 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZsaq-008rR3-5b
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 10:31:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 2D2568061;
 Mon, 11 Oct 2021 10:32:09 +0000 (UTC)
Date: Mon, 11 Oct 2021 13:31:36 +0300
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
 robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 nsekhar@ti.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
Message-ID: <YWQSiNX/bBKcdTl2@atomide.com>
References: <20211007120830.17221-1-rogerq@kernel.org>
 <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
 <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
 <64b65579-7153-1e7d-9866-77ce07fd1df5@canonical.com>
 <YWPRbmaJQN85wRIO@atomide.com>
 <f2125e81-07da-92ea-899a-d06ecae1919f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2125e81-07da-92ea-899a-d06ecae1919f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_033140_276016_792D17AF 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

KiBSb2dlciBRdWFkcm9zIDxyb2dlcnFAa2VybmVsLm9yZz4gWzIxMTAxMSAwNzowNF06Cj4gSGkg
VG9ueSwKPiAKPiBPbiAxMS8xMC8yMDIxIDA4OjUzLCBUb255IExpbmRncmVuIHdyb3RlOgo+ID4g
KiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+
IFsyMTEwMDkgMTQ6NTZdOgo+ID4+IE9uIDA4LzEwLzIwMjEgMjE6MTAsIFJvZ2VyIFF1YWRyb3Mg
d3JvdGU6Cj4gPj4+IEtyenlzenRvZiwKPiA+Pj4KPiA+Pj4gT24gMDcvMTAvMjAyMSAyMDozNywg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+Pj4+IE9uIDA3LzEwLzIwMjEgMTQ6MDgsIFJv
Z2VyIFF1YWRyb3Mgd3JvdGU6Cj4gPj4+Pj4gSGksCj4gPj4+Pj4KPiA+Pj4+PiBUaGlzIHNlcmll
cyBjb252ZXJ0cyB0aSxncG1jIG1lbW9yeSBjb250cm9sbGVyIGFuZCB0aSxncG1jLW5hbmQgYW5k
Cj4gPj4+Pj4gdGksZ3BtYy1vbmVuYW5kIE1URCBjb250cm9sbGVyIGJpbmRpbmdzIHRvIHlhbWwu
Cj4gPj4+Pj4KPiA+Pj4+PiBjaGVlcnMsCj4gPj4+Pj4gLXJvZ2VyCj4gPj4+Pj4KPiA+Pj4+Cj4g
Pj4+PiBIaSwKPiA+Pj4+Cj4gPj4+PiBBbHRob3VnaCB5b3UgZGlkIG5vdCBtZW50aW9uIGl0IGhl
cmUsIGl0IGxvb2tzIGxpa2UgeW91IGhhdmUgc29tZQo+ID4+Pj4gZGVwZW5kZW5jaWVzIGJldHdl
ZW4gdGhlIHBhdGNoZXMuIE1heWJlIHRoaXMgc2hhbGwgZ28gc2ltcGx5IHZpYSBSb2IncyB0cmVl
Pwo+ID4+Pj4KPiA+Pj4KPiA+Pj4gUm9iIGhhcyBhY2tlZCBhbGwgdGhlIERUIGJpbmRpbmcgcGF0
Y2hlcy4KPiA+Pj4gU28gaXQgaXMgdXB0byB5b3UgYW5kIE1pcXXDqGwgdG8gZGVjaWRlIHRoZSBi
ZXN0IHdheS4gTVREIHRyZWUgb3IgTWVtb3J5IGNvbnRyb2xsZXIgdHJlZQo+ID4+PiBmb3IgdGhl
IGR0LWJpbmRpbmdzIHBhdGNoZXMuCj4gPj4+Cj4gPj4+IFRoZSBBUk06IGR0cyBjaGFuZ2VzIHNo
b3VsZCBnbyB2aWEgVG9ueSdzIE9NQVAgU29DIHRyZWUuCj4gPj4+Cj4gPj4+IE9yIGlmIFRvbnkg
aXMgT0sgd2l0aCBpdCB0aGVuIG1heWJlIGFsbCBwYXRjaGVzIGNhbiBnbyB2aWEgVG9ueSdzIHRy
ZWU/IDopCj4gPj4+Cj4gPj4KPiA+Pgo+ID4+IEkgcmV2aWV3ZWQgdGhlIHR3byBtZW1vcnktY29u
dHJvbGxlciBwYXRjaGVzLCBzbyBmZWVsIGZyZWUgdG8gdGFrZSB0aGVtCj4gPj4gdmlhIE1URCBv
ciBPTUFQIFNvQy4KPiA+IAo+ID4gU291bmRzIGxpa2UgSSBzaG91bGQgcGljayB1cCB0aGVzZSBi
ZWNhdXNlIG9mIHRoZSBkdHMgY2hhbmdlcy4KPiAKPiBUaGVyZSBpcyBubyBkZXBlbmRlbmN5IHdp
dGggdGhlIGR0cyBwYXRjaGVzIGJ1dCBpdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY2FuIHBpY2sg
dGhlbSBhbGwgdXAuCgpPSyBhbGwgcHVzaGVkIG91dCBub3cgdG8gb21hcC1mb3ItdjUuMTYvZ3Bt
Yy4KClRoYW5rcywKClRvbnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
