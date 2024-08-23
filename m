Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7831AC54731
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9wpBDm3hSYQbDKsxgK8rwszVgSHjYQsxEjtF68nbgE=; b=csx3f3vVhtEjd+
	skwC/UzTVre7Q3CRSuHvm9MWQ5Ch1PDhsHi5Jw02YIDydpUqpHK+8GTYOmT7ruMQVpWLGcVutUK2A
	jJVi8GklGNkUzon00tLrgQpM9zoSXGkbyI8KuQmmRceeLvrpzyH2GF8ztk/4Q5qYY9s3He9pHDxpe
	4hxXvGGZCfGve1c1O5mrt3BvfVmgCquo+UA8q11XDVfG/0XZGxF4hgV0SXYSxX/wydIwjMtIqjISi
	JzplSuZ+vbmcBrhKt27xei/hE16ZtHwTfHOIfvTem2ELsvJxazCJ3/pStjgqaoEeljvC6HjOIv+zt
	pc+LSRDMpJoWcleR1toQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWP8-0000000HLV3-13oZ;
	Fri, 23 Aug 2024 15:40:46 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWMS-0000000HKnB-1bOJ;
	Fri, 23 Aug 2024 15:38:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCDC41BF206;
	Fri, 23 Aug 2024 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724427477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CutgodhxN+FJr5V+VHWsJBhY68LFF7RKhgiCY4alWI=;
	b=EQgdhHc1vU0jHveAWULFKVBKA5K/Reu7E11e/ThNq9x2gK+seD0B13sWiulonMlwdOssZ+
	k+eOdW0o2tv4Ud7+Sc+JOMrfETHvLbvlgyy+kMY6NXxlMbsUmLZ7/FAN5WXqj27n4bSlr+
	dmDpxLQ/Z+1AQ01pr9Z1lBOL3BCycoIwydon6a7UJIbtuAqynLhzcVgS7Tyw1JXQgEmX0x
	VOnCrmUGt8M8ZePqnH/ue6a4gvzyEDN1u3bA6Elhg+jRCgsbvMd5Mx/JhrjqIxq4e6ckw+
	detDzZoFkx9y82FATvoOoDjp178jqdsLKA7rVAVuQiUuWcQl3YXaclc2dwkXfg==
Date: Fri, 23 Aug 2024 17:37:48 +0200
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
 linux-mips@vger.kernel.org, loongarch@lists.linux.dev, Michael Walle
 <michael@walle.cc>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240823173748.2b3a364a@xps-13>
In-Reply-To: <20240718091753.apwsrvmekn2vvo4k@pengutronix.de>
References: <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
	<mafs0ed8byj5z.fsf@kernel.org>
	<20240702-mighty-brilliant-eel-b0d9fa@houat>
	<20240708084440.70186564@xps-13>
	<20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
	<20240709114302.3c604ef3@xps-13>
	<20240709103841.7x7n4hdtqrunyoc3@pengutronix.de>
	<20240717101948.2e99f472@xps-13>
	<20240718091753.apwsrvmekn2vvo4k@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_083801_054856_9F38E590 
X-CRM114-Status: GOOD (  24.93  )
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

SGkgTWFyY28sCgptLmZlbHNjaEBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBUaHUsIDE4IEp1bCAy
MDI0IDExOjE3OjUzICswMjAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gMjQtMDctMTcsIE1pcXVl
bCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBNYXJjbywKPiA+ICAgCj4gPiA+ID4gPiA+IE92ZXJhbGwg
SSB0aGluayB0aGUgaWRlYSBvZiBnZXR0aW5nIHJpZCBvZiB0aGVzZSBtaXNjLyBkcml2ZXJzIGlz
IGdvZXMKPiA+ID4gPiA+ID4gaW50byB0aGUgcmlnaHQgZGlyZWN0aW9uLCBidXQgcmVnaXN0ZXJp
bmcgZGlyZWN0bHkgaW50byBOVk1FTSBtYWtlcwo+ID4gPiA+ID4gPiBtb3JlIHNlbnNlIElNTy4g
ICAgICAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gU28geW91IHByb3Bvc2UgdG8gaGF2ZSB0d28gcGxh
Y2VzIGZvciB0aGUgcGFydGl0aW9uIGhhbmRsaW5nIChvbmUgZm9yCj4gPiA+ID4gPiBNVEQgYW5k
IG9uZSBmb3IgTlZNRU0pIGluc3RlYWQgb2Ygb25lIGFuZCBtb3ZpbmcgdGhlIGNvZGUgaW50byBO
Vk1FTQo+ID4gPiA+ID4gZGlyZWN0bHk/ICAgIAo+ID4gPiA+IAo+ID4gPiA+IFdoeSB0d28gcGxh
Y2VzIGZvciB0aGUgcGFydGl0aW9ucyBoYW5kbGluZz8gSnVzdCBvbmUsIGluIE5WTUVNLiBBbHNv
ICAgIAo+ID4gPiAKPiA+ID4gV2l0aG91dCBjaGVja2luZyB0aGUgZGV0YWlscyBJIHRoaW5rIHRo
YXQgY29udmVydGluZyB0aGUgTVRECj4gPiA+IHBhcnRpdGlvbmluZyBjb2RlIGludG8gTlZNRU0g
cGFydGl0aW9uaW5nIGNvZGUgaXMgYSBiaWdnZXIgdGFzay4gQXMgeW91Cj4gPiA+IHNhaWQgYmVs
b3cgdGhlcmUgYXJlIG1hbnkgbGVnYWN5IGNvZGUgcGF0aHMgeW91IG5lZWQgdG8gY29uc2lkZXIg
c28gdGhleQo+ID4gPiBzdGlsbCB3b3JrIGFmdGVyd2FyZHMgYXMgd2VsbC4KPiA+ID4gICAKPiA+
ID4gPiB1c3VhbGx5IEVFUFJPTXMgZG9uJ3QgcmVxdWlyZSB2ZXJ5IGFkdmFuY2VkIHBhcnRpdGlv
bmluZyBzY2hlbWVzLAo+ID4gPiA+IHVubGlrZSBmbGFzaGVzICh3aGljaCBhcmUgdGhlIG1vc3Qg
Y29tbW9uIE1URCBkZXZpY2VzIHRvZGF5KS4gICAgCj4gPiA+IAo+ID4gPiBBcyBzYWlkIGluIG15
IGNvdmVyIGxldHRlciBFRVBST01zIGNhbiBiZWNvbWUgcXVpdGUgbGFyZ2UgYW5kIE1URAo+ID4g
PiBzdXBwb3J0cyBwYXJ0aXRpb25pbmcgc3RvcmFnZSBkZXZpY2VzIHdoaWNoIGlzIHZlcnkgaGFu
ZHkgZm9yIGxhcmdlCj4gPiA+IEVFUFJPTXMgYXMgd2VsbC4gIAo+ID4gCj4gPiBEaWQgeW91IGhh
ZCBhIGxvb2sgYXQgbnZtZW0tbGF5b3V0cyA/IEluIHBhcnRpY3VsYXIgdGhlIGZpeGVkLWxheW91
dC4gIAo+IAo+IFllcyBJIGhhZCBhIGxvb2sgYXQgbnZtZW0tbGF5b3V0cyBhbmQgd2UgdXNlIHRo
ZW0gd2l0aGluIGEKPiBtdGQtcGFydGl0aW9uLiBVc2luZyB0aGVtIGluc3RlYWQgb2YgYSBtdGQt
cGFydGl0aW9uIGlzIG5vdCBzdWZmaWNpZW50Cj4gc2luY2UgdGhleToKPiAgMSkgZG9uJ3Qgc3Vw
cG9ydCB1c2VyLXNwYWNlIHdyaXRlIChJIHNlbmQgYSBwYXRjaCBmb3IgaXQgYnV0IGl0IGRvZXNu
J3QKPiAgICAgc2VlbSB0byBiZSBhY2NlcHRlZCBzb29uKS4KClllcywgdGhpcyBuZWVkZWQgaW1w
cm92ZW1lbnRzIG1heWJlIGJ1dCB3YXMgbm90IHJlZnVzZWQgZWl0aGVyLgoKPiAgMikgSWYgd3Jp
dGUgd291bGQgYmUgc3VwcG9ydGVkIHRoZSB1c2VyLXNwYWNlIG5lZWQgdG8gd3JpdGUgdGhlCj4g
ICAgIGNvbXBsZXRlIGNlbGwgZS5nLiBubyBwYXJ0aWFsIHdyaXRlcy4KCk1heWJlIHRoYXQgY2Fu
IGFsc28gYmUgYnJvdWdodCB0byBudm1lbS4gQWdhaW4sIG52bWVtIHdhcyBpbnRyb2R1Y2VkCmZv
ciBoYW5kbGluZyBFRVBST01zIGluIHRoZSBmaXJzdCBwbGFjZS4KCkFueXdheSwgaWYgb3RoZXIg
cGVvcGxlIGluIENjOiB3YW50IHRvIHNoYXJlIHNvbWUgdGhvdWdodHMsIHRoZXkgYXJlCmFsc28g
d2VsY29tZWQsIEkgZG9uJ3Qgd2FudCB0byBibG9jayB0aGlzIHNlcmllcyBmb3IgYmFkIHJlYXNv
bnMuIEknbQphbHNvIGFkZGluZyBNaWNoYWVsIFdhbGxlIGluIENjOiB3aG8gbWlnaHQgaGF2ZSBh
biBvcGluaW9uIG9uIHRoYXQuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
dGQvMjAyNDA3MDEtYjQtdjYtMTAtdG9waWMtdXNiYy10Y3BjaS12MS00LTNmZDVmNGExOTNjY0Bw
ZW5ndXRyb25peC5kZS8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
