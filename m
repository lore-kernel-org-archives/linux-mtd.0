Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3350C02192
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2025 14:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xg25NwDYhaEylVrcMAVl0PLjO5QCg3xT6dYuc1wLFlo=; b=4w3Z1wcHzMUUSd
	ioyT99lmBVecGRxyQuVcKulpy2VIJWIOmbTnVdkaeTl/a3W4ABm7BUUMHPMqtYAd+74emlc/YCv4D
	BA94gOKE1sqxxacSn/LuZJpoTJ4rKfYsi+56Iem8yA/2Fa3oi9RIIME46DjsRdIfnmiuo7frVnyTI
	ie8XIo0Ogd9HAky4eMJPCL9JUZAGNV+k5xuavNP5hbpRbY5EGY+OjRkDZjq1SL9uNtYgjB13SqiNL
	P+lkbLQL7CmeYjWZyF/duVey7RHkFLhv+noHpDTBwupxxd2o3UQ7viLcUbUEvYpUh9xmmtbFG4gsY
	WTrsj2+mOrroVDh+ddMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgP8-00000003XgZ-2kTZ;
	Wed, 05 Feb 2025 14:29:26 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgP5-00000003Xev-3PKF
	for linux-mtd@lists.infradead.org;
	Wed, 05 Feb 2025 14:29:25 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C47B7240101
	for <linux-mtd@lists.infradead.org>; Wed,  5 Feb 2025 15:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738765761; bh=e42SIVOUhhbdor72mrNuSIArnji9rVNQMG+KjSfReLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=PACWVV/B2zEXa/3zM3iFyWGMCvq1ep2tJrc4lnPcQd3vMa6GfKW9yWUGJflhWkzB6
	 mdwFgQnP74Q/JsCwaMpTD/CjCuigxBwGIzzFxwKWVOeHk4MaYvlikd7rp62zTC36An
	 Agq7QhuBJJS77HdFXurVKxgAqrp2UMVQuGlfqmMXwEUvTE2X+Q7vjO9yeuFfneWNi4
	 UzFkZdRD0ItU6gs7hUevNamTNwgpLFYRa/IWNqQMQfGMroi2NGU2e/DlG3TmQlVncm
	 PLI6VUrrsbH50E1C83K8fRG84DpnJGcwKJONJ/5Rq2M0DazTqmw5sg53lAryZJ//tS
	 +5vr8gbAqJFJA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yp2fz0fXhz9rxQ;
	Wed,  5 Feb 2025 15:29:14 +0100 (CET)
Date: Wed,  5 Feb 2025 14:29:14 +0000
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
Subject: Re: [PATCH 8/9] dt-bindings: spi: Convert Freescale SPI bindings to
 YAML
Message-ID: <Z6N1uqg4Dji4Pt3X@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-8-50649f51c3dd@posteo.net>
 <20250127050901.GB3127337-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250127050901.GB3127337-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_062924_133601_ADD191AB 
X-CRM114-Status: GOOD (  18.39  )
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

T24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMTE6MDk6MDFQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMDc6NTk6MDNQTSArMDEwMCwgSi4gTmV1c2No
w6RmZXIgd3JvdGU6Cj4gPiBmc2wtc3BpLnR4dCBjb250YWlucyB0aGUgYmluZGluZ3MgZm9yIHRo
ZSBmc2wsc3BpIGFuZCBmc2wsZXNwaQo+ID4gY29udG9sbGVycy4gQ29udmVydCB0aGVtIHRvIFlB
TUwuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5u
ZXQ+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvZnNsLGVzcGkueWFt
bCAgICAgICAgICB8IDU2ICsrKysrKysrKysrKysrKysrCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NwaS9mc2wsc3BpLnlhbWwgfCA3MSArKysrKysrKysrKysrKysrKysr
KysrCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9mc2wtc3BpLnR4
dCAgfCA2MiAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMjcgaW5z
ZXJ0aW9ucygrKSwgNjIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2ZzbCxlc3BpLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2ZzbCxlc3BpLnlhbWwKPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwLi4zNTAyNzU3NjAyMTBjNTc2M2FmMGM3YjFlMTUyMmNjYmZiOTdlZWM3Cj4gPiAtLS0gL2Rl
di9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2Zz
bCxlc3BpLnlhbWwKPiA+IEBAIC0wLDAgKzEsNTYgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+
ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NwaS9mc2wsZXNw
aS55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBGcmVlc2NhbGUgZVNQSSAoRW5oYW5jZWQgU2Vy
aWFsIFBlcmlwaGVyYWwgSW50ZXJmYWNlKSBjb250cm9sbGVyCj4gPiArCj4gPiArbWFpbnRhaW5l
cnM6Cj4gPiArICAtIEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Cj4gPiArCj4gPiAr
cHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGNvbnN0OiBmc2wsbXBjODUz
Ni1lc3BpCj4gPiArCj4gPiArICByZWc6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArCj4gPiAr
ICBpbnRlcnJ1cHRzOiB0cnVlCj4gCj4gSG93IG1hbnk/Cj4gCj4gPiArCj4gPiArICBmc2wsZXNw
aS1udW0tY2hpcHNlbGVjdHM6Cj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL3VpbnQzMgo+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIG51bWJlciBvZiB0aGUg
Y2hpcHNlbGVjdCBzaWduYWxzLgo+IAo+IENvbnN0cmFpbnRzPwo+IAo+ID4gKwo+ID4gKyAgZnNs
LGNzYmVmOgo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91
aW50MzIKPiA+ICsgICAgZGVzY3JpcHRpb246IENoaXAgc2VsZWN0IGFzc2VydGlvbiB0aW1lIGlu
IGJpdHMgYmVmb3JlIGZyYW1lIHN0YXJ0cwo+IAo+IENvbnN0cmFpbnRzPwo+IAo+ID4gKwo+ID4g
KyAgZnNsLGNzYWZ0Ogo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy91aW50MzIKPiA+ICsgICAgZGVzY3JpcHRpb246IENoaXAgc2VsZWN0IG5lZ2F0aW9uIHRp
bWUgaW4gYml0cyBhZnRlciBmcmFtZSBlbmRzCj4gCj4gQ29uc3RyYWludHM/CgpJJ2xsIGFkZCBh
cHByb3ByaWF0ZSBjb25zdHJhaW50cyB0byBhbGwgb2YgdGhlc2UuCgoKPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2ZzbCxzcGkueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvZnNsLHNwaS55YW1sClsuLi5dCj4g
PiArICBjbG9jay1mcmVxdWVuY3k6Cj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMgo+IAo+IERvbid0IG5lZWQgYSB0eXBlLgoKV2lsbCByZW1vdmUK
Cj4gCj4gPiArICAgIGRlc2NyaXB0aW9uOiBpbnB1dCBjbG9jayBmcmVxdWVuY3kgdG8gbm9uIEZT
TF9TT0MgY29yZXMKPiA+ICsKPiA+ICsgIGNzLWdwaW9zOiB0cnVlCj4gPiArCj4gPiArICBmc2ws
c3Bpc2VsX2Jvb3Q6Cj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL2ZsYWcKCkkgZG8gd29uZGVyLCB3aGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbgokcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFnIGFuZCB0eXBlOiBib29sZWFu
PwoKCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKQmVzdCByZWdhcmRzLApKLiBOZXVzY2jDpGZl
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
