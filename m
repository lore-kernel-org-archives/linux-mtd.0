Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0892C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=inPiocccNBWhciph3mU9qYyhm+HTESuK9zYhPYKZleU=; b=W2Wos0n7L8UGR3
	8BKoSJ87fIOzOiepcp8KlSeUgh3TmRo2r9z3RJYNAhpx4gQvSPDtitjiBSLO/5LQRZMshbpuVMU13
	6zj8lYgy4eKFm8VaBOPUhJglv2cV0WN5gxww0PNj6mcDdQLKXO21vs30dMFZWbqPwLGmNV67mlwOY
	UCeZc95qStFzvYnOz2i4AWpav1fJYSbyguNACplalHQGBkTD4h5MPr1N4P1JVaEOiUvM6XFD2mwc2
	enewYeKbxpiVbvjjQppbQ61HywljSYBvX4RuEvQ38w+160JpfbbUTr4Jcy7mX/eUHC8PkaZLXhx4V
	0C4URsyONVIuF5aP6kZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzx3o-009hrs-Cw; Wed, 22 Dec 2021 08:33:20 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzx3k-009hql-KP
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 08:33:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D10A4FF804;
 Wed, 22 Dec 2021 08:33:12 +0000 (UTC)
Date: Wed, 22 Dec 2021 09:33:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael
 Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Boris Brezillon
 <boris.brezillon@collabora.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Xiangsheng Hou
 <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v8 01/14] spi: spi-mem: reject partial cycle transfers in
Message-ID: <20211222093311.36e5b311@xps13>
In-Reply-To: <20211222083150.i4semnybo2l4aede@ti.com>
References: <20211221174844.56385-1-miquel.raynal@bootlin.com>
 <20211221174844.56385-2-miquel.raynal@bootlin.com>
 <20211221184148.pw4blwxdvxcoerjo@ti.com>
 <20211222091223.5bf11221@xps13>
 <20211222083150.i4semnybo2l4aede@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_003316_836272_241396D6 
X-CRM114-Status: GOOD (  17.57  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBXZWQsIDIyIERlYyAyMDIxIDE0
OjAxOjUyICswNTMwOgoKPiBPbiAyMi8xMi8yMSAwOToxMkFNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4gSGkgUHJhdHl1c2gsCj4gPiAKPiA+IHAueWFkYXZAdGkuY29tIHdyb3RlIG9uIFdlZCwg
MjIgRGVjIDIwMjEgMDA6MTE6NTAgKzA1MzA6Cj4gPiAgIAo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+
IE9uIDIxLzEyLzIxIDA2OjQ4UE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+ID4gPiBGcm9t
OiBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+Cj4gPiA+ID4gCj4gPiA+ID4gSW4gOEQt
OEQtOEQgbW9kZSB0d28gYnl0ZXMgYXJlIHRyYW5zZmVycmVkIHBlciBjeWNsZS4gU28gYW4gb2Rk
IG51bWJlcgo+ID4gPiA+IG9mIGJ5dGVzIGNhbm5vdCBiZSB0cmFuc2ZlcnJlZCBiZWNhdXNlIGl0
IHdvdWxkIGxlYXZlIGEgcmVzaWR1YWwgaGFsZgo+ID4gPiA+IGN5Y2xlIGF0IHRoZSBlbmQuIENv
bnNpZGVyIHN1Y2ggYSB0cmFuc2ZlciBpbnZhbGlkIGFuZCByZWplY3QgaXQuCj4gPiA+ID4gCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPgo+ID4g
PiA+IFJldmlld2VkLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g
ICAgCj4gPiA+IAo+ID4gPiBTb3JyeSwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGlzIGJlZm9yZS4gVGhp
cyBwYXRjaCB3b3VsZCBicmVhayBhIGNvdXBsZSBvZiAKPiA+ID4gU1BJIE5PUiBmbGFzaGVzLiBZ
b3UgbmVlZCBwYXRjaCAxLCAyLCBhbmQgMyBmcm9tIG15IHNlcmllcyBhcyB3ZWxsIHRvIAo+ID4g
PiBtYWtlIHN1cmUgdGhpcyBkb2VzIG5vdCBoYXBwZW4uIFNpbmNlIHRob3NlIHBhdGNoZXMgaGF2
ZSBzb21lIHBlbmRpbmcgCj4gPiA+IGNvbW1lbnRzLCBjYW4geW91IGp1c3QgZHJvcCB0aGlzIHBh
dGNoIGFuZCBJIHdpbGwgcmUtcm9sbCBpdCBvbiB0b3Agb2YgCj4gPiA+IHlvdXIgc2VyaWVzIGxh
dGVyIHdoZW4gSSBjYW4gZmluZCBzb21lIHRpbWUgZm9yIGl0PyBBZ2Fpbiwgc29ycnkgZm9yIG5v
dCAKPiA+ID4gbm90aWNpbmcgdGhpcyBiZWZvcmUuICAKPiA+IAo+ID4gWWVzIG5vIHByb2JsZW0s
IEkgbWlnaHQgYXMgd2VsbCBkcm9wIGl0IHdoZW4gYXBwbHlpbmcuICAKPiAKPiBBbmQgZHJvcCB0
aGUgY2hhbmdlcyBmcm9tIHBhdGNoIDMgYXMgd2VsbC4KClllcyBvZiBjb3Vyc2UsIEknbGwga2Vl
cCB0aGUgImNtZC5uYnl0ZXMgIT0gMiIgY2hlY2sgYXMgaXQgd2FzIHRvIGtlZXAKdGhlIGJlaGF2
aW9yIGV4YWN0bHkgYXMgaXQgd2FzLCBhbmQgb24gdG9wIG9mIHRoYXQgd2UgY2FuIGZpbmUgdHVu
ZQp0aGVzZSBjaGVja3MuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
