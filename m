Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D5AC4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 10:05:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B4B610A6
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 10:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94B4B610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVJG16pda2ViyMKL8MCf2E9wGmFHxAskdZZCAt911lU=; b=EPdbu7/CxA97U1
	tdwuF92+q7FWiR7xRxghWkoQS59LgHDfG4j00vwrf7Kj6CXIidFsItDgPXGtJrzTsrOkQMohWyyok
	tLAztdPPs5AplrVMqN4ot1GGGjF67daWD52PsHyp5qrCx5Uf/QgdaEsd0d6flbAHwtQr3isd+jwCD
	UkMzQLR1OqcyM5LK76jg9k3hyYiHa/4OQ5vFPEAmqPD+yECtyKUx7o1KaiLu3teSSQKoyUMhjwGAO
	/yIu2Ca3YcHvhW6lezFVt2PXtQNd579G4pNRJ0l3wTb0eV3ch6ZqCQqb6FkFm2vy1L1IOUMZJC5Cn
	vHJ2MpF6i4SThc/XLsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmCtF-004cBP-Ii; Thu, 27 May 2021 10:05:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmCsa-004bir-RK; Thu, 27 May 2021 10:04:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 21B77C0008;
 Thu, 27 May 2021 10:04:30 +0000 (UTC)
Date: Thu, 27 May 2021 12:04:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: <patrice.chotard@foss.st.com>, Mark Brown <broonie@kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: mtd: spinand: add spi nand mtd resume handler
Message-ID: <20210527120423.7bf18966@xps13>
In-Reply-To: <20210527100015.abxcroi23zyvcyzk@ti.com>
References: <20210526153016.32653-1-patrice.chotard@foss.st.com>
 <20210527100015.abxcroi23zyvcyzk@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_030441_195217_6384339F 
X-CRM114-Status: GOOD (  31.80  )
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

SGkgUHJhdHl1c2gsCgpQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+IHdyb3RlIG9uIFRo
dSwgMjcgTWF5IDIwMjEgMTU6MzA6MTcKKzA1MzA6Cgo+IE9uIDI2LzA1LzIxIDA1OjMwUE0sIHBh
dHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbSB3cm90ZToKPiA+IEZyb206IENocmlzdG9waGUgS2Vy
ZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQGZvc3Muc3QuY29tPgo+ID4gCj4gPiBBZnRlciBwb3dl
ciB1cCwgYWxsIFNQSSBOQU5EJ3MgYmxvY2tzIGFyZSBsb2NrZWQuIE9ubHkgcmVhZCBvcGVyYXRp
b25zCj4gPiBhcmUgYWxsb3dlZCwgd3JpdGUgYW5kIGVyYXNlIG9wZXJhdGlvbnMgYXJlIGZvcmJp
ZGRlbi4KPiA+IFRoZSBTUEkgTkFORCBmcmFtZXdvcmsgdW5sb2NrcyBhbGwgdGhlIGJsb2NrcyBk
dXJpbmcgaXRzIGluaXRpYWxpemF0aW9uLgo+ID4gCj4gPiBEdXJpbmcgYSBzdGFuZGJ5IGxvdyBw
b3dlciwgdGhlIG1lbW9yeSBpcyBwb3dlcmVkIGRvd24sIGxvc2luZyBpdHMKPiA+IGNvbmZpZ3Vy
YXRpb24uCj4gPiBEdXJpbmcgdGhlIHJlc3VtZSwgdGhlIFFTUEkgZHJpdmVyIHN0YXRlIGlzIHJl
c3RvcmVkIGJ1dCB0aGUgU1BJIE5BTkQKPiA+IGZyYW1ld29yayBkb2VzIG5vdCByZWNvbmZpZ3Vy
ZWQgdGhlIG1lbW9yeS4KPiA+IAo+ID4gVGhpcyBwYXRjaCBhZGRzIHNwaSBuYW5kIG10ZCBQTSBo
YW5kbGVycyBmb3IgcmVzdW1lIG9wcy4KPiA+IFNQSSBOQU5EIHJlc3VtZSBvcCByZS1pbml0aWFs
aXplcyBTUEkgTkFORCBmbGFzaCB0byBpdHMgcHJvYmVkIHN0YXRlLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZv
c3Muc3QuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwgNTYg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA1NiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3NwaS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiA+IGluZGV4IDE3ZjYz
Zjk1ZjRhMi4uNmFiYWY4NzRlYjNmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9z
cGkvY29yZS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiA+IEBAIC0x
MDc0LDYgKzEwNzQsNjEgQEAgc3RhdGljIGludCBzcGluYW5kX2RldGVjdChzdHJ1Y3Qgc3BpbmFu
ZF9kZXZpY2UgKnNwaW5hbmQpCj4gPiAgCXJldHVybiAwOwo+ID4gIH0KPiA+ICAKPiA+ICtzdGF0
aWMgdm9pZCBzcGluYW5kX210ZF9yZXN1bWUoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gPiArewo+
ID4gKwlzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQgPSBtdGRfdG9fc3BpbmFuZChtdGQp
Owo+ID4gKwlzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQgPSBtdGRfdG9fbmFuZGRldihtdGQpOwo+
ID4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmc3BpbmFuZC0+c3BpbWVtLT5zcGktPmRldjsKPiA+
ICsJaW50IHJldCwgaTsKPiA+ICsKPiA+ICsJcmV0ID0gc3BpbmFuZF9yZXNldF9vcChzcGluYW5k
KTsKPiA+ICsJaWYgKHJldCkKPiA+ICsJCXJldHVybjsKPiA+ICsKPiA+ICsJcmV0ID0gc3BpbmFu
ZF9pbml0X3F1YWRfZW5hYmxlKHNwaW5hbmQpOwo+ID4gKwlpZiAocmV0KSB7Cj4gPiArCQlkZXZf
ZXJyKGRldiwKPiA+ICsJCQkiRmFpbGVkIHRvIGluaXRpYWxpemUgdGhlIHF1YWQgcGFydCAoZXJy
ID0gJWQpXG4iLAo+ID4gKwkJCXJldCk7Cj4gPiArCQlyZXR1cm47Cj4gPiArCX0KPiA+ICsKPiA+
ICsJcmV0ID0gc3BpbmFuZF91cGRfY2ZnKHNwaW5hbmQsIENGR19PVFBfRU5BQkxFLCAwKTsKPiA+
ICsJaWYgKHJldCkgewo+ID4gKwkJZGV2X2VycihkZXYsCj4gPiArCQkJIkZhaWxlZCB0byB1cGR0
YWUgdGhlIE9UUCAoZXJyID0gJWQpXG4iLAo+ID4gKwkJCXJldCk7Cj4gPiArCQlyZXR1cm47Cj4g
PiArCX0gIAo+IAo+IFNpbmNlIHlvdSBoYXZlIHJlc2V0IHRoZSBmbGFzaCwgdGhpcyBjYWNoZSBp
cyBpbnZhbGlkLiBZb3Ugc2hvdWxkIHJlc2V0IAo+IHRoZSBjYWNoZSBhbmQgcmUtcG9wdWxhdGUg
aXQgYmVmb3JlIHVzaW5nIGl0IGluIGFueSB3YXkuCj4gCj4gPiArCj4gPiArCXJldCA9IHNwaW5h
bmRfbWFudWZhY3R1cmVyX2luaXQoc3BpbmFuZCk7Cj4gPiArCWlmIChyZXQpIHsKPiA+ICsJCWRl
dl9lcnIoZGV2LAo+ID4gKwkJCSJGYWlsZWQgdG8gaW5pdGlhbGl6ZSB0aGUgU1BJIE5BTkQgY2hp
cCAoZXJyID0gJWQpXG4iLAo+ID4gKwkJCXJldCk7Cj4gPiArCQlyZXR1cm47Cj4gPiArCX0KPiA+
ICsKPiA+ICsJLyogQWZ0ZXIgcG93ZXIgdXAsIGFsbCBibG9ja3MgYXJlIGxvY2tlZCwgc28gdW5s
b2NrIHRoZW0gaGVyZS4gKi8KPiA+ICsJZm9yIChpID0gMDsgaSA8IG5hbmQtPm1lbW9yZy5udGFy
Z2V0czsgaSsrKSB7Cj4gPiArCQlyZXQgPSBzcGluYW5kX3NlbGVjdF90YXJnZXQoc3BpbmFuZCwg
aSk7Cj4gPiArCQlpZiAocmV0KSB7Cj4gPiArCQkJZGV2X2VycihkZXYsCj4gPiArCQkJCSJGYWls
ZWQgdG8gc2VsZWN0IHRoZSB0YXJnZXQgKGVyciA9ICVkKVxuIiwKPiA+ICsJCQkJcmV0KTsKPiA+
ICsJCQlyZXR1cm47Cj4gPiArCQl9Cj4gPiArCj4gPiArCQlyZXQgPSBzcGluYW5kX2xvY2tfYmxv
Y2soc3BpbmFuZCwgQkxfQUxMX1VOTE9DS0VEKTsKPiA+ICsJCWlmIChyZXQpIHsKPiA+ICsJCQlk
ZXZfZXJyKGRldiwKPiA+ICsJCQkJIkZhaWxlZCB0byB1bmxvY2sgYmxvY2sgKGVyciA9ICVkKVxu
IiwKPiA+ICsJCQkJcmV0KTsKPiA+ICsJCQlyZXR1cm47Cj4gPiArCQl9Cj4gPiArCX0KPiA+ICt9
Cj4gPiArICAKPiAKPiBNb3N0IG9mIHRoZXNlIHNlZW0gdG8gYmUgY29waWVkIGZyb20gc3BpbmFu
ZF9pbml0KCkuIEkgdGhpbmsgaXQgaXMgCj4gYmV0dGVyIHRvIGNyZWF0ZSBhIGNvbW1vbiBmdW5j
dGlvbiB0aGF0IGNhbiBiZSBjYWxsZWQgZnJvbSBib3RoIAo+IHNwaW5hbmRfaW5pdCgpIGFuZCBz
cGluYW5kX210ZF9yZXN1bWUoKS4gVGhpcyB3YXkgd2hlbiBzb21lb25lIGFkZHMgCj4gc29tZXRo
aW5nIG5ldyB0byB0aGUgaW5pdCBwcm9jZWR1cmUsIGxpa2Ugc3VwcG9ydCBmb3Igc29tZSBvdGhl
ciBtb2RlcywgCj4gdGhleSB3b24ndCBoYXZlIHRvIHJlbWVtYmVyIHRvIHVwZGF0ZSBpdCBpbiB0
d28gcGxhY2VzLgoKQWdyZWVkLCBsZXQncyB3cml0ZSBhIGNvbW1vbiBoZWxwZXIgZm9yIG1vcmUg
dGhhbiBqdXN0IHRoZSB1bmxvY2tpbmcKc2VxdWVuY2UgKHN0aWxsIGluIGEgc2VwYXJhdGUgcGF0
Y2gpLgoKPiAKPiA+ICBzdGF0aWMgaW50IHNwaW5hbmRfaW5pdChzdHJ1Y3Qgc3BpbmFuZF9kZXZp
Y2UgKnNwaW5hbmQpCj4gPiAgewo+ID4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmc3BpbmFuZC0+
c3BpbWVtLT5zcGktPmRldjsKPiA+IEBAIC0xMTY3LDYgKzEyMjIsNyBAQCBzdGF0aWMgaW50IHNw
aW5hbmRfaW5pdChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4gPiAgCW10ZC0+X2Js
b2NrX2lzcmVzZXJ2ZWQgPSBzcGluYW5kX210ZF9ibG9ja19pc3Jlc2VydmVkOwo+ID4gIAltdGQt
Pl9lcmFzZSA9IHNwaW5hbmRfbXRkX2VyYXNlOwo+ID4gIAltdGQtPl9tYXhfYmFkX2Jsb2NrcyA9
IG5hbmRkZXZfbXRkX21heF9iYWRfYmxvY2tzOwo+ID4gKwltdGQtPl9yZXN1bWUgPSBzcGluYW5k
X210ZF9yZXN1bWU7ICAKPiAKPiBJcyBpdCBwb3NzaWJsZSB0aGF0IHRoZSB1c2Vyc3BhY2UgY2Fu
IHVzZSB0aGlzIG10ZCBkZXZpY2UgYmVmb3JlIHRoZSAKPiByZXN1bWUgaXMgZmluaXNoZWQ/IElz
IHRoZXJlIGEgd2F5IHRvIHRlbXBvcmFyaWx5ICJwYXVzZSIgb3IgdW5yZWdpc3RlciAKPiBhbiBt
dGQgZGV2aWNlPwoKSSBkb24ndCBleHBlY3QgdGhpcyB0byBoYXBwZW4sIEkgd291bGQgZXhwZWN0
IHRoZSBrZXJuZWwgdG8gcmVzdW1lCmVudGlyZWx5IGJlZm9yZSBnaXZpbmcgdGhlIGhhbmQgdG8g
dXNlcnNwYWNlLCBidXQgSSBhbSBub3QgMTAwJSBzdXJlIG9mCnRoYXQgbmVpdGhlci4KCj4gCj4g
PiAgCj4gPiAgCWlmIChuYW5kLT5lY2MuZW5naW5lKSB7Cj4gPiAgCQlyZXQgPSBtdGRfb29ibGF5
b3V0X2NvdW50X2ZyZWVieXRlcyhtdGQpOyAgCj4gCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
