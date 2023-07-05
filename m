Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E8AEB64DD
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Okzer5Y7cnIeNo2jiTdq7Ewd5u3ncwICWrkqzWDGz8Y=; b=fmzWRlKg3+jgqc
	GbvwpOh4T7HzT4qwFvdwq5IcFWHuKVlg6zMKkCXupxTt28ECV187w01IzuaVm61Y4Oy7odvxt72Gk
	hr3/Q/crU+aeofL4ll1sp/9zgwJ98P3hZ0sE/a6tOaUeSFm0RyVn+KWN91y2kEJkHvXTl93mI9jjU
	PNFe63tKIaxfvJb015CphWVMnvy0DzfXAlLUx6WfM9ZkBpMJczh69EQU4NqsmWO8Pzvrd5tj/JNFZ
	tPMgRk6pT5ABwfOkz4kDrXxkJQWPLIjgPZxrawI3a2cLRDCnuNSlO6UGJb1N3wS2F1wNx2Se0zd8o
	29GDOt7RcETbR0UaxRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwbc-00EzlN-2x;
	Wed, 05 Jul 2023 07:07:16 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwbY-00EziW-2D;
	Wed, 05 Jul 2023 07:07:14 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688540826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4xHf+sc8Y2BweoyFrc66CDtYOy0GEjOo0c54ioqoJxI=;
	b=L306DyHIWK20FJnSLQR5pvorUVvS/zh654OhhD6vOCmI8ePMnz+llp2KR/fphXBltNyn+5
	lFEhXDIeZJZ8fZZeZJEDo9E862qA9AuD1X/G24y3NAqAu9btqfxYQpkObA5qTQHOFW1GOZ
	a8eX0VnsAHl0lkp/g77Amu1NgIynFc26YkW1lRtr5N55DlU2U2RDPa+nTrSoD9LMoj/zij
	AGbo+S06vPKc9LAGopslFFhA1I1nPrKbu3CRRgB+3CiXwe5E2nY9wra1GoDYv+PBaqjx/3
	S4iiyiZHUd4MBo6w1XvoNTXT6WRKRG+Rl5uh6LK9j/+se8FSlTC72bl4XE8n+w==
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
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6318FF803;
	Wed,  5 Jul 2023 07:07:04 +0000 (UTC)
Date: Wed, 5 Jul 2023 09:07:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: meson: waiting w/o wired
 ready/busy pin
Message-ID: <20230705090703.15a59c37@xps-13>
In-Reply-To: <59246d83-7c4b-8b34-3173-71bdb698c2aa@sberdevices.ru>
References: <20230608044728.1328506-1-AVKrasnov@sberdevices.ru>
	<20230608044728.1328506-3-AVKrasnov@sberdevices.ru>
	<20230704144357.286281dc@xps-13>
	<47994f36-27d4-e5e4-73a9-6d4225671eec@sberdevices.ru>
	<20230704151220.67857861@xps-13>
	<73849b9c-0700-4946-84a2-428f98f0a6d6@sberdevices.ru>
	<59246d83-7c4b-8b34-3173-71bdb698c2aa@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_000713_018877_4C311788 
X-CRM114-Status: GOOD (  25.42  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDQgSnVs
IDIwMjMgMjA6MzI6MTMgKzAzMDA6Cgo+IE9uIDA0LjA3LjIwMjMgMTY6MDcsIEFyc2VuaXkgS3Jh
c25vdiB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAwNC4wNy4yMDIzIDE2OjEyLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOiAgCj4gPj4gSGkgQXJzZW5peSwKPiA+Pgo+ID4+IGF2a3Jhc25vdkBzYmVyZGV2
aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDQgSnVsIDIwMjMgMTU6NDY6MTggKzAzMDA6Cj4gPj4gIAo+
ID4+PiBPbiAwNC4wNy4yMDIzIDE1OjQzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+PiBI
aSBBcnNlbml5LAo+ID4+Pj4KPiA+Pj4+IEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBv
biBUaHUsIDggSnVuIDIwMjMgMDc6NDc6MjggKzAzMDA6Cj4gPj4+PiAgICAgCj4gPj4+Pj4gSWYg
dGhlcmUgaXMgbm8gd2lyZWQgcmVhZHkvYnVzeSBwaW4sIGNsYXNzaWMgd2F5IHRvIHdhaXQgZm9y
IGNvbW1hbmQKPiA+Pj4+PiBjb21wbGV0aW9uIGlzIHRvIHVzZSBmdW5jdGlvbiAnbmFuZF9zb2Z0
X3dhaXRyZHkoKScuIE1lc29uIE5BTkQgaGFzCj4gPj4+Pj4gc3BlY2lhbCBjb21tYW5kIHdoaWNo
IGFsbG93cyB0byB3YWl0IGZvciBOQU5EX1NUQVRVU19SRUFEWSBiaXQgd2l0aG91dAo+ID4+Pj4+
IHJlYWRpbmcgc3RhdHVzIGluIGEgc29mdHdhcmUgbG9vcCAoYXMgJ25hbmRfc29mdF93YWl0cmR5
KCknIGRvZXMpLiBUbwo+ID4+Pj4+IHVzZSBpdCBzZW5kIHRoaXMgY29tbWFuZCBhbG9uZyB3aXRo
IE5BTkRfQ01EX1NUQVRVUywgdGhlbiB3YWl0IGZvciBhbgo+ID4+Pj4+IGludGVycnVwdCwgYW5k
IGFmdGVyIGludGVycnVwdCBzZW5kIE5BTkRfQ01EX1JFQUQwLiBTbyB0aGlzIGZlYXR1cmUKPiA+
Pj4+PiBhbGxvd3MgdG8gdXNlIGludGVycnVwdCBkcml2ZW4gd2FpdGluZyB3aXRob3V0IHdpcmVk
IHJlYWR5L2J1c3kgcGluLgo+ID4+Pj4+Cj4gPj4+Pj4gU3VnZ2VzdGVkLWJ5OiBMaWFuZyBZYW5n
IDxsaWFuZy55YW5nQGFtbG9naWMuY29tPgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkg
S3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+ID4+Pj4+IC0tLQo+ID4+Pj4+ICBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA3NyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tCj4gPj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+ID4+Pj4+Cj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+
ID4+Pj4+IGluZGV4IDA3NGUxNDIyNWMwNi4uOWYwNWUxMTNiNGVhIDEwMDY0NAo+ID4+Pj4+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ID4+Pj4+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ID4+Pj4+IEBAIC0zOCw2ICszOCw3IEBACj4g
Pj4+Pj4gICNkZWZpbmUgTkZDX0NNRF9TQ1JBTUJMRVJfRElTQUJMRQkwCj4gPj4+Pj4gICNkZWZp
bmUgTkZDX0NNRF9TSE9SVE1PREVfRElTQUJMRQkwCj4gPj4+Pj4gICNkZWZpbmUgTkZDX0NNRF9S
Ql9JTlQJCUJJVCgxNCkKPiA+Pj4+PiArI2RlZmluZSBORkNfQ01EX1JCX0lOVF9OT19QSU4JKCgw
eGIgPDwgMTApIHwgQklUKDE4KSB8IEJJVCgxNikpCj4gPj4+Pj4gIAo+ID4+Pj4+ICAjZGVmaW5l
IE5GQ19DTURfR0VUX1NJWkUoeCkJKCgoeCkgPj4gMjIpICYgR0VOTUFTSyg0LCAwKSkKPiA+Pj4+
PiAgCj4gPj4+Pj4gQEAgLTE3OSw2ICsxODAsNyBAQCBzdHJ1Y3QgbWVzb25fbmZjIHsKPiA+Pj4+
PiAgCXUzMiBpbmZvX2J5dGVzOwo+ID4+Pj4+ICAKPiA+Pj4+PiAgCXVuc2lnbmVkIGxvbmcgYXNz
aWduZWRfY3M7Cj4gPj4+Pj4gKwlib29sIG5vX3JiX3BpbjsKPiA+Pj4+PiAgfTsKPiA+Pj4+PiAg
Cj4gPj4+Pj4gIGVudW0gewo+ID4+Pj4+IEBAIC0zOTIsNyArMzk0LDQyIEBAIHN0YXRpYyB2b2lk
IG1lc29uX25mY19zZXRfZGF0YV9vb2Ioc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiA+Pj4+PiAg
CX0KPiA+Pj4+PiAgfQo+ID4+Pj4+ICAKPiA+Pj4+PiAtc3RhdGljIGludCBtZXNvbl9uZmNfcXVl
dWVfcmIoc3RydWN0IG1lc29uX25mYyAqbmZjLCBpbnQgdGltZW91dF9tcykKPiA+Pj4+PiArc3Rh
dGljIGludCBtZXNvbl9uZmNfd2FpdF9ub19yYl9waW4oc3RydWN0IG1lc29uX25mYyAqbmZjLCBp
bnQgdGltZW91dF9tcywKPiA+Pj4+PiArCQkJCSAgICBib29sIG5lZWRfY21kX3JlYWQwKQo+ID4+
Pj4+ICt7Cj4gPj4+Pj4gKwl1MzIgY21kLCBjZmc7Cj4gPj4+Pj4gKwo+ID4+Pj4+ICsJbWVzb25f
bmZjX2NtZF9pZGxlKG5mYywgbmZjLT50aW1pbmcudHdiKTsKPiA+Pj4+PiArCW1lc29uX25mY19k
cmFpbl9jbWQobmZjKTsKPiA+Pj4+PiArCW1lc29uX25mY193YWl0X2NtZF9maW5pc2gobmZjLCBD
TURfRklGT19FTVBUWV9USU1FT1VUKTsKPiA+Pj4+PiArCj4gPj4+Pj4gKwljZmcgPSByZWFkbChu
ZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DRkcpOwo+ID4+Pj4+ICsJY2ZnIHw9IE5GQ19SQl9JUlFf
RU47Cj4gPj4+Pj4gKwl3cml0ZWwoY2ZnLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DRkcpOwo+
ID4+Pj4+ICsKPiA+Pj4+PiArCXJlaW5pdF9jb21wbGV0aW9uKCZuZmMtPmNvbXBsZXRpb24pOwo+
ID4+Pj4+ICsJY21kID0gbmZjLT5wYXJhbS5jaGlwX3NlbGVjdCB8IE5GQ19DTURfQ0xFIHwgTkFO
RF9DTURfU1RBVFVTOwo+ID4+Pj4+ICsJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19S
RUdfQ01EKTsKPiA+Pj4+PiArCj4gPj4+Pj4gKwkvKiB1c2UgdGhlIG1heCBlcmFzZSB0aW1lIGFz
IHRoZSBtYXhpbXVtIGNsb2NrIGZvciB3YWl0aW5nIFIvQiAqLwo+ID4+Pj4+ICsJY21kID0gTkZD
X0NNRF9SQiB8IE5GQ19DTURfUkJfSU5UX05PX1BJTiB8IG5mYy0+dGltaW5nLnRiZXJzX21heDsK
PiA+Pj4+PiArCXdyaXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4gPj4+
Pj4gKwo+ID4+Pj4+ICsJaWYgKCF3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJm5mYy0+Y29t
cGxldGlvbiwKPiA+Pj4+PiArCQkJCQkgbXNlY3NfdG9famlmZmllcyh0aW1lb3V0X21zKSkpCj4g
Pj4+Pj4gKwkJcmV0dXJuIC1FVElNRURPVVQ7Cj4gPj4+Pj4gKwo+ID4+Pj4+ICsJaWYgKG5lZWRf
Y21kX3JlYWQwKSB7Cj4gPj4+Pj4gKwkJY21kID0gbmZjLT5wYXJhbS5jaGlwX3NlbGVjdCB8IE5G
Q19DTURfQ0xFIHwgTkFORF9DTURfUkVBRDA7Cj4gPj4+Pj4gKwkJd3JpdGVsKGNtZCwgbmZjLT5y
ZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPiA+Pj4+PiArCQltZXNvbl9uZmNfZHJhaW5fY21kKG5m
Yyk7Cj4gPj4+Pj4gKwkJbWVzb25fbmZjX3dhaXRfY21kX2ZpbmlzaChuZmMsIENNRF9GSUZPX0VN
UFRZX1RJTUVPVVQpOwo+ID4+Pj4+ICsJfSAgICAKPiA+Pj4+Cj4gPj4+PiBJIGZvcmdvdCBhYm91
dCB0aGlzLCB5b3Ugc2hvdWxkIGF2b2lkIG9wZW4gY29kaW5nIGNvcmUgaGVscGVycywgY2FuIHlv
dQo+ID4+Pj4gcGxlYXNlIHNlbmQgYSBmb2xsb3d1cCBwYXRjaCB0byB1c2UgbmFuZF9zdGF0dXNf
b3AoKSBhbmQKPiA+Pj4+IG5hbmRfZXhpdF9zdGF0dXNfb3AoKSA/ICAgIAo+ID4+Pgo+ID4+PiBB
IG9rLCBzbzoKPiA+Pj4gMSkgU2VuZGluZyBOQU5EX0NNRF9TVEFUVVMgZ29lcyB0byBuYW5kX3N0
YXR1c19vcCgpCj4gPj4+IDIpIFNlbmRpbmcgTkFORF9DTURfUkVBRDAgZ29lcyB0byBuYW5kX2V4
aXRfc3RhdHVzX29wKCkKPiA+Pj4KPiA+Pj4gT2ssIG5vIHByb2JsZW0hIEknbGwgcHJlcGFyZSBh
bmQgc2VuZCBpdCBvbiB0aGlzIHdlZWshICAKPiA+Pgo+ID4+IEV4YWN0bHkuIFNvcnJ5IEkgaGFk
IHRoaXMgaW4gbWluZCBidXQgSSBsaWtlbHkgZm9yZ290IHRvIHdyaXRlIGl0Cj4gPj4gZG93bi4g
IAo+ID4gCj4gPiBPaywgZ290IGl0ISAgCj4gCj4gSG0sIHNlZW1zICdpbnQgbmFuZF9leGl0X3N0
YXR1c19vcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKScgaXMgbm90IGV4cG9ydGVkLAo+IHNvIEkg
Y2FuJ3QgdXNlIGl0IGluIHRoZSBNZXNvbiBtb2R1bGUuIFdoaWxlICduYW5kX3N0YXR1c19vcCgp
JyB3b3JrcyBvay4KPiBNYXkgSSBjYW4gZXhwb3J0ICduYW5kX2V4aXRfc3RhdHVzX29wKCk/JwoK
WWVzLCBpbiBhIHNlcGFyYXRlIHBhdGNoIHBsZWFzZS4KCj4gCj4gVGhhbmtzLCBBcnNlbml5Cj4g
Cj4gCj4gPiAKPiA+IFRoYW5rcywgQXJzZW5peQo+ID4gICAKPiA+Pgo+ID4+IFRoYW5rcywKPiA+
PiBNaXF1w6hsICAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
