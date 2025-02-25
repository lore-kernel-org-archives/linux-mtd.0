Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46267C021B2
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2025 13:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEMYK1+JWHlBXr4Q15clTrMGow9cyezt2jw/d7ZCzr4=; b=RKF3G7TjyNZU72
	8PTtFjKvYBtBBFDhvihk9VpJW38+qAHhtLPhCiNZgp20mwo+i8WbJUFd5BYK11QfJKld+ZeRQI7B9
	vrt0iffKRGw1CXQdCRHHtsA66oSPKlEex+Ido47XNcJ9rYI9iJJ+FpQ1yPE0XKkfge2sH1Ucaw4Ij
	AnBqvVXcCIi1xlCVmtu1uyQpTSABOU8LzqCQfp7Jgcf5A3UptKHN7dq4sjN2DJLTj4cLlECOVA0w+
	oCz+VyjgGgGVI9ZEWJe5nu8+A14EWX6DRiLnOAMQp6mpHodHb/GJh11VTDndPcGjeMPRgnlYu2V6i
	NSBxdAPCwjbgYU7QQn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuiu-0000000HJt4-1R59;
	Tue, 25 Feb 2025 13:11:44 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuSM-0000000HGpX-0UQG
	for linux-mtd@lists.infradead.org;
	Tue, 25 Feb 2025 12:54:39 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id A2809240028
	for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2025 13:54:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1740488074; bh=W8LIqF7kkH6cCLj3gN0Tz1ix7jTva4xQTCeEx72fA+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=DocMYiOi3cVXULS2RC5V0utrb8byULhJhbWvisytUMbAJTFVxr2C2al5u3xC+ndTa
	 tZB6OqtrM8aSQwknrx692ErF0CgmTXtdkJSrCXPm89T/1FMnqmPIXpcwD0yA0mWbPU
	 dRi98VIg5dkW1Dw2lbwDZdh0GYVgdzdTDp+3xX4N+tUFcecOI5y46dOg4VaqPmwlFY
	 JaWCa3oltODlCxFZf0jVjvrcBeejV+JSHCYDtihwWP/SHo2slFEE6nsIBb8nhn92rA
	 ETiqcTr92RxgkdN7IDzy1IouO6de8WklnnsOd5aK6RQsI+LMZahBREGyheTOAQI/xD
	 dJQqyDIuYtZ3A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Z2HcG3WCTz9rxG;
	Tue, 25 Feb 2025 13:54:21 +0100 (CET)
Date: Tue, 25 Feb 2025 12:54:21 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Frank Li <Frank.li@nxp.com>, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
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
Subject: Re: [PATCH v2 05/12] dt-bindings: dma: Convert fsl,elo*-dma to YAML
Message-ID: <Z729fRBNLAxdYD22@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
 <Z6pV4eauZj75+911@lizhi-Precision-Tower-5810>
 <Z684nUnDX4Sb98rQ@probook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z684nUnDX4Sb98rQ@probook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_045438_447407_8558D137 
X-CRM114-Status: GOOD (  21.98  )
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

T24gRnJpLCBGZWIgMTQsIDIwMjUgYXQgMTI6MzU6NDFQTSArMDAwMCwgSi4gTmV1c2Now6RmZXIg
d3JvdGU6Cj4gT24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDI6Mzk6MTNQTSAtMDUwMCwgRnJhbmsg
TGkgd3JvdGU6Cj4gPiBPbiBGcmksIEZlYiAwNywgMjAyNSBhdCAxMDozMDoyMlBNICswMTAwLCBK
LiBOZXVzY2jDpGZlciB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gPiA+IEZyb206ICJKLiBOZXVzY2jD
pGZlciIgPGoubmVAcG9zdGVvLm5ldD4KPiA+ID4KPiA+ID4gVGhlIGRldmljZXRyZWUgYmluZGlu
Z3MgZm9yIEZyZWVzY2FsZSBETUEgZW5naW5lcyBoYXZlIHNvIGZhciBleGlzdGVkIGFzCj4gPiA+
IGEgdGV4dCBmaWxlLiBUaGlzIHBhdGNoIGNvbnZlcnRzIHRoZW0gdG8gWUFNTCwgYW5kIHNwZWNp
ZmllcyBhbGwgdGhlCj4gPiA+IGNvbXBhdGlibGUgc3RyaW5ncyBjdXJyZW50bHkgaW4gdXNlIGlu
IGFyY2gvcG93ZXJwYy9ib290L2R0cy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSi4gTmV1
c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KPiA+ID4gLS0tClsuLi5dCj4gPiBOZWVkIHJlZiB0
byBkbWEtY29tbW9uLnlhbWw/Cj4gCj4gU291bmRzIGdvb2QsIGJ1dCBJJ20gbm90IHN1cmUgd2hh
dCB0byBkbyBhYm91dCB0aGUgI2RtYS1jZWxscyBwcm9wZXJ0eSwKPiB3aGljaCBpcyByZXF1aXJl
ZCBieSBkbWEtY29tbW9uLnlhbWwuCj4gCj4gVGhlcmUgYXJlbid0IG1hbnkgZXhhbXBsZXMgb2Yg
RE1BIGNoYW5uZWxzIGJlaW5nIGV4cGxpY2l0bHkgZGVjbGFyZWQgaW4KPiBkZXZpY2UgdHJlZXMu
IE9uZSBleGFtcGxlIHRoYXQgSSBjb3VsZCBmaW5kIGlzIHRoZSB0aGUgeGlsaW54X2RtYS50eHQK
PiBiaW5kaW5nOgo+IAo+IAo+IAlheGlfdmRtYV8wOiBheGl2ZG1hQDQwMDMwMDAwIHsKPiAJCWNv
bXBhdGlibGUgPSAieGxueCxheGktdmRtYS0xLjAwLmEiOwo+IAkJI2RtYV9jZWxscyA9IDwxPjsK
PiAJCXJlZyA9IDwgMHg0MDAzMDAwMCAweDEwMDAwID47Cj4gCQlkbWEtcmFuZ2VzID0gPDB4MDAw
MDAwMDAgMHgwMDAwMDAwMCAweDQwMDAwMDAwPjsKPiAJCXhsbngsbnVtLWZzdG9yZXMgPSA8MHg4
PjsKPiAJCXhsbngsZmx1c2gtZnN5bmMgPSA8MHgxPjsKPiAJCXhsbngsYWRkcndpZHRoID0gPDB4
MjA+Owo+IAkJY2xvY2tzID0gPCZjbGsgMD4sIDwmY2xrIDE+LCA8JmNsayAyPiwgPCZjbGsgMz4s
IDwmY2xrIDQ+Owo+IAkJY2xvY2stbmFtZXMgPSAic19heGlfbGl0ZV9hY2xrIiwgIm1fYXhpX21t
MnNfYWNsayIsICJtX2F4aV9zMm1tX2FjbGsiLAo+IAkJCSAgICAgICJtX2F4aXNfbW0yc19hY2xr
IiwgInNfYXhpc19zMm1tX2FjbGsiOwo+IAkJZG1hLWNoYW5uZWxANDAwMzAwMDAgewo+IAkJCWNv
bXBhdGlibGUgPSAieGxueCxheGktdmRtYS1tbTJzLWNoYW5uZWwiOwo+IAkJCWludGVycnVwdHMg
PSA8IDAgNTQgNCA+Owo+IAkJCXhsbngsZGF0YXdpZHRoID0gPDB4NDA+Owo+IAkJfTsKPiAJCWRt
YS1jaGFubmVsQDQwMDMwMDMwIHsKPiAJCQljb21wYXRpYmxlID0gInhsbngsYXhpLXZkbWEtczJt
bS1jaGFubmVsIjsKPiAJCQlpbnRlcnJ1cHRzID0gPCAwIDUzIDQgPjsKPiAJCQl4bG54LGRhdGF3
aWR0aCA9IDwweDQwPjsKPiAJCX07Cj4gCX07Cj4gCj4gCS4uLgo+IAo+IAl2ZG1hdGVzdF8wOiB2
ZG1hdGVzdEAwIHsKPiAJCWNvbXBhdGlibGUgPSJ4bG54LGF4aS12ZG1hLXRlc3QtMS4wMC5hIjsK
PiAJCWRtYXMgPSA8JmF4aV92ZG1hXzAgMAo+IAkJCSZheGlfdmRtYV8wIDE+Owo+IAkJZG1hLW5h
bWVzID0gInZkbWEwIiwgInZkbWExIjsKPiAJfTsKPiAKPiBJdCBoYXMgI2RtYV9jZWxscyAoSSdt
IHN1cmUgI2RtYS1jZWxscyB3YXMgaW50ZW5kZWQpIG9uIHRoZSBjb250cm9sbGVyLgo+IAo+IAo+
IEFub3RoZXIgZXhhbXBsZSBpcyBpbiBhcmNoL3Bvd2VycGMvYm9vdC9kdHMvZnNsL3AxMDIyc2kt
cG9zdC5kdHNpOgo+IAo+IAlkbWFAYzMwMCB7Cj4gCQlkbWEwMDogZG1hLWNoYW5uZWxAMCB7Cj4g
CQkJY29tcGF0aWJsZSA9ICJmc2wsc3NpLWRtYS1jaGFubmVsIjsKPiAJCX07Cj4gCQlkbWEwMTog
ZG1hLWNoYW5uZWxAODAgewo+IAkJCWNvbXBhdGlibGUgPSAiZnNsLHNzaS1kbWEtY2hhbm5lbCI7
Cj4gCQl9Owo+IAl9Owo+IAo+IAkuLi4KPiAKPiAJc3NpQDE1MDAwIHsKPiAJCWNvbXBhdGlibGUg
PSAiZnNsLG1wYzg2MTAtc3NpIjsKPiAJCWNlbGwtaW5kZXggPSA8MD47Cj4gCQlyZWcgPSA8MHgx
NTAwMCAweDEwMD47Cj4gCQlpbnRlcnJ1cHRzID0gPDc1IDIgMCAwPjsKPiAJCWZzbCxwbGF5YmFj
ay1kbWEgPSA8JmRtYTAwPjsKPiAJCWZzbCxjYXB0dXJlLWRtYSA9IDwmZG1hMDE+Owo+IAkJZnNs
LGZpZm8tZGVwdGggPSA8MTU+Owo+IAl9Owo+IAo+IAo+IFRoZXJlLCB0aGUgRE1BIGNoYW5uZWxz
IGFyZSB1c2VkIGRpcmVjdGx5IGFuZCB3aXRob3V0IGFkZGl0aW9uYWwKPiBpbmZvcm1hdGlvbiAo
aS5lLiAjZG1hLWNlbGxzID0gPDA+LCBhbHRob3VnaHQgaXQgaXNuJ3Qgc3BlY2lmaWVkKS4KCkkg
aGFkIGFub3RoZXIgbG9vayBhdCBkbWEtY29tbW9uLnlhbWwgYW5kIGl0IGV4cGxpY2l0bHkgcmVx
dWlyZXMKI2RtYS1jZWxscyB0byBoYXZlIGEgdmFsdWUgb2YgYXQgbGVhc3QgMSwgc28gdGhpcyBz
ZWNvbmQgaWRlYSB3b24ndAp3b3JrLgoKCkJlc3QgcmVnYXJkcywKSi4gTmV1c2Now6RmZXIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
