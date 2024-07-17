Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22C8C3DA4B
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2024 08:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdrBKuNrz6u58ZdyEgEsOVigzDUZEcEil3job9J4Qb0=; b=t7Jy1Qwsvz8/kx
	GOoxw4gZ+bRDv0mihjviGYSMXDfdEa4Pid3GQ1UNYEEcYEHys1srQcJBcvuIC0FKc0i+CZ04L4wgt
	NgS2jyVJ+L7ggQ3kaknubbPjg52M2oxkoVTZX5RM56rWOGmhq6Ju2jSTCkbjsSyUBr4w1Oun4J/ES
	FOOeO6EdfQfwfYCtZr/lQrqFyO0tkvOIcMZwqCR6SOlStSl7ZXKCsRZPLt1teLROJ0K0T82jIGGmu
	avmitSokZkcxXDAkKukHgRyBT/CjdF37avtptr+j/G0ZxsX28PLqY8F1J+WnfhuA2qLZ5FYrjYlSV
	Di3ZKDQIjKzOrsGPBX/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTztN-0000000D6qS-1Dqa;
	Wed, 17 Jul 2024 08:20:05 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTztG-0000000D6oe-22DK;
	Wed, 17 Jul 2024 08:20:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 255A8FF803;
	Wed, 17 Jul 2024 08:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721204394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYy4jlSppC2pcc6cg+3nF/8GvPZv6nmewlb2L7o9Nw8=;
	b=Q8RMbd3XCm3mkOoSML4rikXKiJwOmxmdsX2NkXlZwRplYxuKqVu6DdyLJ7G/4YQS4TR3e0
	tQ9HYyVU0QaJ7mJKdjZ58+NY03/Y4pQSR1nheyy9/gpjRgXyPcN/SYNbnfEvcXYx78cKK1
	DspBdEnmtUUE2Vh7fB3axwb52s022qgb/fQK8B7JQxuL+DVdX8knHLZC7Oxu4B+r0HSgWa
	t6AmHSpNSofRHkmWqrwexOh4wFUvNGOiGe2R2Gz1nk0z8FDgM9iuuAszfZbHO/r1L/BknS
	0yhBDc0k6PoqJGn8/jBTZsc9id1S9XZ4jdCo9jE7HgZr9sw+Ct/c9wyvI/5QfA==
Date: Wed, 17 Jul 2024 10:19:48 +0200
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
Message-ID: <20240717101948.2e99f472@xps-13>
In-Reply-To: <20240709103841.7x7n4hdtqrunyoc3@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
	<mafs0ed8byj5z.fsf@kernel.org>
	<20240702-mighty-brilliant-eel-b0d9fa@houat>
	<20240708084440.70186564@xps-13>
	<20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
	<20240709114302.3c604ef3@xps-13>
	<20240709103841.7x7n4hdtqrunyoc3@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_011958_809596_FBB472B9 
X-CRM114-Status: GOOD (  16.52  )
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

SGkgTWFyY28sCgo+ID4gPiA+IE92ZXJhbGwgSSB0aGluayB0aGUgaWRlYSBvZiBnZXR0aW5nIHJp
ZCBvZiB0aGVzZSBtaXNjLyBkcml2ZXJzIGlzIGdvZXMKPiA+ID4gPiBpbnRvIHRoZSByaWdodCBk
aXJlY3Rpb24sIGJ1dCByZWdpc3RlcmluZyBkaXJlY3RseSBpbnRvIE5WTUVNIG1ha2VzCj4gPiA+
ID4gbW9yZSBzZW5zZSBJTU8uICAgIAo+ID4gPiAKPiA+ID4gU28geW91IHByb3Bvc2UgdG8gaGF2
ZSB0d28gcGxhY2VzIGZvciB0aGUgcGFydGl0aW9uIGhhbmRsaW5nIChvbmUgZm9yCj4gPiA+IE1U
RCBhbmQgb25lIGZvciBOVk1FTSkgaW5zdGVhZCBvZiBvbmUgYW5kIG1vdmluZyB0aGUgY29kZSBp
bnRvIE5WTUVNCj4gPiA+IGRpcmVjdGx5PyAgCj4gPiAKPiA+IFdoeSB0d28gcGxhY2VzIGZvciB0
aGUgcGFydGl0aW9ucyBoYW5kbGluZz8gSnVzdCBvbmUsIGluIE5WTUVNLiBBbHNvICAKPiAKPiBX
aXRob3V0IGNoZWNraW5nIHRoZSBkZXRhaWxzIEkgdGhpbmsgdGhhdCBjb252ZXJ0aW5nIHRoZSBN
VEQKPiBwYXJ0aXRpb25pbmcgY29kZSBpbnRvIE5WTUVNIHBhcnRpdGlvbmluZyBjb2RlIGlzIGEg
YmlnZ2VyIHRhc2suIEFzIHlvdQo+IHNhaWQgYmVsb3cgdGhlcmUgYXJlIG1hbnkgbGVnYWN5IGNv
ZGUgcGF0aHMgeW91IG5lZWQgdG8gY29uc2lkZXIgc28gdGhleQo+IHN0aWxsIHdvcmsgYWZ0ZXJ3
YXJkcyBhcyB3ZWxsLgo+IAo+ID4gdXN1YWxseSBFRVBST01zIGRvbid0IHJlcXVpcmUgdmVyeSBh
ZHZhbmNlZCBwYXJ0aXRpb25pbmcgc2NoZW1lcywKPiA+IHVubGlrZSBmbGFzaGVzICh3aGljaCBh
cmUgdGhlIG1vc3QgY29tbW9uIE1URCBkZXZpY2VzIHRvZGF5KS4gIAo+IAo+IEFzIHNhaWQgaW4g
bXkgY292ZXIgbGV0dGVyIEVFUFJPTXMgY2FuIGJlY29tZSBxdWl0ZSBsYXJnZSBhbmQgTVRECj4g
c3VwcG9ydHMgcGFydGl0aW9uaW5nIHN0b3JhZ2UgZGV2aWNlcyB3aGljaCBpcyB2ZXJ5IGhhbmR5
IGZvciBsYXJnZQo+IEVFUFJPTXMgYXMgd2VsbC4KCkRpZCB5b3UgaGFkIGEgbG9vayBhdCBudm1l
bS1sYXlvdXRzID8gSW4gcGFydGljdWxhciB0aGUgZml4ZWQtbGF5b3V0LgoKSXMgdGhlcmUgYW55
dGhpbmcgeW91IHdvdWxkIGxpa2UgdG8gYWNoaWV2ZSBhbHJlYWR5IHRoYXQgaXMgbm90CnBvc3Np
YmxlIHdpdGggbnZtZW0gYnV0IGlzIHdpdGggbXRkPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
