Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8EFC02199
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Feb 2025 02:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SF6TMl4fWpTCb4ScrNKQGqc6rvyz/vNc5XtKpmExrdc=; b=g33a4ARrX5IiAb
	kpuDJEj2kJC/tA1AawcFVhcIFHtenTf43SZQWMz3C1ay42Tr8nPz+dVXrPqY3aPYt5+Ia6Y9+O5QH
	96son4es3639nEZ7wGvoW9dM3ypd2Dz4I/Ka8u02FSEpNxtqKU6FhhURTRUlVFHqq2kWRtxMdonSj
	6OJwr6+M07B7BnJbX7H49U8zIczrAXJxar+YbYYeDh8oZSMSf6M1+EV0nHu5psnnGZ4TVRUSWfofk
	QoCB6ulpyl45FuYRWjbGOBGO0KJhjBa2OPJ4lPdHAIkLHJuK3m1zzBghX/wo50boYD+EROrelhpD5
	E8qmooGK1D8PfK27Gipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaTO-0000000Bu6k-17sX;
	Sat, 08 Feb 2025 02:21:34 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaSr-0000000Btz0-0IP7
	for linux-mtd@lists.infradead.org;
	Sat, 08 Feb 2025 02:21:05 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 7F650240101
	for <linux-mtd@lists.infradead.org>; Sat,  8 Feb 2025 03:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738981254; bh=X/9UQWBS5m7Ib3mDDNhFlWLQ3zPrVaQFBwT1jLZLH3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=A78rJooZN8UtN3+vX1NHzW5GxE8tztAy6ovu2FBjQcSf1io3nYqEo2OUdgj0cSrZE
	 VrdhXd4ZP4qXBfZrgzi6QaW6wT9eeBlkiqPhxEsQHOdzxlgkeh18AIiTNcI4i+f9Co
	 l3XGq4UzkfR7QDLqgAyXpGsC7M8JbHFHYvYKm0Kq9HfspPykKeNCwGEMlS4UK6ZpmO
	 bKKpcemYzXNkRt2e48In5cmQAdCxY2QWz1WyBAd0GdU9tfOJ64akKLXgWn3VPUN952
	 LHTWH0F7L3NRiUHEGq79kL+wKRk1yX5rk7zQFg1pb14Y6jxf39/8Cle2JYNi/49wzq
	 V6T7FV87eJSfw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YqZM431Sgz9rxL;
	Sat,  8 Feb 2025 03:20:48 +0100 (CET)
Date: Sat,  8 Feb 2025 02:20:47 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Mark Brown <broonie@kernel.org>
Cc: j.ne@posteo.net, devicetree@vger.kernel.org,
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
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <Z6a_f03Ct9aB7Bbn@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_182101_253257_4A6736CA 
X-CRM114-Status: GOOD (  14.19  )
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

T24gRnJpLCBGZWIgMDcsIDIwMjUgYXQgMDk6Mzg6MDVQTSArMDAwMCwgTWFyayBCcm93biB3cm90
ZToKPiBPbiBGcmksIEZlYiAwNywgMjAyNSBhdCAxMDozMDoxN1BNICswMTAwLCBKLiBOZXVzY2jD
pGZlciB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gCj4gPiBUaGlzIGlzIGEgc3Bpbi1vZmYgb2YgdGhl
IHNlcmllcyB0aXRsZWQKPiA+ICJwb3dlcnBjOiBNUEM4M3h4IGNsZWFudXAgYW5kIExBTkNPTSBO
V0FQUDIgYm9hcmQiLgo+IAo+ID4gRHVyaW5nIHRoZSBkZXZlbG9wbWVudCBvZiB0aGF0IHNlcmll
cywgaXQgYmVjYW1lIGNsZWFyIHRoYXQgbWFueQo+ID4gZGV2aWNldHJlZSBiaW5kaW5ncyBmb3Ig
RnJlZXNjYWxlIE1QQzh4eHggcGxhdGZvcm1zIGFyZSBzdGlsbCBpbiB0aGUgb2xkCj4gPiBwbGFp
bi10ZXh0IGZvcm1hdCwgb3IgZG9uJ3QgZXhpc3QgYXQgYWxsLCBhbmQgaW4gYW55IGNhc2UgZG9u
J3QgbWVudGlvbgo+ID4gYWxsIHZhbGlkIGNvbXBhdGlibGUgc3RyaW5ncy4KPiAKPiBXaGF0J3Mg
dGhlIHN0b3J5IHdpdGggZGVwZW5kZW5jaWVzIGhlcmUgLSB3aHkgaXMgYWxsIHRoaXMgc3R1ZmYg
aW4gb25lCj4gc2VyaWVzPwoKVGhlIHBhdGNoZXMgYXJlIGluZGVwZW5kZW50IG9mIGVhY2ggb3Ro
ZXIsIGV4Y2VwdCBmb3IgdGhlIGZvdXIgZWxiYy9uYW5kCnBhdGNoZXMuIFRoZXkgYXJlIGluIHRo
ZSBzYW1lIHNlcmllcyBiZWNhdXNlIHRoZXkgY2FtZSB1cCBkdXJpbmcgdGhlCnNhbWUgcHJvamVj
dCBhbmQgYWNoaWV2ZSBzaW1pbGFyIGdvYWxzLCBidXQgaXQgaXNuJ3QgbmVjZXNzYXJ5LgoKCj4g
Tm9ybWFsbHkgSSdkIGV4cGVjdCBiaW5kaW5ncyBjb252ZXJzaW9ucyB0byBiZSBzdGFuZGFsb25l
LgoKTm90ZWQuCgoKSi4gTmV1c2Now6RmZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
