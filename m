Return-Path: <SRS0=RfYw=TD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08545C004C9
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 12:40:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA58D2075E
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 12:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BcVM7gVE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA58D2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GROPFwPiFrlECzJLJfhaiRPRYKk0CLyu1GI6tjXxepU=; b=BcVM7gVEYBWIgl
	gLISmCBVIDVba0egRSC8NtwaCtBldB/3iqtSA5yjNcsWDva+oId3xDHVZJ4cPYbPFpLvbIGM9Oa8k
	RBvzL4X5XNYNOio8f+nhE3MIxxZVW9GZFL9XKE9S8+2KVpp1B5i4TSHtPetJ1redCQJIB9hLoRBes
	6PW9Y+ySsMLnIJqAiOybqPjlJ1MXk5pMi+zhvrz3psvCfUxoKF7Lq+zuAr9kKK6AJ0KyDGLGjamrv
	B8tQ6CUvLulwQE/cxYIfYDDPpAMeHtZcMLs4aV6TzKDiCXI1uuyECY2AZFzj6EEklBTDZrHgSQ8kP
	B8bj1CUUsAdgdIsZfnGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMXUh-0001Ns-RN; Fri, 03 May 2019 12:40:51 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMXUY-0001Gf-FY; Fri, 03 May 2019 12:40:44 +0000
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6FDCE10000B;
 Fri,  3 May 2019 12:40:30 +0000 (UTC)
Date: Fri, 3 May 2019 14:40:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 07/36] mtd: rawnand: Avoid a typedef
Message-ID: <20190503144030.7fbbc0d4@xps13>
In-Reply-To: <20190331135513.59257c1d@collabora.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
 <20190304222841.13899-8-miquel.raynal@bootlin.com>
 <20190331135513.59257c1d@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190503_054042_824837_7C5E1403 
X-CRM114-Status: GOOD (  20.56  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTdW4sIDMxIE1hcgoyMDE5IDEzOjU1OjEzICswMjAwOgoKPiBPbiBNb24sICA0
IE1hciAyMDE5IDIzOjI4OjEyICswMTAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBJbiBuZXcgY29kZSwgdGhlIHVzZSBvZiB0eXBlZGVm
IGlzIGRpc2NvdXJhZ2VkLiBCZWZvcmUgbW92aW5nIHRoaXMKPiA+IHNlY3Rpb24gb3V0IG9mIHRo
ZSByYXcgTkFORCBiYXNlLCBsZXQncyBzd2l0Y2ggdGhlIG5hbmRfZWNjX21vZGVzX3QKPiA+IHR5
cGUgaW50byBhIHJlZ3VsYXIgbmFuZF9lY2NfbW9kZSBlbnVtZXJhdGlvbi4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jICAgICAgICAgICAgICAg
fCA0ICsrLS0KPiA+ICBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggICAgICAgICAgICAgICAg
ICAgIHwgNiArKystLS0KPiA+ICBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvbXRkLWRhdmlu
Y2kuaCAgICAgIHwgMiArLQo+ID4gIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9tdGQtbmFu
ZC1zM2MyNDEwLmggfCAyICstCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gPiBpbmRl
eCBlMTRmMDJhMDFlZmQuLjA1MTc0YzZhMzA5OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfYmFzZS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X2Jhc2UuYwo+ID4gQEAgLTQ4ODEsOCArNDg4MSw4IEBAIHN0YXRpYyBpbnQgb2ZfZ2V0X25hbmRf
ZWNjX21vZGUoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiA+ICAKPiA+ICAJLyoKPiA+ICAJICog
Rm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgd2Ugc3VwcG9ydCBmZXcgb2Jzb2xldGVkIHZhbHVl
cyB0aGF0IGRvbid0Cj4gPiAtCSAqIGhhdmUgdGhlaXIgbWFwcGluZ3MgaW50byBuYW5kX2VjY19t
b2Rlc190IGFueW1vcmUgKHRoZXkgd2VyZSBtZXJnZWQKPiA+IC0JICogd2l0aCBvdGhlciBlbnVt
cykuCj4gPiArCSAqIGhhdmUgdGhlaXIgbWFwcGluZ3MgaW50byB0aGUgbmFuZF9lY2NfbW9kZSBl
bnVtIGFueW1vcmUgKHRoZXkgd2VyZQo+ID4gKwkgKiBtZXJnZWQgd2l0aCBvdGhlciBlbnVtcyku
Cj4gPiAgCSAqLwo+ID4gIAlpZiAoIXN0cmNhc2VjbXAocG0sICJzb2Z0X2JjaCIpKQo+ID4gIAkJ
cmV0dXJuIE5BTkRfRUNDX1NPRlQ7Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQv
cmF3bmFuZC5oIGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oCj4gPiBpbmRleCAxNDc0ODE4
MzUwOGIuLmM1YmY2YmI0OTMyOSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL3Jh
d25hbmQuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oCj4gPiBAQCAtODcs
MTQgKzg3LDE0IEBAIHN0cnVjdCBuYW5kX2NoaXA7Cj4gPiAgLyoKPiA+ICAgKiBDb25zdGFudHMg
Zm9yIEVDQ19NT0RFUwo+ID4gICAqLwo+ID4gLXR5cGVkZWYgZW51bSB7Cj4gPiArZW51bSBuYW5k
X2VjY19tb2RlIHsKPiA+ICAJTkFORF9FQ0NfTk9ORSwKPiA+ICAJTkFORF9FQ0NfU09GVCwKPiA+
ICAJTkFORF9FQ0NfSFcsCj4gPiAgCU5BTkRfRUNDX0hXX1NZTkRST01FLAo+ID4gIAlOQU5EX0VD
Q19IV19PT0JfRklSU1QsCj4gPiAgCU5BTkRfRUNDX09OX0RJRSwKPiA+IC19IG5hbmRfZWNjX21v
ZGVzX3Q7Cj4gPiArfTsgIAo+IAo+IEhtLCBJJ20gcmVhbGx5IG5vdCBhIGJpZyBmYW4gb2YgdGhp
cyBlbnVtIGJlY2F1c2UgaXQncyBtaXhpbmcgMgo+IGRpZmZlcmVudCBjb25jZXB0czogdGhlIHR5
cGUgb2YgRUNDIGVuZ2luZSB0byB1c2UgKG9uLWRpZSwKPiBody1jb250cm9sbGVyLXNpZGUsIHNv
ZnR3YXJlLCBuby1FQ0MpIGFuZCB0aGUgbGF5b3V0IG9mCj4gRUNDL0ZSRUUgYnl0ZXMgKF9TWU5E
Uk9NRSwgX09PQl9GSVJTVCkuCj4gCj4gSSdkIHJlY29tbWVuZCBjcmVhdGluZyBhIG5hbmRfZWNj
X2VuZ2luZV90eXBlIGVudW06Cj4gCj4gZW51bSBuYW5kX2VjY19lbmdpbmVfdHlwZSB7Cj4gCU5B
TkRfTk9fRUNDX0VOR0lORSwKPiAJTkFORF9TT0ZUX0VDQ19FTkdJTkUsCj4gCU5BTkRfSFdfRUND
X0VOR0lORSwKPiAJTkFORF9PTl9ESUVfRUNDX0VOR0lORSwKPiB9Owo+IAo+IGFuZCB0aGVuIGNv
bnZlcnQgdGhlIHJhdyBOQU5EIGxheWVyIHRvIHRoaXMgZW51bSB3aGVuIHRoZSB0aW1lIGNvbWVz
LgoKSSBzdGFydGVkIHNvbWV0aGluZyBidXQgdGhpcyBnb2VzIHdheSB0b28gZmFyIGZyb20gd2hh
dCBJIHdhbnQgdG8KYWNoaWV2ZS4gSSBrbm93IGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBpdCBi
dXQgaXQgaGFzIGFuCmluY3JlYXNpbmdseSBudW1iZXIgb2Ygc2lkZSBlZmZlY3RzIHdoaWNoIHNj
YXJlZCBtZS4gVGhlIHdheSB0aGUKc2VyaWVzIGlzIG9yZ2FuaXplZCBkb2VzIG5vdCBhbGxvdyB0
byBlYXNpbHkgaWdub3JlIHRoZSByYXcgTkFORCBsYXllcgpmaXJzdCBhbmQgdGhlbiBjb252ZXJ0
IGl0LiBJIGFtIGdpdmluZyB1cCBvbiB0aGlzIG9uZSBmb3Igbm93LCBzb3JyeS4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
