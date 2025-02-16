Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F78C02198
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Feb 2025 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/ZBFo3NPnSJj+cA7ZwgCpdKlWxBFD7I/4TUf5+FHRE=; b=sLm8RE7Byy0ag+
	Y2qKHoZBh8LsM6LJ7xav6HiNFzRuOmocTKi4MuZpSjnaqJwQsaXBcpvL1bhgwNIYcLpvpGsLvXbtR
	mWYm6XzmzrSahTPWT2RpYevNmblbvfrRxmAFAmO39u1iUQPhOaetYaORz2ms0nzwSB/SgiyUMVesS
	pc6GvjnBCvVvPAPNrPbVjbvGE6PqKT9vqi+ViCKI+7bUGyQScNHFZwLWD1sNTj4ZYqkPmAAhyu9Fv
	awU6Iia+Uhfh517cBSHvieug/ZbNkUzDXH95wkCyCjQS20GJmRB4UfLJXB0R64q2XEPGO8vhTUjSn
	DGXWO/8lwSUACXEsFrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjh4D-000000024VC-1Bsk;
	Sun, 16 Feb 2025 16:00:25 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjh41-000000024Hf-2foH
	for linux-mtd@lists.infradead.org;
	Sun, 16 Feb 2025 16:00:15 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 5A8B1240101
	for <linux-mtd@lists.infradead.org>; Sun, 16 Feb 2025 17:00:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739721609; bh=EF26j1suwLuBzziUeMgwWp0X8x4RpIgeD8Jxuuo4ULs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=HRGQzfayKp1Y3J0KKiBjaA29yhFmCsxRPVLMUTZWShJWsJTDFaXIKDwflbCIc0xs9
	 rGBb+ufVjedSubOqie2Ks5OK6nQoz66I01cSJa94hzdICNscwM/6uB2z2oCtIAQasx
	 PxDVce57yYyuKyINg0Xy2dA+vjuAY/7SqRlcJiZCLLzjYqdvqu1vSh80famYzAet8T
	 JHCpPfV4rA0DsxcAjYsVAubSjsQ6SSGm8mPSa9Q7UH+7b5rh2dzdnTvrW1ENqP3AZz
	 YsJZvHOV+pnFqcZo+cLsWziT8OR+bP1gbf6K6ynWbzDpSDk2cqLLZpDCESA8O64F9c
	 e9f2PtbU6IICg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ywr8V6Vlfz9rxW;
	Sun, 16 Feb 2025 16:59:54 +0100 (CET)
Date: Sun, 16 Feb 2025 15:59:54 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: Crystal Wood <oss@buserror.net>, j.ne@posteo.net,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
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
	linux-mtd@lists.infradead.org, Li Yang <leoyang.li@nxp.com>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
Message-ID: <Z7ILej_AJYot_wKP@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <Z6kQpuQf5m-bXTyt@buserror.net>
 <20250210215324.GA1040564-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210215324.GA1040564-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_080013_991392_33862D34 
X-CRM114-Status: GOOD (  28.67  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDM6NTM6MjRQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gU3VuLCBGZWIgMDksIDIwMjUgYXQgMDI6MzE6MzRQTSAtMDYwMCwgQ3J5c3RhbCBX
b29kIHdyb3RlOgo+ID4gT24gRnJpLCBGZWIgMDcsIDIwMjUgYXQgMTA6MzA6MjZQTSArMDEwMCwg
Si4gTmV1c2Now6RmZXIgdmlhIEI0IFJlbGF5IHdyb3RlOgo+ID4gPiBGcm9tOiAiSi4gTmV1c2No
w6RmZXIiIDxqLm5lQHBvc3Rlby5uZXQ+Cj4gPiA+IAo+ID4gPiBDb252ZXJ0IHRoZSBGcmVlc2Nh
bGUgbG9jYWxidXMgY29udHJvbGxlciBiaW5kaW5ncyBmcm9tIHRleHQgZm9ybSB0bwo+ID4gPiBZ
QU1MLiBUaGUgdXBkYXRlZCBsaXN0IG9mIGNvbXBhdGlibGUgc3RyaW5ncyByZWZsZWN0cyBjdXJy
ZW50IHVzYWdlCj4gPiA+IGluIGFyY2gvcG93ZXJwYy9ib290L2R0cy8sIGV4Y2VwdCB0aGF0IG1h
bnkgZXhpc3RpbmcgZGV2aWNlIHRyZWVzCj4gPiA+IGVycm9uZW91c2x5IHNwZWNpZnkgInNpbXBs
ZS1idXMiIGluIGFkZGl0aW9uIHRvIGZzbCwqZWxiYy4KPiA+ID4gCj4gPiA+IENoYW5nZXMgY29t
cGFyZWQgdG8gdGhlIHR4dCB2ZXJzaW9uOgo+ID4gPiAgLSByZW1vdmVkIHRoZSBib2FyZC1jb250
cm9sIChmc2wsbXBjODI3MmFkcy1iY3NyKSBub2RlIGJlY2F1c2UgaXQgb25seQo+ID4gPiAgICBh
cHBlYXJzIGluIHRoaXMgZXhhbXBsZSBhbmQgbm93aGVyZSBlbHNlCj4gPiA+ICAtIGFkZGVkIGEg
bmV3IGV4YW1wbGUgd2l0aCBOQU5EIGZsYXNoCj4gPiA+ICAtIHVwZGF0ZWQgbGlzdCBvZiBjb21w
YXRpYmxlIHN0cmluZ3MKPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVy
IDxqLm5lQHBvc3Rlby5uZXQ+Cj4gPiA+IC0tLQo+ID4gPiAKPiA+ID4gVjI6Cj4gPiA+IC0gZml4
IG9yZGVyIG9mIHByb3BlcnRpZXMgaW4gZXhhbXBsZXMsIGFjY29yZGluZyB0byBkdHMgY29kaW5n
IHN0eWxlCj4gPiA+IC0gbW92ZSB0byBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVtb3J5LWNvbnRyb2xsZXJzCj4gPiA+IC0gY2xhcmlmeSB0aGUgY29tbWl0IG1lc3NhZ2UgYSB0
aW55IGJpdAo+ID4gPiAtIHJlbW92ZSB1bm5lY2Vzc2FyeSBtdWx0aWxpbmUgbWFya2VycyAofCkK
PiA+ID4gLSBkZWZpbmUgYWRkcmVzcyBmb3JtYXQgaW4gcGF0dGVyblByb3BlcnRpZXMKPiA+ID4g
LSB0cmltIHN1YmplY3QgbGluZSAocmVtb3ZlICJiaW5kaW5nIikKPiA+ID4gLSByZW1vdmUgdXNl
IG9mICJzaW1wbGUtYnVzIiwgYmVjYXVzZSBpdCdzIHRlY2huaWNhbGx5IGluY29ycmVjdAo+ID4g
Cj4gPiBXaGlsZSBJIGFkbWl0IEkgaGF2ZW4ndCBiZWVuIGZvbGxvd2luZyByZWNlbnQgZGV2ZWxv
cG1lbnRzIGluIHRoaXMgYXJlYSwKPiA+IGFzIHNvbWVvbmUgd2hvIHdhcyBpbnZvbHZlZCB3aGVu
ICJzaW1wbGUtYnVzIiB3YXMgY3JlYXRlZCAoYW5kIHdhcyBvbiB0aGUKPiA+IGVQQVBSIGNvbW1p
dHRlZSB0aGF0IHN0YW5kYXJkaXplZCBpdCkgSSdtIHN1cnByaXNlZCB0byBoZWFyIHNpbXBsZS1i
dXMKPiA+IGJlaW5nIGNhbGxlZCAiZXJyb25lb3VzIiBvciAidGVjaG5pY2FsbHkgaW5jb3JyZWN0
IiBoZXJlLgo+IAo+IEVycm9uZW91cyBiZWNhdXNlIHRoZSBiaW5kaW5nIGRpZCBub3Qgc2F5ICJz
aW1wbGUtYnVzIiB3YXMgdXNlZC4gTm90IAo+IHVuY29tbW9uIHdpdGggdGhlIG9sZCAudHh0IGJp
bmRpbmdzLgo+IAo+IEdlbmVyYWxseSwgaWYgYSBidXMgaGFzIGNvbnRyb2wgcmVnaXN0ZXJzIG9y
IHJlc291cmNlcyBsaWtlIGNsb2NrcywgdGhlbiAKPiB3ZSB0ZW5kIG5vdCB0byBjYWxsIHRoZW0g
J3NpbXBsZS1idXMnLiBBbmQgJyJzcGVjaWZpYy1idXMiLCAKPiAic2ltcGxlLWJ1cyInIGdpdmVz
IHNvbWUgcHJvYmxlbXMgYXJvdW5kIHdoYXQgZHJpdmVyIGlmIGFueSBkbyB5b3UgCj4gYmluZCB0
by4gClsuLi5dCj4gPiBZb3UnZCBwcm9iYWJseSBuZWVkIHNvbWV0aGluZyBsaWtlIGNvbW1pdCAz
ZTI1ZjgwMGFmYjgyYmQ5ZTVmOCAoIm1lbW9yeToKPiA+IGZzbF9pZmM6IHBvcHVsYXRlIGNoaWxk
IGRldmljZXMgd2l0aG91dCByZWx5aW5nIG9uIHNpbXBsZS1idXMiKSBhbmQgdGhlIAo+ID4gc3Vi
c2VxdWVudCBmaXggaW4gZGQ4YWRjNzEzYjE2NTYgKCJtZW1vcnk6IGZzbF9pZmM6IHBvcHVsYXRl
IGNoaWxkCj4gPiBub2RlcyBvZiBidXNlcyBhbmQgbWZkIGRldmljZXMiKS4uLgo+ID4gCj4gPiBJ
J20gY3VyaW91cyB3aGF0IHRoZSByZWFzb25pbmcgd2FzIGZvciByZW1vdmluZyBzaW1wbGUtYnVz
IGZyb20gSUZDLiAgSXQKPiA+IHNlZW1zIHRoYXQgdGhlIHNjaGVtYSB2ZXJpZmljYXRpb24gYWxz
byBwbGF5ZWQgYSByb2xlIGluIHRoYXQ6Cj4gPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0
cy9kZXZpY2V0cmVlL21zZzIyMDQxOC5odG1sCj4gCj4gSWYgYSBrZXJuZWwgY2hhbmdlIGlzIG5l
ZWRlZCB0byBzdXBwb3J0IGNoYW5nZWQgLmR0cyBmaWxlcywgdGhlbiB3ZSAKPiBzaG91bGRuJ3Qg
YmUgZG9pbmcgdGhhdCBoZXJlIChiZWluZyBtYXR1cmUgcGxhdGZvcm1zKS4gVGhhdCB3b3VsZCBt
ZWFuIAo+IG5ldyBEVEIgd2lsbCBub3Qgd29yayB3aXRoIGV4aXN0aW5nIGtlcm5lbHMuCgpBbHJp
Z2h0LCBJJ2xsIGtlZXAgc2ltcGxlLWJ1cyBpbiB0aGUgZUxCQyBiaW5kaW5nIGZvciBoaXN0b3Jp
Y2FsCmNvbXBhdGliaWxpdHkuCgoKVGhhbmsgeW91IGJvdGggZm9yIHlvdXIgZGlzY3Vzc2lvbi4K
CgpKLiBOZXVzY2jDpGZlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
