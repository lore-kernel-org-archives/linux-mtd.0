Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917B5C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Oct 2022 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDPoo8Hw74f1SV9ienT7YAI1X07PEyZVzGK11nr8330=; b=kbkV34G7IAec6M
	ObIvA6U6/JipFQ5wNj8eGJcRt0w8SVLPyCd4HVnyHN1tHi7jUN7++mxnEJqKPk68dmIu545dpfPIo
	inzFYxD9VF94QtcmbjPueBTGgR9/Uls8SocLPl/w1tZSz1jPb42Hj+F1lk63eI7XAto3oTG9ma3MF
	7Jw6pc7WpTf2Uvj43vgh1AW/Hjur0dnBrfV7II0FmTNQQJnN2V3AKkK+sYAVUF+Vm3VGniEtvNF0G
	9i8mSxayfnPnVpqJWuMMQouoktBGHR8qzqGEYZDB+UG7c+GsS8VGBeo1QIoGMukcTJsw/mhDmPXjB
	GQ0Ti1zXWclXeyquNnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPjp-00BXTu-F4; Thu, 20 Oct 2022 07:13:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPjl-00BXRX-JY; Thu, 20 Oct 2022 07:13:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2050461A2B;
	Thu, 20 Oct 2022 07:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6806C433D6;
	Thu, 20 Oct 2022 07:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666249983;
	bh=DWD/+a3tWspqd9R6eZBRIia+z4497qxbwbDyZj76oLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMsAEFVD9WkedPvZ+l9oQhe6aKnlJ5QLEE/RAQL9Hdcc42aiZpvKQTxC305JfTGC7
	 HIiBFiyvAsNadm37u8Hfx9NL0Nj1ovVYawfZFWjT1jHyBqLcaoEzE81tld4QRTQcRq
	 1sNrMwbOaEFU4cFBzyCu2yq8+QF/+T8uUuezBvAaVCLvMo+hQZNXbbrO5Bt1qnKPOA
	 g4FpFI4xvJ0seaFCmivcPDcVBVicUidY1B3W/JQo0AkYB93UbthGLj9zxp5tjjv3bX
	 WHNv0zjG+ItGUccu+GqbSLjLpERRSZOjraiWPPAD9FrnYnJaB7fbLDBRWdnEJDSzbh
	 r1FvJA9rT3QGg==
Date: Thu, 20 Oct 2022 08:12:50 +0100
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	stern@rowland.harvard.edu, alexandre.belloni@bootlin.com,
	brgl@bgdev.pl, damien.lemoal@opensource.wdc.com,
	dmitry.torokhov@gmail.com, linux@dominikbrodowski.net,
	balbi@kernel.org, gregkh@linuxfoundation.org, deller@gmx.de,
	perex@perex.cz, jingoohan1@gmail.com, kernel@wantstofly.org,
	lgirdwood@gmail.com, linus.walleij@linaro.org,
	marek.vasut@gmail.com, broonie@kernel.org, mkpetch@internode.on.net,
	miquel.raynal@bootlin.com, lost.distance@yahoo.com,
	philipp.zabel@gmail.com, linux@armlinux.org.uk, sre@kernel.org,
	slapin@ossfans.org, s.shtylyov@omp.ru, sudipm.mukherjee@gmail.com,
	tiwai@suse.com, ulf.hansson@linaro.org, vigneshr@ti.com,
	viresh.kumar@linaro.org, wsa+renesas@sang-engineering.com,
	linux-pm@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
	patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
Message-ID: <Y1D08tpbdE52x7hN@google.com>
References: <20221019161831.3864786-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019161831.3864786-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_001305_767224_74DCEA96 
X-CRM114-Status: GOOD (  22.56  )
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

T24gV2VkLCAxOSBPY3QgMjAyMiwgQXJuZCBCZXJnbWFubiB3cm90ZToKCj4gRnJvbTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBNb3N0IG9mIHRoZSBsZWdhY3kgUFhBIGJvYXJk
IGZpbGVzIHdlcmUgbWFya2VkIGFzIHVudXNlZCBpbiBsaW51eC01LjE5IGFuZAo+IGNhbiBnZXQg
cmVtb3ZlZCBpbiBsaW51eC02LjIuIFRoZXJlIGlzIHN1cHBvcnQgZm9yIHB4YTI1MC9weGEyNzAv
cHhhMzAwCj4gdXNpbmcgZGV2aWNldHJlZSBhbHJlYWR5LCB3aGljaCBzdXBwb3J0cyBhIG51bWJl
ciBvZiBib2FyZHMsIGJ1dCBwcm9ncmVzcwo+IG9uIGNvbnZlcnRpbmcgdGhlIHJlbWFpbmluZyBv
bmVzIGhhcyBzdGFsbGVkIG92ZXIgdGhlIHBhc3QgZmV3IHllYXJzLgo+IAo+IFRoZSB0d28gYm9h
cmRzIHRoYXQgYXJlIGxlZnQgaW4gdGhlIHRyZWUgZm9yIG5vdyBhcmUgdGhlIHRocmVlICdzaGFy
cHNsJwo+IHZhcmlhbnRzIChzcGl0ei9ha2l0YS9ib3J6b2kpIGFuZCB0aGUgJ2d1bXN0aXgnIGZh
bWlseSBvZiBtYWNoaW5lcy4KPiBCb3RoIG9mIHRoZXNlIGFyZSBzdXBwb3J0ZWQgYnkgcWVtdSwg
d2hpY2ggY2FuIGJlIGhlbHBmdWwgZm9yIGNvbXBsZXRpbmcKPiB0aGUgRFQgY29udmVyc2lvbi4K
PiAKPiBPbmx5IFBYQTI1eCBhbmQgUFhBMjd4IGFyZSBsZWZ0IHdpdGggZnVsbCBib2FyZGZpbGUg
c3VwcG9ydCwgc28gUFhBMzAwCj4gY2FuIGdldCBhIGxvdCBzaW1wbGVyIHdoaWxlIHN0aWxsIHdv
cmtpbmcgd2l0aCBEVCwgYW5kIFBYQTMxMC8zMjAvOTN4Cj4gY2FuIGJlIHJlbW92ZWQgZW50aXJl
bHkuCj4gCj4gQSBnb29kIG51bWJlciBvZiBkcml2ZXJzIGJlY29tZSBpbXBvc3NpYmxlIHRvIHNl
bGVjdCBhZnRlciB0aGlzLCBzbwo+IGVhY2ggb2YgdGhlc2UgYWxzbyBnZXQgZHJvcHBlZC4gSSdt
IGluY2x1ZGluZyB0aGUgZHJpdmVyIHBhdGNoZXMgaW4gdGhlCj4gc2VyaWVzIGhlcmUgYW5kIGNh
biBlaXRoZXIgbWVyZ2UgdGhlbSB0aHJvdWdoIHRoZSBzb2MgdHJlZSwgb3IgdGhleQo+IGNhbiBn
ZXQgcGlja2VkIHVwIGJ5IHRoZSBpbmRpdmlkdWFsIHN1YnN5c3RlbSBtYWludGFpbmVycy4gU2lu
Y2UgYm90aAo+IHRoZSBwbGF0Zm9ybSBhbmQgdGhlIGRyaXZlcnMgZ2V0IHJlbW92ZWQsIHRoZSBv
cmRlciBzaG91bGQgbm90IG1hdHRlci4KPiAKPiBOb3RlIHRoYXQgdGhlIHBhdGNoZXMgaGVyZSBh
cmUgZ2VuZXJhdGVkIHdpdGggJ2dpdCBmb3JtYXQtcGF0Y2ggLUQnCj4gYW5kIGRvbid0IGNvbnRh
aW4gdGhlIGNvbnRlbnRzIG9mIHJlbW92ZWQgZmlsZXMgYmVjYXVzZSBvZiB0aGUKPiBzaWduaWZp
Y2FudCBzaXplICh0aGUgZmlyc3QgcGF0Y2ggaXMgY2xvc2UgdG8gYSBtZWdhYnl0ZSkuCj4gCj4g
QXJuZCBCZXJnbWFubiAoMzApOgo+ICAgQVJNOiBweGE6IHJlbW92ZSB1bnVzZWQgYm9hcmQgZmls
ZXMKPiAgIEFSTTogcHhhOiByZW1vdmUgaXJkYSBsZWZ0b3Zlcgo+ICAgQVJNOiBweGE6IHJlbW92
ZSB1bnVzZWQgcHhhM3h4LXVscGkKPiAgIEFSTTogcHhhOiBkcm9wIHB4YTMxMC9weGEzMjAvcHhh
OTN4IHN1cHBvcnQKPiAgIEFSTTogcHhhOiBwcnVuZSB1bnVzZWQgZGV2aWNlIHN1cHBvcnQKPiAg
IHBvd2VyOiByZW1vdmUgejJfYmF0dGVyeSBkcml2ZXIKPiAgIHBvd2VyOiByZW1vdmUgdG9zYV9i
YXR0ZXJ5IGRyaXZlcgo+ICAgYXRhOiByZW1vdmUgcGFsbWxkIHBhdGEgZHJpdmVyCj4gICBiYWNr
bGlnaHQ6IHJlbW92ZSBweGEgdG9zYSBzdXBwb3J0Cj4gICBpbnB1dDogcmVtb3ZlIHB4YTkzMF90
cmtiYWxsIGRyaXZlcgo+ICAgaW5wdXQ6IHJlbW92ZSBweGE5MzBfcm90YXJ5IGtleWJvYXJkIGRy
aXZlcgo+ICAgaW5wdXQ6IHJlbW92ZSB6eWxvbml0ZSB0b3VjaHNjcmVlbiBkcml2ZXIKPiAgIHBj
bWNpYTogcmVtb3ZlIHVudXNlZCBweGEvc2ExMTAwIGRyaXZlcnMKPiAgIEFTb0M6IHB4YTogcmVt
b3ZlIHVudXNlZCBib2FyZCBzdXBwb3J0Cj4gICBBTFNBOiByZW1vdmUgYWM5NyBidXMgc3VwcG9y
dAo+ICAgbWZkOiByZW1vdmUgd205N3h4IGRyaXZlcgo+ICAgaW5wdXQ6IHJlbW92ZSB3bTk3eHgg
c3VwcG9ydAo+ICAgcGFycG9ydDogcmVtb3ZlIGF4ODg3OTYgZHJpdmVyCj4gICBwb3dlcjogcmVt
b3ZlIHBkYV9wb3dlciBzdXBwbHkgZHJpdmVyCj4gICBydGM6IHJlbW92ZSB2MzAyMCBkcml2ZXIK
PiAgIG1mZDogcmVtb3ZlIHRvc2hpYmEgdG1pbyBkcml2ZXJzCj4gICBtZmQ6IHJlbW92ZSB1Y2Ix
NDAwIHN1cHBvcnQKPiAgIG10ZDogcmVtb3ZlIHRtaW9fbmFuZCBkcml2ZXIKPiAgIG1tYzogcmVt
b3ZlIHRtaW9fbW1jIGRyaXZlcgo+ICAgZmJkZXY6IHJlbW92ZSB0bWlvZmIgZHJpdmVyCj4gICBm
YmRldjogcmVtb3ZlIHcxMDBmYiBkcml2ZXIKPiAgIGxlZHM6IHJlbW92ZSBhc2ljMyBkcml2ZXIK
PiAgIHVzYjogcmVtb3ZlIG9oY2ktdG1pbyBkcml2ZXIKPiAgIHcxOiByZW1vdmUgZHMxd20gZHJp
dmVyCj4gICBtZmQ6IHJlbW92ZSBodGMtcGFzaWMzIGRyaXZlcgoKQXJlIHlvdSBzdXJlIHRoZXNl
IHdlbnQgb3V0PwoKVGhleSBkbyBub3QgYXBwZWFyIHRvIGJlIGluIG15IGluYm94LCBub3IgbG9y
ZS4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
