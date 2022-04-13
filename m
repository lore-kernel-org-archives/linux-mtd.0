Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A2FC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Apr 2022 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6e/KqdqJn6LZgVjwU/AcH1Fr5bP7y2ioficAtp0JBFA=; b=RGytPH2AGFOZoD
	QzYs1rGT9P60guQ1LuhvOERzGAgzyEqXqFulDDmameR2+JIPVVnFTmyiav7hnpmbNzSKaf9uP8FAd
	8/mDcJYMPAlbvmU0OSMMUulLv7P/9CBCs2gsJvFB0dsU+57DKjs6xnIYnlFcJBSIO68DEFDdg9x/T
	dDU7jFepj+BESEJupxn7uZhJGq+2cHp3j30r06mmdf2jX4bSiiDD0kO0Uh5QkLrW4PHByV+Nv349v
	ftZBqYI6sPCeViqZ1fpyhvrLrxQDufnERmL4RbotF3Qw4aarbZDTBUWsNF21EERie996BiPlzB8pS
	nTuUhx1KmJGieO/9hvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neev3-001aia-KS; Wed, 13 Apr 2022 15:28:33 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neeuy-001agB-CR
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2022 15:28:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7E3141C0002;
 Wed, 13 Apr 2022 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649863704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WGuKkZoZhqAp3vshntO7a0lSfalv/QZe/nQ44NUXLMc=;
 b=fjHFRViT16sOsvfG3G/TDkG5Aj69mjco8uA9n8i3tjVrkhiNXyvVcYtwx6NANeUlxEiRxs
 4azAHfxQyuSZKYkj8sUIg4XpPzMYOysj9o4xNd7TE/imZtURksFoadaX7xHLHByVFdwe+r
 AO6HhHg5gbB/3Fy2mGcXxzN6RwDV72xDLigcXHG49kkyDcQZhy/gEeJc4nvtHr/H0dc4Ag
 T/gUbuDShrMYKdqEXBTZPLpghxIfk1k27mLLOwRM0f0kY+4oCMsyezUJigZ2HyKLYe8WpK
 qqs6Da+AdYt7/XVSQk77BMFNBeK5a0xjtE4cC6D4qYcVUdfhKbQwIS0Syl1/NQ==
Date: Wed, 13 Apr 2022 17:28:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Mark Brown <broonie@kernel.org>, Daniel
 Palmer <daniel@0x0f.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spinand: add support for ESMT F50x1G41LB
Message-ID: <20220413172819.438f79e4@xps13>
In-Reply-To: <CAJsYDV+3J0ipbR+N-xE=DH-WXsjierdHe_pJtKf1Xbt7fdaiWw@mail.gmail.com>
References: <20220413083824.247136-1-gch981213@gmail.com>
 <20220413145843.46a3d9b5@xps13>
 <CAJsYDV+3J0ipbR+N-xE=DH-WXsjierdHe_pJtKf1Xbt7fdaiWw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_082828_731372_6FCD8201 
X-CRM114-Status: GOOD (  32.58  )
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

SGVsbG8sCgpnY2g5ODEyMTNAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMTMgQXByIDIwMjIgMjI6
NTA6NDMgKzA4MDA6Cgo+IEhpIQo+IAo+IE9uIFdlZCwgQXByIDEzLCAyMDIyIGF0IDg6NTggUE0g
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPiBbLi4u
XSAgCj4gPiA+IFRoaXMgcGF0Y2ggaXMgbWFkZSBwdXJlbHkgYmFzZWQgb24gZGF0YXNoZWV0IGlu
Zm8gd2l0aG91dCB0ZXN0aW5nCj4gPiA+IG9uIGFueSBhY3R1YWwgY2hpcHMuICAKPiA+Cj4gPiBE
byB5b3UgcGxhbiB0byBnZXQgb25lIG9mIHRoZXNlIGFueSB0aW1lIHNvb24/ICAKPiAKPiBOby4g
SSBhbHJlYWR5IGhhdmUgd2F5IG1vcmUgc3BpLW5hbmQgY2hpcHMgdGhhbiBJIHBvc3NpYmx5Cj4g
bmVlZCBkdWUgdG8gbXkgbGFzdCBHaWdhRGV2aWNlIHN1Ym1pc3Npb24gOikKCjopCgo+IAo+IEkg
bmVlZCB0byByZXBsYWNlIHRoZSBzcGktbmFuZCBkcml2ZXIgZm9yIG1lZGlhdGVrIGluIE9wZW5X
cnQKPiB3aXRoIG15IHJlY2VudCBzdWJtaXNzaW9uLCBhbmQgdGhpcyBjaGlwIGlzIHVzZWQgaW4g
b25lIG9mIHRoZQo+IGN1cnJlbnRseSBzdXBwb3J0ZWQgcm91dGVyLiBTbyBJIG1hZGUgdGhpcyBw
YXRjaCBmcm9tCj4gZGF0YXNoZWV0IGZvciBpdC4KPiAKPiBCVFcgUm9ja2NoaXAgYWRkZWQgaWRl
bnRpY2FsIGNoaXAgc3VwcG9ydCBpbiB0aGVpciB1LWJvb3QuWzBdCj4gSSBhc3N1bWUgdGhleSd2
ZSB0ZXN0ZWQgaXQuCj4gCj4gPiBJIGFtIG5vdCByZWFsbHkgY29uZmlkZW50IG1lcmdpbmcgYSAx
MDAlIG5vbi10ZXN0ZWQgZHJpdmVyIDopICAKPiAKPiBJIGNhbiB1bmRlcnN0YW5kIHRoYXQuCj4g
SSdsbCByb2xsIHRoaXMgcGF0Y2ggb3V0IGluIE9wZW5XcnQgYW55d2F5LiBJIGNhbiB3YWl0IGZv
ciBhIHRlc3QKPiB0aGVyZSBhbmQgcmVzdWJtaXQgcGlsZWQgZG93bnN0cmVhbSBwYXRjaGVzIGZv
ciBjaGlwIHN1cHBvcnRzCj4gYWZ0ZXIgbmV4dCBPcGVuV3J0IHN0YWJsZSByZWxlYXNlLgoKWWVz
LCBwbGVhc2UsIGFueSBmZWVkYmFjayBmcm9tIHRoZSBPcGVuV3J0IGNvbW11bml0eSB3b3VsZCBi
ZSBnb29kLiBJZgp5b3UgY2FuIGdldCBhIFRlc3RlZC1ieSBJJ2xsIHRha2UgdGhlIHBhdGNoIChy
ZXNlbmQgaXQgd2l0aCB0aGUgdGFnIHNvCnRoYXQgSSBkb24ndCBtaXNzIGl0KS4KCj4gPiBbLi4u
XSAgCj4gPiA+ICsKPiA+ID4gKy8qIEVTTVQgdXNlcyBHaWdhRGV2aWNlIDB4YzggSkVDREVDIElE
IG9uIHNvbWUgU1BJIE5BTkRzICovCj4gPiA+ICsjZGVmaW5lIFNQSU5BTkRfTUZSX0VTTVRfQzgg
ICAgICAgICAgICAgICAgICAweGM4ICAKPiA+Cj4gPiBXaGF0IGhhcHBlbnMgaWYgdGhlIGdpZ2Fk
ZXZpY2UgZHJpdmVyIHByb2JlcyBmaXJzdD8gIAo+IAo+IFRoZWlyIGRldmljZSBJRCBhcmVuJ3Qg
Y29uZmxpY3RpbmcgeWV0LCBzbyBub3RoaW5nIHdpbGwgaGFwcGVuCj4gYXQgdGhlIG1vbWVudC4K
PiAKPiBUaGVyZSBpcyBhIHNvbHV0aW9uIGZvciBmdXR1cmUgY29uZmxpY3Q6IFJlY2VudCBTUEkt
TkFORCBjaGlwcwo+IGNvbnRhaW4gYSBwYXJhbWV0ZXIgcGFnZSB3aGljaCBoYXMgdGhlIGV4YWN0
IGNoaXAgdmVuZG9yCj4gYW5kIG1vZGVsLiBXZSBjYW4gZG8gb25lIG1vcmUgZGV0ZWN0aW9uIHdp
dGggdGhlIHBhcmFtZXRlcgo+IHBhZ2UgY29udGVudC4KPiBXaW5ib25kIFcyNU4wMUtWIGlzIGEg
MmsrOTYgU1BJLU5BTkQgd2l0aCA0LWJpdCBFQ0MuCj4gSXQgdXNlcyB0aGUgZXhhY3Qgc2FtZSBj
aGlwIGlkIGFzIHRoZSBjdXJyZW50IFcyNU4wMUdWCj4gKDJrKzY0IDEtYml0IEVDQykuIFdlIG5l
ZWQgdG8gc3VwcG9ydCBkZXRlY3Rpb24gdXNpbmcKPiBwYXJhbWV0ZXIgcGFnZSBmb3IgdGhpcyBj
cmF6eSBkZWNpc2lvbiBieSBXaW5ib25kIGFueXdheS4KCjonKQoKPiBJJ2xsIHRyeSB0byBjb2Rl
IHNvbWV0aGluZyBmb3IgdGhpcyB3aXRoIG15IGZyZWUgdGltZS4KPiBNeSBjdXJyZW50IGlkZWEg
aXM6IFdlIGZpcnN0IGRvIGEgZGV0ZWN0aW9uIGJhc2VkIG9uIGNoaXAgaWQuCj4gSWYgdGhhdCBm
YWlsZWQsIHRyeSB0byByZWFkIHRoZSBwYXJhbWV0ZXIgcGFnZS4gSWYgd2UgZ290IGEKPiB2YWxp
ZCBvbmUsIG1hdGNoIHRoZSBjaGlwIHZlbmRvciBhbmQgbW9kZWwgc3RyaW5nLgo+IAo+IEFueSB0
aG91Z2h0cz8KClllYWggdGhhdCBsb29rcyByZWFzb25hYmxlLgoKPiAoQlRXIHRoaXMgRVNNVCBj
aGlwIGlzIFBPV0VSQ0hJUCBQU1UxR1MyMERYCj4gYWNjb3JkaW5nIHRvIHRoZSBwYXJhbWV0ZXIg
cGFnZSBpbiB0aGVpciBkYXRhc2hlZXQuCj4gQnV0IEkgY2FuJ3QgZmluZCBhIGRhdGFzaGVldCBm
b3IgdGhpcyBtb2RlbCBudW1iZXIuKQo+IAo+ID4gIAo+ID4gPiArCj4gPiA+ICsjZGVmaW5lIEY1
MEwyRzQxWEFfRUNDX1NUQVRVU19NQVNLICAgICAgICAgICBHRU5NQVNLKDYsIDQpCj4gPiA+ICsj
ZGVmaW5lIEY1MEwyRzQxWEFfU1RBVFVTX0VDQ18xXzNfQklURkxJUFMgICAoMSA8PCA0KQo+ID4g
PiArI2RlZmluZSBGNTBMMkc0MVhBX1NUQVRVU19FQ0NfNF82X0JJVEZMSVBTICAgKDMgPDwgNCkK
PiA+ID4gKyNkZWZpbmUgRjUwTDJHNDFYQV9TVEFUVVNfRUNDXzdfOF9CSVRGTElQUyAgICg1IDw8
IDQpICAKPiAKPiBPb3BzLiBUaGVzZSBhcmUgbGVmdC1vdmVyIGRlZmluZXMgd2hlbiBJIGRpc2Nv
dmVyZWQgdGhhdCBFU01UIDJHLzRHCj4gU1BJLU5BTkRzIGFyZSByZXBhY2thZ2VkIG1pY3JvbiBw
YXJ0cyBhbmQgZHJvcHBlZCB0aGVpciBzdXBwb3J0Cj4gZnJvbSB0aGlzIGZpbGUuCj4gQSB2MyBp
cyBuZWVkZWQgYW55d2F5LiBJJ2xsIHdhaXQgZm9yIGEgdGVzdCBiZWZvcmUgc3VibWl0dGluZyBp
dC4KPiAKPiBbMF06IGh0dHBzOi8vZ2l0aHViLmNvbS9yb2NrY2hpcC1saW51eC91LWJvb3QvY29t
bWl0LzUyYjAwNjAxNzgyODU0ODg3Mzc4NTRhNDhkZGVjZDM4MWY4YjIzNmUKCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
