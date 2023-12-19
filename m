Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD76DC41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzHjNErQaLcrAOFMEDkY2g3Gpn4TCY15MnP00MWOfM4=; b=eVFnD9q52qD6uD
	zflHs1nJNjzEZ2V004IutUoa6YSniL74ey6N/X1LiGujA4gE4sA4k2omHiCLz8oY7JjXIO+LTWxe/
	UmgHiaylBAyyJv8MYkFLObnA4UvOVAqa52UrXdlLNyl6w5SlLQv+NytyK96HJL/fEU89QzrvxMrWm
	jiQd1Qo7mj0MhJWXeRJUoY9G5ClXniYd8WwmKqwG3D5prI7EmgKN+YH91xNN2e00a7DDWGki9MawE
	I8dq8NegEq6a6WTAQ3zTkTS2MEGtJrBfXllEdw0auiG5sfWVpUGSFegRHWRs8nSKRmsCF2icQDpij
	MqbFYqT/mjPRp8uNbdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFVDO-00DGOt-2H;
	Tue, 19 Dec 2023 08:12:34 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFVDL-00DGNg-1H;
	Tue, 19 Dec 2023 08:12:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDF98240012;
	Tue, 19 Dec 2023 08:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702973546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQdUFyLeNJUwSBurp25+RwofnZarRLxRivzumNAHgLw=;
	b=RD2CkaEn/GG9QxTYaa0dWcy6UlNPS5YXoBiXAWMwaFltIhdneTFchqmrllZwjquGRNKBVa
	RXLuk1LY9NtnuMY1sO0q+3L2JgQlQ09b5tLMWEt4p+CEtsIfVeVzh2hxDWq3QaW14DcVua
	G3RM5wdEOZp7SLHR8Ii0LoF3LlEFi83qaccyzXfivV8ed0QDu9QeeAEGNjHl6GYFM3EAV4
	/+AjQM0KUdsxQYFB31hCcqXvoJxXbCB8PO2C7Oh5Y9lcaN40/ZoI8EQCTt1zbeaWhkB420
	QyYheZGGYiPCpEW7xplaotEH62ULXemTci1tXDqN5+q+R078QgB5ux51ARZ/0g==
Date: Tue, 19 Dec 2023 09:12:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, pratyush
 <pratyush@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 sbinding@opensource.cirrus.com, Lee Jones <lee@kernel.org>, james schulman
 <james.schulman@cirrus.com>, david rhodes <david.rhodes@cirrus.com>,
 rf@opensource.cirrus.com, Jaroslav Kysela <perex@perex.cz>, tiwai@suse.com,
 linux-spi <linux-spi@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Michael Walle <michael@walle.cc>, linux-mtd
 <linux-mtd@lists.infradead.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 michal simek <michal.simek@amd.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, alsa-devel
 <alsa-devel@alsa-project.org>, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 00/10] spi: Add support for stacked/parallel
 memories
Message-ID: <20231219091221.30b1f167@xps-13>
In-Reply-To: <1953466568.133535.1702937420979.JavaMail.zimbra@nod.at>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
	<1953466568.133535.1702937420979.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_001231_725361_7FA9A60D 
X-CRM114-Status: GOOD (  17.62  )
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

SGkgUmljaGFyZCwKCnJpY2hhcmRAbm9kLmF0IHdyb3RlIG9uIE1vbiwgMTggRGVjIDIwMjMgMjM6
MTA6MjAgKzAxMDAgKENFVCk6Cgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiA+
IFZvbjogIkFtaXQgS3VtYXIgTWFoYXBhdHJhIiA8YW1pdC5rdW1hci1tYWhhcGF0cmFAYW1kLmNv
bT4gIAo+IAo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgdXBkYXRlZCB0aGUgc3BpLW5vciwgc3BpIGNv
cmUgYW5kIHRoZSBBTUQtWGlsaW54IEdRU1BJCj4gPiBkcml2ZXIgdG8gYWRkIHN0YWNrZWQgYW5k
IHBhcmFsbGVsIG1lbW9yaWVzIHN1cHBvcnQuICAKPiAKPiBJIHdpc2ggdGhlIHNlcmllcyBoYWQg
YSByZWFsIGNvdmVyIGxldHRlciB3aGljaCBleHBsYWlucyB0aGUgYmlnIHBpY3R1cmUKPiBpbiBt
b3JlIGRldGFpbC4KPiAKPiBXaGF0IEkgZGlkbid0IHJlYWxseSBnZXQgc28gZmFyLCBpcyBpdCBy
ZWFsbHkgbmVjZXNzYXJ5IHRvIHN1cHBvcnQgbXVsdGlwbGUKPiBjaGlwIHNlbGVjdHMgd2l0aGlu
IGEgc2luZ2xlIG10ZD8KPiBZb3UgY2hhbmdlcyBpbnRyb2R1Y2UgaGFyZCB0byBtYWludGFpbiBj
aGFuZ2VzIGludG8gdGhlIHNwaS1ub3IvbXRkIGNvcmUgY29kZQo+IHdoaWNoIGFsZXJ0IG1lLgo+
IFdoeSBjYW4ndCB3ZSBoYXZlIG9uZSBtdGQgZm9yIGVhY2ggY3MgYW5kLCBpZiBuZWVkZWQsIGNv
bWJpbmUgdGhlbSBsYXRlcj8KPiBXZSBoYXZlIGRyaXZlcnMgc3VjaCBhcyBtdGRjb25jYXQgZm9y
IHJlYXNvbnMuCgpUaGUgWGlsaW54IFNQSSBjb250cm9sbGVyIGlzIGEgYml0IGNvbnZvbHV0ZWQs
IHRoZXJlIGFyZSB0d28gd2F5cyB0bwphZGRyZXNzIHRoZSBiaXRzIGluIGEgbWVtb3J5OgoqIEVp
dGhlciB5b3VyIGV4dGVuZCB0aGUgbWVtb3J5IHJhbmdlIHdpdGggdGhlIHNlY29uZCBjaGlwICJv
bgogIHRvcCIgb2YgdGhlIGZpcnN0ICh3aGljaCB3b3VsZCB0eXBpY2FsbHkgYmUgYSBtdGQtY29u
Y2F0IHVzZSBjYXNlKQoqIE9yIHlvdSB1c2UgdGhlIHR3byBjaGlwcyBpbiBwYXJhbGxlbCBhbmQg
eW91IHN0b3JlIHRoZSBldmVuIGJpdHMKICBpbiBvbmUgZGV2aWNlIChsZXQncyBzYXkgY3MwKSBh
bmQgdGhlIG9kZCBiaXRzIGluIHRoZSBvdGhlciAoY3MxKS4KICBFeHRlbmRpbmcgbXRkLWNvbmNh
dCBmb3IgdGhpcyBtaWdodCBiZSBhbm90aGVyIHNvbHV0aW9uLCBJIGRvbid0IGtub3cKICBob3cg
ZmVhc2libGUgaXQgd291bGQgYmUuCgpNYXliZSB0aGVzZSBiaW5kaW5ncyB3aWxsIGhlbHAgdW5k
ZXJzdGFuZGluZyB0aGUgbG9naWM6CmUyZWRkMWI2NGYxYyAoInNwaTogZHQtYmluZGluZ3M6IERl
c2NyaWJlIHN0YWNrZWQvcGFyYWxsZWwgbWVtb3JpZXMgbW9kZXMiKQplYmE1MzY4NTAzYjQgKCJz
cGk6IGR0LWJpbmRpbmdzOiBBZGQgYW4gZXhhbXBsZSB3aXRoIHR3byBzdGFja2VkIGZsYXNoZXMi
KQoKSG93ZXZlciBJIGFncmVlIHRoZSBjaGFuZ2VzIHdpbGwgbGlrZWx5IGJlIGhhcmQgdG8gbWFp
bnRhaW4gZ2l2ZW4gdGhlCmNvbXBsZXhpdHkgYnJvdWdodCB3aXRoIHN1Y2ggYSBkaWZmZXJlbnQg
Y29udHJvbGxlci4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
