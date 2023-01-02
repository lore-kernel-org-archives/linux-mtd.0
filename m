Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09608C3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 09:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjkTDtNVEh/4u4A4N6WiWgPCCao2aAjB2oW8wLoYxn4=; b=FIcRKOZ0Qyl9o2
	ufSUvI/ZAfPC4issPzp2R23aHT4Y6U/mEiN3unQx+/DvKrsIfSzKvrcYYLBCdxdmg6HLn3Bv2eZTm
	fwqDYRNFYlHXUB43DcGBiSNmhc9IonGY38d34KiakTlL0KItBEnL1+bePApi+m7q6nHhYDjb+xG5S
	DeisDblmN2y40DZBXtSWdOkOQRyHDF9jA9gKzZkdlAIPbxvGrR8De/aG1Xza7ZSKwk737HC7FkOZ1
	Zjs/zyE22aOgNJLOJz7P8SNqXvEvQBha9R94Fh9cyLTLeRUMERH1q62iMGcKO5vigoUCicSBZou6e
	6jwRCnnFsMFFVb/uPxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCH2h-009oz2-Il; Mon, 02 Jan 2023 09:23:39 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCH0c-009oEl-Qf; Mon, 02 Jan 2023 09:21:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3A05AE000E;
	Mon,  2 Jan 2023 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672651286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7iy6kRpjbShIO/YNDBtH1+IvGNDYKzJ6crYcrc+yU+s=;
	b=bBD2KATViq9V9UFZTRuVakbuRQmAKRuR+IDKsnCP+gWLdh+yPLGqT/HX6i4IHbXs43RZNe
	yVXVnsWjw91UjV7MAlz7nlm35DsxSEGo/a4ifHfJaJ0oCB4rTnsIrNKWx1KQIlSny87nIv
	KFlis88NcA1ut7c65tYKU/kc2w8RUMnAwukx5uvyRioydsU7uXdFM+2MXFijyNC6tAmmo6
	9nuLZLiIEEzmgK8TyTNCXM59jVBQ97zOnCj6lwSrTAXkJ+7n0v8kwxtl7wbeIy8S5EWWyt
	AMO3z+26t+oOVCfG6c9VTqtwJsGSPD1IsVWrI05gII4nQyocPnP+LSUS6zV+nA==
Date: Mon, 2 Jan 2023 10:21:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 6/7] mtd: rawnand: sunxi: Update OOB layout to match
 hardware
Message-ID: <20230102102123.511d337d@xps-13>
In-Reply-To: <20221229181526.53766-7-samuel@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
	<20221229181526.53766-7-samuel@sholland.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_012131_416739_A9069F14 
X-CRM114-Status: GOOD (  18.38  )
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

SGkgU2FtdWVsLAoKc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZSBvbiBUaHUsIDI5IERlYyAyMDIy
IDEyOjE1OjI1IC0wNjAwOgoKPiBXaGVuIHVzaW5nIHRoZSBoYXJkd2FyZSBFQ0MgZW5naW5lLCB0
aGUgT09CIGRhdGEgaXMgbWFkZSBhdmFpbGFibGUgaW4KPiB0aGUgTkZDX1JFR19VU0VSX0RBVEEg
cmVnaXN0ZXJzLCBvbmUgMzItYml0IHdvcmQgcGVyIEVDQyBzdGVwLiBBbnkKPiBhZGRpdGlvbmFs
IGJ5dGVzIGFyZSBvbmx5IGFjY2Vzc2libGUgdGhyb3VnaCByYXcgcmVhZHMgYW5kIHNvZnR3YXJl
Cj4gZGVzY3JhbWJsaW5nLiBGb3IgZWZmaWNpZW5jeSwgYW5kIHRvIG1hdGNoIHRoZSB2ZW5kb3Ig
ZHJpdmVyLCBpZ25vcmUKPiB0aGVzZSBleHRyYSBieXRlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
YW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KPiAtLS0KPiAKPiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3Vu
eGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gaW5kZXggOGU4
NzNmNGZlYzlhLi5hM2JjOWY3ZjllNWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvc3VueGlfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5j
Cj4gQEAgLTE2MDQsNiArMTYwNCwxMyBAQCBzdGF0aWMgaW50IHN1bnhpX25hbmRfb29ibGF5b3V0
X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAo+ICAJCXJldHVybiAwOwo+
ICAJfQo+ICAKPiArCS8qCj4gKwkgKiBUaGUgY29udHJvbGxlciBkb2VzIG5vdCBwcm92aWRlIGFj
Y2VzcyB0byBPT0IgYnl0ZXMKPiArCSAqIHBhc3QgdGhlIGVuZCBvZiB0aGUgRUNDIGRhdGEuCj4g
KwkgKi8KPiArCWlmIChzZWN0aW9uID09IGVjYy0+c3RlcHMgJiYgZWNjLT5lbmdpbmVfdHlwZSA9
PSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9IT1NUKQo+ICsJCXJldHVybiAtRVJBTkdFOwoKQWdh
aW4sIEkgYW0gc29ycnkgYnV0IEkgY2Fubm90IHRha2UgdGhpcyBjaGFuZ2UsIGl0IHdvdWxkIHR5
cGljYWxseQpicmVhayBqZmZzMiB1c2VycyAoaWYgYW55PykgOigKCj4gIAlvb2JyZWdpb24tPm9m
ZnNldCA9IHNlY3Rpb24gKiAoZWNjLT5ieXRlcyArIDQpOwo+ICAKPiAgCWlmIChzZWN0aW9uIDwg
ZWNjLT5zdGVwcykKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
