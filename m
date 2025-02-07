Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AF2C02199
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 23:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lznkD/g8Nmedu9uvC0n8JWcfkhKrAmBKgZluz1KQVVk=; b=3BVmOcWmM4E+/w
	Au8ysKPY9EFFfR/HdgG02BDaHLfLInBPl+ziKhG8fKuDk1+oqm5C4UgH3luIMaJDiSpXtzg7y0RnO
	C9khvD/ly/NSkni//OmfSBctV22iNOZF9aW3/1xN2bDWrHYVi1u+runso7+PD090O2PlX4wXentma
	93Y6UpqOBBZvj3erQHHfXVWP8GXqAcpt4yGOlw80Vv2fD6KVUJ/y1DRgccHF/ehA8jI0IvjPcudPS
	4/QMKnRw61qgtvk/gell+a5Nl+0nvTWpQ11GF4UIIvEqxZ5vXidSB8k7SzXWwKQLU3f0nlxUDv/9S
	GsbsSkbRLaA2Wscq7Xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXbU-0000000BUd1-45me;
	Fri, 07 Feb 2025 23:17:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXbS-0000000BUbM-1TVn
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 23:17:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B85ADA43E2A;
	Fri,  7 Feb 2025 23:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0028C4CEE2;
	Fri,  7 Feb 2025 23:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738970260;
	bh=uBu6t4ty0hQZKKSCZBRKb4E9WpdD1GpGMPNfBVQXDVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nvPoqqaucbZ+Zi7dcFcDf19MmSlaU676cQ27+TNgNPph5SnE0OcWAbUo6mtU6XA70
	 CRj64dcDZGAl20MNFWj5ElGlRslwwc5/82rTjSJ/eeDkPagVEXOvKsD37lz5OmauQ/
	 BljW5xyk6RVr97YBC4nN3jG9BDk7HPMnGeR5w/afedLrOmISQIhvJXZa2NMYrUgnwM
	 +ems6aj8tw36WCnlJU03Wieogvtqo9kWaQrsmW8KgpgFP0XAmUNUufDSjHc1B4z7ZF
	 HP5wB6OAf2XEnk0gkYoiiGTKTKW1VOfe52a2OyomRnFgIxjFCNSp7ViFtzhQ4/rN4C
	 MKlSVzR3S6BAg==
Message-ID: <8de72c76-6fea-4f8a-b818-72c8de07a78c@kernel.org>
Date: Sat, 8 Feb 2025 08:17:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] dt-bindings: ata: Convert fsl,pq-sata to YAML
To: j.ne@posteo.net, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: imx@lists.linux.dev, Scott Wood <oss@buserror.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?J=2E_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-2-8137b0c42526@posteo.net>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250207-ppcyaml-v2-2-8137b0c42526@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_151742_456269_7A02FBEA 
X-CRM114-Status: UNSURE (   6.35  )
X-CRM114-Notice: Please train this message.
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

T24gMi84LzI1IDA2OjMwLCBKLiBOZXVzY2jDpGZlciB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gRnJv
bTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0Pgo+IAo+IENvbnZlcnQgdGhlIEZy
ZWVzY2FsZSBQb3dlclFVSUNDIFNBVEEgY29udHJvbGxlciBiaW5kaW5nIGZyb20gdGV4dCBmb3Jt
Cj4gdG8gWUFNTC4gVGhlIGxpc3Qgb2YgY29tcGF0aWJsZSBzdHJpbmdzIHJlZmxlY3RzIGN1cnJl
bnQgdXNhZ2UuCj4gCj4gVG8gY2xhcmlmeSB0aGUgZGVzY3JpcHRpb24sIEkgY2hhbmdlZCBpdCB0
byBtZW50aW9uICJlYWNoIFNBVEEKPiBjb250cm9sbGVyIiBpbnN0ZWFkIG9mIGVhY2ggcG9ydC4K
PiAKPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiBT
aWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgoKQWNrZWQtYnk6
IERhbWllbiBMZSBNb2FsIDxkbGVtb2FsQGtlcm5lbC5vcmc+CgotLSAKRGFtaWVuIExlIE1vYWwK
V2VzdGVybiBEaWdpdGFsIFJlc2VhcmNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
