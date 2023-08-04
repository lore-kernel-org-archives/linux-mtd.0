Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22464C001DB
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 06:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7aWGzjBVG7i4WRKV64UUzJpux8bAsEevmli6ejJBYw=; b=F1FFfMDviW/QFT
	x/LhB1unGa2Nsl7zwyl6qK8vg154aOaNrl+TJTBWnYy2cMuu9zM8fUdmdgY1hzwMMQX7Nd1YXz6pH
	9+ocm9RejjkG93kgNLeonJenj7nMwBEFsn0wFutulzmgNnvprns72zthqTZBpE/iyrKK3x7ym6Ghg
	+WTQ9pV8NUOMiyCm8HFfRjcIVk5QnLgTocJxA5BiDqFv71U643xJF7q+rHaNuD0FSFIXltiGjSXxJ
	6fmnJZXoHYZriY/ngh1wyTFo7b/ShKBqdx/x+n+txBsdByQWsRyteS6lLUbKaFv1+JLo9aXSS8Eg0
	p7qk7beqcJZgHQTMCneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoYd-00BheU-1W;
	Fri, 04 Aug 2023 06:45:07 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoYX-00BhdI-33
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 06:45:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39D87FF809;
	Fri,  4 Aug 2023 06:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691131494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a7VCQHvdtZdwX7ptqByjWyUehXzHsk4UxYY3r02COfc=;
	b=bq8KxpOA+qwO3HmCNDlx9JaV5ptvBGsZ3LdLcJzor/ILETPtr5ysT/h0YCjeciIJbfCn5R
	DDU44GBT3yYmtSqBi8hm0MQNofC2U8JN0zTnwq3erJWGtQGnMNqXO31K+YmmVa61aUK6j5
	iM5SgUztI+uB9VwPPSFU8Qukga0AE6C7VP1NvIQuYx/cUAJy3OqukJB8t46EnxQVJKu1ug
	9u+u2ZN3UzPhk3A381RAJJRDxEaROlHL1prl2ujtOF9ZW4kxbMYOocYyDaScd815QB9IJ7
	V9chKo/vhGs8jq2pRur0ZABYsxTowYCJJ8rA7+TkBsHvWXFClZsHgauP3cAWxA==
Date: Fri, 4 Aug 2023 08:44:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, "Michael Walle" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>, Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH v2] mtd: Fix refcounting with MTD_PARTITIONED_MASTER
Message-ID: <20230804084450.5b46aa8b@xps-13>
In-Reply-To: <CY5PR11MB63664273EC02BE1A9AC05D7EED0AA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230731090903.770277-1-miquel.raynal@bootlin.com>
	<CY5PR11MB63664273EC02BE1A9AC05D7EED0AA@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_234502_145326_D8F82BED 
X-CRM114-Status: GOOD (  20.66  )
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

SGkgQWxleGFuZGVyLAoKYWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tIHdyb3RlIG9uIFR1ZSwg
MSBBdWcgMjAyMyAwODo0NTo0NyArMDAwMDoKCj4gSGkgTWlxdWVsLAo+IAo+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+Cj4gPiBTZW50OiBNb25kYXksIEp1bHkgMzEsIDIwMjMgMTI6MDkKPiA+IFRv
OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PjsgVmlnbmVzaCBSYWdoYXZlbmRy
YQo+ID4gPHZpZ25lc2hyQHRpLmNvbT47IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGlu
YXJvLm9yZz47IFByYXR5dXNoCj4gPiBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9yZz47IE1pY2hh
ZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+OyBsaW51eC0KPiA+IG10ZEBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gPiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT47
IFdpbmtsZXIsIFRvbWFzCj4gPiA8dG9tYXMud2lua2xlckBpbnRlbC5jb20+OyBVc3lza2luLCBB
bGV4YW5kZXIKPiA+IDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+OyBaaGFuZyBYaWFveHUg
PHpoYW5neGlhb3h1NUBodWF3ZWkuY29tPgo+ID4gU3ViamVjdDogW1BBVENIIHYyXSBtdGQ6IEZp
eCByZWZjb3VudGluZyB3aXRoIE1URF9QQVJUSVRJT05FRF9NQVNURVIKPiA+IAo+ID4gVGhlIGxv
Z2ljIGlzIHdheSB0b28gY29udm9sdXRlZCwgbGV0J3MgY2xlYW4gdGhlIGtyZWZfZ2V0L3B1dCBz
ZWN0aW9uIHRvCj4gPiBjbGFyaWZ5IHdoYXQgdGhpcyBibG9jayBkb2VzLCBob3BlZnVsbHkgc29s
dmluZyB0aGUgcmVmY291bnRpbmcgaXNzdWUKPiA+IHdoZW4gdXNpbmcgQ09ORklHX01URF9QQVJU
SVRJT05FRF9NQVNURVIgYXQgdGhlIHNhbWUgdGltZToKPiA+IC0gSXRlcmF0ZSB0aHJvdWdoIGFs
bCB0aGUgcGFyZW50IG10ZCBkZXZpY2VzCj4gPiAtIEdyYWIgYSByZWZlcmVuY2Ugb3ZlciB0aGVt
IGFsbCBidXQgdGhlIG1hc3Rlcgo+ID4gLSBPbmx5IGdyYWIgdGhlIG1hc3RlciB3aGl0aCBDT05G
SUdfTVREX1BBUlRJVElPTkVEX01BU1RFUgo+ID4gU2FtZSBsb2dpYyBtdXN0IGFwcGx5IGluIHRo
ZSBwdXQgcGF0aCwgb3RoZXJ3aXNlIGl0IHdvdWxkIGJlIGJyb2tlbi4KPiA+IAo+ID4gQ2M6IFRv
bWFzIFdpbmtsZXIgPHRvbWFzLndpbmtsZXJAaW50ZWwuY29tPgo+ID4gQ2M6IEFsZXhhbmRlciBV
c3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+Cj4gPiBDYzogWmhhbmcgWGlhb3h1
IDx6aGFuZ3hpYW94dTVAaHVhd2VpLmNvbT4KPiA+IEZpeGVzOiAxOWJmYTllYmViYjUgKCJtdGQ6
IHVzZSByZWZjb3VudCB0byBwcmV2ZW50IGNvcnJ1cHRpb24iKQo+ID4gU2lnbmVkLW9mZi1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+ICAgCj4gCj4gSSd2
ZSBwdXQgaXQgb24gdG9wIG9mIG15ICJbUEFUQ0ggdjJdIG10ZDogZml4IHVzZS1hZnRlci1mcmVl
IGluIG10ZCByZWxlYXNlIiwKPiBsb29rcyBvaywgYnV0IEkgaGF2ZSBoYWQgbm8gcHJvYmxlbXMg
d2l0aCByZWZjb3VudGluZyBiZWZvcmUuLi4KPiBJTU8sIHdlIG5lZWQgYm90aCB0aGlzIHBhdGNo
IGFuZCBteSBwYXRjaCBhcyB0aGV5IGZpeCBkaWZmZXJlbnQgaXNzdWVzLgo+IAo+IFRlc3RlZC1i
eTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT4KPiAKCkFj
dHVhbGx5IEkgZG9uJ3QgdGhpbmsgdGhpcyBwYXRjaCBmaXhlcyBhbnl0aGluZywgYmVzaWRlcyB0
aGUKc2ltcGxpZmljYXRpb24gb2YgdGhlIGhlbHBlcnMgd2hpY2ggYXJlIChJTUhPKSBtb3JlIHJl
YWRhYmxlIG5vdy4KClpoYW5nLCBhcmUgeW91IHN1cmUgeW91IHRlc3Qgb24gdGhlIGxhdGVzdCBt
dGQvbmV4dCBicmFuY2g/IEJlY2F1c2UgSQpzZWUgbm8gcmVmY291bnRpbmcgaXNzdWUgaGVyZSwg
d2l0aC93aXRob3V0IFBBUlRJVElPTkVEX01BU1RFUi4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
