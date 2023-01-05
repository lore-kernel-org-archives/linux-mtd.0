Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CC8C3DA7A
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jan 2023 20:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PSvl/uYbFDn9IDKdJdXtTRzZnOuuOMV09dXAph7MGY=; b=MxKqL2XGUvvAxH
	+6xg9wQzkK7MnIV5j3vs+mPfJ0bdBuwXmUD5enQlcqf6KCTwBRIMLVoABC+SZAvmdZHYqF7dlD+Kd
	Vo8S/5mhl6e4/hzEpX2nyIt470mxcl3NO88odWtskp8GYDXNqxoQAKsLtsqNpdV4fykuurNjrf+Og
	kRCztV3miKBMMIaWiQjRZZCi+mmUQP0TF59e2SO/srk5yo4KCdpUcUSkPCKtibbQQrrOk/PNv7x8i
	Fgqc7330VPQte4ZLdx0VhVmn/75fZvBPhdz5tuz2e98CgNz5Sic4XobKmoDWpqolpc9IZBvZvK2em
	bnjgVsyC0eEUS0poBNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWxS-00Ebw6-MI; Thu, 05 Jan 2023 20:35:27 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDOVG-00BtuI-W5; Thu, 05 Jan 2023 11:33:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 115D520010;
	Thu,  5 Jan 2023 11:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672918418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czix4WDiCzpW3gGaXbhaVHkR8drxG1fsG3atEPzhoE8=;
	b=E98RZEZil+eOZnuosJNaIyf29QcPtWzut/isscPsVXu2r8jb+ceMRofLb2GJg9QwFchFCe
	Ri9pjxxDF568W8/pTwqkmArc4ylao8PityZ+Fo3jU0R/aOhIDWTkHqw+CZluG6+vaHftRx
	NTkfyrFPC15rbjBWQTnIN/aK9US9TJam8c5JEM0WANz8zSqnOx4RnUptxqwmjOC6dR+b/G
	KhtwNSsMZKa7aYoCUcGUoZc60wSBB+QPVLTU8AcXEQrkCldRFlrUoDZuDrdLdSx/xNyodI
	w8J7rIwdP6gSmXCUITvKx2Mn4LgWuyI0dPGrCkejB10l7RrbYPvi+K/mSphrTQ==
Date: Thu, 5 Jan 2023 12:33:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20230105123334.7f90c289@xps-13>
In-Reply-To: <20230102104004.6abae6da@xps-13>
References: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
	<6f5f5b32-d7fe-13cc-b52d-83a27bd9f53e@denx.de>
	<20221216120155.4b78e5cf@xps-13>
	<Y5xmi62hR6JeYUt1@francesco-nb.int.toradex.com>
	<20221216143720.3c8923d8@xps-13>
	<fb55a784-eda3-8916-1413-581b9436b3f2@denx.de>
	<20221216163501.1c2ace21@xps-13>
	<Y5ydGhn/qYUalamm@francesco-nb.int.toradex.com>
	<20230102104004.6abae6da@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_033347_396992_EBFF8855 
X-CRM114-Status: GOOD (  38.11  )
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

SGkgRnJhbmNlc2NvLAoKbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBNb24sIDIg
SmFuIDIwMjMgMTA6NDA6MDQgKzAxMDA6Cgo+IEhpIEZyYW5jZXNjbywKPiAKPiBmcmFuY2VzY29A
ZG9sY2luaS5pdCB3cm90ZSBvbiBGcmksIDE2IERlYyAyMDIyIDE3OjMwOjE4ICswMTAwOgo+IAo+
ID4gT24gRnJpLCBEZWMgMTYsIDIwMjIgYXQgMDQ6MzU6MDFQTSArMDEwMCwgTWlxdWVsIFJheW5h
bCB3cm90ZTogIAo+ID4gPiBtYXJleEBkZW54LmRlIHdyb3RlIG9uIEZyaSwgMTYgRGVjIDIwMjIg
MTU6MzI6MjggKzAxMDA6ICAgIAo+ID4gPiA+IFRoZSBzZWNvbmQgcGFydCBvZiB0aGUgbWVzc2Fn
ZSwgYXMgZmFyIGFzIEkgdW5kZXJzdGFuZCBpdCwgaXMKPiA+ID4gPiAiaWdub3JlIHByb2JsZW1z
IHRoaXMgd2lsbCBjYXVzZSB0byB1c2VycyBvZiBib2FyZHMgd2UgZG8gbm90IGtub3cKPiA+ID4g
PiBhYm91dCwgbGV0IHRoZW0gcnVuIGludG8gdW5ib290YWJsZSBzeXN0ZW1zIGFmdGVyIHNvbWUg
bGludXgga2VybmVsCj4gPiA+ID4gdXBkYXRlLCAgICAgCj4gPiA+IAo+ID4gPiBOb3cgeW91IGtu
b3cgd2hhdCBrZXJuZWwgdXBkYXRlIHdpbGwgYnJlYWsgdGhlbSwgc28geW91IGNhbiBwcmV2ZW50
IGl0Cj4gPiA+IGZyb20gaGFwcGVuaW5nLiAKPiA+ID4gCj4gPiA+IEZvciBib2FyZHMgd2l0aG91
dCBldmVuIGEgZHRzaSBpbiB0aGUga2VybmVsLCBzaG91bGQgd2UgY2FyZT8gICAgCj4gPiAKPiA+
IFdvdWxkIGNhcmluZyBmb3IgdGhvc2UgYm9hcmRzIG5vdCBiZSBqdXN0IGV4YWN0IHRoZSBzYW1l
IGFzIGNhcmluZyBmb3IKPiA+IHNvbWUgVUVGSS9BQ1BJIG1lc3MgZm9yIHdoaWNoIG5vIHNvdXJj
ZSBjb2RlIGlzIG5vcm1hbGx5IGF2YWlsYWJsZSBhbmQKPiA+IG5vYm9keSByZWFsbHkga25vd24g
YXQgd2hpY2ggcG9pbnQgdGhlIHZhcmlvdXMgdmVuZG9ycyBoYXZlIGZvcmtlZCB0aGVpcgo+ID4g
c291cmNlIGNvZGUgZnJvbSBzb21lIEludGVsIG9yIEFNRCBvciB3aGF0ZXZlciByZWZlcmVuY2Ug
Y29kZT8gIAo+IAo+IEkgYW0gc29ycnkgSSBkb24ndCBrbm93IFVFRkkvQUNQSSB3ZWxsIGVub3Vn
aCB0byBkaXNjdXNzIGl0Lgo+IAo+ID4gSU1ITyB3ZSBzaG91bGQgY2FyZSBmb3IgdGhlIG11bHRp
cGxlIHJlYXNvbiBJIGhhdmUgYWxyZWFkeSB3cml0dGVuIGluIG15Cj4gPiBwcmV2aW91cyBlbWFp
bHMuCj4gPiAKPiA+IEFuZCBob25lc3RseSwganVzdCBhcyBhIHNpZGUgY29tbWVudCwgSSB3b3Vs
ZCBmZWVsIHdheSBtb3JlIGhhcHB5Cj4gPiB0byBrbm93IHRoYXQgdGhlIGVsZXZhdG9yIGNvbnRy
b2wgc3lzdGVtIGluIHRoZSBlbGV2YXRvciBJIHVzZSBldmVyeWRheQo+ID4gb3IgdGhlIGNoZW1p
Y2FsIGluZHVzdHJpYWwgcGxhbiBITUkgbmV4dCB0byBteSBob21lIGlzIHJ1bm5pbmcgYW4gdXAg
dG8KPiA+IGRhdGUgTGludXggc3lzdGVtIHRoYXQgaXMgbm90IGFmZmVjdGVkIGJ5IGtub3duIHNl
Y3VyaXR5IHZ1bG5lcmFiaWxpdGllcwo+ID4gYW5kIHRoZXkgZGlkIHN0b3AgdXBkYXRpbmcgaXQg
anVzdCBiZWNhdXNlIHRoZXJlIHdhcyBzb21lIHJhbmRvbSBidWcKPiA+IHByZXZlbnRpbmcgdGhl
IHVwZGF0ZWQga2VybmVsIHRvIGJvb3QgYW5kIG5vYm9keSBoYWQgdGhlIHRpbWUvc2tpbGwgdG8K
PiA+IGludmVzdGlnYXRlIGFuZCBmaXggaXQuIFsxXSAgCj4gCj4gVGhlIGlzc3VlIGNvbWVzIGZy
b20gYSB2ZXJ5IHNwZWNpZmljIFUtQm9vdCBmdW5jdGlvbiB0aGF0IHNob3VsZCBoYXZlCj4gbmV2
ZXIgZXhpc3RlZC4gSSBob3BlIHBlb3BsZSB3b3JraW5nIG9uIGNoZW1pY2FsIHBsYW50cyBkbyBu
b3QgbWFrZQo+IHVzZSBvZiB0aGVzZSBhbmQgd2lsbCBub3QgZGlzcmVnYXJkIHRoZSAieW91ciBE
VCBpcyBicm9rZW4gdGhlcmUgWy4uLl0iCj4gd2FybmluZyB3ZSBwbGFuIHRvIGFkZCByaWdodCBi
ZWZvcmUgdGhlaXIgdXBkYXRlZCBib2FyZCB3aWxsIGZhaWwuIFdlCj4gYXJlIG5vdCBsaXZpbmcg
cGVvcGxlIGluIHRoZSBkYXJrLCBJIGFncmVlZCBmb3IgYSB3YXJuaW5nLCBidXQgSSBkb24ndAo+
IHRoaW5rIGFwcGx5aW5nIHRoZSBwcm9wb3NlZCBmaXggYmxpbmRseSBpcyB3aXNlIGFuZCBmdXR1
cmUtcHJvb2YuCgpMZXQncyBtb3ZlIGZvcndhcmQgd2l0aCB0aGlzLiBMZXQncyBhc3N1bWUgbXkg
ZmVhcnMgYXJlIGJhc2VsZXNzLiBXZQptaWdodCBjb25zaWRlciB0aGUgc2l0dWF0aW9uIHdoZXJl
IHNvbWVvbmUgdHJpZXMgdG8gaGlkZSB0aGUgcGFydGl0aW9ucwpieSBzZXR0aW5nICNzaXplLWNl
bGwgdG8gMCBldmVuIHdyb25nZXIgYW5kIHRvbyB1bmxpa2VseS4gSG9wZWZ1bGx5IHdlCndpbGwg
bm90IGJyZWFrIGFueSBvdGhlciBleGlzdGluZyBzZXR1cHMgYnkgYXBwbHlpbmcgYW4gYWx3YXlz
LW9uIGZpeC4KCkkgd291bGQgc3RpbGwgbGlrZSB0byBzZWUgVS1Cb290IHBhcnRpdGlvbnMgaGFu
ZGxpbmcgZXZvbHZlLCBhdCBsZWFzdDoKLSBmaXggI3NpemUtY2VsbHMgaW4gZmR0X2ZpeHVwX210
ZCgpCi0gYXZvaWQgdGhlIGZkdF9maXh1cF9tdGQoKSBjYWxsIGZyb20gQ29sbGlicmkgYm9hcmRz
IChpZS4gYW4gZXhhbXBsZQogIHRoYXQgY2FuIGJlIGZvbGxvd2VkIGJ5IHRoZSBvdGhlciB1c2Vy
cykKCk9uIExpbnV4IHNpZGUgbGV0J3MgZml4ICNzaXplLWNlbGxzIGxpa2UgeW91IHByb3Bvc2Vk
IHdpdGhvdXQgZmlsdGVyaW5nCmFnYWluc3QgYSBsaXN0IG9mIGNvbXBhdGlibGVzLiBXZSBob3dl
dmVyIG5lZWQgdG8gaW1wcm92ZSB0aGUKaGV1cmlzdGljczoKLSBEbyBpdCBvbmx5IHdoZW4gdGhl
cmUgYXJlIHBhcnRpdGlvbnMgZGVjbGFyZWQgd2l0aGluIGEgTkFORAogIGNvbnRyb2xsZXIgbm9k
ZS4KLSBDaGFuZ2UgdGhlIHdhcm5pbmcgdG8gYXZvaWQgbWVudGlvbmluZyBiYWNrd2FyZCBjb21w
YXRpYmlsaXR5LCBqdXN0CiAgbWVudGlvbiB0aGlzIGlzIHV0dGVybHkgd3JvbmcgYW5kIHRodXMg
dGhlIHZhbHVlIHdpbGwgYmUgc2V0IHRvIDEKICBpbnN0ZWFkIG9mIDAuCi0gTWVudGlvbiBpbiB0
aGUgY29tbWVudCBhYm92ZSB0aGlzIG9ubHkgd29ya3Mgb24gc3lzdGVtcyB3aXRoIDw0R2lCCiAg
Y2hpcHMuCklmIHlvdSB0aGluayBhYm91dCBvdGhlciBjb25kaXRpb25zIHBsZWFzZSBmZWVsIGZy
ZWUgdG8gYWRkIHRoZW0uCgpEbyB5b3UgY29uY3VyPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
