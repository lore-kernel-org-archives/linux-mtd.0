Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB66CC10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 06:59:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC4A4206B7
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 06:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SZB8s5yS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC4A4206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rM2fSE4yBsuhexeVFFa6H5nfuY1qWssjwDlp4+4RXaQ=; b=SZB8s5ySAEz781
	pF3iTOQHysEnNWZI1aj1bGP8tdpkCmxNjA8mMfjBNWoaXgdTgm8oMxEmyEGwfCY86mxvXVlZQ+4IK
	Kn98coe8fEJSwyBEH4VJUP3eFOpTSm1RFnUkqjYkleIfh1HD1h0vYrx9KY64L+BHK7E/ldRHRZjUK
	Pw8WQ+hdFvglcXSUxGyRGYZsApPBKVNa4U7iJRbVWJkonmtJjqWn4Ty1noLCFK4wndnfjFHdMLs+Z
	/TKH001imOnUY38ujUYKFvF7sv9x350Pf/6vQrmwoQ4MvNS+QQ31ALqcSTH1MrCOg0uXRUD6CwuV0
	9YMOyxTj4CLITmXDUxOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFvaU-0001sN-BG; Mon, 15 Apr 2019 06:59:30 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFvaM-0001m0-Mv; Mon, 15 Apr 2019 06:59:24 +0000
X-Originating-IP: 81.185.162.127
Received: from xps13 (127.162.185.81.rev.sfr.net [81.185.162.127])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 408E920011;
 Mon, 15 Apr 2019 06:59:02 +0000 (UTC)
Date: Mon, 15 Apr 2019 08:58:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Message-ID: <20190415085859.21f69396@xps13>
In-Reply-To: <20190414110549.5c91829d@collabora.com>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
 <20190414110549.5c91829d@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_235922_901562_C52E6651 
X-CRM114-Status: GOOD (  16.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTdW4sIDE0IEFwcgoyMDE5IDExOjA1OjQ5ICswMjAwOgoKPiBPbiBUaHUsICA0
IEFwciAyMDE5IDE4OjIxOjEwICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBBbGx3aW5uZXIgTkFORCBjb250cm9sbGVycyBjYW4g
bWFrZSB1c2Ugb2YgRE1BIHRvIGVuaGFuY2UgdGhlIEkvTwo+ID4gdGhyb3VnaHB1dCB0aGFua3Mg
dG8gRUNDIHBpcGVsaW5pbmcuIERNQSBoYW5kbGluZyB3aXRoIHN1bjhpIE5BTkQgSVAKPiA+IGlz
IGEgYml0IGRpZmZlcmVudCB0aGFuIHdpdGggdGhlIG9sZGVyIFNvQ3MsIGhlbmNlIHRoZSBpbnRy
b2R1Y3Rpb24gb2YKPiA+IGEgbmV3IGNvbXBhdGlibGUgdG8gaGFuZGxlOgo+ID4gKiB0aGUgZGlm
ZmVyZW5jZXMgYmV0d2VlbiByZWdpc3RlciBvZmZzZXRzLAo+ID4gKiB0aGUgYnVyc3QgbGVuZ3Ro
IGNoYW5nZSBmcm9tIDQgdG8gbWluaW11bSA4LAo+ID4gKiBkcml2ZSBTUkFNIGFjY2Vzc2VzIHRo
cm91Z2ggdGhlIEFIQiBidXMgaW5zdGVhZCBvZiB0aGUgTUJVUy4gIAo+IAo+IEhtLCBub3cgdGhh
dCB5b3Uga25vdyBNQlVTIGFjY2Vzc2VzIGFyZSB3b3JraW5nIGZpbmUgKElJUkMsIHRoYXQncyB3
aGF0Cj4geW91IHVzZWQgZm9yIHRoZSBTUEwgRE1BLWJhc2VkIGltcGxlbWVudGF0aW9uKSwgd2h5
IG5vdCBkaXJlY3RseSB1c2UKPiBNQlVTIGFjY2Vzc2VzIG9uIEEzMz8gSSBtZWFuLCBpdCdzIGxp
a2VseSBmYXN0ZXIgdGhhbiBnb2luZyB0aHJvdWdoCj4gdGhlIERNQSBlbmdpbmUgKHdoaWNoIGlz
IHNoYXJlZCBieSBzZXZlcmFsIElQcyksIGFuZCBBRkFJUiwgdGhlIE1CVVMKPiBzZXR1cCBpcyBw
cmV0dHkgc2ltcGxlLgoKQmVjYXVzZSBhbGwgdGhlIGRyaXZlciBpcyBhbHJlYWR5IGluIHNoYXBl
IHRvIHVzZSB0aGUgZXh0ZXJuYWwgRE1BCmVuZ2luZSBhbmQgaXQgd2FzIHZlcnkgZWFzeSBhbmQg
cXVpY2sgKGhhdmUgYSBsb29rIGF0IHRoZSBkaWZmIG9mIHRoZQp2MykgdG8gdXNlIGl0IGFnYWlu
LgoKSG93ZXZlciwgdGhlIGNob2ljZSBJIGFtIGRlc2NyaWJpbmcgaGVyZSBpcyBub3QgRE1BIHZz
LiBNQlVTIChvciBNRE1BKSwKaXQgaXMgTUJVUyB2cy4gQUhCLCBpdCBpcyBqdXN0IGFib3V0IHRo
ZSBidXMgdGhhdCB3aWxsIGFjY2VzcyB0aGUgU1JBTQoodGhpcyBpcyB3aGF0IHdlIGhhdmUgdW5k
ZXJzdG9vZCB3aXRoIE1heGltZSBmcm9tIHRoZSBkYXRhc2hlZXRzIGFuZAp0aGUgdGVzdHMgd2Ug
aGF2ZSBkb25lKS4gRm9yIHRoaXMgY2hvaWNlLCB3ZSB0ZXN0ZWQgd2l0aCBib3RoIGJ1c2VzOiBu
bwp0aHJvdWdocHV0IGNoYW5nZSBzbyB3ZSB0aGluayB0aGF0IGl0IGlzIG5vdCBhIGJvdHRsZW5l
Y2sgYW55d2F5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
