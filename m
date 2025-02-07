Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB868C0219D
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 21:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQjmgBzfQor24M6mAPxvXNTjR17JaJ7IhoDIDktXdEs=; b=cjSZS9LTGHnkd/
	wAE6J2KFPnrD3zQUoLSO6vefJxG9SR++hG9SXLVKQEb7BVDNa5sQavZ16gVeUBwQYbHgdcVKlzdY1
	bnZ6J2Ob350SCzm9sofd+ZeXalaQgJgsiNW4X1wJl9oIRxjWGc1904O8/lew9zsVZmvKsu2xqbTVl
	zd1VgI3pQenTLnFmlMT00E4NTcaKKjjh+Hns5QfViLdfgkOrVJheU2QM/iy8vpWKuQzfE0oBpHpx0
	+7pY76KHEHcfZpdnd7nvQtV2tppUtF9eK9IY1+0W7+x3en6nfY3FGMCc+2UBDtZBOCLh/Hyl/AobH
	s6SppAcD8BV3lkY/fQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwg-0000000BDiG-3t9g;
	Fri, 07 Feb 2025 21:31:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVvo-0000000BD6M-3m59
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 21:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BF3A5C71CF;
	Fri,  7 Feb 2025 21:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2056DC4CEE4;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963835;
	bh=Yko99go3545UAB2s6Emx2EMK5jUBtBhobNj/oRqGi+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JiBlDHg6ZSDyxbhNeVBdiYDu0RTc2VmBhCvC/9Ujwk3f08unB+9u5VSyNP5fQ59+w
	 gYPjTe20zFKpi67KhwKIKAoPCLNDSRlnTW3ewUFAdPPg8bjAQ/Ma0HkbRFgHxavBeG
	 3ZSWE/0FDmdZCUjyankvfSGGR+T0BAiTRScMiHob6XcDelVXWnq9G3MJAwtEiJcGys
	 sZ8QrQU2yz7KQrm8VtXHiG73zpbiXyGkW/1a7oxgAjE1oglLwipJP3oHWRIcYUVYSS
	 gpBk4mR0xSzCmZf2b8VkVPKPeJDpBPbUZmVsri9PKVGilHnUzj+LOeGE5WtNAq9TAE
	 z6+Pq5a+E5q8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DB1C02196;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:18 +0100
Subject: [PATCH v2 01/12] dt-bindings: powerpc: Add Freescale/NXP MPC83xx
 SoCs
MIME-Version: 1.0
Message-Id: <20250207-ppcyaml-v2-1-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
In-Reply-To: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: imx@lists.linux.dev, Scott Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=2727;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=+DtXHVhCbOjn2pFTbqRWo5Ja3tlRCt7VFujPhHnXDOo=;
 b=54lqxy1ufYEIepdx+xHdUJx6JcOYaLxP/9DdiR0f6dmwQhVzKAJEIXbhq9mtePiM8uZ3aOyby
 Do8ItLmBFxhAnsOoEwKoXSekGVjsFNxzqD5f2ZqqDPjxCvL/6gHEYYX
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133037_024525_016EE425 
X-CRM114-Status: GOOD (  11.02  )
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
Reply-To: j.ne@posteo.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKQWRkIGEgbmV3IGJpbmRp
bmcgZm9yIE1QQzgzeHggcGxhdGZvcm1zLCBkZXNjcmliaW5nIHRoZSBib2FyZCBjb21wYXRpYmxl
CnN0cmluZ3MgdXNlZCBpbiBjdXJyZW50bHkgZXhpc3RpbmcgZGV2aWNlIHRyZWVzLgoKTm90ZSB0
aGF0IHRoZSBTb0MgYnVzIGlzIGNhbGxlZCBpbW1yQC4uLiBpbiBtYW55IGV4aXN0aW5nIGRldmlj
ZXRyZWVzLApidXQgdGhpcyBjb250cmFkaWN0cyB0aGUgc2ltcGxlLWJ1cyBiaW5kaW5nLgoKUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYt
Ynk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQoKVjI6Ci0gdHJpbSBzdWJq
ZWN0IGxpbmUKLSBmaXggcHJvcGVydHkgb3JkZXIgdG8gY29tcGx5IHdpdGggZHRzIGNvZGluZyBz
dHlsZQotIGFkZCBSb2IgSGVycmluZ3MncyBSLWIgdGFnCi0tLQogLi4uL2JpbmRpbmdzL3Bvd2Vy
cGMvZnNsL2ZzbCxtcGM4M3h4LnlhbWwgICAgICAgICAgfCA2NyArKysrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlcnBjL2ZzbC9mc2wsbXBjODN4eC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2ZzbCxtcGM4
M3h4LnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMC4uMWQ3ZWQ2NzQ3M2NhNDQ3ZTBmZDJlOWI4ZjMwZDIwZTE4YzYw
MWNjZgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wb3dlcnBjL2ZzbC9mc2wsbXBjODN4eC55YW1sCkBAIC0wLDAgKzEsNjcgQEAKKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwg
MS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcG93ZXJwYy9mc2wv
ZnNsLG1wYzgzeHgueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIworCit0aXRsZTogRnJlZXNjYWxlIFBvd2VyUVVJQ0MgSUkgUHJvIChN
UEM4M3h4KSBwbGF0Zm9ybXMKKworbWFpbnRhaW5lcnM6CisgIC0gSi4gTmV1c2Now6RmZXIgPGou
bmVAcG9zdGVvLm5ldD4KKworcHJvcGVydGllczoKKyAgJG5vZGVuYW1lOgorICAgIGNvbnN0OiAn
LycKKyAgY29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIC0gZGVzY3JpcHRpb246IE1QQzgz
eHggUmVmZXJlbmNlIERlc2lnbiBCb2FyZHMKKyAgICAgICAgaXRlbXM6CisgICAgICAgICAgLSBl
bnVtOgorICAgICAgICAgICAgICAtIGZzbCxtcGM4MzA4cmRiCisgICAgICAgICAgICAgIC0gZnNs
LG1wYzgzMTVlcmRiCisgICAgICAgICAgICAgIC0gZnNsLG1wYzgzNjByZGsKKyAgICAgICAgICAg
ICAgLSBmc2wsbXBjODM3N3JkYgorICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc3d2xhbgorICAg
ICAgICAgICAgICAtIGZzbCxtcGM4Mzc4cmRiCisgICAgICAgICAgICAgIC0gZnNsLG1wYzgzNzly
ZGIKKworcGF0dGVyblByb3BlcnRpZXM6CisgICJec29jQC4qJCI6CisgICAgdHlwZTogb2JqZWN0
CisgICAgcHJvcGVydGllczoKKyAgICAgIGNvbXBhdGlibGU6CisgICAgICAgIG9uZU9mOgorICAg
ICAgICAgIC0gaXRlbXM6CisgICAgICAgICAgICAgIC0gZW51bToKKyAgICAgICAgICAgICAgICAg
IC0gZnNsLG1wYzgzMTUtaW1tcgorICAgICAgICAgICAgICAgICAgLSBmc2wsbXBjODMwOC1pbW1y
CisgICAgICAgICAgICAgIC0gY29uc3Q6IHNpbXBsZS1idXMKKyAgICAgICAgICAtIGl0ZW1zOgor
ICAgICAgICAgICAgICAtIGNvbnN0OiBmc2wsbXBjODM2MC1pbW1yCisgICAgICAgICAgICAgIC0g
Y29uc3Q6IGZzbCxpbW1yCisgICAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxzb2MKKyAgICAgICAg
ICAgICAgLSBjb25zdDogc2ltcGxlLWJ1cworICAgICAgICAgIC0gY29uc3Q6IHNpbXBsZS1idXMK
KworYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKKworZXhhbXBsZXM6CisgIC0gfAorICAgIC8g
eworICAgICAgICBjb21wYXRpYmxlID0gImZzbCxtcGM4MzE1ZXJkYiI7CisgICAgICAgIG1vZGVs
ID0gIk1QQzgzMTVFLVJEQiI7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwxPjsKKworICAgICAgICBzb2NAZTAwMDAwMDAgeworICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJmc2wsbXBjODMxNS1pbW1yIiwgInNpbXBsZS1idXMiOworICAgICAg
ICAgICAgcmVnID0gPDB4ZTAwMDAwMDAgMHgwMDAwMDIwMD47CisgICAgICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwxPjsKKyAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+OworICAgICAgICAg
ICAgZGV2aWNlX3R5cGUgPSAic29jIjsKKyAgICAgICAgICAgIHJhbmdlcyA9IDwwIDB4ZTAwMDAw
MDAgMHgwMDEwMDAwMD47CisgICAgICAgICAgICBidXMtZnJlcXVlbmN5ID0gPDA+OworICAgICAg
ICB9OworICAgIH07CisKKy4uLgoKLS0gCjIuNDguMC5yYzEuMjE5LmdiNmI2NzU3ZDc3MgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
