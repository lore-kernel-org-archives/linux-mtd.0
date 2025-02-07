Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6F9C0219D
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 23:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LNcVlnhOOGLQcT6BDJxelzRJJ/84iP21dfqWteku77U=; b=rmooSWdV6KWJJAhebh/y76FpZc
	/R/V1jO021BOVWCdHoGs4IKf5p+iY3vrl/NRSRu2givDgGqY9BRtB7GXxVdPSgmrn1ZF9ujMwujOZ
	2cbnI6jYPToInedRtJECdEaMiOyyUYQGXG+rF5Z0PDK9B5VHVKmUZmPU7nfP5CS5k3OfGUEEBRVkb
	M7sNDTqTPeF4Tl4JUrsw4DCcGz56lX457ISMdNVijlGvpUJ8uUDq0O+f5xhg8BVnBR2ZOqXQnucbF
	SUw2CD3tgV25aXhXHAG1dnXdIns9ROiY4g4lS3aTrtFZlKnG8X7JLSNbf0TFF81VLFwWZKS/g0xPB
	hbee1VPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY1y-0000000BY7r-3rVo;
	Fri, 07 Feb 2025 23:45:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY1u-0000000BY4p-3qww
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 23:45:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 795EB5C6F70;
	Fri,  7 Feb 2025 23:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BB2C4CEE7;
	Fri,  7 Feb 2025 23:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738971902;
	bh=tBmrobeWDK6+aWiDeO0VVX8TfLiyt8/pAlurKL5A7RE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=G8ojqiQ5opUcLh9s5PIYTf2xPkT83yWsGUUHMXZl5lHvU6Mn89nnfv1wXOW49TcSk
	 35SMUuUZOOgoJLT1UHJm98Nw4GgaIdcRaplBWxiW/VtIYdY+P/3lZT6Jz1vLQF/gwj
	 svxuttRP4HEgFQyLjnmsLgdlQ5bdZOjF91Twr0GobeyOz0U6GD0yldmMLdu7tdpkor
	 CpqoqihaNPN8X+975ECarsF0RKSWGwgPsmlC82hEz5wGp7SdFyUWd36Ps+rMzrTvTC
	 qmr/9q3CQmDhFTduB9v0s+gIIMBo+p73n2Liv87lB/04iL03xko1aXY72hB7noSMrT
	 AodCA/oLktTDA==
Date: Fri, 07 Feb 2025 17:45:00 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Guenter Roeck <linux@roeck-us.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Richard Weinberger <richard@nod.at>, Lee Jones <lee@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, linux-pci@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, imx@lists.linux.dev, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Scott Wood <oss@buserror.net>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Damien Le Moal <dlemoal@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Niklas Cassel <cassel@kernel.org>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250207-ppcyaml-v2-11-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-11-8137b0c42526@posteo.net>
Message-Id: <173897189774.2630698.330205726613217230.robh@kernel.org>
Subject: Re: [PATCH v2 11/12] dt-bindings: nand: Add fsl,elbc-fcm-nand
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_154503_046046_684159EB 
X-CRM114-Status: GOOD (  13.88  )
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

Ck9uIEZyaSwgMDcgRmViIDIwMjUgMjI6MzA6MjggKzAxMDAsIEouIE5ldXNjaMOkZmVyIHdyb3Rl
Ogo+IEZvcm1hbGl6ZSB0aGUgYmluZGluZyBhbHJlYWR5IHN1cHBvcnRlZCBieSB0aGUgZnNsX2Vs
YmNfbmFuZC5jIGRyaXZlcgo+IGFuZCB1c2VkIGluIHNldmVyYWwgZGV2aWNlIHRyZWVzIGluIGFy
Y2gvcG93ZXJwYy9ib290L2R0cy8uCj4gCj4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIg
PGoubmVAcG9zdGVvLm5ldD4KPiAtLS0KPiAKPiBWMjoKPiAtIHNwbGl0IG91dCBmcm9tIGZzbCxl
bGJjIGJpbmRpbmcgcGF0Y2gKPiAtIGNvbnN0cmFpbiAjYWRkcmVzcy1jZWxscyBhbmQgI3NpemUt
Y2VsbHMKPiAtIGFkZCBhIGdlbmVyYWwgZGVzY3JpcHRpb24KPiAtIHVzZSB1bmV2YWx1YXRlZFBy
b3BlcnRpZXM9ZmFsc2UgaW5zdGVhZCBvZiBhZGRpdGlvbmFsUHJvcGVydGllcz1mYWxzZQo+IC0g
Zml4IHByb3BlcnR5IG9yZGVyIHRvIGNvbXBseSB3aXRoIGR0cyBjb2Rpbmcgc3R5bGUKPiAtIGlu
Y2x1ZGUgcmF3LW5hbmQtY2hpcC55YW1sIGluc3RlYWQgb2YgbmFuZC1jaGlwLnlhbWwKPiAtLS0K
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwgfCA2
OCArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25z
KCspCj4gCgpNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVj
aycgb24geW91ciBwYXRjaDoKCnlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoKCmR0c2NoZW1hL2R0
YyB3YXJuaW5ncy9lcnJvcnM6Ci9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9mc2wsZWxiYy1mY20tbmFuZC5l
eGFtcGxlLmR0YjogbmFuZEAxLDA6ICRub2RlbmFtZTowOiAnbmFuZEAxLDAnIGRvZXMgbm90IG1h
dGNoICdebmFuZEBbYS1mMC05XSQnCglmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL210ZC9mc2wsZWxiYy1mY20tbmFuZC55YW1sIwovYnVpbGRzL3JvYmhlcnJp
bmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMuZXhhbXBsZS5kdGI6IG5hbmRAMSwwOiAkbm9kZW5h
bWU6MDogJ25hbmRAMSwwJyBkb2VzIG5vdCBtYXRjaCAnXm5hbmRAW2EtZjAtOV0kJwoJZnJvbSBz
Y2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvZnNsLGVsYmMtZmNt
LW5hbmQueWFtbCMKCmRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6CgpT
ZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUtYmluZGlu
Z3MvcGF0Y2gvMjAyNTAyMDctcHBjeWFtbC12Mi0xMS04MTM3YjBjNDI1MjZAcG9zdGVvLm5ldAoK
VGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRp
ZmZlcmVudCBkZXBlbmRlbmN5CnNob3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2guCgpJZiB5
b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhl
IGFib3ZlCmVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBh
bmQgZHQtc2NoZW1hIGlzIHVwIHRvCmRhdGU6CgpwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdy
YWRlCgpQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBj
b21tYW5kIHlvdXJzZWxmLiBOb3RlCnRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8g
eW91ciBzY2hlbWEgZmlsZSB0byBzcGVlZCB1cCBjaGVja2luZwp5b3VyIHNjaGVtYS4gSG93ZXZl
ciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1h
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
