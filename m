Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FCAC3DA45
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRQYTGcKQWyBdwY8T3epkEpNW8CYUpE98wgXJdElObM=; b=0QgE1vRjD2aAKn
	MwJmWG2RKtLhnbx9GGR3Kx9Sj3q+EiVMGWGt8Ou2+IBHQB1Rh0VQZhRu29eVzMc8ipsdvtElJJp1a
	FlPQc+qe5SrSt/NmmTLY17UisKz23jVhRoZKfIXh3UDcTQxbjSOMwPnRpgx9SCJTEN6B5uwQuLPme
	tl9K87mKllwPTft5TSH1s7fOEdEcdI8QklI9a2v0uNnlQX+F6kCEfDsmqWLug3CmZAYd40kXN/YWH
	JCImumWCuUIlB3O6L2EuWm9QK7RdanUE4m2pA+qtZDyrmEfIb1iFUCvCz4ScXXBD53pErVFos5eHG
	Wueeu0mva47mWpaNIwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sReqN-0000000Bm5R-2G4M;
	Wed, 10 Jul 2024 21:27:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sReq4-0000000BlxF-1IGH;
	Wed, 10 Jul 2024 21:27:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 194FB61B27;
	Wed, 10 Jul 2024 21:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EDCC32781;
	Wed, 10 Jul 2024 21:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720646818;
	bh=UyV9QbskN7z87S59wOHZ2z6ufUHkf36Y+JyJjuFAzSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pPZwmdACIM5CFKtV379ANRxnTOElJ/KOZO8aepw99FFFLmxpWtFWz1WrZ9AT64Oja
	 07Wtlhw27CDzKBZMWvsaZNko9mwmH4NrjAdwxhc4OpAxPh5eMdr9Z4mrc5OgcMjhbP
	 9fu/M+OZVbJ4x8b3bu2kbvmf/oqbJR4Tj9gxFDPomiN8EYJ2N4B9METkFfbbvcIWDe
	 N9xoZRYzOxv1OHS7Xeb2kyo6x3OClcnBl+z2Wn37ZNKWk1PjpRgqGR9lMpArrcW2CD
	 zeWKZPv+0ILdSC98Vpz7cNE0OEGJqDz+0/cbSuYKzKilHHT1gCt1pcBXwUDB1/f9ZG
	 z8clcEP33kTyw==
Date: Wed, 10 Jul 2024 15:26:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Walle <michael@walle.cc>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, u-boot@lists.denx.de,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: convert U-Boot env to a layout
Message-ID: <172064681629.3804403.16986704276630415661.robh@kernel.org>
References: <20240705225821.13196-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240705225821.13196-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_142700_420082_88446815 
X-CRM114-Status: GOOD (  17.47  )
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

Ck9uIFNhdCwgMDYgSnVsIDIwMjQgMDA6NTg6MjEgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gVS1Cb290
IGVudmlyb25tZW50IHZhcmlhYmxlcyBjYW4gYmUgc3RvcmVkIGluIHZhcmlvdXMgZGF0YSBzb3Vy
Y2VzLiBNVEQKPiBpcyBqdXN0IG9uZSBvZiBhdmFpbGFibGUgb3B0aW9ucy4gUmVmYWN0b3IgRFQg
YmluZGluZyBpbnRvIGEgbGF5b3V0IHNvCj4gaXQgY2FuIGJlIHVzZWQgd2l0aCBVQkkgdm9sdW1l
cyBhbmQgb3RoZXIgTlZNRU0gZGV2aWNlcy4KPiAKPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyMzEyMjExNzM0MjEuMTM3MzctMS16YWplYzVAZ21haWwuY29tLwo+IFNpZ25l
ZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiBJJ20g
c2VuZGluZyB0aGlzIFBBVENIIHdpdGhvdXQgTGludXggY2hhbmdlcyB0byBzZWUgaWYgdGhpcyBp
cyB0aGUKPiByaWdodCBhcHByb2FjaCAtIGZvciBkZXZlbG9wZXJzIGFuZCAoRFQpIG1haW50YWlu
ZXJzIHRvIHJldmlldyBpdCBmaXJzdC4KPiAKPiBNeSBwcmV2aW91cyBhdHRlbXB0IChzZWUgYWJv
dmUgTGluaykgdHVybmVkIG91dCBpbiByZWZ1c2FsIHNvIEknbSBqdXN0Cj4gdHJ5aW5nIHRvIHNh
dmUgc29tZSB0aW1lIGluIGNhc2UgdGhpcyBvbmUgZ29lcyB3cm9uZyBhcyB3ZWxsLgo+IAo+IEhv
cGVmdWxseSB0aGUgaW5jbHVkZWQgZXhhbXBsZSAod2hpY2ggSSByZWFsbHkgdGhpbmsgd2Ugc2hv
dWxkIGFkZCkKPiBleHBsYWlucyB3ZWxsIGhvdyBJIHRoaW5rIHRoaXMgYmluZGluZyBzaG91bGQg
YmUgdXNlZCB3aXRoIGxheW91dHMuCj4gCj4gSWYgSSBnZXQgc29tZSBwb3NpdGl2ZSBmZWVkYmFj
ayBJJ2xsIHdvcmsgb24gVjIgd2l0aCBhY3R1YWwgTGludXgKPiBjaGFuZ2VzLgo+IAo+ICAuLi4v
YmluZGluZ3MvbnZtZW0vbGF5b3V0cy9udm1lbS1sYXlvdXQueWFtbCAgfCAgMSArCj4gIC4uLi9u
dm1lbS97ID0+IGxheW91dHN9L3UtYm9vdCxlbnYueWFtbCAgICAgICB8IDM5ICsrKysrKysrKysr
KysrKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+ICByZW5hbWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3sg
PT4gbGF5b3V0c30vdS1ib290LGVudi55YW1sICg3NSUpCj4gCgpSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
