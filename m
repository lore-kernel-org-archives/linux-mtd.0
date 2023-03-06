Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33C1C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09RB+fm/3C8HrAExjxW7Yybz9/4JTgTqGu4f6QIYhuk=; b=aLqhSs1+AXm9aW
	eC87cX2EMspCxzOuOmhELW6blJzUUzKww6X0Kde3Kw1x3vrAdsFeCQgQkuzpmz6v2NtLWbs2qU1NX
	zXHKnhp6IsnZ/R6A97FIVWXan2Lnw0Hh5p1mytinO9UBJm4ywrkN9Lkpv/W1YEPDk6TpYRJCJp5JL
	vgdPvGU5mfrSU3UcyL4ROZZ+6vpSSGJUXd2y9hYz04izWNr0fsQuipMmgy0MPvT+5Ndj5n9DOsVAU
	P3v1Rz6C/8K9zmhl6qyhYuggsY+XAdl6bHAuh1/iQUpE0Qyowe8DEg563XOc9qRhF4063sKluo493
	LcObHPNNR+KR+iB5eYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ8fU-00CPNw-0L; Mon, 06 Mar 2023 11:06:12 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ8fO-00CPLh-UV
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 11:06:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8821920012;
	Mon,  6 Mar 2023 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678100760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qb2Hdhx8UQsFd5rz53oW2MFWr/yNsB2YoLuzM6NAUc=;
	b=K1u1OcRQwV8LvxFRdcaUP/g/B7X2Lt3wheEs3GfvkdCyh60rK59o2R0fEuox/Vlp5QpI6w
	ixVxsim2gtA/Sh3gaJ+riNqIOLCRAGceNKGZJkV+yE1aGB7NSQJiU1GIFHrLkUGA+iY6Pb
	eHcQmrLvSyKQ51NgA3ej2nRt6N+5xVxiKkS0ieKyUM01Qm/j2MCgH84a1xLCmfFBSLLR6P
	UtZQjV3WrsFX8uODL9kq52mgiK7gkA7cg873WNNRn0aiOPItSs/K7SOyyrv6TyjoGIcsMK
	4VDQn8bBiy45LFugqvhU/VfoZ9La6HbQrM6KdYt3bvvbiN5tQ1Q0vh171dNnLw==
Date: Mon, 6 Mar 2023 12:05:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Walle <michael@walle.cc>, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
Message-ID: <20230306120558.00f614fb@xps-13>
In-Reply-To: <ZAWuvRHVVV3hTm0e@kroah.com>
References: <20230208160230.2179905-1-gregkh@linuxfoundation.org>
	<f60870dee13900252e0b13fb2f5f05b5@walle.cc>
	<ZAWNtv0g6vmADGnb@kroah.com>
	<20230306093336.523832b0@xps-13>
	<ZAWuvRHVVV3hTm0e@kroah.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_030607_313320_BE7764A8 
X-CRM114-Status: GOOD (  25.08  )
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

SGkgR3JlZywKCmdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnIHdyb3RlIG9uIE1vbiwgNiBNYXIg
MjAyMyAxMDoxMzozMyArMDEwMDoKCj4gT24gTW9uLCBNYXIgMDYsIDIwMjMgYXQgMDk6MzM6MzZB
TSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIEdyZWcsCj4gPiAKPiA+IGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnIHdyb3RlIG9uIE1vbiwgNiBNYXIgMjAyMyAwNzo1MjozOCAr
MDEwMDoKPiA+ICAgCj4gPiA+IE9uIFdlZCwgRmViIDA4LCAyMDIzIGF0IDA1OjE1OjQxUE0gKzAx
MDAsIE1pY2hhZWwgV2FsbGUgd3JvdGU6ICAKPiA+ID4gPiBBbSAyMDIzLTAyLTA4IDE3OjAyLCBz
Y2hyaWViIEdyZWcgS3JvYWgtSGFydG1hbjogICAgCj4gPiA+ID4gPiBXaGVuIGNhbGxpbmcgZGVi
dWdmc19sb29rdXAoKSB0aGUgcmVzdWx0IG11c3QgaGF2ZSBkcHV0KCkgY2FsbGVkIG9uIGl0LAo+
ID4gPiA+ID4gb3RoZXJ3aXNlIHRoZSBtZW1vcnkgd2lsbCBsZWFrIG92ZXIgdGltZS4gIFRvIHNv
bHZlIHRoaXMsIHJlbW92ZSB0aGUKPiA+ID4gPiA+IGxvb2t1cCBhbmQgY3JlYXRlIHRoZSBkaXJl
Y3Rvcnkgb24gdGhlIGZpcnN0IGRldmljZSBmb3VuZCwgYW5kIHRoZW4KPiA+ID4gPiA+IHJlbW92
ZSBpdCB3aGVuIHRoZSBtb2R1bGUgaXMgdW5sb2FkZWQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IENj
OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+Cj4gPiA+ID4gPiBD
YzogUHJhdHl1c2ggWWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+Cj4gPiA+ID4gPiBDYzogTWlj
aGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPiA+ID4gPiA+IENjOiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gPiA+ID4gQ2M6IFJpY2hhcmQgV2VpbmJl
cmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gPiA+ID4gPiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8
dmlnbmVzaHJAdGkuY29tPgo+ID4gPiA+ID4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPiAgICAKPiA+ID4gPiAKPiA+ID4gPiBSZXZpZXdlZC1ieTogTWlj
aGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPiA+ID4gPiAKPiA+ID4gPiBvbmUgbml0IGJl
bG93IEkgZGlkbid0IG5vdGljZSBlYXJsaWVyLCBubyBuZWVkIHRvIHNlbmQgYSBuZXcKPiA+ID4g
PiBwYXRjaCB2ZXJzaW9uIGp1c3QgZm9yIHRoYXQuCj4gPiA+ID4gCj4gPiA+ID4gLi4KPiA+ID4g
PiAgICAgCj4gPiA+ID4gPiArdm9pZCBzcGlfbm9yX2RlYnVnZnNfc2h1dGRvd24odm9pZCkKPiA+
ID4gPiA+ICt7Cj4gPiA+ID4gPiArCWlmIChyb290ZGlyKQo+ID4gPiA+ID4gKwkJZGVidWdmc19y
ZW1vdmUocm9vdGRpcik7ICAgIAo+ID4gPiA+IAo+ID4gPiA+IGRlYnVnZnNfcmVtb3ZlKCkgYWxy
ZWFkeSBoYXMgYSBjaGVjayBmb3IgTlVMTC4KPiA+ID4gPiAgICAgCj4gPiA+IAo+ID4gPiBBaCwg
Z29vZCBjYXRjaCwgSSBtZXJnZWQgdGhpcyBpbiB3aGVuIEkgYXBwbGllZCBpdCB0byBteSB0cmVl
LCB0aGFua3MhICAKPiA+IAo+ID4gQW55IHJlYXNvbnMgd2h5IHlvdSBkaWQgYXBwbHkgdGhpcyBw
YXRjaCB0byB5b3VyIHRyZWU/IEl0IGlzIGEgc3BpLW5vcgo+ID4gZml4LCBJIHdvdWxkIGhhdmUg
ZXhwZWN0ZWQgaXQgdG8gZ28gdGhyb3VnaCBtdGQuICAKPiAKPiBJdCdzIGJlZW4gc2l0dGluZyBh
cm91bmQgZm9yIGEgbW9udGgsIEkgYXNzdW1lZCBpdCB3YXMgbG9zdCwgc28gSSBwaWNrZWQKPiBp
dCB1cC4KClNvcnJ5IGlmIGl0IHRvb2sgdG9vIGxvbmcsIHRoZSBtZXJnZSB3aW5kb3cgYWxzbyBo
YXBwZW5lZCBkdXJpbmcgdGhhdAp0aW1lLCB3ZSBhcmUgY29sbGVjdGluZyBwYXRjaGVzIG5vdyB0
aGF0IDYuMy1yYzEgaGFzIGJlZW4gcmVsZWFzZWQuCk5leHQgdGltZSBkb24ndCBoZXNpdGF0ZSB0
byBwaW5nIGZpcnN0IDstKQoKPiBJIGNhbiByZXZlcnQgaXQgaWYgeW91IGRvbid0IHdhbnQgbWUg
dG8gdGFrZSBpdCBmb3IgNi4zLWZpbmFsCj4gdGhyb3VnaCBteSBkcml2ZXIgY29yZSB0cmVlLgoK
SSdsbCBsZXQgc3BpLW5vciBtYWludGFpbmVycyBkZWNpZGUgd2hhdCB0aGV5IHByZWZlci4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
