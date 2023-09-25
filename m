Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1EACE7A8C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 07:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aMCYSA1zh9WYBa2cifiAtkM1FtWOUUCrS1ioDixNJo=; b=MTUXAzd2STLWoC
	U5enU2dVYjxtLC8jlAraYmVwrtjASQSRFMnjNN2KbEyf3gnUwi5FPdEwuxO7/dMyowDK9xuXM2Ie0
	tpLMdYRzrtaXXUlaoB3GGzmC6WEOMY4cqoZNWEjEpOXncyrQ2RQQDTXy7CBuf9i8oDJ8DgEXd8LTP
	CPr1ekPh/d9vcEZ0SVSMnXJMRr2jmquY/VyxMDkHr2K9iT6it06zBcQa4L9eN2RaWXYL7VdEsqyLo
	xG66IwO13GZnDjYulSQJthDWX8mZnIAIzp+i1VO6DQ5KP0OFIPgh59Jl5sql5dcSuA5FVAJuIBm5h
	KM0koVZgcOzSlDBl5JEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkfkp-00DWZN-1x;
	Mon, 25 Sep 2023 07:11:39 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkfkk-00DWYp-23;
	Mon, 25 Sep 2023 07:11:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABFB31C0009;
	Mon, 25 Sep 2023 07:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695625888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26b231nqCTW8YDmT+k7imAl/79DNcgXu5bn48KEqLfw=;
	b=YRwCKHNBWwQ1FkvaWVZ/Og+/mmFqwxLmWm2f3iKU1+p1xFst5DGy+XnneU44A9RrjA3rdg
	Azus39eWfnwxy8U2CZv2jAH2XzDpT5cL0cAeatZKCjXfpaHt37LkBNDc6D4y+U0amFOwO+
	Wz3ubnrtPFXFT51WV7uyVWlSZ+CLcKdPiqrR39Tmev8eTSl3cUycwiP21pIHIfKpU5hxAs
	Tlo7aw+7+U3cKugIdfFU1cR697vD7Ymc4/7wNi0ukIWN1L1hg3KDkT+DCd77+hUQD02ZQk
	68yf2yVVFqd5CGFbldFY4WeP+EyBQkg3hbAjHwJvrIZsiyAAJV94buF5YZ22nA==
Date: Mon, 25 Sep 2023 09:11:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-mips@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/6] mtd: parsers: ar7: remove support
Message-ID: <20230925091125.299caa92@xps-13>
In-Reply-To: <52ba27b9-79d5-f9cc-450f-fe831e65769a@linaro.org>
References: <20230922061530.3121-1-wsa+renesas@sang-engineering.com>
	<20230922061530.3121-3-wsa+renesas@sang-engineering.com>
	<20230922163903.3f49ea2a@xps-13>
	<ZQ3VA/2pAC3Do1Xd@ninjato>
	<52ba27b9-79d5-f9cc-450f-fe831e65769a@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_001134_970000_25653FA0 
X-CRM114-Status: GOOD (  17.77  )
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

SGksCgpwaGlsbWRAbGluYXJvLm9yZyB3cm90ZSBvbiBGcmksIDIyIFNlcCAyMDIzIDIwOjM1OjE2
ICswMjAwOgoKPiBPbiAyMi85LzIzIDE5OjU1LCBXb2xmcmFtIFNhbmcgd3JvdGU6Cj4gPiAgIAo+
ID4+IEknbSBub3Qgc3VyZSBpdCBpcyB3aXNlIHRvIG1lcmdlIGRlZmNvbmZpZyBjaGFuZ2VzIHRo
cm91Z2ggbXRkLiBXb3VsZAo+ID4+IHlvdSBtaW5kIHNlbmRpbmcgdGhpcyBjaGFuZ2UgYXNpZGUg
dG8gYXZvaWQgcG90ZW50aWFsIGNvbmZsaWN0cz8gRWFjaAo+ID4+IHBhdGNoIGNhbiBsaXZlIG9u
IHRoZWlyIG93biBhbnl3YXkuICAKPiA+IAo+ID4gWXVwLCBJIGNhbiBzZW5kIGEgc2VwZXJhdGUg
cGF0Y2ggZm9yIGl0Lgo+ID4gICAKPiA+Pj4gICBkcml2ZXJzL210ZC9wYXJzZXJzL0tjb25maWcg
ICAgfCAgIDUgLS0KPiA+Pj4gICBkcml2ZXJzL210ZC9wYXJzZXJzL01ha2VmaWxlICAgfCAgIDEg
LQo+ID4+PiAgIGRyaXZlcnMvbXRkL3BhcnNlcnMvYXI3cGFydC5jICB8IDEyOSAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gIAo+ID4+Cj4gPj4gRG8geW91IGhhdmUgb3RoZXIgY2hh
bmdlcyByZWxhdGVkIHRvIHRoaXMgZmlsZSBpbiB5b3VyIHRyZWU/IEl0IGZhaWxlZAo+ID4+IHRv
IGFwcGx5IG9uIG15IHNpZGUuICAKPiA+IAo+ID4gTm8gY2hhbmdlLiBQbGFpbiB2Ni42LXJjMi4g
SSB1c2VkICItLWlycmV2ZXJzaWJsZS1kZWxldGUiLCB0aG91Z2guIE1heWJlCj4gPiB0aGlzIGlz
IGNhdXNpbmcgaXNzdWVzPyBBcyBJIHN0YXRlZCBpbiB0aGUgY292ZXItbGV0dGVyLCBJIHdvbmRl
ciBpZiBhbGwKPiA+IHRoaXMgc2hvdWxkIGdvIHZpYSBNSVBTLiBCdXQgdGhlcmUgaGFzbid0IGJl
ZW4gYW55IGRpc2N1c3Npb24gYWJvdXQgaXQKPiA+IHlldC4gIAo+IAo+IE1JUFMgdHJlZSBmb3Ig
dGhlIHdob2xlIHNlcmllcyBjZXJ0YWlubHkgbWFrZXMgc2Vuc2UuCgpUaGVuOgoKQWNrZWQtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
