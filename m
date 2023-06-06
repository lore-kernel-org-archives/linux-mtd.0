Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B4EC77B73
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 10:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwB5yqEEFrU8yBYq7mn+wciyqS/qZKh6DE9ZyTyNTzc=; b=Dzc5gfrvJVll8u
	y1a582eCajK2M+kg4o16AmT131soRIvG6eDoLxUbdkjlC9bbwpG2Q0luD5DAzoaZYELOJ/oIP40FS
	poHWFOXj1SYQkEtDNF7C1UeT54Jf68tGy6Dy+syO51/RWpOULfsV4XmEarUvWDntq7JJaeBQA6ays
	K/tI3xFTWBVZ+KqtaemYil1LDui5ipToj8gvdHaKS8tatUltK0Og/iPWWxogk5MpTvMYagTmotCE9
	H4mBcTNRZiiVgcjNFHe1UVsxu4NC4AGziBuHGCjvHfe8z+USNdpp4T942WxQcgH8068AXzZBod9kF
	c6M6EgU594P4cGwLwMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TvN-001AxY-12;
	Tue, 06 Jun 2023 10:28:25 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TvJ-001AwZ-2b;
	Tue, 06 Jun 2023 10:28:23 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686047297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MbOwpIPwd7ecKKCdWUaXxk1gMTlweGrlfTRorHHoufY=;
	b=m24Uwt3PtvDcGDw8hY4xSFXyyh9gm3u4OIwNTmSu/dQoeVeBZ1MnVppSZrBMqIu/M6yDvi
	U0fjurhQl/AJJaHAvrsolInpAAiTznZ+r3yK2X+qGbjRmvpFovpbZHWvAcbwuV1u8qA+ET
	BMlT3V3eMQUQBTpUFvPQZ/AVVi8wxLW+ivwAcGF/hnJWZAubBn1C6lrBjyQlsmFatjC2WX
	I+PRH3eDvRdV+/YwbBujtndbU44UxDW4Xwq9facrRSbE99ZmyobpLNuEA0Z+GhTg4w93LJ
	C8+yL84A+unRUTSzDoqitydxRaCWKtoJLReE5CBZZ3TV/QP9RPCgn1abnTsYpQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CD9140003;
	Tue,  6 Jun 2023 10:28:13 +0000 (UTC)
Date: Tue, 6 Jun 2023 12:28:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "conor@kernel.org" <conor@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "enachman@marvell.com"
 <enachman@marvell.com>, Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <20230606122812.411b223a@xps-13>
In-Reply-To: <845924ba-d9bf-d0ec-e1f2-f721366f43c0@linaro.org>
References: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
	<20230531234923.2307013-4-chris.packham@alliedtelesis.co.nz>
	<a23dd485-a3d9-e31f-be3e-0ab293fcfc4a@linaro.org>
	<785368df-1881-e62e-6172-d902cee814a8@alliedtelesis.co.nz>
	<eaf9d7cf-c9f5-a5d5-67af-c43761c3c6cf@linaro.org>
	<4ea0b16e-0cec-00db-c598-e0364a7edef8@alliedtelesis.co.nz>
	<9fc57052-5049-ed50-ca95-cfd1d0420dd9@alliedtelesis.co.nz>
	<20230606094855.1ab005eb@xps-13>
	<845924ba-d9bf-d0ec-e1f2-f721366f43c0@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_032822_153129_F7074EED 
X-CRM114-Status: GOOD (  28.88  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFR1
ZSwgNiBKdW4gMjAyMyAxMDo0NDozNCArMDIwMDoKCj4gT24gMDYvMDYvMjAyMyAwOTo0OCwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgaXQgKG90aGVy
d2lzZSBpdCBpcyBoYXJtbGVzcykuCj4gPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZwo+ID4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGRlcHJlY2F0ZWQ6IHRydWUKPiA+Pj4+Pj4+ICsKPiA+Pj4+Pj4+ICvCoMKgwqAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlICAgIAo+ID4+Pj4+PiB1bmV2YWx1YXRlZFByb3BlcnRpZXM6
IGZhbHNlICAgIAo+ID4+Pj4+IEl0IHdhcyBoaWRpbmcgYnkgJyJebmFuZEBbMC0zXSQiOicuIFNo
b3VsZCBJIG1vdmUgaXQgaGVyZT8gICAgCj4gPj4+PiBZb3UgY2Fubm90IGhhdmUgYm90aCBhZGRp
dGlvbmFsUHJvcHMgYW5kIHVuZXZhbHVhdGVkUHJvcHMgYXQgdGhlIHNhbWUKPiA+Pj4+IHRpbWUs
IHNvIHdlIGRvIG5vdCB0YWxrIGFib3V0IHNhbWUgdGhpbmcgb3IgdGhpcyB3YXMgbmV2ZXIgd29y
a2luZz8gICAgCj4gPj4+Cj4gPj4+IEhtbSwgSSdtIGEgbGl0dGxlIGNvbmZ1c2VkIHRoZW4uIEF0
IHZhcmlvdXMgdGltZXMgSSd2ZSBiZWVuIHRvbGQgdG8gCj4gPj4+IHB1dCAnYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlJyBvciAndW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZScgCj4gPj4+
IChhbHRob3VnaCBuZXZlciBhdCB0aGUgc2FtZSB0aW1lKS4gSSdtIG5vdCBzdXJlIHdoZW4gdG8g
dXNlIG9uZSBvciB0aGUgCj4gPj4+IG90aGVyLgo+ID4+Pgo+ID4+PiBGcm9tIHdoYXQgSSd2ZSBi
ZWVuIGFibGUgdG8gZ2xlYW4gJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlJyAKPiA+Pj4gaW5k
aWNhdGVzIHRoYXQgdGhlIG5vZGUgaXMgZXhwZWN0ZWQgdG8gaGF2ZSBjaGlsZCBub2RlcyBkZWZp
bmVkIGluIGEgCj4gPj4+IGRpZmZlcmVudCBzY2hlbWEgc28gSSB3b3VsZCBoYXZlIHRob3VnaHQg
J2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZScgCj4gPj4+IHdvdWxkIGJlIGFwcHJvcHJpYXRl
IGZvciBhIHNjaGVtYSBjb3ZlcmluZyBhIGxlYWYgbm9kZS4gCj4gPj4+ICd1bmV2YWx1YXRlZFBy
b3BlcnRpZXM6IGZhbHNlJyBzZWVtcyB0byBlbmFibGUgc3RyaWN0ZXIgY2hlY2tpbmcgd2hpY2gg
Cj4gPj4+IG1ha2VzIHNlbnNlIHdoZW4gYWxsIHRoZSBwcm9wZXJ0aWVzIGFyZSBkZXNjcmliZWQg
aW4gdGhlIHNjaGVtYS4gICAgCj4gPj4KPiA+PiBTbyBJIHRoaW5rIHRoaXMgbWlnaHQgYmUgdGhl
IHByb2JsZW0uIElmIEkgbG9vayBhdCBxY29tLG5hbmRjLnlhbWwgb3IgCj4gPj4gaW5nZW5pYyxu
YW5kLnlhbWwgd2hpY2ggYm90aCBoYXZlIGEgcGFydGl0aW9ucyBwcm9wZXJ0eSBpbiB0aGVpciAK
PiA+PiBleGFtcGxlLiBOZWl0aGVyIGhhdmUgJ3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2Un
IG9uIHRoZSBuYW5kQC4uLiAKPiA+PiBzdWJub2RlLiBJZiBJIGFkZCBpdCBzdXJlIGVub3VnaCBJ
IHN0YXJ0IGdldHRpbmcgY29tcGxhaW50cyBhYm91dCB0aGUgCj4gPj4gJ3BhcnRpdGlvbnMnIG5v
ZGUgYmVpbmcgdW5leHBlY3RlZC4gIAo+ID4gCj4gPiBTb3JyeSBpZiB0aGF0IHdhcyB1bmNsZWFy
LCBJIHRoaW5rIHRoZSB3aG9sZSBsb2dpYyBhcm91bmQgdGhlIHlhbWwKPiA+IGZpbGVzIGlzIHRv
IHByb2dyZXNzaXZlbHkgY29uc3RyYWluIHRoZSBkZXNjcmlwdGlvbnMsIHNjaGVtYSBhZnRlcgo+
ID4gc2NoZW1hLiBJT1csIGluIHRoZSBtYXJ2ZWxsIGJpbmRpbmcgeW91IHNob3VsZCBzZXQKPiA+
IHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UgZm9yIHRoZSBOQU5EIGNvbnRyb2xsZXIuIFdo
YXQgaXMgaW5zaWRlCj4gPiAoTkFORCBjaGlwcywgcGFydGl0aW9uIGNvbnRhaW5lciwgcGFydGl0
aW9uIHBhcnNlcnMsICJtdGQiIHByb3BlcnRpZXMsCj4gPiBldGMpIHdpbGwgYmUgaGFuZGxlZCBi
eSBvdGhlciBmaWxlcy4gT2YgY291cnNlIHlvdSBjYW4gY29uc3RyYWluIGEgYml0Cj4gPiB3aGF0
IGNhbi9jYW5ub3QgYmUgdXNlZCBpbnNpZGUgdGhlc2Ugc3Vibm9kZXMsIGJ1dCBJIHRoaW5rIHlv
dSBkb24ndAo+ID4gbmVlZCB0byBzZXQgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzIGluIHRoZXNlIHN1
Ym5vZGVzICh0aGUgTkFORCBjaGlwIGluCj4gPiB0aGlzIGNhc2UsIG9yIGV2ZW4gdGhlIHBhcnRp
dGlvbnMpIGJlY2F1c2UgeW91IGFscmVhZHkgcmVmZXJlbmNlCj4gPiBuYW5kLWNvbnRyb2xsZXIu
eWFtbCB3aGljaCByZWZlcmVuY2VzIG5hbmQtY2hpcC55YW1sLCBtdGQueWFtbCwKPiA+IHBhcnRp
dGlvbnMueWFtbCwgZXRjLiAqdGhleSogd2lsbCBtYWtlIHRoZSBnZW5lcmljIGNoZWNrcyBhbmQg
aG9wZWZ1bGx5Cj4gPiBhcHBseSBzdHJpY3RlciBjaGVja3MsIHdoZW4gZGVlbWVkIHJlbGV2YW50
LiAgCj4gCj4gTm8sIG5laXRoZXIgbmFuZC1jb250cm9sbGVyLnlhbWwgbm9yIG5hbmQtY2hpcC55
YW1sIGxpbWl0IHRoZSBwcm9wZXJ0aWVzCj4gaW4gdGhpcyBjb250ZXh0LCBzbyBlYWNoIGRldmlj
ZSBzY2hlbWEgbXVzdCBoYXZlIHVuZXZhbHVhdGVkUHJvcGVydGllczoKPiBmYWxzZSwgZm9yIHdo
aWNoIEkgYXNrZWQgZmV3IGVtYWlscyBhZ28uCgpUaGUgY29udHJvbGxlciBkZXNjcmlwdGlvbiBz
aGFsbCBiZSBndWFyZGVkIGJ5IHVuZXZhbHVhdGVkUHJvcGVydGllczoKZmFsc2UsIHdlIGFncmVl
LiBEbyB5b3UgbWVhbiB0aGUgbmFuZCBjaGlwIGRlc2NyaXB0aW9uIGluIGVhY2ggbmFuZApjb250
cm9sbGVyIGJpbmRpbmcgc2hvdWxkIGFsc28gaW5jbHVkZSBpdCBhdCBpdHMgb3duIGxldmVsPyBC
ZWNhdXNlCnRoYXQgaXMgbm90IHdoYXQgd2UgZW5mb3JjZWQgc28gZmFyIElJUkMuIEkgYW0gdG90
YWxseSBmaW5lIGRvaW5nIHNvCnN0YXJ0aW5nIGZyb20gbm93IG9uIGlmIHRoaXMgaXMgYSBuZXcg
cmVxdWlyZW1lbnQgKHdoaWNoIG1ha2VzIHNlbnNlKS4KCklmIHllcywgdGhlbiBpdCBtZWFucyB3
ZSB3b3VsZCBuZWVkIHRvIGxpc3QgKmFsbCogdGhlIG5hbmQKY2hpcCBwcm9wZXJ0aWVzIGluIGVh
Y2ggc2NoZW1hLCB3aGljaCBjbGVhcmx5IGludm9sdmVzIGEgbG90IG9mCmR1cGxpY2F0aW9uIGFz
IHlvdSB3b3VsZCBuZWVkIHRvIGRlZmluZSBhbGwgdHlwZXMgb2YgcGFydGl0aW9ucywKcGFydGl0
aW9uIHBhcnNlcnMsIGdlbmVyaWMgcHJvcGVydGllcywgZXRjIGluIG9yZGVyIGZvciB0aGUgZXhh
bXBsZXMgdG8KcGFzcyBhbGwgdGhlIGNoZWNrcy4gT25seSB0aGUgcHJvcGVydGllcyBsaWtlIHBp
bmN0cmwtKiB3b3VsZCBub3QgbmVlZAp0byBiZSBsaXN0ZWQgSSBndWVzcy4KCkFzIENocmlzIHdh
cyBoYXZpbmcgaXNzdWVzIGNvbXBhcmluZyBoaXMgd29yayB3aXRoIHRoZSBpbmdlbmljIGFuZCBx
Y29tCnlhbWwgZmlsZXMsIEkgZ2F2ZSB5b3VyIGlucHV0IGEgdHJ5IGFuZCBob3BlZnVsbHkgImZp
eGVkIiB0aGVzZQpiaW5kaW5ncy4gSSdsbCBDYyBDaHJpcyBvbiB0aGUgc3VibWlzc2lvbiBzbyB0
aGF0IGhlIGhhcyBhbiBleGFtcGxlIG9mCndvcmtpbmcgLWJ1dCBtYXliZSBub3QgZnVsbHkgdmFs
aWQsIGxldCdzIHNlZS0gYmluZGluZyB0byB0YWtlIGFzCmV4YW1wbGUuCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
