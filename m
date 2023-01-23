Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28E3C25B50
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 10:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fngsumOasbIzYYYUwQEoi9Kl9zeZ5QQaE7JMzQ0Bu5I=; b=nFJF5QBQLwxlBp
	LIWEI5WRuCpbnqq0blY8i38Gf9h4YCCXPX3a+WSWkZTrieJHR2n5d/q1CaPou50Cs0FzsmYunzBBO
	FgWpYEk21fErh5aqmjQWUQ/A63u8+lVLjY5NszYZogx+YIPBipnJ1ZTcDTm88ta0T+WPcx4VuKXyU
	o3VBDy/wqW1vw4emQvgcg7UrZqFI947a8chlGukl5zM1C9XK7aYqwI63by1DdaWgKvLRKVr5+YVNh
	xEhDy2vovHch5WkYvnEIFxNx/2v1kIfq3DXcJQtQ8r/bhwLLf1iq/qxOWlsPZXkGJ3VfggozvfQYJ
	L3UKXK3tXIq66/04ZVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuQx-00Gtrc-CX; Mon, 23 Jan 2023 10:52:15 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuQu-00Gtqo-22
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 10:52:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D7F59C0015;
	Mon, 23 Jan 2023 10:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674471129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Em+wh7EuKAACsoEuy6n7AqkIrScyansnkvjPyxJcJRY=;
	b=NIq+KnRoX/3ITSDDsBq7KFI9CIGvBrKB3A19Cm03z0neNCcYw3VfxGFpL7aRmGfWFYX1/p
	eM7S5XrCG0IeFODoio6PXAtyUMFwNnoV9ca2j6/5mIgWYWI58zmITL/O0T7Hwz3wHj/TJf
	j+UWLDE1VibdugYvR9VjEWL1cqYwiAiT1fpFSASjafG5S1c+FMw4oGfgXrfSaEbq8Blbaa
	zoc9RYp82uqELzabBx/Vezk2NVgCX0y22M0q4vfjjaX2gMwsTQ34i0AW8Hlwg8w+W2hJNB
	7J6vAko/tkWhUeQIYFlwB5FObbz6xD67RAzOh7VkcV5Udc6nN048d10w5LF5pQ==
Date: Mon, 23 Jan 2023 11:52:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Marek Vasut
 <marex@denx.de>, Francesco Dolcini <francesco.dolcini@toradex.com>,
 u-boot@lists.denx.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] mtd: parsers: ofpart: add workaround for #size-cells
 0
Message-ID: <20230123115207.0f8e9a80@xps-13>
In-Reply-To: <Y85i+R79AWvAUAj7@francesco-nb.int.toradex.com>
References: <20230113184556.487405-1-francesco@dolcini.it>
	<20230123112808.6340a016@xps-13>
	<Y85i+R79AWvAUAj7@francesco-nb.int.toradex.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_025212_272971_061F180F 
X-CRM114-Status: GOOD (  23.37  )
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

SGkgRnJhbmNlc2NvLAoKZnJhbmNlc2NvQGRvbGNpbmkuaXQgd3JvdGUgb24gTW9uLCAyMyBKYW4g
MjAyMyAxMTozNTozNyArMDEwMDoKCj4gT24gTW9uLCBKYW4gMjMsIDIwMjMgYXQgMTE6Mjg6MDhB
TSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IGZyYW5jZXNjb0Bkb2xjaW5pLml0IHdy
b3RlIG9uIEZyaSwgMTMgSmFuIDIwMjMgMTk6NDU6NTYgKzAxMDA6Cj4gPiAgIAo+ID4gPiBGcm9t
OiBGcmFuY2VzY28gRG9sY2luaSA8ZnJhbmNlc2NvLmRvbGNpbmlAdG9yYWRleC5jb20+Cj4gPiA+
IAo+ID4gPiBBZGQgYSBtZWNoYW5pc20gdG8gaGFuZGxlIHRoZSBjYXNlIGluIHdoaWNoIHBhcnRp
dGlvbnMgYXJlIHByZXNlbnQgYXMKPiA+ID4gZGlyZWN0IGNoaWxkIG9mIHRoZSBuYW5kIGNvbnRy
b2xsZXIgbm9kZSBhbmQgI3NpemUtY2VsbHMgaXMgc2V0IHRvIDwwPi4KPiA+ID4gCj4gPiA+IFRo
aXMgY291bGQgaGFwcGVuIGlmIHRoZSBuYW5kLWNvbnRyb2xsZXIgbm9kZSBpbiB0aGUgRFRTIGlz
IHN1cHBvc2VkIHRvCj4gPiA+IGhhdmUgI3NpemUtY2VsbHMgc2V0IHRvIDAsIGJ1dCBmb3Igc29t
ZSBoaXN0b3JpY2FsIHJlYXNvbi9idWcgaXQgd2FzIHNldAo+ID4gPiB0byAxIGluIHRoZSBwYXN0
LCBhbmQgdGhlIGZpcm13YXJlIChlLmcuIFUtQm9vdCkgaXMgYWRkaW5nIHRoZSBwYXJ0aXRpb24K
PiA+ID4gYXMgZGlyZWN0IGNoaWxkcmVuIG9mIHRoZSBuYW5kLWNvbnRyb2xsZXIgZGVmYXVsdGlu
ZyB0byAjc2l6ZS1jZWxscwo+ID4gPiBiZWluZyB0byAxLgo+ID4gPiAKPiA+ID4gVGhpcyBwcmV2
ZW50cyBhIHJlYWwgYm9vdCBmYWlsdXJlIG9uIGNvbGlicmktaW14NyB0aGF0IGhhcHBlbmVkIGR1
cmluZyB2Ni4xCj4gPiA+IGRldmVsb3BtZW50IGN5Y2xlcy4KPiA+ID4gCj4gPiA+IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9ZNGRnQlRHTldwTTZTUVhJQGZyYW5jZXNjby1uYi5p
bnQudG9yYWRleC5jb20vCj4gPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIyMTIwMjA3MTkwMC4xMTQzOTUwLTEtZnJhbmNlc2NvQGRvbGNpbmkuaXQvCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEZyYW5jZXNjbyBEb2xjaW5pIDxmcmFuY2VzY28uZG9sY2luaUB0b3JhZGV4LmNv
bT4KPiA+ID4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAKPiA+ID4gTWlxdWVsLCBNYXJlazogSSBkbyBu
b3QgZXhwZWN0IHRoaXMgcGF0Y2ggdG8gYmUgYmFja3BvcnRlZCB0byBzdGFibGUsIGhvd2V2ZXIK
PiA+ID4gSSB3b3VsZCBleHBlY3QgdGhhdCB3ZSBkbyBub3QgYmFja3BvcnQgbmFuZC1jb250cm9s
bGVyIGR0cyBjbGVhbnVwcyBuZWl0aGVyLiAgCj4gPiAKPiA+IE9rYXkuICAKPiAKPiBbc25pcF0K
PiAKPiA+ID4gKwkJCXByX3dhcm4oIiVzOiBvZnBhcnQgcGFydGl0aW9uICVwT0YgKCVwT0YpICNz
aXplLWNlbGxzIGlzIHdyb25nbHkgc2V0IHRvIDwwPiwgYXNzdW1pbmcgPDE+IGZvciBwYXJzaW5n
IHBhcnRpdGlvbnMuXG4iLAo+ID4gPiArCQkJCSBtYXN0ZXItPm5hbWUsIHBwLAo+ID4gPiArCQkJ
CSBtdGRfbm9kZSk7ICAKPiA+IAo+ID4gV2h5IG10ZF9ub2RlIG9uIGEgbmV3IGxpbmU/ICAKPiAK
PiBGb3Igc29tZSBoaXN0b3JpY2FsIHJlYXNvbiBtb3N0IG9mIHRoaXMgZmlsZSBpcyBsaWtlIHRo
YXQsIHNvIEkgZGlkIHRoZQo+IHNhbWUgZm9yIGNvbnNpc3RlbmN5ICh0byBiZSBob25lc3Qgd2hl
biBJIGRpZCBpdCBJIHRob3VnaCBpdCB3YXMgX2FsbF8KPiBsaWtlIHRoYXQpLgo+IAo+ID4gT3Ro
ZXJ3aXNlIGxvb2tzIGdvb2QgdG8gbWUuICAKPiBJIGNhbiBzZW5kIGEgdjIgd2l0aCB0aGlzIGNo
YW5nZWQuCgpZZXMgcGxlYXNlLgoKVGhhbmtzIGZvciB0aGUgVS1Cb290IHNlcmllcyBieSB0aGUg
d2F5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
