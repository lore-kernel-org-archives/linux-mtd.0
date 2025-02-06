Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C044AC02194
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2025 22:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEb0kZIt09AbUP/GNHGXBrfddQBgOjGp62osHCWo7aw=; b=sru125knLA+CVB
	uMfJUsBkvy5whaHJVfXe4n+3xWGjUJGghBLHwwnoWDRheFVpBoViZDvjDI0KLVrb58fyd57qW9s4s
	/s52LYeCzLjaFEgbUSwEazmQteO2S/F/CFzum4a08fEezpH2pM5sB7/ykGNSDBTkh2+0SZ/qSDevp
	5LT1kzmDe3Df47mAVV0zi+l65IIvE6TdXRHDW13dnt7uxLrx3kxmrG4i8f81q/Znrjmr7bbpuDZfy
	74K1k8rQVNrQam1dMKEoTOyZ06YUC90Ag69aXr1fFlBt8si+/boylVW1fxlDM+mx9rjdpVWJKRGHY
	foigHrt5dSbDiKoHdTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAqj-00000007kps-2Nw9;
	Thu, 06 Feb 2025 22:59:57 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAqh-00000007kpK-1YPe
	for linux-mtd@lists.infradead.org;
	Thu, 06 Feb 2025 22:59:56 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 6D05A240027
	for <linux-mtd@lists.infradead.org>; Thu,  6 Feb 2025 23:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738882792; bh=8wEjDCTuOvcktBrfjhLQ0lipXUb5sf39X+VV2LrhSa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=f5fZ5dxc+yiDR/WQT0Po4+rbJRF/txKc1K68b+9pnLBawItBAJwI2Z+S2x4Y1a6dX
	 3o9+6n8Ac6zOKWwBStCcVuzT4EfA0PH63bkmdao7A9yMOyDhJLdUvKZn+fvhstXL9L
	 0eQBvnQV4jdarLr3kJ2yWQtio5/V7D4cf2HNmkQN4XUTDviSnDQU7R+xCWplMukXe9
	 +/rP6AcoIJq9HCiegXVNIG3oaULtkuSzrOyxk3NmiwBryyj79VZfhfrWtcJpkaWkFz
	 qbpUtlZoAlUOyOFhP/QKs6fx1h+aRBctKN8niJcY4kyyQox7dY+X47sFoQ99SfrYy8
	 UeOGQqYnODnjQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ypsxb3GYrz9rxD;
	Thu,  6 Feb 2025 23:59:47 +0100 (CET)
Date: Thu,  6 Feb 2025 22:59:43 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Frank Li <Frank.li@nxp.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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
Subject: Re: [PATCH RFC 9/9] dt-bindings: nand: Convert fsl,elbc bindings to
 YAML
Message-ID: <Z6U-38ONJ0F3ILCo@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
 <Z5qzMH1t7jIr39Ce@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5qzMH1t7jIr39Ce@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_145955_698538_D83B504C 
X-CRM114-Status: GOOD (  19.87  )
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

T24gV2VkLCBKYW4gMjksIDIwMjUgYXQgMDY6MDE6MDRQTSAtMDUwMCwgRnJhbmsgTGkgd3JvdGU6
Cj4gT24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMDc6NTk6MDRQTSArMDEwMCwgSi4gTmV1c2Now6Rm
ZXIgd3JvdGU6Cj4gPiBDb252ZXJ0IHRoZSBGcmVlc2NhbGUgbG9jYWxidXMgY29udHJvbGxlciBi
aW5kaW5ncyBmcm9tIHRleHQgZm9ybSB0bwo+ID4gWUFNTC4gVGhlIGxpc3Qgb2YgY29tcGF0aWJs
ZSBzdHJpbmdzIHJlZmxlY3RzIGN1cnJlbnQgdXNhZ2UuCj4gPgo+ID4gQ2hhbmdlcyBjb21wYXJl
ZCB0byB0aGUgdHh0IHZlcnNpb246Cj4gPiAgLSByZW1vdmVkIHRoZSBib2FyZC1jb250cm9sIChm
c2wsbXBjODI3MmFkcy1iY3NyKSBub2RlIGJlY2F1c2UgaXQgb25seQo+ID4gICAgYXBwZWFycyBp
biB0aGlzIGV4YW1wbGUgYW5kIG5vd2hlcmUgZWxzZQo+ID4gIC0gYWRkZWQgYSBuZXcgZXhhbXBs
ZSB3aXRoIE5BTkQgZmxhc2gKPiA+Cj4gPiBSZW1haW5pbmcgaXNzdWVzOgo+ID4gIC0gVGhlIGxv
Y2FsYnVzIGlzIG5vdCByZWFsbHkgYSBzaW1wbGUtYnVzOiBVbml0IGFkZHJlc3NlcyBhcmUgbm90
IHNpbXBseQo+ID4gICAgYWRkcmVzc2VzIG9uIGEgbWVtb3J5IGJ1cy4gSW5zdGVhZCwgdGhleSBo
YXZlIGEgZm9ybWF0OiBUaGUgZmlyc3QgY2VsbAo+ID4gICAgaXMgYSBjaGlwIHNlbGVjdCBudW1i
ZXIsIHRoZSByZW1haW5pbmcgb25lIG9yIHR3byBjZWxscyBhcmUgYnVzCj4gPiAgICBhZGRyZXNz
ZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5l
dD4KPiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9mc2wsZWxiYy1mY20t
bmFuZC55YW1sIHwgIDYxICsrKysrKysrKwo+ID4gIC4uLi9iaW5kaW5ncy9wb3dlcnBjL2ZzbC9m
c2wsZWxiYy1ncGNtLXVpby55YW1sICAgIHwgIDU1ICsrKysrKysrCj4gPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvcG93ZXJwYy9mc2wvZnNsLGVsYmMueWFtbCAgfCAxNTAgKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9mc2wvbGJjLnR4
dCAgICAgICAgfCAgNDMgLS0tLS0tCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNjYgaW5zZXJ0aW9u
cygrKSwgNDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZnNsLGVsYmMtZmNtLW5hbmQueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZnNsLGVsYmMtZmNtLW5hbmQueWFtbApbLi4u
XQo+ID4gKyAgIiNhZGRyZXNzLWNlbGxzIjogdHJ1ZQo+IAo+IHNob3VsZCBsaW1pdCB0byBhIG51
bWJlciBzZXQgbGlrZQo+IAo+IAktIGNvbnN0OiAyCgpXaWxsIGRvCgo+ID4gKwo+ID4gKyAgIiNz
aXplLWNlbGxzIjogdHJ1ZQo+IAo+IHRoZSBzYW1lIGFzICNhZGRyZXNzLWNlbGxzLgoKV2lsbCBk
bwoKClRoYW5rcywKSi4gTmV1c2Now6RmZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
