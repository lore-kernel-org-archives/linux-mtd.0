Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70EFC0219E
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Feb 2025 00:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1hmduf66xIIGt3yQpm5aP4iwSsBikm3jtZ+RgGQBwk4=; b=2TvLIle68QEQmI
	032xpLqgI43dvNd5hD6zFmvclVASo6OsfwE0vnJpfgcbrqHgigqntgMYho4XLrFLYJlH3gQk22T3k
	b7Axh+CM1+4wZUOh5wscyJXbLOpULEsv1Xs8nv1d82ZKoZSMG3sGwcGYZ0z1MfU+kaWB7rSscv0I1
	f59QWTs/Ro3Bn+c96kYrU6mhyg73MXeytfnAaaaeIV6cKmoJBwis4c9D2B2UDe08xcMavQNdk47f4
	V3myRG0XW7WhtQawaPYzHW+rIvR4o3tIYv2F0NgktUp9a8/M++oO5Jh59hFR5gBxUTWjb2FrRud68
	XIF5aVk3eH5PXgmUpe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgur0-0000000Dl8O-0xT1;
	Sun, 09 Feb 2025 00:07:18 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tguqv-0000000Dl7V-1e7b
	for linux-mtd@lists.infradead.org;
	Sun, 09 Feb 2025 00:07:15 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id AD20A240027
	for <linux-mtd@lists.infradead.org>; Sun,  9 Feb 2025 01:07:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739059628; bh=Rnod+Cv9JGN27bc74JTeUwsZwKe+/eQ5wUgORPxiuzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=SR2TmtIo67z05s4kxF0Ofa2/igGTbKkcbZPByXWXy8i6zm9KWjhNMQ/3Vaqi5EU6A
	 JkqODKQmGafdbjTgaw6zvXIjbwCea1icwXx7XJkKGwDvjrw6cOwzih3KjdBWDEkmeQ
	 TAV2d8GBB+HcI8v0XRjQ89eked08X5Fnl4rHWmiAxvOraVLYfkyXf4raGqN9z9w9Gy
	 VmloYIu+RyuefxPplg8tyDFctF4eRcBdw1kFlC36JnybCRp/IEQgKYg+M3g7QvpWUG
	 ohkM9bj5pnzu735rDicaTmq0dj+A2G8d9R/pUbzadWaJ8mfgVociMnpq9oukqQgHOv
	 /dTErrwHPl7Ag==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yr7LD23pfz6v0D;
	Sun,  9 Feb 2025 01:06:59 +0100 (CET)
Date: Sun,  9 Feb 2025 00:06:59 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v2 06/12] dt-bindings: pci: Convert fsl,mpc83xx-pcie to
 YAML
Message-ID: <Z6fxo4j5a6ro0f1w@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_160713_887212_383B51FA 
X-CRM114-Status: GOOD (  21.12  )
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

T24gRnJpLCBGZWIgMDcsIDIwMjUgYXQgMTA6MzA6MjNQTSArMDEwMCwgSi4gTmV1c2Now6RmZXIg
dmlhIEI0IFJlbGF5IHdyb3RlOgo+IEZyb206ICJKLiBOZXVzY2jDpGZlciIgPGoubmVAcG9zdGVv
Lm5ldD4KPiAKPiBGb3JtYWxpc2UgdGhlIGJpbmRpbmcgZm9yIHRoZSBQQ0kgY29udHJvbGxlcnMg
aW4gdGhlIEZyZWVzY2FsZSBNUEM4eHh4Cj4gY2hpcCBmYW1pbHkuIEluZm9ybWF0aW9uIGFib3V0
IFBDSS1YLXNwZWNpZmljIHByb3BlcnRpZXMgd2FzIHRha2VuIGZyb20KPiBmc2wscGNpLnR4dC4g
VGhlIGV4YW1wbGVzIHdlcmUgdGFrZW4gZnJvbSBtcGM4MzE1ZXJkYi5kdHMgYW5kCj4geHBlZGl0
ZTUyMDBfeG1vbi5kdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmVA
cG9zdGVvLm5ldD4KPiAtLS0KPiAKPiBWMjoKPiAtIG1lcmdlIGZzbCxwY2kudHh0IGludG8gZnNs
LG1wYzh4eHgtcGNpLnlhbWwKPiAtIHJlZ3JvdXAgY29tcGF0aWJsZSBzdHJpbmdzLCBsaXN0IHNp
bmdsZS1pdGVtIHZhbHVlcyBpbiBvbmUgZW51bQo+IC0gdHJpbSBzdWJqZWN0IGxpbmUgKHJlbW92
ZSAiYmluZGluZyIpCj4gLSBmaXggcHJvcGVydHkgb3JkZXIgdG8gY29tcGx5IHdpdGggZHRzIGNv
ZGluZyBzdHlsZQo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLG1wYzh4
eHgtcGNpLnlhbWwgICB8IDExNSArKysrKysrKysrKysrKysrKysrKysKPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9mc2wscGNpLnR4dCAgfCAgMjcgLS0tLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMTUgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLG1wYzh4
eHgtcGNpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxt
cGM4eHh4LXBjaS55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi41N2M1NTAzY2VjNDdlNmU5MGVkMmIwOTgz
NWJmYWQxMDMwOWRiOTI3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLG1wYzh4eHgtcGNpLnlhbWwKPiBAQCAtMCwwICsxLDEx
NSBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICsKPiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9wY2kvZnNsLG1wYzh4eHgtcGNpLnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IEZy
ZWVzY2FsZSBNUEM4M3h4IFBDSS9QQ0ktWC9QQ0llIGNvbnRyb2xsZXJzCj4gKwo+ICtkZXNjcmlw
dGlvbjogfAo+ICsgIEJpbmRpbmcgZm9yIHRoZSBQQ0kvUENJLVgvUENJZSBob3N0IGJyaWRnZXMg
b24gTVBDOHh4eCBTb0NzLgo+ICsgIFNlZSBhbHNvOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGNpL2ZzbCxwY2kudHh0CgpUaGlzIGlzIG9idmlvdXNseSBhIGJpdCB3cm9uZzsg
SSBlbmRlZCB1cCBwdXR0aW5nIHRoZSBpbmZvcm1hdGlvbiBmcm9tCmZzbCxwY2kudHh0IGVudGly
ZWx5IHVuZGVyIHRoZSBmc2wscGNpLWFnZW50LWZvcmNlLWVudW0gcHJvcGVydHksIGJ1dApmb3Jn
b3QgdG8gcmVtb3ZlIHRoZSByZWZlcmVuY2UgdG8gdGhlIG9sZCB0eHQgZmlsZS4KCj4gK3Byb3Bl
cnRpZXM6ClsuLi5dCj4gKyAgZnNsLHBjaS1hZ2VudC1mb3JjZS1lbnVtOgo+ICsgICAgdHlwZTog
Ym9vbGVhbgo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgIFR5cGljYWxseSBhbnkgRnJlZXNj
YWxlIFBDSS1YIGJyaWRnZSBoYXJkd2FyZSBzdHJhcHBlZCBpbnRvIEFnZW50IG1vZGUgaXMKPiAr
ICAgICAgcHJldmVudGVkIGZyb20gZW51bWVyYXRpbmcgdGhlIGJ1cy4gVGhlIFByUE1DIGZvcm0t
ZmFjdG9yIHJlcXVpcmVzIGFsbAo+ICsgICAgICBtZXp6YW5pbmVzIHRvIGJlIFBDSS1YIEFnZW50
cywgYnV0IG9uZSBwZXIgc3lzdGVtIG1heSBzdGlsbCBlbnVtZXJhdGUgdGhlCj4gKyAgICAgIGJ1
cy4KPiArCj4gKyAgICAgIFRoaXMgcHJvcGVydHkgYWxsb3dzIGEgUENJLVggYnJpZGdlIHRvIGJl
IHVzZWQgZm9yIGJ1cyBlbnVtZXJhdGlvbgo+ICsgICAgICBkZXNwaXRlIGJlaW5nIHN0cmFwcGVk
IGludG8gQWdlbnQgbW9kZS4KPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gcmVnCj4gKyAgLSBjb21w
YXRpYmxlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
