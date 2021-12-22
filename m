Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F219BC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hWBP241jZ/ciAGcGXb5oLDGjd7PIE2tBZqwkhPfFK4=; b=qmqHwkf2mvTYG/
	R8Z5Lc20ko/9QP6u8PZ1nssCZDuBqWYaHyQlDl7ciO8eMjOwk/LCqw0h7ImOGeF2uh7bQ9OhlEFSv
	SvGIHVL8BSdI3kVM8KhCa1pWep5B8CIJ7s5xIgntNKvWwIi5/IWDPUTGHlxfcvhfkM5bnINXI/O8o
	Sk7YYXlsjpCbdhlCX2ZvKiYlH4ZECNr4mK3JDXNZSWVlqMk+cmEm0mexOeC/fVma/CUh4hFGmEN30
	uyR89+3A5S59P2BZAdHDMFBP9Zs7/3VS1KTaevEDPc5x0a9saOcKJDkbzQswMMmIf1Bg9P7Ux2NhD
	RoEguaW/mMDg0KwsHajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzwvD-009f5G-PA; Wed, 22 Dec 2021 08:24:28 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzwuL-009eX7-9P
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 08:23:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 073C6FF807;
 Wed, 22 Dec 2021 08:23:25 +0000 (UTC)
Date: Wed, 22 Dec 2021 09:23:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>, Michal
 Simek <monstr@monstr.eu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: spi-nor: Allow two CS per device
Message-ID: <20211222092324.7ec6ec6a@xps13>
In-Reply-To: <20211221184725.46lelrdfoxeom6uc@ti.com>
References: <20211221170058.18333-1-miquel.raynal@bootlin.com>
 <20211221170058.18333-2-miquel.raynal@bootlin.com>
 <20211221184725.46lelrdfoxeom6uc@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_002333_513008_640DEF45 
X-CRM114-Status: GOOD (  31.12  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBXZWQsIDIyIERlYyAyMDIxIDAw
OjE3OjI3ICswNTMwOgoKPiBPbiAyMS8xMi8yMSAwNjowMFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4gVGhlIFhpbGlueCBRU1BJIGNvbnRyb2xsZXIgaGFzIHR3byBhZHZhbmNlZCBtb2RlcyB3
aGljaCBhbGxvdyB0aGUKPiA+IGNvbnRyb2xsZXIgdG8gYmVoYXZlIGRpZmZlcmVudGx5IGFuZCBj
b25zaWRlciB0d28gZmxhc2hlcyBhcyBvbmUgc2luZ2xlCj4gPiBzdG9yYWdlLgo+ID4gCj4gPiBP
bmUgb2YgdGhlc2UgdHdvIG1vZGVzIGlzIHF1aXRlIGNvbXBsZXggdG8gc3VwcG9ydCBmcm9tIGEg
YmluZGluZyBwb2ludAo+ID4gb2YgdmlldyBhbmQgaXMgdGhlIGR1YWwgcGFyYWxsZWwgbWVtb3Jp
ZXMuIEluIHRoaXMgbW9kZSwgZWFjaCBieXRlIG9mCj4gPiBkYXRhIGlzIHN0b3JlZCBpbiBib3Ro
IGRldmljZXM6IHRoZSBldmVuIGJpdHMgaW4gb25lLCB0aGUgb2RkIGJpdHMgaW4KPiA+IHRoZSBv
dGhlci4gVGhlIHNwbGl0IGlzIGF1dG9tYXRpY2FsbHkgaGFuZGxlZCBieSB0aGUgUVNQSSBjb250
cm9sbGVyIGFuZAo+ID4gaXMgdHJhbnNwYXJlbnQgZm9yIHRoZSB1c2VyLgo+ID4gCj4gPiBUaGUg
b3RoZXIgbW9kZSBpcyBzaW1wbGVyIHRvIHN1cHBvcnQsIGl0IGlzIGNhbGxlZCBkdWFsIHN0YWNr
ZWQKPiA+IG1lbW9yaWVzLiBUaGUgY29udHJvbGxlciBzaGFyZXMgdGhlIHNhbWUgU1BJIGJ1cyBi
dXQgZWFjaCBvZiB0aGUgZGV2aWNlcwo+ID4gY29udGFpbiBoYWxmIG9mIHRoZSBkYXRhLiBPbmNl
IGluIHRoaXMgbW9kZSwgdGhlIGNvbnRyb2xsZXIgZG9lcyBub3QKPiA+IGZvbGxvdyBDUyByZXF1
ZXN0cyBidXQgaW5zdGVhZCBpbnRlcm5hbGx5IHdpcmVzIHRoZSB0d28gQ1MgbGV2ZWxzIHdpdGgK
PiA+IHRoZSB2YWx1ZSBvZiB0aGUgbW9zdCBzaWduaWZpY2FudCBhZGRyZXNzIGJpdC4KPiA+IAo+
ID4gU3VwcG9ydGluZyB0aGVzZSB0d28gbW9kZXMgd2lsbCBpbnZvbHZlIGNvcmUgY2hhbmdlcyB3
aGljaCBpbmNsdWRlIHRoZQo+ID4gcG9zc2liaWxpdHkgb2YgcHJvdmlkaW5nIHR3byBDUyBmb3Ig
YSBzaW5nbGUgU1BJIGRldmljZQo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAo+
ID4gaW5kZXggMzk0MjFmNzIzM2U0Li40YWJmYjRjZmMxNTcgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9y
LnlhbWwKPiA+IEBAIC00Nyw3ICs0Nyw4IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgaWRlbnRp
ZmllZCBieSB0aGUgSkVERUMgUkVBRCBJRCBvcGNvZGUgKDB4OUYpLgo+ID4gIAo+ID4gICAgcmVn
Ogo+ID4gLSAgICBtYXhJdGVtczogMQo+ID4gKyAgICBtaW5JdGVtczogMQo+ID4gKyAgICBtYXhJ
dGVtczogMiAgCj4gCj4gWW91IGFsbG93IHVwIHRvIDQgaXRlbXMgaW4gc3RhY2tlZC1tZW1vcmll
cyBidXQgb25seSBhbGxvdyB1cCB0byAyIENTLCAKPiB3aGljaCB3b3VsZCBtYWtlIHRoZSBvdGhl
ciAyIG1lbW9yaWVzIHVudXNhYmxlLiBTaG91bGQgYWxzbyBjaGFuZ2UgdGhpcyAKPiB0byA0LgoK
WWVzLCBJIGFsbG93ZWQgIm1vcmUiIHRoZW9yZXRpY2FsIGRldmljZXMgaW4gdGhlCnN0YWNrZWQv
cGFyYWxsZWwtbWVtb3JpZXMgcHJvcGVydGllcyBiZWNhdXNlIHRoZXJlIGlzIG5vIHJlYWwKbGlt
aXRhdGlvbiBvbiB0aGlzIHNpZGUgc28gSSBkaWRuJ3Qgd2FudCB0byBjb25zdHJhaW4gaXQgdG9v
IG11Y2gsCndoaWxlIHN0aWxsIGtlZXBpbmcgYSBtYXhpbXVtIHZhbHVlLCBoZW5jZSA0IHNlZW1l
ZCBhIG5pY2UgZ3Vlc3MgZm9yIGEKIm1heGltdW0gYnV0IGNhbiBiZSBiaWdnZXIgdmFsdWUgd2Ug
ZG9uJ3QgcmVhbGx5IGNhcmUgaXQncyBqdXN0IGZvcgpib3VuZGluZyIuIEhvd2V2ZXIgb24gdGhl
IFNQSSBzaWRlIHRoaXMgaXMgYSBiaWcgY2hhbmdlIHdpdGggZGVlcApjb25zZXF1ZW5jZXMgYW5k
IEkgZG9uJ3Qgd2FudCB0byBydXNoIHRoaW5ncyBzbyBpdCBpcyBvbiBwdXJwb3NlIHRoYXQgSQpr
ZXB0IHRoZSBsaW1pdGF0aW9uIHRvIDIuIEJ1dCB3ZSBjYW4gY2hhbmdlIHRoZSBtYXhJdGVtcyB0
byAyCmV2ZXJ5d2hlcmUgaWYgdGhpcyBhcHBlYXJzIHRvIGJlIHRoZSB0aGluZyB0byBkby4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
