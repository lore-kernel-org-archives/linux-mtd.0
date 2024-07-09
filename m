Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF90C2BD09
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2024 09:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pecYdA/1mxN3eViFWePQly9bT6MEn0Qt2hWcvmrSVNs=; b=TGWm6Vzg/K6BXC
	0rxYTDlQJdQ55xvDk3MtfFNRaWEMp91VbpQ/D64I6VmvKuqHOzN4axpuNcCN9i31QUelV3K5FULJc
	0xZQcV8jXVM5NqwtFk7m5HjIy/aXSbeyhmn6kmE/+iToHL9D9S6hGqjDzdYWlPyxOjZMEg5IHLhG5
	IWsWm0gxRKzCEU6+L/XpuDw7KR+bulxwh6E+RgINPpjwlDSE6nRYdVuH5MeTZFSKX94gao0sBmMFz
	3x9kkNGV0cfRKRiKC0Q0sPISsK953ZQs08lQMpB3W6o9HGgPk16ic7CQuOpcabULM3IpAWE2Q6fMR
	A78vLRg7cTf9Hue/Cz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7NT-00000006f4Q-1Dmk;
	Tue, 09 Jul 2024 09:43:15 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7NO-00000006f2W-2uFi;
	Tue, 09 Jul 2024 09:43:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 896761BF20E;
	Tue,  9 Jul 2024 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720518188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WVMmtSjwlNQmVjxtUeUdR3iKhz4W+lQLl2pkn1Xk12k=;
	b=pS12M/hFFtUvUahs26E5vD/JZJjIQ8CmyPf5kCaaSJzFbR3RDeMCaG4WkQ18U83Kje7Xfl
	AyN919sqdbsVTsmreQhwHSygXqgRJ0kdPQ5zjcJUGtxlT4Ho9p8ijdF8YfTeIO6HFDK7eO
	9ZWZUOd5wpLbo4/rkrKRN8+RnXilQYghyruJzJG1B0By1AlkPDEswaoM56ChbKqR9xzmtO
	jhtQebyqSJwnet2P69DvwaCq24fYzhp/MVzppGLvK1eJdhxGBanp5/LzDMV65mb+L+itk6
	lQKaVcgNUEyq8U3sZF8TqV+3RTbRtu+1Gi6vNNP28kc9H4uebjsO4mk9Ei94yg==
Date: Tue, 9 Jul 2024 11:43:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Maxime Ripard <mripard@kernel.org>, Pratyush Yadav
 <pratyush@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Richard
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
Message-ID: <20240709114302.3c604ef3@xps-13>
In-Reply-To: <20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
	<mafs0ed8byj5z.fsf@kernel.org>
	<20240702-mighty-brilliant-eel-b0d9fa@houat>
	<20240708084440.70186564@xps-13>
	<20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_024311_025224_7F7C71BA 
X-CRM114-Status: GOOD (  34.75  )
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

SGkgTWFyY28sCgo+ID4gPiA+ID4+IEkgYWxzbyBmb3VuZCBhIHRocmVhZCBmcm9tIDIwMTMgYnkg
TWF4aW1lIFJpcGFyZCAoK0NjKSBzdWdnZXN0aW5nIGFkZGluZwo+ID4gPiA+ID4+IEVFUFJPTXMg
dG8gTVREIFsxXS4gVGhlIG1haW4gcHVycG9zZSB3b3VsZCBoYXZlIGJlZW4gdW5pZnlpbmcgdGhl
IEVFUFJPTQo+ID4gPiA+ID4+IGRyaXZlcnMgdW5kZXIgYSBzaW5nbGUgaW50ZXJmYWNlLiBJIGFt
IG5vdCBzdXJlIHdoYXQgY2FtZSBvZiBpdCB0aG91Z2gsCj4gPiA+ID4gPj4gc2luY2UgSSBjYW4n
dCBmaW5kIGFueSBwYXRjaGVzIHRoYXQgZm9sbG93ZWQgdXAgd2l0aCB0aGUgcHJvcG9zYWwuICAg
IAo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYXQgZGlzY3Vzc2lvbiBsZWQgdG8gZHJpdmVycy9udm1l
bSBhZnRlciBJIHN0YXJ0ZWQgdG8gd29yayBvbgo+ID4gPiA+ID4gc29tZSBlYXJseSBwcm90b3R5
cGUsIGFuZCBTcmluaXZhcyB0b29rIG92ZXIgdGhhdCB3b3JrLiAgICAKPiA+ID4gPiAKPiA+ID4g
PiBTbyB3b3VsZCB5b3Ugc2F5IGl0IGlzIGJldHRlciBmb3IgRUVQUk9NIGRyaXZlcnMgdG8gdXNl
IG52bWVtIGluc3RlYWQgb2YKPiA+ID4gPiBtb3ZpbmcgdW5kZXIgTVREPyAgICAKPiA+ID4gCj4g
PiA+IEkgdGhvdWdodCBzbyBhdCB0aGUgdGltZSwgYnV0IHRoYXQgd2FzIG1vcmUgdGhhbiAxMHkg
YWdvLCBhbmQgSSBoYXZlCj4gPiA+IGZvbGxvd2VkIG5laXRoZXIgbnZtZW0gbm9yIE1URCBzaW5j
ZSBzbyBJIGRvbid0IHJlYWxseSBoYXZlIGFuIG9waW5pb24KPiA+ID4gdGhlcmUuCj4gPiA+IAo+
ID4gPiBJdCBsb29rcyBsaWtlIGRyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jIGhhcyBzdXBwb3J0
IGZvciBudm1lbSB0aG91Z2gsCj4gPiA+IGFuZCBNVEQgY2FuIGJlIHVzZWQgYXMgYW4gbnZtZW0g
cHJvdmlkZXIgdG9vLCBzbyBpdCdzIG5vdCBjbGVhciB0byBtZQo+ID4gPiB3aHkgd2Ugd291bGQg
d2FudCB0byBjcmVhdGUgeWV0IGFub3RoZXIgdmFyaWFudC4KPiA+ID4gCj4gPiA+IEJ1dCBhZ2Fp
biwgeW91IHNob3VsZG4ndCByZWFsbHkgYXNrIG1lIGluIHRoZSBmaXJzdCBwbGFjZSA6KQo+ID4g
PiAKPiA+ID4gSSdtIHN1cmUgTWlxdWVsLCBTcmluaXZhcywgYW5kIHN1cmVseSBvdGhlcnMsIGFy
ZSBtdWNoIG1vcmUgcmVsZXZhbnQgdG8KPiA+ID4gYW5zd2VyIHRoYXQgcXVlc3Rpb24uICAKPiA+
IAo+ID4gTW9yZSByZWxldmFudCwgSSBkb3VidCwgYnV0IGp1c3QgYSBmZWVsaW5nOiBFRVBST01z
IGhhdmUgdGhlaXIgb3duCj4gPiBzdWJzeXN0ZW0gbm93LCBOVk1FTSwgd2hpY2gsIGFzIE1heGlt
ZSBzYWlkLCB3YXMgaW5pdGlhbGx5IHdyaXR0ZW4gZm9yCj4gPiB0aGF0IHZlcnkgc3BlY2lmaWMg
Y2FzZS4gRUVQUk9NcyBkb24ndCBoYXZlIHRoZSBjb21wbGV4aXR5IG9mIE1URAo+ID4gZGV2aWNl
cywgYW5kIHRodXMgcHVsbGluZyB0aGUgd2hvbGUgTVREIHN1YnN5c3RlbSBqdXN0IGZvciBnZXR0
aW5nCj4gPiBwYXJ0aXRpb25zIHNlZW1zIGNvdW50ZXIgaW50dWl0aXZlIHRvIG1lLiBZb3UgY2Fu
IGRlZmluaXRlbHkgInNwbGl0Igo+ID4gRUVQUk9NIGRldmljZXMgd2l0aCBOVk1FTSBhcyB3ZWxs
IGFueXdheS4gIAo+IAo+IEkgYXNrZWQgZm9yIGZlZWRiYWNrIG9uIG15IFJGQyBbMV0gYW5kIGFs
bCBJIGdvdCB3YXMgdG8gbWVyZ2UgYm90aAo+IGRyaXZlcnMgaW50byBvbmUgYW5kIG1ha2UgdGhl
IGRyaXZlciBiYWNrd2FyZCBjb21wYXRpYmxlLCB3aGljaCBJIGRpZCBieQo+IHRoaXMgY29tbWl0
LgoKSSdtIHNvcnJ5IGZvciBub3QgYnJpbmdpbmcgdGhpcyBlYXJsaWVyLgoKPiA+IE92ZXJhbGwg
SSB0aGluayB0aGUgaWRlYSBvZiBnZXR0aW5nIHJpZCBvZiB0aGVzZSBtaXNjLyBkcml2ZXJzIGlz
IGdvZXMKPiA+IGludG8gdGhlIHJpZ2h0IGRpcmVjdGlvbiwgYnV0IHJlZ2lzdGVyaW5nIGRpcmVj
dGx5IGludG8gTlZNRU0gbWFrZXMKPiA+IG1vcmUgc2Vuc2UgSU1PLiAgCj4gCj4gU28geW91IHBy
b3Bvc2UgdG8gaGF2ZSB0d28gcGxhY2VzIGZvciB0aGUgcGFydGl0aW9uIGhhbmRsaW5nIChvbmUg
Zm9yCj4gTVREIGFuZCBvbmUgZm9yIE5WTUVNKSBpbnN0ZWFkIG9mIG9uZSBhbmQgbW92aW5nIHRo
ZSBjb2RlIGludG8gTlZNRU0KPiBkaXJlY3RseT8KCldoeSB0d28gcGxhY2VzIGZvciB0aGUgcGFy
dGl0aW9ucyBoYW5kbGluZz8gSnVzdCBvbmUsIGluIE5WTUVNLiBBbHNvCnVzdWFsbHkgRUVQUk9N
cyBkb24ndCByZXF1aXJlIHZlcnkgYWR2YW5jZWQgcGFydGl0aW9uaW5nIHNjaGVtZXMsCnVubGlr
ZSBmbGFzaGVzICh3aGljaCBhcmUgdGhlIG1vc3QgY29tbW9uIE1URCBkZXZpY2VzIHRvZGF5KS4K
Cj4gVGhhdCBkb2Vzbid0IHNvdW5kIHJpZ2h0IHRvIG1lIGVpdGhlci4gQWxzbyBJIGRvbid0IGdl
dCB0aGUKPiBwb2ludCB3aHkgRUVQUk9NcyBjYW4ndCBiZSBoYW5kbGVkIGJ5IHRoZSBNVEQgbGF5
ZXI/CgpUaGV5IGNhbiwgYnV0IHNob3VsZCB0aGV5PyBKdXN0IGNvbXBpbGUgdGhlIHR3byBsYXll
cnMgYW5kIG9ic2VydmUKdGhlIHNpemUgZGlmZmVyZW5jZS4gTVREIGlzIGNvbXBsZXggYW5kIG9s
ZCwgY2FycmllcyBhIGxvdCBvZiBoaXN0b3J5LAphbmQgdGhlIHVzZXIgaW50ZXJmYWNlIGlzIGFs
c28gbm90IHN0cmFpZ2h0Zm9yd2FyZCBiZWNhdXNlIHlvdSBuZWVkIHRvCmhhbmRsZSBwYWdlcywg
YmxvY2tzLCBlcmFzZXMsIGJpdGZsaXBzLCBFQ0Mgc3RhdHMsIE9PQiBieXRlcyBhbmQKcG9zaXRp
b25zLCB0d28gT1RQIGFyZWFzLi4uIE5vbmUgb2YgdGhhdCBleGlzdHMgaW4gdGhlIEVFUFJPTSB3
b3JsZC4gU28Kd2h5IHdvdWxkIHlvdSB3YW50IHRvIHJlZ2lzdGVyIGludG8gTVREIGFuZCBwdWxs
IGEgaHVnZSBzdWJzeXN0ZW0gd2hpbGUKdGhlcmUgaXMgYSBtdWNoIG1vcmUgcmVjZW50LCBzaW1w
bGVyIGFuZCB3YXkgbGlnaHRlciBzdWJzeXN0ZW0gZml0dGluZwptdWNoIGJldHRlciB5b3VyIGRl
dmljZT8KCj4gVGhlIGxheWVyIGFscmVhZHkKPiBzdXBwb3J0cyBkZXZpY2VzIG9mIHR5cGUgTVRE
X1JBTSB3aGljaCBhcmUgdmVyeSBzaW1wbGUgYW5kIGRvbid0IHJlcXVpcmUKPiBhbiBlcmFzZS1v
cCBhdCBsZWFzdCBJIGRvbid0IHNlZSBvbmUuCgpNVERfUkFNIGhhcyBiZWVuIHRoZXJlIGZvcmV2
ZXIsIHByb2JhYmx5IGZvciAiYmFkIiByZWFzb25zLiBCVFcgdGhlcmUKaGFzIGJlZW4gYW4gYXR0
ZW1wdCBhdCByZW1vdmluZyBpdCB3aGljaCB3YXMgcmV2ZXJ0ZWQgaW4gXzIwMDZfIGFuZCB0aGVu
CmZlbHQgaW50byB0aGUgY3JhY2tzOgoyMWM4ZGI5ZWZmOTUgKCJbTVREXSBSZXN0b3JlIE1URF9S
T00gYW5kIE1URF9SQU0gdHlwZXMiKQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
