Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4406EC77B7A
	for <linux-mtd@archiver.kernel.org>; Fri, 26 May 2023 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbZFsEAi9Z2Fbjx8uzMDcmHBq00RpcHegxmcPRjDWWs=; b=xlKrPXggZZI7va
	xZM0eSehdi1tGShI1xCeOTxf2gI6KQc2AMkSaTZm1EjWU5og4PLskcvVzf2y0mCtKqJY4NjduaKSu
	zTzkXuhaiGFk2m10NCVGJCyFFrCDn7dgOO//sEq3xNvTLeFwzfH1k+gev20CnnfcRUup1Upch7RVg
	UMWN/dnlAL/+i8aVApa/QwpGILMQb3JA6847huLQDCxrfwxdwQ84aOBlCbhQVMv2S3PHhtb+/efgg
	HPPASLQtURCygG9jlp6ELS82KX1H1m+PhFhIJ3qVa/RdVF/xPLU7tLYZYCKy/I2bmVxvC/fSb2bBn
	pDvbtj6xHkzYtaWmqo5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2awF-003Ewr-2T;
	Fri, 26 May 2023 17:09:15 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2awB-003Eve-0l;
	Fri, 26 May 2023 17:09:12 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685120948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mdi3+7iY1FuuVZkTHEgLzoKSqhn5EptZQCzuKXVDC0s=;
	b=ZtKAWITht2MZsPftTNyQR0rssOpfR0x0RkKpyVvkGXiNJijisFlfgOqCuq/mhPJtyz5Ror
	uRm31TWwLlCyu95bUA/IWD5Xdlxq+UBmuwB5dRL9pGUc/rSbm8Hw0/nz6tm6YLkVvfWPST
	VYEsq1Va1Qg7/9FKOmqfUqUOs17k4nlWHKEuMYLTOxBf1UPqoC8JxLfXSTr/4MiSRUJ+hk
	xIaINAqGLNijTwq1cHYzwTC8Kl0A3r5Qo5r1B33RoUnd5YRag6V+HosxwW8cVZulf/TS9l
	8i8kYjkmP/ltSzYPzSnJRO19FGBSFMlaezoILrh/gXrhKzAaCUT+gMbrSjsqAA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A77D41BF204;
	Fri, 26 May 2023 17:09:06 +0000 (UTC)
Date: Fri, 26 May 2023 19:09:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/5] mtd: rawnand: meson: always read whole OOB bytes
Message-ID: <20230526190905.1d5a3821@xps-13>
In-Reply-To: <84a2e0c4-cc6f-1743-ee93-c13bc8bf09f1@sberdevices.ru>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
	<20230515094440.3552094-4-AVKrasnov@sberdevices.ru>
	<20230522173813.08afe6b8@xps-13>
	<84a2e0c4-cc6f-1743-ee93-c13bc8bf09f1@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_100911_560888_56E0D24E 
X-CRM114-Status: GOOD (  25.43  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDIzIE1h
eSAyMDIzIDIwOjI3OjM1ICswMzAwOgoKPiBPbiAyMi4wNS4yMDIzIDE4OjM4LCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+ID4gSGkgQXJzZW5peSwKPiA+IAo+ID4gQVZLcmFzbm92QHNiZXJkZXZpY2Vz
LnJ1IHdyb3RlIG9uIE1vbiwgMTUgTWF5IDIwMjMgMTI6NDQ6MzcgKzAzMDA6Cj4gPiAgIAo+ID4+
IFRoaXMgY2hhbmdlcyBzaXplIG9mIHJlYWQgYWNjZXNzIHRvIE9PQiBhcmVhIGJ5IHJlYWRpbmcg
YWxsIGJ5dGVzIG9mCj4gPj4gT09CIChmcmVlIGJ5dGVzICsgRUNDIGVuZ2luZSBieXRlcykuICAK
PiA+IAo+ID4gVGhpcyBpcyBub3JtYWxseSB1cCB0byB0aGUgdXNlciAodXNlciBpbiB5b3VyIGNh
c2UgPT0gamZmczIpLiBUaGUKPiA+IGNvbnRyb2xsZXIgZHJpdmVyIHNob3VsZCBleHBvc2UgYSBu
dW1iZXIgb2YgdXNlciBhY2Nlc3NpYmxlIGJ5dGVzIGFuZAo+ID4gdGhlbiB3aGVuIHVzZXJzIHdh
bnQgdGhlIE9PQiBhcmVhLCB0aGV5IHNob3VsZCBhY2Nlc3MgaXQgZW50aXJlbHkuIE9uCj4gPiB0
b3Agb2YgdGhhdCByZWFkLCB0aGV5IGNhbiBleHRyYWN0IChvciAid3JpdGUgb25seSIpIHRoZSB1
c2VyIGJ5dGVzLiAgCj4gCj4gU29ycnksIEkgZGlkbid0IGdldCBpdC4gSWYgZHJpdmVyIGV4cG9z
ZXMgTiBieXRlcyBvZiB1c2VyIGFjY2Vzc2libGUgYnl0ZXMsCj4gSSBtdXN0IGFsd2F5cyByZXR1
cm4gd2hvbGUgT09CIHllcz8gRS5nLiBOICsgcmVzdCBvZiBPT0IKClllcy4gQXQgdGhlIE5BTkQg
Y29udHJvbGxlciBsZXZlbCwgeW91IGdldCBhc2tlZCBmb3IgZWl0aGVyIGEgcGFnZSBvZgpkYXRh
IChzb21ldGltZXMgYSBzdWJwYWdlLCBidXQgd2hhdGV2ZXIpLCBhbmQvb3IgdGhlIG9vYiBhcmVh
LiBZb3UgbmVlZAp0byBwcm92aWRlIHdoYXQgaXMgcmVxdWVzdGVkLCBubyBtb3JlLCBubyBsZXNz
LiBUaGUgdXBwZXIgbGF5ZXJzIHdpbGwKdHJpbSBkb3duIHdoYXQncyB1bmVlZGVkIGFuZCBleHRy
YWN0IHRoZSBieXRlcyB0aGV5IHdhbnQuCgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jh
c25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+ID4+IC0tLQo+ID4+ICBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiA+
PiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9tZXNvbl9uYW5kLmMKPiA+PiBpbmRleCA4NTI2YTZiODc3MjAuLmEzMTEwNmM5NDNkNyAxMDA2
NDQKPiA+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+PiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+PiBAQCAtNzU1LDYgKzc1NSwz
MCBAQCBzdGF0aWMgaW50IF9fbWVzb25fbmZjX3JlYWRfb29iKHN0cnVjdCBuYW5kX2NoaXAgKm5h
bmQsIGludCBwYWdlLAo+ID4+ICAJdTMyIG9vYl9ieXRlczsKPiA+PiAgCXUzMiBwYWdlX3NpemU7
Cj4gPj4gIAlpbnQgcmV0Owo+ID4+ICsJaW50IGk7Cj4gPj4gKwo+ID4+ICsJLyogUmVhZCBFQ0Mg
Y29kZXMgYW5kIHVzZXIgYnl0ZXMuICovCj4gPj4gKwlmb3IgKGkgPSAwOyBpIDwgbmFuZC0+ZWNj
LnN0ZXBzOyBpKyspIHsKPiA+PiArCQl1MzIgZWNjX29mZnMgPSBuYW5kLT5lY2Muc2l6ZSAqIChp
ICsgMSkgKwo+ID4+ICsJCQkgICAgICAgTkZDX09PQl9QRVJfRUNDKG5hbmQpICogaTsKPiA+PiAr
Cj4gPj4gKwkJcmV0ID0gbmFuZF9yZWFkX3BhZ2Vfb3AobmFuZCwgcGFnZSwgMCwgTlVMTCwgMCk7
Cj4gPj4gKwkJaWYgKHJldCkKPiA+PiArCQkJcmV0dXJuIHJldDsKPiA+PiArCj4gPj4gKwkJLyog
VXNlIHRlbXBvcmFyeSBidWZmZXIsIGJlY2F1c2UgJ25hbmRfY2hhbmdlX3JlYWRfY29sdW1uX29w
KCknCj4gPj4gKwkJICogc2VlbXMgd29yayB3aXRoIHNvbWUgYWxpZ25tZW50LCBzbyB3ZSBjYW4n
dCByZWFkIGRhdGEgdG8KPiA+PiArCQkgKiAnb29iX2J1ZicgZGlyZWN0bHkuICAKPiA+IAo+ID4g
RE1BPyAgCj4gCj4gWWVzIEkgZ3Vlc3MsIHRoaXMgYWRkcmVzcyBwYXNzZWQgdG8gZXhlY19vcCBj
b2RlIGFuZCB1c2VkIGFzIERNQS4KCklmIHlvdXIgY29udHJvbGxlciB1c2VzIERNQSBvbiBleGVj
X29wIGFjY2Vzc2VzLCB0aGVuIHllcy4gRXhlY19vcApyZWFkcy93cml0ZXMgYXJlIHVzdWFsbHkg
c21hbGwgZW5vdWdoIChvciBub3QgdGltZSBzZW5zaXRpdmUgYXQgYWxsIGlmCnRoZXkgYXJlIGJp
Z2dlcikgc28gaXQncyBub3QgcmVxdWlyZWQgdG8gdXNlIERNQSB0aGVyZS4gQW55aG93LCBvb2Jf
YnVmCmlzIHN1aXRhYmxlIGZvciBETUEgcHVycG9zZXMsIHNvIEknbSBhIGJpdCBzdXJwcmlzZWQg
eW91IG5lZWQgYSBib3VuY2UKYnVmZmVyLCBpZiB0aGF0J3MgdGhlIG9ubHkgcmVhc29uLiBNYXli
ZSB5b3UgbmVlZCBhIGJvdW5jZSBidWZmZXIgdG8KcmVvcmdhbml6ZSB0aGUgZGF0YS4gVGhhdCB3
b3VsZCBiZSBhIG11Y2ggYmV0dGVyIGV4cGxhbmF0aW9uLgoKPiA+PiArCQkgKi8KPiA+PiArCQly
ZXQgPSBuYW5kX2NoYW5nZV9yZWFkX2NvbHVtbl9vcChuYW5kLCBlY2Nfb2ZmcywgbWVzb25fY2hp
cC0+b29iX2J1ZiwKPiA+PiArCQkJCQkJIE5GQ19PT0JfUEVSX0VDQyhuYW5kKSwgZmFsc2UpOwo+
ID4+ICsJCWlmIChyZXQpCj4gPj4gKwkJCXJldHVybiByZXQ7Cj4gPj4gKwo+ID4+ICsJCW1lbWNw
eShvb2JfYnVmICsgaSAqIE5GQ19PT0JfUEVSX0VDQyhuYW5kKSwKPiA+PiArCQkgICAgICAgbWVz
b25fY2hpcC0+b29iX2J1ZiwKPiA+PiArCQkgICAgICAgTkZDX09PQl9QRVJfRUNDKG5hbmQpKTsK
PiA+PiArCX0KPiA+PiAgCj4gPj4gIAlvb2JfYnl0ZXMgPSBtZXNvbl9uZmNfZ2V0X29vYl9ieXRl
cyhuYW5kKTsKPiA+PiAgICAKPiA+IAo+ID4gCj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsICAKPiAK
PiBUaGFua3MsIEFyc2VuaXkKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
