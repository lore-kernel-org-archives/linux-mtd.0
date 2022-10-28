Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC50ECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Oct 2022 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbGplh9qfVwwK0NWttwVpiK+w1JGl+gGZUanXCTZyKQ=; b=4AleD9kWxqh54k
	yDheTXLYGc6FMQM6lfJRgy7NmixvSLaUmNnv2MXwYe3vpTHczMm1XkewXnaeXpWE2nr0FKzkoiDEU
	Qi0+bIGc42hoqm2JHaLd3RufW4AX/LA2JQvdiUW18kiCx0U+GPS6iHrb201NYASXBWzdNMDrsrlFQ
	kB+35KjpfmF1GLSZJFlPWY+pfIkTS41c4v2AneHu6mwvDooWQHgkpR3492y1Z76zt2VXXswW+iRgI
	Wvp1QtDhL8TYM0dwC4L516wVbkmLg3pEGNuUGq9CnPEgwdrMP9NgpFo8fWE91Ram93vsb+R/8LXFX
	7GynarI5zJpEjgxMxUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooK5w-00G3Ln-HJ; Fri, 28 Oct 2022 07:48:00 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooK5k-00G3JA-2Y; Fri, 28 Oct 2022 07:47:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 74201E0010;
	Fri, 28 Oct 2022 07:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666943263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLXC0cwAmDt5KBT+Al/vAYlHjySoviECJr9RtYbcKzg=;
	b=SoaPKg4+LmzLGFBGG+w/Xg5NUehylrSZvbjXNLIgzaqTWTPzApxQ0TsUvLwCMkvE3FjyZ3
	D+LIaLMmYDinzQP5DLMHDyScbeWkQBDLv7DGsHduIeNoXv/w2SuZBR85jJv2oggff23rLq
	qPWR8lnjB6n/famZwwZCK4tIqBH2t9A74noW+HNz6YctDgC8jwOgM/XE/67+je7bTXKs1t
	p7oOkz9+SdXKCDxXjMJ5hQ1MZMXjjzNlnvVdRCahcp/hrxDGdzedV2/XJp1/Y+uWCC3YBi
	5UhRLlIPkMKGJVx/mBTYc+cfO5sSZ/TmVCi7bSo2uZw7LnDesnUlXHwow6D8IQ==
Date: Fri, 28 Oct 2022 09:47:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vadym Kochan <vadym.kochan@plvision.eu>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Elad Nachman <enachman@marvell.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <20221028094740.3c11f52b@xps-13>
In-Reply-To: <683dffbc-744f-80cd-2262-b6deb4200ccc@linaro.org>
References: <20221026134545.7146-1-vadym.kochan@plvision.eu>
	<20221026134545.7146-2-vadym.kochan@plvision.eu>
	<33f04b06-dc00-b7ce-6a24-2282608b40dc@linaro.org>
	<VI1P190MB0317C739E2D39427CD2A771D95309@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
	<10581088-e4ff-76db-3c9b-42a7a9c118ee@linaro.org>
	<20221027151825.166a9255@xps-13>
	<e937b059-4168-3bd4-b294-cbfff0519d1f@linaro.org>
	<20221027155025.7c04774a@xps-13>
	<683dffbc-744f-80cd-2262-b6deb4200ccc@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_004748_404429_0D71BF5B 
X-CRM114-Status: GOOD (  38.20  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFRo
dSwgMjcgT2N0IDIwMjIgMTA6NTE6MjkgLTA0MDA6Cgo+IE9uIDI3LzEwLzIwMjIgMDk6NTAsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBLcnp5c3p0b2YsCj4gPiAKPiA+IGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZyB3cm90ZSBvbiBUaHUsIDI3IE9jdCAyMDIyIDA5OjI0OjI0IC0w
NDAwOgo+ID4gICAKPiA+PiBPbiAyNy8xMC8yMDIyIDA5OjE4LCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
OiAgCj4gPj4+IEhpIFZhZHltLAo+ID4+PiAgICAgCj4gPj4+Pj4+PiArcGF0dGVyblByb3BlcnRp
ZXM6Cj4gPj4+Pj4+PiArICAiXm5hbmRAWzAtM10kIjoKPiA+Pj4+Pj4+ICsgICAgdHlwZTogb2Jq
ZWN0Cj4gPj4+Pj4+PiArICAgIHByb3BlcnRpZXM6Cj4gPj4+Pj4+PiArICAgICAgcmVnOgo+ID4+
Pj4+Pj4gKyAgICAgICAgbWluaW11bTogMAo+ID4+Pj4+Pj4gKyAgICAgICAgbWF4aW11bTogMwo+
ID4+Pj4+Pj4gKwo+ID4+Pj4+Pj4gKyAgICAgIG5hbmQtcmI6Cj4gPj4+Pj4+PiArICAgICAgICBt
aW5pbXVtOiAwCj4gPj4+Pj4+PiArICAgICAgICBtYXhpbXVtOiAxCj4gPj4+Pj4+PiArCj4gPj4+
Pj4+PiArICAgICAgbmFuZC1lY2Mtc3RyZW5ndGg6Cj4gPj4+Pj4+PiArICAgICAgICBlbnVtOiBb
MSwgNCwgOF0KPiA+Pj4+Pj4+ICsKPiA+Pj4+Pj4+ICsgICAgICBuYW5kLW9uLWZsYXNoLWJidDog
dHJ1ZQo+ID4+Pj4+Pj4gKwo+ID4+Pj4+Pj4gKyAgICAgIG5hbmQtZWNjLW1vZGU6IHRydWUKPiA+
Pj4+Pj4+ICsKPiA+Pj4+Pj4+ICsgICAgICBuYW5kLWVjYy1hbGdvOgo+ID4+Pj4+Pj4gKyAgICAg
ICAgZGVzY3JpcHRpb246IHwKPiA+Pj4+Pj4+ICsgICAgICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBl
c3NlbnRpYWxseSB1c2VmdWwgd2hlbiBub3QgdXNpbmcgaGFyZHdhcmUgRUNDLgo+ID4+Pj4+Pj4g
KyAgICAgICAgICBIb3dlcnZlciwgaXQgbWF5IGJlIGFkZGVkIHdoZW4gdXNpbmcgaGFyZHdhcmUg
RUNDIGZvciBjbGFyaWZpY2F0aW9uCj4gPj4+Pj4+PiArICAgICAgICAgIGJ1dCB3aWxsIGJlIGln
bm9yZWQgYnkgdGhlIGRyaXZlciBiZWNhdXNlIEVDQyBtb2RlIGlzIGNob3NlbiBkZXBlbmRpbmcK
PiA+Pj4+Pj4+ICsgICAgICAgICAgb24gdGhlIHBhZ2Ugc2l6ZSBhbmQgdGhlIHN0cmVuZ3RoIHJl
cXVpcmVkIGJ5IHRoZSBOQU5EIGNoaXAuCj4gPj4+Pj4+PiArICAgICAgICAgIFRoaXMgdmFsdWUg
bWF5IGJlIG92ZXJ3cml0dGVuIHdpdGggbmFuZC1lY2Mtc3RyZW5ndGggcHJvcGVydHkuCj4gPj4+
Pj4+PiArCj4gPj4+Pj4+PiArICAgICAgbmFuZC1lY2Mtc3RlcC1zaXplOgo+ID4+Pj4+Pj4gKyAg
ICAgICAgZGVzY3JpcHRpb246IHwKPiA+Pj4+Pj4+ICsgICAgICAgICAgTWFydmVsbCdzIE5BTkQg
Zmxhc2ggY29udHJvbGxlciBkb2VzIHVzZSBmaXhlZCBzdHJlbmd0aAo+ID4+Pj4+Pj4gKyAgICAg
ICAgICAoMS1iaXQgZm9yIEhhbW1pbmcsIDE2LWJpdCBmb3IgQkNIKSwgc28gdGhlIGFjdHVhbCBz
dGVwIHNpemUKPiA+Pj4+Pj4+ICsgICAgICAgICAgd2lsbCBzaHJpbmsgb3IgZ3JvdyBpbiBvcmRl
ciB0byBmaXQgdGhlIHJlcXVpcmVkIHN0cmVuZ3RoLgo+ID4+Pj4+Pj4gKyAgICAgICAgICBTdGVw
IHNpemVzIGFyZSBub3QgY29tcGxldGVseSByYW5kb20gZm9yIGFsbCBhbmQgZm9sbG93IGNlcnRh
aW4KPiA+Pj4+Pj4+ICsgICAgICAgICAgcGF0dGVybnMgZGVzY3JpYmVkIGluIEFOLTM3OSwgIk1h
cnZlbGwgU29DIE5GQyBFQ0MiLgo+ID4+Pj4+Pj4gKwo+ID4+Pj4+Pj4gKyAgICAgIGxhYmVsOgo+
ID4+Pj4+Pj4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
c3RyaW5nCj4gPj4+Pj4+PiArCj4gPj4+Pj4+PiArICAgICAgcGFydGl0aW9uczoKPiA+Pj4+Pj4+
ICsgICAgICAgIHR5cGU6IG9iamVjdCAgICAgIAo+ID4+Pj4+Pgo+ID4+Pj4+PiBUaGF0J3Mgbm90
IHdoYXQgSSBhc2tlZCBmb3IuIExpa2UgZm91ciB0aW1lcyBJIGFza2VkIHlvdSB0byBhZGQgaGVy
ZQo+ID4+Pj4+PiB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlIGFuZCBJIG5ldmVyIHNhaWQg
dGhhdCByZWYgdG8gcGFydGl0aW9uLnlhbWwKPiA+Pj4+Pj4gc2hvdWxkIGJlIHJlbW92ZWQgYW5k
IHlvdS4uLiBpbnN0ZWFkIHJlbW92ZSB0aGF0IHJlZi4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gWW91IG5l
ZWQgdG8gZGVmaW5lIGhlcmUgY2hpbGRyZW4gYW5kIHNwZWNpZnkgdGhlaXIgcmVmLgo+ID4+Pj4+
Pgo+ID4+Pj4+PiBZb3UgbXVzdCB1c2UgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZSBoZXJl
LiBTbyB0aGlzIGlzIGZpZnRoIHRpbWUgSQo+ID4+Pj4+PiBhbSB3cml0aW5nIHRoaXMgZmVlZGJh
Y2suCj4gPj4+Pj4+Cj4gPj4+Pj4+ICAgICAgCj4gPj4+Pj4KPiA+Pj4+PiBJdCBpcyBhIGJpdCBj
b25mdXNpbmcgdGhhdCBpdCBpcyBuZWVkZWQgdG8gZGVmaW5lICJwYXJ0aXRpb25zIiBhbmQgImxh
YmVsIiBydWxlcyBwYXJ0aWN1bGFyeQo+ID4+Pj4+IGluIHRoaXMgbmFuZCBjb250cm9sbGVyIGlu
c3RlYWQgb2Ygc29tZSBjb21tb24gcGxhY2UgbGlrZSBuYW5kLWNoaXAueWFtbCwgdGhlc2UgcHJv
cGVydGllcwo+ID4+Pj4+IGFyZSBjb21tb24gYWxzbyBmb3IgdGhlIG90aGVyIG5hbmQgY29udHJv
bGxlcnMuICAgICAgCj4gPj4+Pgo+ID4+Pj4gTm8gb25lIHNwZWFrcyBhYm91dCBsYWJlbCwgSSBu
ZXZlciBjb21tZW50ZWQgYWJvdXQgbGFiZWwsIEkgdGhpbmsuLi4KPiA+Pj4+Cj4gPj4+PiBJZiB5
b3UgdGhpbmsgdGhlIHByb3BlcnR5IGlzIHJlYWxseSBnZW5lcmljIGFuZCBldmVyeSBOQU5EIGNv
bnRyb2xsZXIKPiA+Pj4+IGJpbmRpbmdzIGltcGxlbWVudCBpdCwgdGhlbiBmZWVsIGZyZWUgdG8g
aW5jbHVkZSB0aGVtIHRoZXJlLCBpbiBhCj4gPj4+PiBzZXBhcmF0ZSBwYXRjaC4gSXQgc291bmRz
IHNlbnNpYmxlLCBidXQgSSBkaWQgbm90IGNoZWNrIG90aGVyIGJpbmRpbmdzLiAgICAKPiA+Pj4K
PiA+Pj4gRllJLCBsYWJlbCBpcyBhbHJlYWR5IGRlZmluZWQgaW4gbXRkL210ZC55YW1sLiAgICAK
PiA+Pgo+ID4+IFdoaWNoIGlzIG5vdCBpbmNsdWRlZCBoZXJlIGFuZCBpbiBuYW5kLWNvbnRyb2xs
ZXIueWFtbCAgCj4gPiAKPiA+IE1heWJlIG5hbmQtY2hpcC55YW1sIHNob3VsZD8gIAo+IAo+IG10
ZC55YW1sIGxvb2tzIGEgYml0IG1vcmUgdGhhbiB0aGF0IC0gYWxzbyBhbGxvd3MgbnZtZW0gbm9k
ZXMuIE1heWJlCj4gbGV0J3MganVzdCBhZGQgbGFiZWwgdG8gbmFuZC1jaGlwPwoKSSBkb24ndCBn
ZXQgdGhlIHJlYXNvbiBiZWhpbmQgdGhpcyBwcm9wb3NhbCwgbXRkLnlhbWwgcmVhbGx5IGlzCmtp
bmQgb2YgYSBkZWZpbml0aW9uIG9mIGdlbmVyaWMgcHJvcGVydGllcyBhbnkgbXRkIGRldmljZSBt
aWdodApoYXZlLCBzbyBkdXBsaWNhdGluZyBsYWJlbCAob3Igd2hhdGV2ZXIgZWxzZSBpbnNpZGUp
IGRvZXMgbm90IHNlZW0KbGVnaXRpbWF0ZSB0byBtZS4gVGhlIGplZGVjLHNwaS1ub3IueWFtbCBm
aWxlIGFscmVhZHkgcmVmZXJlbmNlcyBpdCBmb3IKaW5zdGFuY2UuCgo+ID4+PiBQYXJ0aXRpb25z
IGRvIG5vdCBuZWVkIHRvIGJlIGRlZmluZWQgaW4geW91ciBiaW5kaW5nLCBqdXN0IGRvbid0IHB1
dAo+ID4+PiBhbnkgaW4geW91ciBleGFtcGxlIGFuZCB5b3UnbGwgYmUgZmluZS4gVGhlc2UgcGFy
dGl0aW9ucyBhcmUgZWl0aGVyCj4gPj4+IHN0YXRpYyBhbmQgbWF5IGJlIGRlc2NyaWJlZCBpbiB0
aGUgRFQgKHNlZQo+ID4+PiBtdGQvcGFydGl0aW9uL3BhcnRpdGlvbi55YW1sKSBvciB0aGVyZSBp
cyBzb21lIGR5bmFtaWMgZGlzY292ZXJ5Cj4gPj4+IGludm9sdmVkIGFuZCBhIHByb3BlciBwYXJz
ZXIgc2hhbGwgYmUgcmVmZXJlbmNlZCAocGFyc2VycyBoYXZlIHRoZWlyCj4gPj4+IG93biBiaW5k
aW5nKS4gICAgCj4gPj4KPiA+PiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgY29ycmVjdC4gQmFzaWNh
bGx5IHlvdSBhbGxvdyBhbnkgbm9kZSB0byBiZSB1bmRlcgo+ID4+IHBhcnRpdGlvbnMgYXMgdGhl
cmUgaXMgbm8gc2NoZW1hIHZhbGlkYXRpbmcgdGhlbSAod2l0aG91dCBjb21wYXRpYmxlcykuICAK
PiA+IAo+ID4gU29ycnkgaWYgdGhhdCB3YXMgdW5jbGVhciwgd2hhdCBJIG1lYW50IGlzOiBwYXJ0
aXRpb25zIHNob3VsZCBub3QgYmUKPiA+IGRlZmluZWQgaW4gdGhlIGJpbmRpbmdzIGZvciBNYXJ2
ZWxsIE5BTkQgY29udHJvbGxlciBiZWNhdXNlIHRoZXkgc2hvdWxkCj4gPiBiZSBkZWZpbmVkIHNv
bWV3aGVyZSBlbHNlIGFscmVhZHkuICAKPiAKPiBBaCwgcmlnaHQuIFRoZW4gaXQgc2VlbXMgcmVh
c29uYWJsZS4KPiAKPiA+IAo+ID4gTkFORCBjb250cm9sbGVyIHN1Ym5vZGVzIHNob3VsZCBkZWZp
bmUgdGhlIHN0b3JhZ2UgZGV2aWNlcyAodGhlCj4gPiBmbGFzaGVzIHRoZW1zZWx2ZXMpIGNvbm5l
Y3RlZCB0byB0aGUgY29udHJvbGxlci4gIm5hbmQtY2hpcC55YW1sIgo+ID4gZGVzY3JpYmVzIGdl
bmVyaWMgcHJvcGVydGllcyBmb3IgdGhlc2UuIEFkZGl0aW9uYWwgc3Vibm9kZXMgYXJlIGFsbG93
ZWQKPiA+IGFuZCBleHBlY3RlZCB0byBiZSBwYXJ0aXRpb25zICh0aGlzIGlzIG5vdCBlbmZvcmNl
ZCBhbnl3aGVyZSBJIHRoaW5rKSwKPiA+IHRoZXkgc2hvdWxkIHVzZSBvbmUgb2YgdGhlIGV4aXN0
aW5nIGNvbXBhdGlibGVzIHRvIGRlZmluZSB0aGUgcGFyc2VyLgo+ID4gVGhlIG1vc3QgY29tbW9u
IHBhcnNlciBpcyBuYW1lZCBmaXhlZC1wYXJ0aXRpb25zIGFuZCBoYXMgaXRzIG93bgo+ID4gY29t
cGF0aWJsZS4gRXZlcnkgcGFyc2VyIHJlZmVyZW5jZXMgcGFydGl0aW9ucy55YW1sLgo+ID4gCj4g
PiBUaGVyZSBhcmUgYSBmZXcgY29udHJvbGxlciBiaW5kaW5ncyBob3dldmVyIHdoaWNoIHJlZmVy
ZW5jZQo+ID4gcGFydGl0aW9uLnlhbWwgYW55d2F5LCBwcm9iYWJseSB0byBtYWtlIHRoZSBleGFt
cGxlcyB2YWxpZGF0aW9uIHdvcmssCj4gPiBJJ20gbm90IHN1cmUgaXQgc2hvdWxkIGJlIGRvbmUg
bGlrZSB0aGF0IHRob3VnaDoKPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2
LjAvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvdGksZ3BtYy1u
YW5kLnlhbWwKPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjAvc291cmNl
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvdGksZ3BtYy1vbmVuYW5kLnlh
bWwgIAo+IAo+IAo+IFllcywgc28gdGhlIG5hbmQtY2hpcCBpbXBsZW1lbnRhdGlvbiAobGlrZSBN
YXJ2ZWxsIE5BTkQpIGNvdWxkIHJlZmVyZW5jZQo+IHRoZSBwYXJzZXIgYW5kIHdlIHdvdWxkIGJl
IGRvbmUuIElmIGl0IGRvZXNuJ3QsIHRoZW4gd2UgbXVzdCBoYXZlCj4gZ2VuZXJpYyBwYXJ0aXRp
b25zIGluIHRoZSBuYW5kLWNoaXAuCgpJbiB0aGlzIGNhc2UsIEkgYW0gbm90IGF3YXJlIG9mIGFu
eSBwYXJzZXIgdGhhdCB3b3VsZCBiZSByZWxldmFudC4KCkluIHRoZSBnZW5lcmljIGNhc2UsIHNo
b3VsZCB3ZSByZWFsbHkgcmVmZXJlbmNlIGEgcGFyc2VyIGluIHBhcnRpY3VsYXI/CklmIHllcyB0
aGVuIG1heWJlIHdlIHNob3VsZCBtYWtlIGEgeWFtbCBmaWxlIHRoYXQganVzdCBnYXRoZXJzIGFs
bCB0aGUKcGFyc2VycyBhbmQgaW5jbHVkZSBpdCB3aXRoaW4gbXRkLnlhbWwgKGFuZCBoYXZlIGl0
IHJlZmVyZW5jZWQgaW4KbmFuZC1jaGlwLnlhbWwpLiBXaGF0IGRvIHlvdSB0aGluaz8KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
