Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E50AC10F16
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2024 13:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlCB8XLC4lEglK5SWzEeFXUxot4u/mPHmJXPAHt8mP0=; b=WUYyVrY0Y3HaiE
	FfAVHX5BnqwX+jbWGeleOQ0mJl/NH2ija2mL1a19k7nMFLvNdzRE3NbGL7zJ7HoDhK++auFwtZfxu
	IENUy6EqBYourZ129z/IIe8uy+3kin2uHh5HCgamErX8R5xc2Siwyjus9E39HadGMm8N0LP2PhLK4
	QtXnqOjhdDF+M4K+Fd6rnj26gzV7VxRRiSFJf81xWqJcmMsgoHvJRnZ7D1xltCUzkMt5sZPeWOALJ
	vYF6lf2vJcMRIWymG1ZMuShLK4xGnKSqtSj2bn12+0gr8bukul4DC4y2b2InsgqxN/kftfEWz8gxI
	7ONedEJPpzXTT6zmYKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yiN-00000007XOt-1gsu;
	Mon, 06 May 2024 13:49:11 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yiI-00000007XLl-0Uen;
	Mon, 06 May 2024 13:49:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3A7F1BF20E;
	Mon,  6 May 2024 13:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715003341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiYk/OF8J/A5XkO49NEeG0JReklIrIL4u4kDqBfVQe0=;
	b=mauWTkRJEwC2lvjJlXWeuOXCeuQOgxLTQoZe+3vo06UVOGbnAcLbx+bNbmOKRWY6N/2LMh
	ZDPxv8XA2VsvMlJhgiYmdv0114okHcldvzL+KSx6iGlunRr5ydNL7c1Mq0g087+atQRTLh
	Fcxkxsn0rh1VeFRBkpGPfu7kOn8og+qC/lMfPl6ICDW6CAsuZmoH0jM9hFYKEDUbm7LxvN
	r/+W7vfKhw7rXY92GmeNbGyQxRdUAINnUkE2S2ksf/xbJYBm/OOO6MkCinkF6tem/bUGTb
	tYehaTyf0yxIyTjRNJDaA02iiBlYKZzDvBhnU+bDdBPdzk4dlsD1AkVCAv+VZA==
Date: Mon, 6 May 2024 15:48:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <20240506154858.003bab54@xps-13>
In-Reply-To: <20240416085101.740458-2-avkrasnov@salutedevices.com>
References: <20240416085101.740458-1-avkrasnov@salutedevices.com>
	<20240416085101.740458-2-avkrasnov@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_064906_663648_305A5820 
X-CRM114-Status: GOOD (  19.41  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBUdWUsIDE2
IEFwciAyMDI0IDExOjUxOjAwICswMzAwOgoKPiBCb290IFJPTSBjb2RlIG9uIE1lc29uIHJlcXVp
cmVzIHRoYXQgc29tZSBwYWdlcyBvbiBOQU5EIG11c3QgYmUgd3JpdHRlbgo+IGluIHNwZWNpYWwg
bW9kZTogInNob3J0IiBFQ0MgbW9kZSB3aGVyZSBlYWNoIGJsb2NrIGlzIDM4NCBieXRlcyBhbmQK
PiBzY3JhbWJsaW5nIG1vZGUgaXMgb24uCgpPawoKPiBTdWNoIHBhZ2VzIGxvY2F0ZWQgd2l0aCB0
aGUgc3BlY2lmaWVkIGludGVydmFsIHdpdGhpbiBzcGVjaWZpZWQgb2Zmc2V0LgoKSSdtIHNvcnJ5
IEkgZG9uJ3QgZ2V0IHRoYXQgc2VudGVuY2UuCgo+IEJvdGggaW50ZXJ2YWwgYW5kIG9mZnNldCBh
cmUgbG9jYXRlZCBpbiB0aGUKPiBkZXZpY2UgdHJlZSBhbmQgdXNlZCBieSBkcml2ZXIgaWYgJ25h
bmQtaXMtYm9vdC1tZWRpdW0nIGlzIHNldCBmb3IKPiBOQU5EIGNoaXAuCgpUaGlzIHNlbnRlbmNl
IGlzIHByb2JhYmx5IG5vdCBuZWVkZWQuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jh
c25vdiA8YXZrcmFzbm92QHNhbHV0ZWRldmljZXMuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3Mv
bXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24t
bmFuZC55YW1sCj4gaW5kZXggNTdiNjk1N2M4NDE1Li42N2IyZjdjMTI1OWMgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5h
bmQueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1s
b2dpYyxtZXNvbi1uYW5kLnlhbWwKPiBAQCAtNjQsMTEgKzY0LDI1IEBAIHBhdHRlcm5Qcm9wZXJ0
aWVzOgo+ICAgICAgICAgIGl0ZW1zOgo+ICAgICAgICAgICAgbWF4aW11bTogMAo+ICAKPiArICAg
ICAgYW1sb2dpYyxib290LXBhZ2VzOgo+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ICsgICAgICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICAg
ICAgTnVtYmVyIG9mIHBhZ2VzIHN0YXJ0aW5nIGZyb20gMCwgd2hlcmUgc3BlY2lhbCBFQ0MKCmZy
b20gKm9mZnNldCogMCBJIGd1ZXNzPwoKPiArICAgICAgICAgIGFsZ29yaXRobSB3aWxsIGJlIHVz
ZWQgYnkgdGhlIGRyaXZlci4KCiJ3aGVyZSBhIHNwZWNpYWwgRUNDIGNvbmZpZ3VyYXRpb24gbXVz
dCBiZSB1c2VkIGJlY2F1c2UgaXQgaXMgYWNjZXNzZWQKYnkgdGhlIFJPTSBjb2RlIj8gTWF5YmUg
eW91IGNhbiBldmVuIGRldGFpbCB3aGF0IGFyZSB0aGVzZSB2YWx1ZXMgaWYKdGhleSBhcmUgZml4
ZWQuCgpZb3Ugc2hvdWxkIHByb2JhYmx5IGluZm9ybSB0aGF0IHNjcmFtYmxpbmcgc2hhbGwgYmUg
b24gYXMgd2VsbC4KIAo+ICsKPiArICAgICAgYW1sb2dpYyxib290LXBhZ2Utc3RlcDoKPiArICAg
ICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiArICAg
ICAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgICAgIEludGVydmFsIGJldHdlZW4gcGFnZXMsIHJl
YWQvd3JpdHRlbiBieSB0aGUgZHJpdmVyIHdpdGgKPiArICAgICAgICAgIHNwZWNpYWwgRUNDIGFs
Z29yaXRobS4KCkknbSBub3Qgc3VyZSBJIGZ1bGx5IGdldCB0aGUgZGVzY3JpcHRpb24uIFdoYXQg
aXMgdGhlIHVuaXQgaGVyZT8gY2FuCnlvdSBkcmF3IGEgc21hbGwgYXNjaWktYXJ0IGRpYWdyYW0/
Cgo+ICsKPiAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiAgCj4gICAgICBkZXBl
bmRlbmNpZXM6Cj4gICAgICAgIG5hbmQtZWNjLXN0cmVuZ3RoOiBbbmFuZC1lY2Mtc3RlcC1zaXpl
XQo+ICAgICAgICBuYW5kLWVjYy1zdGVwLXNpemU6IFtuYW5kLWVjYy1zdHJlbmd0aF0KPiArICAg
ICAgYW1sb2dpYyxib290LXBhZ2VzOiBbbmFuZC1pcy1ib290LW1lZGl1bSwgImFtbG9naWMsYm9v
dC1wYWdlLXN0ZXAiXQo+ICsgICAgICBhbWxvZ2ljLGJvb3QtcGFnZS1zdGVwOiBbbmFuZC1pcy1i
b290LW1lZGl1bSwgImFtbG9naWMsYm9vdC1wYWdlcyJdCj4gIAo+ICAKPiAgcmVxdWlyZWQ6CgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
