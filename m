Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D6AC021A3
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Feb 2025 17:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7K3q1HxmOrRdmRGHZo48R5lvEgnkeFJ4i6TtPuRPxwM=; b=DHPkIvJ/nemWon
	lLF2qJ3TzVdlimH9uR7HqS0u2Ly6n/3MG0osm73AU2fCSpz9fvwej7SGT+GS5Lr9QqtbGpw+6Ev5S
	HLjgqJdQVpme8vCxXoJoM/nuPwdw9HlbSsuuSrnZilsLOQeT74irNyxuOoe/P22G7hPcJtnTwkYAk
	rDq/Vjx6vTTHerou8u8EFoo55RwQyzcEmra7LUSkQUjHX/+gbgN3SIUbaq4XIXRh6F+KefWNSPFk7
	0sqrW8Bi6eqlsWP33WO7yQMmrSLFdbTumhRptvrqNxg6QPfydPLTEh8/Ic88Mh5keFrHMKsvCLV7N
	oho9/Q08YW+h+Cb+k4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thB99-0000000FG8e-0afE;
	Sun, 09 Feb 2025 17:31:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thB93-0000000FG77-45uS
	for linux-mtd@lists.infradead.org;
	Sun, 09 Feb 2025 17:31:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 833265C5BCF;
	Sun,  9 Feb 2025 17:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B079FC4CEF3;
	Sun,  9 Feb 2025 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739122258;
	bh=xH6x/QYtEnKtOblwV4z7BbFUBC1Q4T3epCkfofCCAoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nzvOo5BGo8/4jIfa3Y9Dvm/ix3FOQgmCTPYJrDTTpnTF8h4ed2s6WH+ZEQJE5DuBM
	 TiXGG2DC/pUa/lpw+2F7ONZG6qBZK4kBuRFyrKA6pwqSRxRdyDdu3EYZGuV4+GXUcM
	 AmJkYJf4cXdsVyVj1cmHJVAIjp7zb+5jJeAaMe+oJmJfvOQgJ0ik7KcaQDDriFHB3k
	 a5TKl2uzSC3/Eea9//uMC9/wAyp471x/l9vtA9ZEAkibIHHiAmV1xHqfuxewICie/I
	 LXlkqYsVeuBj2LyUYImLqEaZCz0IQCgl1n/UR081ULm5viW5EkJpOyMlS9mb4eJLET
	 nPhV2eS0CkvbA==
Message-ID: <4c41a8e2-b097-4b95-ba0a-115dbbfc4e1a@kernel.org>
Date: Sun, 9 Feb 2025 18:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-ide@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linuxppc-dev@lists.ozlabs.org,
 linux-spi@vger.kernel.org, =?UTF-8?Q?J=2E_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, Guenter Roeck <linux@roeck-us.net>,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Naveen N Rao <naveen@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev,
 Niklas Cassel <cassel@kernel.org>, Scott Wood <oss@buserror.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Richard Weinberger <richard@nod.at>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-pci@vger.kernel.org
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <173897189669.2630636.11579554304003668196.robh@kernel.org>
 <Z6jlrU7EPeATjK8s@probook>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z6jlrU7EPeATjK8s@probook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_093102_106462_184E39F6 
X-CRM114-Status: GOOD (  11.72  )
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

T24gMDkvMDIvMjAyNSAxODoyOCwgSi4gTmV1c2Now6RmZXIgd3JvdGU6Cj4gT24gRnJpLCBGZWIg
MDcsIDIwMjUgYXQgMDU6NDQ6NTlQTSAtMDYwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3JvdGU6Cj4+
IE9uIEZyaSwgMDcgRmViIDIwMjUgMjI6MzA6MjYgKzAxMDAsIEouIE5ldXNjaMOkZmVyIHdyb3Rl
Ogo+IFsuLi5dCj4+PiAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy55
YW1sICAgICAgfCAxNDYgKysrKysrKysrKysrKysrKysrKysrCj4+PiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvcG93ZXJwYy9mc2wvbGJjLnR4dCAgICAgICAgfCAgNDMgLS0tLS0tCj4+PiAgMiBm
aWxlcyBjaGFuZ2VkLCAxNDYgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCj4gWy4uLl0K
Pj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoKPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy5leGFtcGxlLmR0YjogL2V4
YW1wbGUtMC9sb2NhbGJ1c0BmMDAxMDEwMC9zaW1wbGUtcGVyaXBoQDIsMDogZmFpbGVkIHRvIG1h
dGNoIGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxlOiBbJ2ZzbCxlbGJjLWdwY20tdWlvJ10KPj4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9mc2ws
ZWxiYy5leGFtcGxlLmR0YjogL2V4YW1wbGUtMS9sb2NhbGJ1c0BlMDAwNTAwMC9uYW5kQDEsMDog
ZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxlOiBbJ2ZzbCxtcGM4MzE1
LWZjbS1uYW5kJywgJ2ZzbCxlbGJjLWZjbS1uYW5kJ10KPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy5leGFtcGxlLmR0YjogL2V4
YW1wbGUtMS9sb2NhbGJ1c0BlMDAwNTAwMC9uYW5kQDEsMDogZmFpbGVkIHRvIG1hdGNoIGFueSBz
Y2hlbWEgd2l0aCBjb21wYXRpYmxlOiBbJ2ZzbCxtcGM4MzE1LWZjbS1uYW5kJywgJ2ZzbCxlbGJj
LWZjbS1uYW5kJ10KPiAKPiBJIHRoaW5rIHRoaXMgaXMgZHVlIHRvIGhvdyB0aGUgcGF0Y2hlcyBh
cmUgb3JkZXJlZCBpbiB0aGUgc2VyaWVzLgoKSWYgdGhhdCdzIHBvc3NpYmxlLCB0aGlzIHNob3Vs
ZCBiZSBmaXhlZCwgZS5nLiAgYnkgcmUtb3JkZXJpbmcgdGhlIHBhdGNoZXMuCgo+IFRoaXMgcGF0
Y2ggdXNlcyBmc2wsZWxiYy1ncGNtLXVpbyBhbmQgZnNsLGVsYmMtZmNtLW5hbmQgaW4gZXhhbXBs
ZXMsIGJ1dAo+IGNvbWVzIGJlZm9yZSB0aGUgcGF0Y2hlcyB0aGF0IGRlZmluZSB0aGUgY29ycmVz
cG9uZGluZyBiaW5kaW5ncy4KCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
