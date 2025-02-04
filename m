Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BA2C02193
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaUCGJqj36vJU7XqZhDFqZa/RUSfNJxCyQPEh0IDvyo=; b=hkfTaAzZYfxb77
	ww5oK6CcY3BGUDZkZpOxfZA196HYcMuusJRT0VrB0peJ4JL+zlkYP0SViKx9GHb+WSJoe01i8ZxI5
	vWH5bCC7Pvn2zaDzEICXhqqRUplqA4vMr5qqKM6rzbjJr6qx7nVdCgOIYwRi9jofQjPRVoBlPZT8l
	ILFfwANxiU4GdCNla8jEx5xwS5MKBh78KkX+EYhmPryZn2RwyP9uZBqfum05lXV8GGBI/zrOQQT+f
	Kfr7s4S3a+PNJ764qB1kss1lTaRnZWrCvvgs1pnJ4PCvkYV1ikv8o6zaONRlQOzFQ6Bkru/jcoZA3
	F1Zq7nJDyky4D45hM8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNXi-00000001CQJ-0sAQ;
	Tue, 04 Feb 2025 18:21:02 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNW1-00000001CCq-4BIf
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 18:19:19 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id BA53E240027
	for <linux-mtd@lists.infradead.org>; Tue,  4 Feb 2025 19:19:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738693152; bh=TCqqBaH/6DxhhY4LxUIZxLWTUzfo7FZ0g9lCT/VEHVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=QLuSB3Cp5wmxvy0AcnxYAbea4vAVqLHQ2qWlm36gLR16yyS9Z6v9YRiCvyp4j4gn5
	 LgZDTviocjTkkrBZfKjqIX7HKrKmbEgZd5usiMBwfyowuAzH7n9ya5rw+1WcRG1Oim
	 61l/YRbLQ/MuqjUeCkWoQ1kkGDN+vaSKCCpYDwnidKomCYAjqhFy+gkv+aXN4VknA6
	 SHTFc7qSWaWjKRuglfENNnh6zyhAw0zuaTMO+sMLjEjkDm5sMj/UWLXt8eIducymRH
	 jcDEMinpzWrqCDL2LTwSNhNU1eiDWLfNxb9bwY4wxFJwO7H3iV26supD7Xr4Uco5Zq
	 7tomMw0Ep2Izg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YnWpc4lyZz6tw4;
	Tue,  4 Feb 2025 19:19:03 +0100 (CET)
Date: Tue,  4 Feb 2025 18:19:03 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 5/9] dt-bindings: dma: Convert fsl,elo*-dma bindings to
 YAML
Message-ID: <Z6JaFxfwC0tAB4uQ@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
 <20250127044735.GD3106458-robh@kernel.org>
 <Z5zYGdZU-IXwIuR6@probook>
 <CAL_JsqJAX1QbXvG16NV2g6DGece6KiG_V-uyKQQLA618Oq9miw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJAX1QbXvG16NV2g6DGece6KiG_V-uyKQQLA618Oq9miw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_101918_330146_885D4108 
X-CRM114-Status: GOOD (  17.78  )
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

T24gRnJpLCBKYW4gMzEsIDIwMjUgYXQgMDQ6MTY6MDdQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gRnJpLCBKYW4gMzEsIDIwMjUgYXQgODowM+KAr0FNIEouIE5ldXNjaMOkZmVyIDxq
Lm5lQHBvc3Rlby5uZXQ+IHdyb3RlOgo+ID4KPiA+IE9uIFN1biwgSmFuIDI2LCAyMDI1IGF0IDEw
OjQ3OjM1UE0gLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gPiBPbiBTdW4sIEphbiAyNiwg
MjAyNSBhdCAwNzo1OTowMFBNICswMTAwLCBKLiBOZXVzY2jDpGZlciB3cm90ZToKPiA+ID4gPiBU
aGUgZGV2aWNldHJlZSBiaW5kaW5ncyBmb3IgRnJlZXNjYWxlIERNQSBlbmdpbmVzIGhhdmUgc28g
ZmFyIGV4aXN0ZWQgYXMKPiA+ID4gPiBhIHRleHQgZmlsZS4gVGhpcyBwYXRjaCBjb252ZXJ0cyB0
aGVtIHRvIFlBTUwsIGFuZCBzcGVjaWZpZXMgYWxsIHRoZQo+ID4gPiA+IGNvbXBhdGlibGUgc3Ry
aW5ncyBjdXJyZW50bHkgaW4gdXNlIGluIGFyY2gvcG93ZXJwYy9ib290L2R0cy4KPiA+ID4gPgo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Cj4g
PiA+ID4gLS0tCj4gPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9mc2wsZWxvLWRt
YS55YW1sICAgICAgIHwgMTI5ICsrKysrKysrKysrKysKPiA+ID4gPiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvZG1hL2ZzbCxlbG8zLWRtYS55YW1sICAgICAgfCAxMDUgKysrKysrKysrKysKPiA+
ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2ZzbCxlbG9wbHVzLWRtYS55YW1sICAg
fCAxMjAgKysrKysrKysrKysrCj4gPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2Vy
cGMvZnNsL2RtYS50eHQgICAgICAgIHwgMjA0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiA+
ICA0IGZpbGVzIGNoYW5nZWQsIDM1NCBpbnNlcnRpb25zKCspLCAyMDQgZGVsZXRpb25zKC0pCj4g
PiBbLi4uXQo+ID4gPiA+ICtwYXR0ZXJuUHJvcGVydGllczoKPiA+ID4gPiArICAiXmRtYS1jaGFu
bmVsQC4qJCI6Cj4gPiA+ID4gKyAgICB0eXBlOiBvYmplY3QKPiA+ID4KPiA+ID4gICAgICAgIGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4KPiA+IEknbGwgYWRkIGl0Lgo+ID4KPiA+ID4g
KFRoZSB0b29scyBzaG91bGQgaGF2ZSBoaWdobGlnaHRlZCB0aGlzKQo+ID4KPiA+IFdpdGggZHRz
Y2hlbWEgMjAyNC4xMSBpbnN0YWxsZWQsICJtYWtlIGR0X2JpbmRpbmdfY2hlY2sKPiA+IERUX1ND
SEVNQV9GSUxFUz1mc2wsZWxvLWRtYS55YW1sIiBkb2VzIG5vdCBoaWdobGlnaHQgdGhpcy4KPiAK
PiBBY3R1YWxseSwgaXQncyB0aGUgdG9wLWxldmVsICdhZGR0aW9uYWxQcm9wZXJ0aWVzOiB0cnVl
JyB0aGF0IGRpc2FibGVzCj4gdGhlIGNoZWNrIGhlcmUuIFRoYXQgc2hvdWxkIGJlIGZhbHNlIGFz
IHdlbGwuCgpOb3RlZC4gVGhpcyBkaWQgaW5kZWVkIGhlbHAgbWUgZmluZCBtb3JlIGVycm9ycy4K
CgpCZXN0IHJlZ2FyZHMsCkouIE5ldXNjaMOkZmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
