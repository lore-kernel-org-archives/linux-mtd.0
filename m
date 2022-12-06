Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928DCC3A5A7
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 08:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCJ+E5Uxm/m2aO+XK/4DZA+WDl4ZOu/Ewgub3FzU4LA=; b=MGefaOsxMgp1sA
	dOJGrAylgBA63/rwUUYXpas0oJa36OlpdqclBN8dApu7vvlZGP9VOyob7HCl4N2DdGJPZo1yRlmmM
	DZNb3rWhSYWDwJdn2ICvlubuB10bD8UUXV0arWvHqbrmo31Vg6PlsT7VbIkCxls55VWfJIVyZ+Pqr
	QDtM9ZIladYSxJzk3TB/pmt4uObrSUCwpTWeYI04ic7IMid/GRjQJ84V4umItuqvGsOkmmjlBmUJB
	ybN0mqJXuM0fzvA2pKgwpBQ62T5uIF/aLeB5AY4WHmzNjRcCK//Lyr+YBFMrDcVTKTkaDj5zKgxH/
	iqMEZJ+HslJDTMOayEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TAJ-004e6C-7A; Tue, 06 Dec 2022 08:18:59 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TAF-004dxq-KA
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2022 08:18:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4387A1BF20F;
	Tue,  6 Dec 2022 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670314732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S85P/+unHj6WfJF7lTAK0jbzKUnO/6gheXWbSSkrvk0=;
	b=JJfK/UI5HAr0Th8hY/ol509drdMRFeEjuQWYe1p1irD4rmMZdn84Z2ua8yt7hR1fF2OTk1
	s5PCfucEqUB16Rqvvc5f6ULY1gBSfsbIIyz6iSdL4Scu5AmcXf1jlmtBhW5wJ50v+LNVoN
	7zBCatR1xaUoa7k/KKBZzlapM6BEUmI9GMpSe7zxlOOrCyiZ2LqCcgRj27upgDRbTX5XoQ
	7G6dncEK2KZB8jyWEj9ivuIEJdozB7D48ilbF1Ap50YHVy15su4y9qWkUGagnixv/ioswJ
	5Zwq2x4XK5Qv0Xa0tNksbyZdHoVWnsHKbcRvoVuajMJxxuIWfZLsEC0gFulT+g==
Date: Tue, 6 Dec 2022 09:18:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vlim <vlim@gigadevice.com>
Cc: Michael Walle <michael@walle.cc>, Victor Lim <victorswlim@gmail.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "vikhyat.goyal@amd.com"
 <vikhyat.goyal@amd.com>, "amit.kumar-mahapatra@amd.com"
 <amit.kumar-mahapatra@amd.com>, "alejandro.carmona@amd.com"
 <alejandro.carmona@amd.com>
Subject: Re: [PATCH] Linux: SPI: add Gigadevice part #
Message-ID: <20221206091846.02f6396f@xps-13>
In-Reply-To: <TY0PR06MB5658B73E2F22472D0AF48BDBBB1B9@TY0PR06MB5658.apcprd06.prod.outlook.com>
References: <20221204080000.4100-1-vlim@gigadevice.com>
	<dee37d18f8de5af7d07388031fc08571@walle.cc>
	<TY0PR06MB5658B73E2F22472D0AF48BDBBB1B9@TY0PR06MB5658.apcprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_001855_954190_5A053572 
X-CRM114-Status: GOOD (  14.67  )
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

SGkgVmxpbSwKCnZsaW1AZ2lnYWRldmljZS5jb20gd3JvdGUgb24gVHVlLCA2IERlYyAyMDIyIDAx
OjI3OjEzICswMDAwOgoKPiBIaSwgTWljaGFlbCwKPiAKPiBJIHdpbGwgcmVkbyB0aGUgcGF0Y2gg
Zm9sbG93aW5nIHRoaXMgZG9jLgo+IEF0IHRoZSBtZWFudGltZSwgY2FuIHlvdSBwb2ludCBvdXQg
YSBmZXcgbWlzdGFrZXMgdGhhdCBJIGFtIG1ha2luZyBzbyB0aGF0IEkgY2FuIGNvcnJlY3QgaXQg
aW4gdGhlIG5leHQgc3VibWl0LgoKSGVyZSBhcmUgYSBmZXc6Ci0gVGhlIHRpdGxlIGlzIHdyb25n
IChnaXQgbG9nIC0tb25lbGluZSA8ZmlsZT4gZm9yIGhpbnRzKQotIFRoZSBjb21taXQgbG9nIGlz
IHVzZWxlc3MKLSBEb24ndCBtYWtlIHVucmVsYXRlZCBjaGFuZ2VzIGluIHlvdXIgY29tbWl0LCBv
bmUgY2hhbmdlID09IG9uZSBjb21taXQKLSBEb24ndCBjaGFuZ2UgaG93IHRoZSBjb2RlIGxvb2tz
IGxpa2UgZm9yIG5vIHJlYXNvbiBvciBqdXN0aWZpY2F0aW9uCgpBbmQgcGxlYXNlIGF2b2lkIHRv
cCBwb3N0aW5nIHdoZW4gYW5zd2VyaW5nLgoKR29vZCBsdWNrIQoKVGhhbmtzLApNaXF1w6hsCgo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gRnJvbTogTWljaGFlbCBXYWxs
ZSA8bWljaGFlbEB3YWxsZS5jYz4KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDUsIDIwMjIgMDA6
MjIKPiBUbzogVmljdG9yIExpbSA8dmljdG9yc3dsaW1AZ21haWwuY29tPgo+IENjOiB0dWRvci5h
bWJhcnVzQG1pY3JvY2hpcC5jb20gPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT47IHAueWFk
YXZAdGkuY29tIDxwLnlhZGF2QHRpLmNvbT47IG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+OyByaWNoYXJkQG5vZC5hdCA8cmljaGFyZEBub2QuYXQ+
OyB2aWduZXNockB0aS5jb20gPHZpZ25lc2hyQHRpLmNvbT47IGxpbnV4LW10ZEBsaXN0cy5pbmZy
YWRlYWQub3JnIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyB2aWtoeWF0Lmdv
eWFsQGFtZC5jb20gPHZpa2h5YXQuZ295YWxAYW1kLmNvbT47IGFtaXQua3VtYXItbWFoYXBhdHJh
QGFtZC5jb20gPGFtaXQua3VtYXItbWFoYXBhdHJhQGFtZC5jb20+OyBhbGVqYW5kcm8uY2FybW9u
YUBhbWQuY29tIDxhbGVqYW5kcm8uY2FybW9uYUBhbWQuY29tPjsgVmxpbSA8dmxpbUBnaWdhZGV2
aWNlLmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBMaW51eDogU1BJOiBhZGQgR2lnYWRldmlj
ZSBwYXJ0ICMKPiAKPiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIG1pY2hhZWxAd2Fs
bGUuY2MuIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFy
bkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+IAo+IOatpOS4uuWklumDqOmCruS7tu+8jOiw
qOmYsumSk+mxvOmCruS7tu+8jOivt+azqOaEj+mCruS7tuaYr+WQpua2ieWPiuaVj+aEn+S/oeaB
rwo+IAo+IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwsIGJld2FyZSBvZiBwaGlzaGluZyBlbWFp
bHMuIFBsZWFzZSBwYXkgY2xvc2UgYXR0ZW50aW9uIHRvIHdoZXRoZXIgdGhlIGVtYWlsIGNvbnRh
aW5zIHNlbnNpdGl2ZSBpbmZvcm1hdGlvbgo+IAo+IAo+IEhpLAo+IAo+IEFtIDIwMjItMTItMDQg
MDk6MDAsIHNjaHJpZWIgVmljdG9yIExpbToKPiA+IEVkaXRlZCBnaWdhZGV2aWNlLmMgIAo+IAo+
IFBsZWFzZSBoYXZlIGEgbG9vayBhdAo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwv
bGF0ZXN0L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwKPiAKPiAtbWljaGFlbAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
