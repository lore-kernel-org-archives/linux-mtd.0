Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC36C0218D
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2025 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kN5YTg+huBUznd1WIrkaDx8k+JeVP48NgaWBTeYkrHk=; b=RWEkos/4GDhwCs
	g9pbivEDwirmGOn3dXEiPmMz75QDSwEgYiXOLpwe3Z77Fi/7uKa4WcYpRYRGM0vmJXy1lzSpi+kLE
	JfdYGybasNmP7dchnswoMeFxNO2LPZscfCh/fpDxVb8KmSPKveR1SmSQk9r91zTKrJpouXSLCC6HZ
	dCteuvj+lMDEg3QhlPqDPrpkCZGFkt+SGF0p2GDEzwU0R0bYkpBShixO7/1LLrPysM1ivt4PJB+J+
	cOa10CIGOR7dsPjxrRs0XauZrsC5siNA7V+7cR6/jq/n3hV6/w4AvwxVxZk+aBZWz7JxsgCPBCyw/
	OTXNfsB79Pi8p01cuUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdADw-00000007II0-20fu;
	Wed, 29 Jan 2025 15:43:28 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdACj-00000007Hz8-0SYK
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jan 2025 15:42:14 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2154C240101
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2025 16:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738165327; bh=fHuIzrO2wct7VL46Pzm/QKC1E0zvkFPkq1uaLyfrAgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=IU+Z0xBnnig0EhC6/GBKN71jt8XivDM3AVYyasQIpUlNY76h59cwZ/+vDfkR4fcfN
	 nsuu2mKYkn3yYGa0cMRLwNmrN2ok7JdvGiALjdFO4oWx07PiAhZBO/vaLsLckL8zsj
	 6pXbrgmqRF6TXS2Wg4+5mdwmWSTz64CB7GE7ZoaT7IoPIDBsRfs4c90I6YE4ngXWdO
	 adl5mIZ+12yhvg/Rn7aM1EtkPA7oDvfU3G8CoPftB3M8/R3va0ivVGwPJdU9Ul/Psd
	 ErT9rzxaA7bFABhuwnfHAcV7D7f+LnoIePImCl7YAEeGZUcDLj49DdJUJmQE68Ks53
	 uM3PTxFHxmkUA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yjmc71lNXz9rxB;
	Wed, 29 Jan 2025 16:41:59 +0100 (CET)
Date: Wed, 29 Jan 2025 15:41:58 +0000
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
Subject: Re: [PATCH 3/9] dt-bindings: crypto: Convert fsl,sec-2.0 binding to
 YAML
Message-ID: <Z5pMRk8WEZZK9TEL@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-3-50649f51c3dd@posteo.net>
 <20250127044128.GB3106458-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250127044128.GB3106458-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_074213_430853_C874A0B2 
X-CRM114-Status: GOOD (  19.48  )
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

T24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMTA6NDE6MjhQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMDc6NTg6NThQTSArMDEwMCwgSi4gTmV1c2No
w6RmZXIgd3JvdGU6Cj4gPiBDb252ZXJ0IHRoZSBGcmVlc2NhbGUgc2VjdXJpdHkgZW5naW5lIChj
cnlwdG8gYWNjZWxlcmF0b3IpIGJpbmRpbmcgZnJvbQo+ID4gdGV4dCBmb3JtIHRvIFlBTUwuIFRo
ZSBsaXN0IG9mIGNvbXBhdGlibGUgc3RyaW5ncyByZWZsZWN0cyB3aGF0IHdhcwo+ID4gcHJldmlv
dXNseSBkZXNjcmliZWQgaW4gcHJvc2U7IG5vdCBhbGwgY29tYmluYXRpb25zIG9jY3VyIGluIGV4
aXN0aW5nCj4gPiBkZXZpY2V0cmVlcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2No
w6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KPiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2NyeXB0by9mc2wsc2VjMi4wLnlhbWwgICAgIHwgMTM5ICsrKysrKysrKysrKysrKysrKysr
Kwo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NyeXB0by9mc2wtc2VjMi50eHQgICAgICAg
IHwgIDY1IC0tLS0tLS0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEzOSBpbnNlcnRpb25zKCsp
LCA2NSBkZWxldGlvbnMoLSkKWy4uLl0KPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJs
ZToKPiA+ICsgICAgZGVzY3JpcHRpb246IHwKPiAKPiBEb24ndCBuZWVkICd8Jy4gSSBpbWFnaW5l
IHRoZXJlIGFyZSBtb3JlIGluIHRoZSBzZXJpZXMsIGJ1dCB3aWxsIGxldCB5b3UgCj4gZmluZCB0
aGUgcmVzdC4KClllcwoKPiA+ICsgIGZzbCxudW0tY2hhbm5lbHM6Cj4gPiArICAgICRyZWY6IC9z
Y2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4gKyAgICBkZXNjcmlwdGlv
bjogQW4gaW50ZWdlciByZXByZXNlbnRpbmcgdGhlIG51bWJlciBvZiBjaGFubmVscyBhdmFpbGFi
bGUuCj4gCj4gbWluaW11bTogMQo+IG1heGltdW06ID8KCkFjY29yZGluZyB0byBleGlzdGluZyB1
c2FnZSAoYW5kIGEgY3Vyc29yeSBzdHVkeSBvZiBkYXRhc2hlZXRzKSwKcG9zc2libGUgdmFsdWVz
IGFyZSAxIG9yIDQuCgo+IAo+ID4gKwo+ID4gKyAgZnNsLGNoYW5uZWwtZmlmby1sZW46Cj4gPiAr
ICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4gKyAg
ICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgIEFuIGludGVnZXIgcmVwcmVzZW50aW5nIHRoZSBu
dW1iZXIgb2YgZGVzY3JpcHRvciBwb2ludGVycyBlYWNoIGNoYW5uZWwKPiA+ICsgICAgICBmZXRj
aCBmaWZvIGNhbiBob2xkLgo+IAo+IENvbnN0cmFpbnRzPwoKQ3VycmVudCB1c2FnZSBzaG93cyBh
IHR5cGljYWwgdmFsdWUgb2YgMjQsIGFsdGhvdWdoIEkgd2Fzbid0IGFibGUgdG8KZmluZCBhbnkg
aW5mb3JtYXRpb24gaW4gdGhlIGRhdGFzaGVldHMuIEknbGwgYWRkIHBsYXVzaWJsZSBsaW1pdHMu
Cgo+IAo+ID4gKwo+ID4gKyAgZnNsLGV4ZWMtdW5pdHMtbWFzazoKPiA+ICsgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgIGRlc2NyaXB0aW9u
OiB8Cj4gPiArICAgICAgVGhlIGJpdG1hc2sgcmVwcmVzZW50aW5nIHdoYXQgZXhlY3V0aW9uIHVu
aXRzIChFVXMpIGFyZSBhdmFpbGFibGUuCj4gPiArICAgICAgRVUgaW5mb3JtYXRpb24gc2hvdWxk
IGJlIGVuY29kZWQgZm9sbG93aW5nIHRoZSBTRUMncyBEZXNjcmlwdG9yIEhlYWRlcgo+ID4gKyAg
ICAgIER3b3JkIEVVX1NFTDAgZmllbGQgZG9jdW1lbnRhdGlvbiwgaS5lLiBhcyBmb2xsb3dzOgo+
ID4gKwo+ID4gKyAgICAgICAgYml0IDAgID0gcmVzZXJ2ZWQgLSBzaG91bGQgYmUgMAo+ID4gKyAg
ICAgICAgYml0IDEgID0gc2V0IGlmIFNFQyBoYXMgdGhlIEFSQzQgRVUgKEFGRVUpCj4gPiArICAg
ICAgICBiaXQgMiAgPSBzZXQgaWYgU0VDIGhhcyB0aGUgREVTLzNERVMgRVUgKERFVSkKPiA+ICsg
ICAgICAgIGJpdCAzICA9IHNldCBpZiBTRUMgaGFzIHRoZSBtZXNzYWdlIGRpZ2VzdCBFVSAoTURF
VS9NREVVLUEpCj4gPiArICAgICAgICBiaXQgNCAgPSBzZXQgaWYgU0VDIGhhcyB0aGUgcmFuZG9t
IG51bWJlciBnZW5lcmF0b3IgRVUgKFJORykKPiA+ICsgICAgICAgIGJpdCA1ICA9IHNldCBpZiBT
RUMgaGFzIHRoZSBwdWJsaWMga2V5IEVVIChQS0VVKQo+ID4gKyAgICAgICAgYml0IDYgID0gc2V0
IGlmIFNFQyBoYXMgdGhlIEFFUyBFVSAoQUVTVSkKPiA+ICsgICAgICAgIGJpdCA3ICA9IHNldCBp
ZiBTRUMgaGFzIHRoZSBLYXN1bWkgRVUgKEtFVSkKPiA+ICsgICAgICAgIGJpdCA4ICA9IHNldCBp
ZiBTRUMgaGFzIHRoZSBDUkMgRVUgKENSQ1UpCj4gPiArICAgICAgICBiaXQgMTEgPSBzZXQgaWYg
U0VDIGhhcyB0aGUgbWVzc2FnZSBkaWdlc3QgRVUgZXh0ZW5kZWQgYWxnIHNldCAoTURFVS1CKQo+
ID4gKwo+ID4gKyAgICAgIHJlbWFpbmluZyBiaXRzIGFyZSByZXNlcnZlZCBmb3IgZnV0dXJlIFNF
QyBFVXMuCj4gCj4gU286Cj4gCj4gbWF4aW11bTogMHhmZmYKCldpbGwgYWRkLgoKClRoYW5rIHlv
dSBmb3IgeW91ciByZXZpZXdzLgoKQmVzdCByZWdhcmRzLApKLiBOZXVzY2jDpGZlcgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
