Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9E8C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 23:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cX6VhdzRtszDVPAVomlWMImnNlineTdW87CWgbGvZtk=; b=uuTXRa6jrYkgnFVKiZIhh11awu
	VepluauM3FDEz0nlz0YNnLVJZAGM6XdqSZv2aAY/eqZ3FQPZdw9zKEXRbhUnnu6Y+zoPBeKOcuAid
	cWaDhxXA2Rxan9eYMyUK/Ka2anvHyOkkoO0q9T9SsMBUizykb6HkzKnvoQizL5+vPNnl6L5rcoxKW
	JYRJ44CzvsNbFPUaTb8569e3zOadEIILg31fAyz71evlAfnMO8crwXqC6NMKqeLbN4Y/Gxs2pH9qS
	2sbjlKrLgIgKUt19PFkOANBnfXvxZiSjaoD9ceUt+ZXNthc67pEwn8JJf1JPAG3hDZbXFVX1PD+v4
	OSxLd/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUf0-00B6wl-0R; Fri, 15 Jul 2022 23:23:50 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCULZ-00Axq4-58
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 23:03:47 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id B69A822175;
	Sat, 16 Jul 2022 01:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657926219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHA9hmkXfJHcRowuiSm/1pwyuW6mHTYJZjrpyrCLpu4=;
	b=Y2NdEdDdvZsctAvY+X828e/O65uDqcdY5FDfSCbW40ShXS2PmzN7kqRJmcQ4NTVne1vJel
	ONhC/unBbytMNSC+3yEDOKA0OL9V2ZxFY4oDLUDNry4mTwxa/OGK5l1dxhy1xt2w8XGhIe
	7tX91q/YF2F2Ir2J9QUwwlNhytBw5o4=
MIME-Version: 1.0
Date: Sat, 16 Jul 2022 01:03:38 +0200
From: Michael Walle <michael@walle.cc>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: clg@kaod.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, quic_ggregory@quicinc.com,
 quic_jiles@quicinc.com, tudor.ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
In-Reply-To: <c628e868-5c73-ca4b-1f99-60cc149806bf@quicinc.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
 <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
 <00f0c9d480ef5a414f1c34492661bd9e@walle.cc>
 <63cedfce-34bb-ed63-3871-75a6c3dd5d73@quicinc.com>
 <6be710bb5c1bf0449e54a54b78f6f7a0@walle.cc>
 <47c01d768ea56edc9a2f9d317af7b495@walle.cc>
 <114fcde6-bdf7-68ee-d031-35a916027aee@quicinc.com>
 <b42cb229-f241-6e29-a138-29023ce316d9@quicinc.com>
 <c628e868-5c73-ca4b-1f99-60cc149806bf@quicinc.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <b00410c825486ec406ed1ae773b11792@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_160345_571633_97704FBA 
X-CRM114-Status: GOOD (  32.07  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpBbSAyMDIyLTA3LTE2IDAwOjM1LCBzY2hyaWViIEphZSBIeXVuIFlvbzoKPiBPbiA3LzE1
LzIwMjIgMToxNSBQTSwgSmFlIEh5dW4gWW9vIHdyb3RlOgo+PiBPbiA3LzE0LzIwMjIgNzozMCBB
TSwgSmFlIEh5dW4gWW9vIHdyb3RlOgo+Pj4gT24gNy8xNC8yMDIyIDc6MjEgQU0sIE1pY2hhZWwg
V2FsbGUgd3JvdGU6Cj4+Pj4gQW0gMjAyMi0wNy0xNCAxNjoxNiwgc2NocmllYiBNaWNoYWVsIFdh
bGxlOgo+Pj4+PiBBbSAyMDIyLTA3LTE0IDE1OjQ3LCBzY2hyaWViIEphZSBIeXVuIFlvbzoKPj4+
Pj4+IE9uIDcvMTQvMjAyMiAxMjo0MSBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+Pj4+PiBX
aGF0IGRvZXMgImRvZXNuJ3QgYm9vdCBhdCBhbGwiIG1lYW4/IEFyZSB0aGVyZSBhbnkga2VybmVs
IAo+Pj4+Pj4+IHN0YXJ0dXAKPj4+Pj4+PiBtZXNzYWdlcz8KPj4+Pj4+IAo+Pj4+Pj4gSSdtIHNo
YXJpbmcgdGhlIGVycm9yIG1lc3NhZ2VzIGJlbG93Lgo+Pj4+PiAKPj4+Pj4gVGhhbmtzLgo+Pj4+
PiAKPj4+Pj4+IFvCoMKgwqAgMC43NDg1OTRdIHNwaS1ub3Igc3BpMC4wOiB3MjVxNTEybndxICg2
NTUzNiBLYnl0ZXMpCj4+Pj4+PiBbwqDCoMKgIDAuODY1MjE2XSBzcGktYXNwZWVkLXNtYyAxZTYy
MDAwMC5zcGk6IENFMCByZWFkIGJ1c3dpZHRoOjQgCj4+Pj4+PiBbMHg0MDZjMDc0MV0KPj4+Pj4+
IFvCoMKgwqAgMC44NzI4MzNdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+
Pj4+Pj4gW8KgwqDCoCAwLjg3Nzk4NF0gV0FSTklORzogQ1BVOiAxIFBJRDogMSBhdCBkcml2ZXJz
L210ZC9tdGRjb3JlLmM6NTgzCj4+Pj4+PiBhZGRfbXRkX2RldmljZSsweDI4Yy8weDUzYwo+Pj4+
Pj4gW8KgwqDCoCAwLjg4NzIzN10gQ1BVOiAxIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRh
aW50ZWQKPj4+Pj4+IDUuMTUuNDMtQVVUT0lOQy1kaXJ0eS0yMzgwMWE2ICMxCj4+Pj4+IAo+Pj4+
PiBDb3VsZCB5b3UgcGxlYXNlIHRyeSBpdCBvbiB0aGUgbGF0ZXN0ICh2YW5pbGxhKSBsaW51eC1u
ZXh0Pwo+Pj4+IAo+Pj4+IG9yIHNwaS1ub3IvbmV4dCBbMV0gYXMgdGhlcmUgYXJlIHF1aXRlIGEg
bG90IG9mIGNoYW5nZXMuIFRoZQo+Pj4+IHBhdGNoZXMgc2hhbGwgYmUgYmFzZWQgb24gdGhhdC4K
Pj4+IAo+Pj4gT2theS4gTGV0IG1lIHRyeSB0aGF0LiBJIHRlc3RlZCBpdCB1c2luZyA1LjE1LjQz
IHdpdGggYmFjay1wb3J0ZWQKPj4+IHNwaS1ub3IgcGF0Y2hlcyBmcm9tIHRoZSBsYXRlc3QuIEkn
bGwgYmFjay1wb3J0IG1vcmUgY2hhbmdlcyBmcm9tCj4+PiB0aGUgc3BpLW5vci9uZXh0IGFuZCB3
aWxsIHRlc3QgdGhlIElORk8oMHhlZjYwMjAsIDAsIDAsIDApIHNldHRpbmcKPj4+IGFnYWluLgo+
PiAKPj4gSSB0ZXN0ZWQgdGhlIHNldHRpbmcgYWdhaW4gYWZ0ZXIgY2hlcnJ5IHBpY2tpbmcgYWxs
IFNQSSByZWxhdGluZyAKPj4gY2hhbmdlcwo+PiBmcm9tIHRoZSAnZm9yLW5leHQnIGJyYW5jaCBv
Zgo+PiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25p
ZS9zcGkgcmVwb3NpdG9yeS4KPj4gCj4+IE5vIGx1Y2shIEl0J3Mgc3RpbGwgbWFraW5nIHRoZSBz
YW1lIHdhcm5pbmcgZHVtcCBhdCAnYWRkX210ZF9kZXZpY2UnCj4+IHNpbmNlICdtdGQtPmVyYXNl
c2l6ZScgaXMgY2hlY2tlZCBhcyAwLgo+PiAKPj4gSSB0cmFjZWQgaXQgZnVydGhlciB0byBjaGVj
ayBpZiB0aGUgZXJhc2VzaXplIGlzIHByb3Blcmx5IHBhcnNlZCBmcm9tCj4+IHRoZSBzZmRwIGFu
ZCBjaGVja2VkIHRoYXQgZXJhc2UgbWFwIHNlZW1zIHBhcnNlZCBhbmQgaW5pdGlhbGl6ZWQKPj4g
Y29ycmVjdGx5IGluICdzcGlfbm9yX3BhcnNlX2JmcHQnIGJ1dCBwcm9ibGVtIGlzLCBhIHRhcmdl
dAo+PiBtdGQtPmVyYXNlc2l6ZSBpcyBub3QgcHJvcGVybHkgc2VsZWN0ZWQgaW4gJ3NwaV9ub3Jf
c2VsZWN0X2VyYXNlJyAKPj4gc2luY2UKPj4gdGhlICd3YW50ZWRfc2l6ZScgdmFyaWFibGUgaXMg
aW5pdGlhbGl6ZWQgYXMgc2VjdG9yIHNpemUgb2YgaW5mbyB0YWJsZQo+PiBzbyBhIHNlbGVjdGVk
IHRhcmdldCBtdGQtPmVyYXNlc2l6ZSBpcyBhbHNvIDAgc28gbG9va3MgbGlrZSBpdCdzIHRoZQo+
PiByZWFzb24gd2h5IGl0IGNhbid0IGluaXRpYWxpemUgbXRkIGRldmljZSBpZiB3ZSB1c2UKPj4g
SU5GTygweGVmNjAyMCwgMCwgMCwgMCkuCj4+IAo+PiBBbHNvLCBjaGVja2VkIHRoYXQgdGhlIG10
ZC0+ZXJhc2VzaXplIGlzIHNldCB0byA0MDk2IGlmIEkgZW5hYmxlCj4+IENPTkZJR19NVERfU1BJ
X05PUl9VU0VfNEtfU0VDVE9SUyBzbyB0aGUgU1BJIGZsYXNoIGNhbiBiZSBpbml0aWFsaXplZCAK
Pj4gd2l0aCB0aGUgSU5GTygweGVmNjAyMCwgMCwgMCwgMCkgc2V0dGluZyBidXQsIGl0IHNob3Vs
ZCBjb3ZlciBldmVuIAo+PiB3aGVuCj4+IHRoZSBjb25maWd1cmF0aW9uIGlzIG5vdCBlbmFibGVk
LiBJIHRoaW5rLCB0aGlzIHBhdGNoIHNob3VsZCBnbyBhcyBpdAo+PiBpcy4gVGhlIGVyYXNlc2l6
ZSBzZWxlY3RpbmcgaXNzdWUgY291bGQgYmUgZml4ZWQgdXNpbmcgYSBzZXBhcmF0ZQo+PiBwYXRj
aC4KPj4gCj4+IEFyZSB5b3Ugc3RpbGwgc3VyZSB0aGF0IHRoZSBJTkZPKDB4ZWY2MDIwLCAwLCAw
LCAwKSB3b3JrcyBpbiB0aGUKPj4gbGF0ZXN0IHNwaS1uZXh0Pwo+IAo+IEkgYWxzbyB0cmllZCB0
byBmaXggdGhlIGlzc3VlIGFuZCBtYWRlIGEgZml4IGxpa2UgYmVsb3cuCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmMKPiBpbmRleCA1MDI5NjdjNzZjNWYuLmY4YTAyMGY4MGE1NiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5j
Cj4gQEAgLTIxMTcsNyArMjExNyw3IEBAIHNwaV9ub3Jfc2VsZWN0X3VuaWZvcm1fZXJhc2Uoc3Ry
dWN0Cj4gc3BpX25vcl9lcmFzZV9tYXAgKm1hcCwKPiAgICAgICAgICAgICAgICAgICogSWYgdGhl
IGN1cnJlbnQgZXJhc2Ugc2l6ZSBpcyB0aGUgb25lLCBzdG9wIGhlcmU6Cj4gICAgICAgICAgICAg
ICAgICAqIHdlIGhhdmUgZm91bmQgdGhlIHJpZ2h0IHVuaWZvcm0gU2VjdG9yIEVyYXNlIAo+IGNv
bW1hbmQuCj4gICAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICBpZiAodGVzdGVk
X2VyYXNlLT5zaXplID09IHdhbnRlZF9zaXplKSB7Cj4gKyAgICAgICAgICAgICAgIGlmICh3YW50
ZWRfc2l6ZSAmJiB0ZXN0ZWRfZXJhc2UtPnNpemUgPT0gd2FudGVkX3NpemUpIHsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBlcmFzZSA9IHRlc3RlZF9lcmFzZTsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAgfQo+IAo+IFRlc3RlZCB0aGF0IGl0IG1h
a2VzIHRoZSBJTkZPKDB4ZWY2MDIwLCAwLCAwLCAwKSBzZXR0aW5nIHdvcmsgYW5kIGEKPiBzZWxl
Y3RlZCBtdGQtPmVyYXNlc2l6ZSBpcyA2NTUzNiB3aGljaCBpcyB3aGF0IEkgZXhwZWN0ZWQgZm9y
IHRoaXMKPiBkZXZpY2UuCj4gCj4gTm90IHN1cmUgaWYgaXQncyBhIHJpZ2h0IGZpeCBvciBub3Qu
IFBsZWFzZSByZXZpZXcgYW5kIGxldCBtZSBrbm93IGlmCj4gaXQncyBnb29kIHRvIHN1Ym1pdCBv
ciBub3QuCgpBaGgsIEkgdGhpbmsgSSBrbm93IHdoYXRzIGdvaW5nIHdyb25nIGhlcmUuIFRoYW5r
cyEKCjRiYWl0IHdpbGwgc2V0IHRoZSBlcmFzZSBzaXplIHRvIDAgaWYgdGhlcmUgaXMgbm8gY29y
cmVzcG9uZGluZwpvcGNvZGUgZm9yIHRoZSA0Ynl0ZSBlcmFzZS4gU28geW91J2xsIGVuZCB1cCB3
aXRoCmV0WzBdOiA0MDk2IC0gMjFoCmV0WzFdOiAwIC0gRkZoCmV0WzJdOiA2NTUzNiAtIERDaApl
dFszXTogLS0KCkFuZCBzcGlfbm9yX3NlbGVjdF91bmlmb3JtX2VyYXNlKCkgd2lsbCBzZWxlY3Qg
ZXRbMV0uCgpDb3VsZCB5b3UgdHJ5IHRoZSBmb2xsb3dpbmc6CgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwppbmRleCBj
ZTVkNjkzMTdkNDYuLmEyYzhkZTI1MGUwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKQEAgLTIxMTMsNiArMjEx
MywxMCBAQCBzcGlfbm9yX3NlbGVjdF91bmlmb3JtX2VyYXNlKHN0cnVjdCAKc3BpX25vcl9lcmFz
ZV9tYXAgKm1hcCwKCiAgICAgICAgICAgICAgICAgdGVzdGVkX2VyYXNlID0gJm1hcC0+ZXJhc2Vf
dHlwZVtpXTsKCisgICAgICAgICAgICAgICAvKiBTa2lwIG1hc2tlZCBlcmFzZSB0eXBlcy4gKi8K
KyAgICAgICAgICAgICAgIGlmICghdGVzdGVkX2VyYXNlLT5zaXplKQorICAgICAgICAgICAgICAg
ICAgICAgICBjb250aW51ZTsKKwogICAgICAgICAgICAgICAgIC8qCiAgICAgICAgICAgICAgICAg
ICogSWYgdGhlIGN1cnJlbnQgZXJhc2Ugc2l6ZSBpcyB0aGUgb25lLCBzdG9wIGhlcmU6CiAgICAg
ICAgICAgICAgICAgICogd2UgaGF2ZSBmb3VuZCB0aGUgcmlnaHQgdW5pZm9ybSBTZWN0b3IgRXJh
c2UgY29tbWFuZC4KCgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
