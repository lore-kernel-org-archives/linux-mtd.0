Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38751C3DA42
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2024 06:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/lcp9CIixl3xpoRO1RbQL/OEzL3RXa24vjwJFzmwKM=; b=tMC4jkm2ZOgRq5
	P8gZxGERtiM9hoznFay4oFcl2UMDkUEWP/FlplQ72QUqn90NiNwqOIIAp1VmXN6pprGoWm/BKZCVN
	xzmCEwMjNvhZ9o/lIY8bnJmLyPNJIdbQkYzBgi1jIkslghagDDMTKNwgMZLQ0aLhVHbDkfa/8cUq3
	xqLK72mCc1pfBzNQBndBd5ROF6gwBk6cfbjamh0+VUDkDWa011/5o502xUALna2DmKll1lbxxYlBz
	hN3luhCrm3VNKGji3TyZlm3zMR1xdpbko3keg2dpYNS5M0bFiIiAOMqbU6AcbE8fxTBI2MjYSUPCf
	yhzugP5goXrWHl2FyEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQi7K-00000002v0C-3jkF;
	Mon, 08 Jul 2024 06:44:54 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQi7G-00000002uzN-1yQR;
	Mon, 08 Jul 2024 06:44:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 817CBE0006;
	Mon,  8 Jul 2024 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720421086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kN45r2MzRBKAE4raZ17kWauJPTnIek3N3oaVcC2BO/g=;
	b=PzOy6Z2WDoUDIURvXSdTtpzbHX3JQqR2TwTpbeUTnfB6vX3dNcZ37ATxjxBqYPJmXyybOW
	/cSvPuilXVhZeR7B2dXURK6eJ39WhH4IRmB3cgvultxkXbdYRWIJAVPOSzfOAYpJjJ6yjj
	T4otuw7FybtaZrQhYLIzqq3zUvj4Jc9ZhqWNxjCSwxjRvmd7Z4M+rCx4VXtxp9PGAb8E1q
	oZ1dnF7ScZhNf1MbVD05qQH3qQWLfMAQwFkOz4wVja8KUEs30B2F3BIx4guMRdC+Ulvnk+
	YXsH623cgVPmDlxftJRPmEBJAk7rpJRwu3UnaQOHOTk3BC9lbm01fchVhlirnQ==
Date: Mon, 8 Jul 2024 08:44:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Marco Felsch <m.felsch@pengutronix.de>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240708084440.70186564@xps-13>
In-Reply-To: <20240702-mighty-brilliant-eel-b0d9fa@houat>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
	<mafs0ed8byj5z.fsf@kernel.org>
	<20240702-mighty-brilliant-eel-b0d9fa@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_234450_794594_06324AC2 
X-CRM114-Status: GOOD (  24.52  )
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

SGksCgo+ID4gPj4gPj4gUG9ydCB0aGUgY3VycmVudCBtaXNjL2VlcHJvbS9hdDI0LmMgZHJpdmVy
IHRvIHRoZSBNVEQgZnJhbWV3b3JrIHNpbmNlCj4gPiA+PiA+PiBFRVBST01zIGFyZSBtZW1vcnkt
dGVjaG5vbG9neSBkZXZpY2VzIGFuZCB0aGUgZnJhbWV3b3JrIGFscmVhZHkgc3VwcG9ydHMgIAo+
ID4gPj4gPgo+ID4gPj4gPiBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IE1URCBkZXZp
Y2VzIGFyZSB0aWdodGx5IGNvdXBsZWQgYnkgZXJhc2UKPiA+ID4+ID4gYmxvY2tzLiBCdXQgdGhl
biB3ZSBzZWUgTVREX05PX0VSQVNFLCBzbyB3aGF0IGFyZSBNVEQgZGV2aWNlcyBhZnRlciBhbGw/
ICAKPiA+ID4+IAo+ID4gPj4gSSB3YXMgY3VyaW91cyBhcyB3ZWxsIHNvIEkgZGlkIHNvbWUgZGln
Z2luZy4KPiA+ID4+ICAgCj4gPiBbLi4uXSAgCj4gPiA+PiAKPiA+ID4+IEkgYWxzbyBmb3VuZCBh
IHRocmVhZCBmcm9tIDIwMTMgYnkgTWF4aW1lIFJpcGFyZCAoK0NjKSBzdWdnZXN0aW5nIGFkZGlu
Zwo+ID4gPj4gRUVQUk9NcyB0byBNVEQgWzFdLiBUaGUgbWFpbiBwdXJwb3NlIHdvdWxkIGhhdmUg
YmVlbiB1bmlmeWluZyB0aGUgRUVQUk9NCj4gPiA+PiBkcml2ZXJzIHVuZGVyIGEgc2luZ2xlIGlu
dGVyZmFjZS4gSSBhbSBub3Qgc3VyZSB3aGF0IGNhbWUgb2YgaXQgdGhvdWdoLAo+ID4gPj4gc2lu
Y2UgSSBjYW4ndCBmaW5kIGFueSBwYXRjaGVzIHRoYXQgZm9sbG93ZWQgdXAgd2l0aCB0aGUgcHJv
cG9zYWwuICAKPiA+ID4KPiA+ID4gVGhhdCBkaXNjdXNzaW9uIGxlZCB0byBkcml2ZXJzL252bWVt
IGFmdGVyIEkgc3RhcnRlZCB0byB3b3JrIG9uCj4gPiA+IHNvbWUgZWFybHkgcHJvdG90eXBlLCBh
bmQgU3Jpbml2YXMgdG9vayBvdmVyIHRoYXQgd29yay4gIAo+ID4gCj4gPiBTbyB3b3VsZCB5b3Ug
c2F5IGl0IGlzIGJldHRlciBmb3IgRUVQUk9NIGRyaXZlcnMgdG8gdXNlIG52bWVtIGluc3RlYWQg
b2YKPiA+IG1vdmluZyB1bmRlciBNVEQ/ICAKPiAKPiBJIHRob3VnaHQgc28gYXQgdGhlIHRpbWUs
IGJ1dCB0aGF0IHdhcyBtb3JlIHRoYW4gMTB5IGFnbywgYW5kIEkgaGF2ZQo+IGZvbGxvd2VkIG5l
aXRoZXIgbnZtZW0gbm9yIE1URCBzaW5jZSBzbyBJIGRvbid0IHJlYWxseSBoYXZlIGFuIG9waW5p
b24KPiB0aGVyZS4KPiAKPiBJdCBsb29rcyBsaWtlIGRyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5j
IGhhcyBzdXBwb3J0IGZvciBudm1lbSB0aG91Z2gsCj4gYW5kIE1URCBjYW4gYmUgdXNlZCBhcyBh
biBudm1lbSBwcm92aWRlciB0b28sIHNvIGl0J3Mgbm90IGNsZWFyIHRvIG1lCj4gd2h5IHdlIHdv
dWxkIHdhbnQgdG8gY3JlYXRlIHlldCBhbm90aGVyIHZhcmlhbnQuCj4gCj4gQnV0IGFnYWluLCB5
b3Ugc2hvdWxkbid0IHJlYWxseSBhc2sgbWUgaW4gdGhlIGZpcnN0IHBsYWNlIDopCj4gCj4gSSdt
IHN1cmUgTWlxdWVsLCBTcmluaXZhcywgYW5kIHN1cmVseSBvdGhlcnMsIGFyZSBtdWNoIG1vcmUg
cmVsZXZhbnQgdG8KPiBhbnN3ZXIgdGhhdCBxdWVzdGlvbi4KCk1vcmUgcmVsZXZhbnQsIEkgZG91
YnQsIGJ1dCBqdXN0IGEgZmVlbGluZzogRUVQUk9NcyBoYXZlIHRoZWlyIG93bgpzdWJzeXN0ZW0g
bm93LCBOVk1FTSwgd2hpY2gsIGFzIE1heGltZSBzYWlkLCB3YXMgaW5pdGlhbGx5IHdyaXR0ZW4g
Zm9yCnRoYXQgdmVyeSBzcGVjaWZpYyBjYXNlLiBFRVBST01zIGRvbid0IGhhdmUgdGhlIGNvbXBs
ZXhpdHkgb2YgTVRECmRldmljZXMsIGFuZCB0aHVzIHB1bGxpbmcgdGhlIHdob2xlIE1URCBzdWJz
eXN0ZW0ganVzdCBmb3IgZ2V0dGluZwpwYXJ0aXRpb25zIHNlZW1zIGNvdW50ZXIgaW50dWl0aXZl
IHRvIG1lLiBZb3UgY2FuIGRlZmluaXRlbHkgInNwbGl0IgpFRVBST00gZGV2aWNlcyB3aXRoIE5W
TUVNIGFzIHdlbGwgYW55d2F5LgoKT3ZlcmFsbCBJIHRoaW5rIHRoZSBpZGVhIG9mIGdldHRpbmcg
cmlkIG9mIHRoZXNlIG1pc2MvIGRyaXZlcnMgaXMgZ29lcwppbnRvIHRoZSByaWdodCBkaXJlY3Rp
b24sIGJ1dCByZWdpc3RlcmluZyBkaXJlY3RseSBpbnRvIE5WTUVNIG1ha2VzCm1vcmUgc2Vuc2Ug
SU1PLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
