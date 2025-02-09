Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ED6C0219B
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Feb 2025 17:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNAwmqAhUyc2G06yBEuhS19GC/ul0WSeJNVe308TD+k=; b=aLNnPVDNc7O/Pa
	QY2Q84azuDcu0vl+z3cab9fRAu8C6TZkAKbg9Da+UhSKMOWX2PO1/NOdpLMhUBuqf1lt8QohRpccq
	308KOvtp69sWvQcCrVrSSbbsxH5I3vYQHWhU21v4yMZjiRqOWpZaDjGEuw1ZAB4+9Ak2t24kJXiT3
	Dthvx21L/+G91eBaprq/xRzFbR/TMbkwi9+Z+aoZmRqRABDpgGM5CnG9ocfJB7Xpfr99RVbDIxmFb
	Twozlkl+wAH59aF50K9ynALuUK/omuyQWR0ao/H85kUEuf1txdDmx1pRU5KRshlCwmKAruiDkK3Vg
	N4gXANlHsEruDewyLjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thBND-0000000FHGN-2gVZ;
	Sun, 09 Feb 2025 17:45:39 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thBNA-0000000FHFe-3BY4
	for linux-mtd@lists.infradead.org;
	Sun, 09 Feb 2025 17:45:38 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 9156B240103
	for <linux-mtd@lists.infradead.org>; Sun,  9 Feb 2025 18:45:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739123132; bh=wwaN1MEN5EN7ialSuuoReLLWAW4uA92LExoXB3rQqdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=pFQz+McgXOD4SJpqS3t88fYmh0f5343D1MX9fCQZ5W5ZdV5d90NJnQIiHn4PjdCht
	 jpzs5EMtNx/SAOBHAvluntIEwLOprerzu70UzAecNitIGH8k0ZnZrhUFsPPYt30bPa
	 5W++llA90llvNmYGZGg6pjdtnttlirT0AnVYIO3h/V52Nxuo2QcmZfdHQ5yO7Q21SW
	 jvIRtzOr5XZUGt9zXBs5HlCATqYCjE2JIiSc7GPY4SJyuH2VUSeO6sOP/akjsfoNL7
	 NQWpd+m9PlYAgJGrD6+VmVwjqa+7KOvmx5tud7mokjtobj+GT1nLVBwQhE74lhhlhe
	 V93cWZaX8J0/A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YrZqX2D0Mz9rxK;
	Sun,  9 Feb 2025 18:45:28 +0100 (CET)
Date: Sun,  9 Feb 2025 17:45:27 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-ide@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linuxppc-dev@lists.ozlabs.org, linux-spi@vger.kernel.org,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>, Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Richard Weinberger <richard@nod.at>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
Message-ID: <Z6jptzP7KLxmIJeL@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <173897189669.2630636.11579554304003668196.robh@kernel.org>
 <Z6jlrU7EPeATjK8s@probook>
 <4c41a8e2-b097-4b95-ba0a-115dbbfc4e1a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c41a8e2-b097-4b95-ba0a-115dbbfc4e1a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_094537_092166_3FD70ECD 
X-CRM114-Status: GOOD (  14.73  )
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

T24gU3VuLCBGZWIgMDksIDIwMjUgYXQgMDY6MzA6NDRQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBPbiAwOS8wMi8yMDI1IDE4OjI4LCBKLiBOZXVzY2jDpGZlciB3cm90ZToK
PiA+IE9uIEZyaSwgRmViIDA3LCAyMDI1IGF0IDA1OjQ0OjU5UE0gLTA2MDAsIFJvYiBIZXJyaW5n
IChBcm0pIHdyb3RlOgo+ID4+IE9uIEZyaSwgMDcgRmViIDIwMjUgMjI6MzA6MjYgKzAxMDAsIEou
IE5ldXNjaMOkZmVyIHdyb3RlOgo+ID4gWy4uLl0KPiA+Pj4gIC4uLi9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvZnNsLGVsYmMueWFtbCAgICAgIHwgMTQ2ICsrKysrKysrKysrKysrKysrKysr
Kwo+ID4+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9mc2wvbGJjLnR4dCAgICAg
ICAgfCAgNDMgLS0tLS0tCj4gPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDE0NiBpbnNlcnRpb25zKCsp
LCA0MyBkZWxldGlvbnMoLSkKPiA+IFsuLi5dCj4gPj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vy
cm9yczoKPiA+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRy
b2xsZXJzL2ZzbCxlbGJjLmV4YW1wbGUuZHRiOiAvZXhhbXBsZS0wL2xvY2FsYnVzQGYwMDEwMTAw
L3NpbXBsZS1wZXJpcGhAMiwwOiBmYWlsZWQgdG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBh
dGlibGU6IFsnZnNsLGVsYmMtZ3BjbS11aW8nXQo+ID4+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMuZXhhbXBsZS5kdGI6IC9leGFt
cGxlLTEvbG9jYWxidXNAZTAwMDUwMDAvbmFuZEAxLDA6IGZhaWxlZCB0byBtYXRjaCBhbnkgc2No
ZW1hIHdpdGggY29tcGF0aWJsZTogWydmc2wsbXBjODMxNS1mY20tbmFuZCcsICdmc2wsZWxiYy1m
Y20tbmFuZCddCj4gPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1j
b250cm9sbGVycy9mc2wsZWxiYy5leGFtcGxlLmR0YjogL2V4YW1wbGUtMS9sb2NhbGJ1c0BlMDAw
NTAwMC9uYW5kQDEsMDogZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxl
OiBbJ2ZzbCxtcGM4MzE1LWZjbS1uYW5kJywgJ2ZzbCxlbGJjLWZjbS1uYW5kJ10KPiA+IAo+ID4g
SSB0aGluayB0aGlzIGlzIGR1ZSB0byBob3cgdGhlIHBhdGNoZXMgYXJlIG9yZGVyZWQgaW4gdGhl
IHNlcmllcy4KPiAKPiBJZiB0aGF0J3MgcG9zc2libGUsIHRoaXMgc2hvdWxkIGJlIGZpeGVkLCBl
LmcuICBieSByZS1vcmRlcmluZyB0aGUgcGF0Y2hlcy4KClllcywgSSdsbCBkbyB0aGF0IGZvciB0
aGUgbmV4dCBpdGVyYXRpb24KCgpCZXN0IHJlZ2FyZHMsCkouIE5ldXNjaMOkZmVyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
