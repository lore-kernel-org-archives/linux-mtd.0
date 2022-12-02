Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AD5C47088
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbmeZC+5e5tkuVmwoqznT4J6aBzDglsFgGCUkx3ratQ=; b=zxsGxFG35Yae8V
	AikvbBdKFYS/oSXmfRJV54T0e68CQ1sZG3I/ei0VpvqwXczi1KxfPl7boVdYq3po5XgrquUl2oVR1
	YEecZ5iaLNgrEaYM6aD00Ji2lh3Xtuwkx7YUERnqUoFQWZDC33tZjcihKtmD4z3oUIUEcYBn3Jds7
	rVSR18nLDB7sqdVkI3H6ha7CS9OjYLnu7gTRM8npXpFT4PMdt7wAzf5tl0uqR6Yv+9oifeziXRkLP
	t9p3Z6779NZ5HWxVuYCgHgPqwMzQgpMUzynuuU0v/oMq8Vcs01lvvhm6CLpjC5ZdOAqHW2AQaU7QZ
	wMSBO+BA1LAlIctuiu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p17X4-00GxKw-0Q; Fri, 02 Dec 2022 15:00:54 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p17Wq-00GxGf-IN; Fri, 02 Dec 2022 15:00:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B0F21100007;
	Fri,  2 Dec 2022 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669993236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=59qSwgpaGJCpHjydTIqoo0IPT+OCfNv0dCYixP5EWqg=;
	b=TaAd/jd7DJaOECXA/cSb/SywJ7kSqgK5OydWuWmhvTIXhgKRyyxWmNG6YzOeT/M30zSuhc
	WaSxv3dOkKMXexw8SXTLM6GQ62JgFH4Dk0piZgv5otuzG1rxbAx62Hb7Id5E7/b1WySwjB
	llvxVcds2aETbx3Wqcih+KWrROrFLDc2cuVdGG6Oj8vaO333shCCokqqLGLgX5cBDCqOao
	+krQkRkGSRtUy+yQxAxeAGJDkMiOaJh3jKeyCbwHxZGAtan+cc+iGFxSvf9/aHp3mg0qVR
	RS3eZ5IImxAO+2GZR61FyfapFqnCJs+64n1FfLB2bpk9CRQk/3L6NTMvdw/o/A==
Date: Fri, 2 Dec 2022 16:00:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Francesco Dolcini
 <francesco.dolcini@toradex.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20221202160030.1b8d0b8a@xps-13>
In-Reply-To: <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
References: <20221202071900.1143950-1-francesco@dolcini.it>
	<20221202101418.6b4b3711@xps-13>
	<Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
	<Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
	<20221202115327.4475d3a2@xps-13>
	<Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
	<20221202150556.14c5ae43@xps-13>
	<2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_070040_952675_45648EE4 
X-CRM114-Status: GOOD (  35.76  )
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

SGkgTWFyZWssCgptYXJleEBkZW54LmRlIHdyb3RlIG9uIEZyaSwgMiBEZWMgMjAyMiAxNTozMTo0
MCArMDEwMDoKCj4gT24gMTIvMi8yMiAxNTowNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhp
IEZyYW5jZXNjbywgIAo+IAo+IEhpLAo+IAo+IFsuLi5dCj4gCj4gPiBJIHN0aWxsIHN0cm9uZ2x5
IGRpc2FncmVlIHdpdGggdGhlIGluaXRpYWwgcHJvcG9zYWwgYnV0IHdoYXQgSSB0aGluayB3ZQo+
ID4gY2FuIGRvIGlzOgo+ID4gCj4gPiAxLiBUbyBwcmV2ZW50IGZ1dHVyZSBicmVha2FnZXM6Cj4g
PiAgICBGaXggZmR0X2ZpeHVwX210ZHBhcnRzKCkgaW4gdS1ib290LiBUaGlzIHdheSBuZXdlciBV
LUJvb3QgKyBhbnkKPiA+ICAgIGtlcm5lbCBzaG91bGQgd29yay4KPiA+IAo+ID4gMi4gVG8gaGVs
cCB0cmFja2luZyBkb3duIHNpdHVhdGlvbnMgbGlrZSB0aGF0Ogo+ID4gICAgS2VlcCB0aGUgd2Fy
bmluZyBpbiBvZnBhcnQuYyBidXQgY29udGludWUgdG8gZmFpbC4KPiA+IAo+ID4gMy4gVG8gZml4
IHRoZSBjdXJyZW50IHNpdHVhdGlvbjoKPiA+ICAgICBJbW1lZGlhdGVseSByZXZlcnQgY29tbWl0
IChhbmQgcHJldmVudCBpdCBmcm9tIGJlaW5nIGJhY2twb3J0ZWQpOgo+ID4gICAgIDc1MzM5NWVh
MWU0NSAoIkFSTTogZHRzOiBpbXg3OiBGaXggTkFORCBjb250cm9sbGVyIHNpemUtY2VsbHMiKQo+
ID4gICAgIFRoaXMgd2F5IHlvdXIgb3duIGJvb3QgZmxvdyBpcyBmaXhlZCBpbiB0aGUgc2hvcnQg
dGVybS4gIAo+IAo+IEhlcmUgSSBkaXNhZ3JlZSwgdGhlIGZpeCBpcyBjb3JyZWN0IGFuZCBJIHRo
aW5rIHdlIHNob3VsZG4ndAo+IHByb2xpZmVyYXRlIGluY29ycmVjdCBEVHMgd2hpY2ggZG9uJ3Qg
bWF0Y2ggdGhlIGJpbmRpbmcgZG9jdW1lbnQuCgpJIGFncmVlIHdlIHNob3VsZCBub3QgcHJvbGlm
ZXJhdGUgaW5jb3JyZWN0IERUcywgc28gbGV0J3MgdXNlIGEgbW9kZXJuCmRlc2NyaXB0aW9uIHRo
ZW4sIHdpdGggYSBjb250cm9sbGVyIGFuZCBhIGNoaWxkIG5vZGUgd2hpY2ggZGVmaW5lcyB0aGUK
Y2hpcC4KCj4gUmF0aGVyLCBpZiBhIGJvb3Rsb2FkZXIgZ2VuZXJhdGVzIGluY29ycmVjdCAobmV3
KSBEVCBlbnRyaWVzLCBJCj4gYmVsaWV2ZSB0aGUgZHJpdmVyIHNob3VsZCBpbXBsZW1lbnQgYSBm
aXh1cCBhbmQgd2FybiB1c2VyIGFib3V0IHRoaXMuCj4gUEMgZG9lcyB0aGF0IGFzIHdlbGwgd2l0
aCBicm9rZW4gQUNQSSB0YWJsZXMgYXMgZmFyIGFzIEkgY2FuIHRlbGwuCj4gCj4gSSdtIG5vdCBj
b252aW5jZWQgbWFraW5nIGEgRFQgbm9uLWNvbXBsaWFudCB3aXRoIGJpbmRpbmdzIGFnYWluLAoK
SSBhbSBzb3JyeSB0byBzYXkgc28sIGJ1dCB3aGlsZSB3YXJuaW5ncyByZXBvcnRlZCBieSB0aGUg
dG9vbHMKc2hvdWxkIGJlIGZpeGVkLCBpdCdzIG5vdCBiZWNhdXNlIHRoZSB0b29sIGRvZXMgbm90
IHNjcmVhbSBhdCB5b3UgdGhhdAp0aGUgZGVzY3JpcHRpb24gaXMgdmFsaWQuIFdlIGFyZSBhY3Rp
dmVseSB3b3JraW5nIG9uIGVuaGFuY2luZyB0aGUKc2NoZW1hIHNvIHRoYXQgImFsbCIgaW1wcm9w
ZXIgZGVzY3JpcHRpb25zIGdldCB3YXJuaW5ncyAoc2VlIHRoZSBzZXJpZXMKcG9pbnRlZCBlYXJs
aWVyKSwgYnV0IGluIG5vIHdheSB0aGlzIGNoYW5nZSBtYWtlcyB0aGUgbm9kZSBjb21wbGlhbnQK
d2l0aCBtb2Rlcm4gYmluZGluZ3MuCgpJJ20gbm90IHNheWluZyB0aGUgZml4IGlzIHdyb25nLCBi
dXQgbGV0J3MgYmUgcHJhZ21hdGljLCBpdCBjdXJyZW50bHkKbGVhZHMgdG8gYm9vdCBmYWlsdXJl
cy4KCj4gb25seSB0byB3b3JrIGFyb3VuZCBhIHByb2JsZW0gaW5kdWNlZCBieSBib290bG9hZGVy
LCBpcyB0aGUgcmlnaHQgYXBwcm9hY2gKPiBoZXJlLgoKV2hlbiBhIHBhdGNoIGJyZWFrcyBhIGJv
YXJkIGFuZCB0aGVyZSBpcyBubyBzdHJhaWdodCBmaXgsIHlvdSByZXZlcnQKaXQsIHRoZW4geW91
IHRoaW5rIGhhcmRlci4gVGhhdCdzIHdoYXQgSSBhbSBzYXlpbmcuIFRoaXMgaXMgYSB0ZW1wb3Jh
cnkKc29sdXRpb24uCgo+IFRoaXMgd291bGQgYmUgc2V0dGluZyBhIGRhbmdlcm91cyBleGFtcGxl
LCB3aGVyZSBhbnlvbmUgY291bGQgcmVxdWVzdCBhIERUIGZpeCB0byBiZSByZXZlcnRlZCBiZWNh
dXNlIHRoZWlyIHJhbmRvbSBib290bG9hZGVyIGRvZXMgdGhlIHdyb25nIHRoaW5nIGFuZCB3aXRo
IHZhbGlkIERUIGNsZWFuIHVwLCBzb21ldGhpbmcgYnJva2UuCgpQbGVhc2UsIHlvdSBrbm93IHRo
aXMgaXMgbm90IHZhbGlkIERUIGNsZWFuIHVwLiBXZSd2ZSBiZWVuIGRlY291cGxpbmcKY29udHJv
bGxlciBhbmQgY2hpcCBkZXNjcmlwdGlvbiBzaW5jZSAyMDE2LiBXaGF0IEkgYW0gcHJvcG9zaW5n
IGlzIGEKdmFsaWQgRFQgY2xlYW51cCwgbm90IHRvIHRoZSBsYXRlc3Qgc3RhbmRhcmQsIGJ1dCB3
YXkgY2xvc2VyIHRoYW4gdGhlCmN1cnJlbnQgc29sdXRpb24uCgo+ID4gNC4gVGhlcmUgaXMgbm8g
cmVhc29uIHRvIHBhcnRpYWxseSBmaXggYSBEVCBsaWtlIHdoYXQgdGhlIGFib3ZlIGRpZAo+ID4g
ICAgIGJlc2lkZXMgdHJ5aW5nIHRvIGF2b2lkIHdhcm5pbmdzIGVtaXR0ZWQgYnkgdGhlIERUIGNo
ZWNrIHRvb2xzLiAgCj4gCj4gTm90ZSB0aGF0IHRoZSAzLiBkb2VzIG5vdCBwYXJ0aWFsbHkgZml4
IHRoZSBEVCwgaXQgZml4ZXMgdGhlIG5vZGUgZnVsbHkuCj4gCj4gPiAgICAgSWYKPiA+ICAgICBj
b21wbHlpbmcgd2l0aCBtb2Rlcm4gYmluZGluZ3MgaXMgYSBnb2FsIChhbmQgSSB0aGluayBpdCBz
aG91bGQKPiA+ICAgICBiZSksIHRoZW4gd2UgY2FuIG1vZGVybml6ZSB0aGlzIERUIHdpdGhvdXQg
YnJlYWtpbmcgdGhlIGJvb3QgZmxvdzoKPiA+ICAgICBJbnN0ZWFkIG9mIG9ubHkgc2V0dGluZyAj
c2l6ZS1jZWxsID0gPDA+LCB5b3UgY2FuIGFzIHdlbGwgZGVmaW5lCj4gPiAgICAgaW4geW91ciBE
VCBhIHN1Ym5vZGUgdG8gZGVmaW5lIHRoZSBOQU5EIGNoaXAuIE5BTkQgY2hpcHMgYXJlIG5vdAo+
ID4gICAgIHN1cHBvc2VkIHRvIGhhdmUgI3NpemUtY2VsbHMgcHJvcGVydGllcywgYnV0IGluIHRo
ZSBwYXN0IHRoZXkgZGlkLAo+ID4gICAgIHdoaWNoIG1lYW5zICNhZGRyZXNzLWNlbGxzIGFuZCAj
c2l6ZS1jZWxscyBhcmUgYWxsb3dlZCAoYW5kIG1hcmtlZAo+ID4gICAgIGRlcHJlY2F0ZWQgaW4g
dGhlIHNjaGVtYSkuIFNvIGluIHByYWN0aWNlLCB0aGUgZHQtc2NoZW1hIHdpbGwgbm90Cj4gPiAg
ICAgd2FybiB5b3UgaWYgdGhleSBhcmUgdGhlcmUsIHdoaWNoIG1lYW5zIHlvdSBjYW4gc3RpbGwg
c2V0Cj4gPiAgICAgI3NpemUtY2VsbCA9IDwxPi4gIAo+IAo+IEkgYW0gcmVhbGx5IG5vdCBjb252
aW5jZWQgd2Ugc2hvdWxkIGhhY2sgYXJvdW5kIHRoaXMgb24gdGhlIERUIGVuZCBhbmQgdHJ5IHRv
IHB1c2ggc29tZSBzb3J0IG9mIGNvbnZvbHV0ZWQgd29ya2Fyb3VuZCB0aGVyZSwKCiJjb252b2x1
dGVkIHdvcmthcm91bmQiIDotKQoKPiBpbnN0ZWFkIG9mIGZpeGluZyBpdCBvbiB0aGUgZHJpdmVy
IHNpZGUgKGFuZCBib290bG9hZGVyIHNpZGUsIGluIHRoZQo+IGxvbmcgcnVuKS4KPgo+ID4gICAg
IFBsZWFzZSBtaW5kLCB0aGUgdG9vbHMgaGF2ZSBiZWVuIHVwZGF0ZWQgdmVyeSByZWNlbnRseSB0
byBtYXRjaAoKcy90b29scy9zY2hlbWEvCgo+ID4gICAgIHdoYXQgSSBhbSBkZXNjcmliaW5nIGFi
b3ZlLCBzbyB0aGV5IHdpbGwgbGlrZWx5IHN0aWxsIHJlcG9ydAo+ID4gICAgIGVycm9ycyB1bnRp
bCB2Ni4yLXJjMSwgc2VlOgo+ID4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10
ZC8yMDIyMTExNDA5MDMxNS44NDgyMDgtMS1taXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tLwo+ID4g
Cj4gPiBEb2VzIHRoaXMgc291bmQgcmVhc29uYWJsZT8gIAo+IAo+IFsuLi5dCgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
