Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83143C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0hjQkkZKgdH5M3N4w79XQ0/4uoUhef+diIWoxrIef8=; b=Exlh+/RBKT0rJl
	l/YDhr2m/O74wckG5dXxbIt0oPdTzVwEekSH+laQj4jY/9rau9QOqqR/5VTPIf8NvSoNJ65Jq36LN
	QZgDMqLwwaU9KsE09GfNQSYSfZVQyN+YtN3iV+lGNUjTmXbZj+dtqcZWfqkFYGRKCuaRAC9ga3WBq
	eUtTv2C/3fzqbOkdfwx997dmeRgn7OgW1BR1+o6tIxADFR1NrTqTFUwo23AABKA+b1jOXlSkT522y
	YtwwKJDC5gI4EneWWBr78jHs426CYTxURujehnNfYV/ZfWVCVhULCoQ33ZDmYZmK3kqUBOem9uL0v
	kHdSoHGs+kRJYyo/7Dsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyFO-00B4ad-2K;
	Tue, 12 Dec 2023 08:36:10 +0000
Received: from forward501b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d501])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyFH-00B4Yq-34
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 08:36:09 +0000
Received: from mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:1215:0:640:367b:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTP id 2008D60E55;
	Tue, 12 Dec 2023 11:35:51 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id lZdPDeDm3mI0-qcIIANXy;
	Tue, 12 Dec 2023 11:35:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1702370150; bh=2R9S6QInVyV5OaAGIjzNQBpof2xW+CkJZHvkJhjTMPA=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=Jwi0lm3I8K+jy4ugTFlxO+3gwwno5KvIGe95adUOeoDMa25zx4oZRZ3iRTwZOlw4v
	 REn8SQfXyiXOc4xzH4AwKJnlKW0hrtyylyxPnKtYEvBax42WG4z551B1LzhfjQgGXt
	 20WD3K0pYyKDLglIl3zXmydVaoktBfJpoSqLbcjM=
Authentication-Results: mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <29970d694d155dee0c76612f453eaa06a929e2c1.camel@maquefel.me>
Subject: Re: [PATCH v6 20/40] mtd: rawnand: add support for ts72xx
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann
 <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Christophe
 Kerello <christophe.kerello@foss.st.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Johan Jonker <jbx6244@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Date: Tue, 12 Dec 2023 11:35:48 +0300
In-Reply-To: <2023121220-shine-caviar-68dc@gregkh>
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
	 <20231212-ep93xx-v6-20-c307b8ac9aa8@maquefel.me>
	 <2023121220-shine-caviar-68dc@gregkh>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_003605_075170_C4B847F7 
X-CRM114-Status: GOOD (  16.79  )
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

SGVsbG8gR3JlZyEKCk9uIFR1ZSwgMjAyMy0xMi0xMiBhdCAwOTozMCArMDEwMCwgR3JlZyBLcm9h
aC1IYXJ0bWFuIHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDEyLCAyMDIzIGF0IDExOjIwOjM3QU0gKzAz
MDAsIE5pa2l0YSBTaHViaW4gdmlhIEI0IFJlbGF5Cj4gd3JvdGU6Cj4gPiBGcm9tOiBOaWtpdGEg
U2h1YmluIDxuaWtpdGEuc2h1YmluQG1hcXVlZmVsLm1lPgo+ID4gCj4gPiBUZWNobm9sb2dpYyBT
eXN0ZW1zIGhhcyBpdCdzIG93biBuYW5kIGNvbnRyb2xsZXIgaW1wbGVtZW50YXRpb24gaW4KPiA+
IENQTEQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE5pa2l0YSBTaHViaW4gPG5pa2l0YS5zaHVi
aW5AbWFxdWVmZWwubWU+Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZp
Z8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDcgKwo+
ID4gwqBkcml2ZXJzL210ZC9uYW5kL3Jhdy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPiA+IMKgZHJpdmVycy9tdGQvbmFuZC9yYXcv
dGVjaG5vbG9naWMtbmFuZC1jb250cm9sbGVyLmMgfCAyMjAKPiA+ICsrKysrKysrKysrKysrKysr
KysrKwo+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDIyOCBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPiBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L0tjb25maWcKPiA+IGluZGV4IGNiZjhhZTg1ZTFhZS4uMzkzN2MxMGRlYTFjIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+ID4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+ID4gQEAgLTQ0OSw2ICs0NDksMTMgQEAgY29uZmln
IE1URF9OQU5EX1JFTkVTQVMKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBFbmFibGVzIHN1cHBvcnQg
Zm9yIHRoZSBOQU5EIGNvbnRyb2xsZXIgZm91bmQgb24gUmVuZXNhcwo+ID4gUi1DYXIKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoCBHZW4zIGFuZCBSWi9OMSBTb0MgZmFtaWxpZXMuCj4gPiDCoAo+ID4g
K2NvbmZpZyBNVERfTkFORF9UUzcyWFgKPiA+ICvCoMKgwqDCoMKgwqDCoHRyaXN0YXRlICJ0czcy
eHggTkFORCBjb250cm9sbGVyIgo+ID4gK8KgwqDCoMKgwqDCoMKgZGVwZW5kcyBvbiBBUkNIX0VQ
OTNYWCAmJiBIQVNfSU9NRU0KPiA+ICvCoMKgwqDCoMKgwqDCoGhlbHAKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgIEVuYWJsZXMgc3VwcG9ydCBmb3IgTkFORCBjb250cm9sbGVyIG9uIHRzNzJ4eCBTQkNz
Lgo+ID4gK8KgwqDCoMKgwqDCoMKgwqAgVGhpcyBpcyBhIGxlZ2FjeSBkcml2ZXIgYmFzZWQgb24g
Z2VuX25hbmQuCj4gCj4gV2h5IGlzIGEgbmV3ICJsZWdhY3kgZHJpdmVyIiBiZWluZyB3cml0dGVu
IHRoZXNlIGRheXM/wqAgV2h5IG5vdCBkbyBpdAo+IHByb3Blcmx5PwoKU29ycnksIG15IGJhZCwg
ZGVzY3JpcHRpb24gaXMgYSBsZWZ0b3ZlciBmcm9tIG9sZGVyIGRlc2NyaXB0aW9uICh3aGVuIGkK
d2FzIGFsbG93ZWQgdG8gc3VibWl0IGEgbGVnYWN5IG9uZSkuCgpUaGUgZHJpdmVyIGlzIG1vc3Rs
eSBuZXcsIHNoaW55IGFuZCBhcHByb3ZlZCBieSBNaXF1ZWw6CgpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjMxMDA0MTAzOTExLjJhYTY1MzU0QHhwcy0xMy8KClRoZSBLQ29uZmlnIGRl
c2NyaXB0aW9uIHNob3VsZCBiZSBmaXhlZC4KCj4gCj4gdGhhbmtzLAo+IAo+IGdyZWcgay1oCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
