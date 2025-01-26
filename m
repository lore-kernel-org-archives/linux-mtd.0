Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270C7C02192
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gf/Zph+IuhF4rNIMUu//KUrmeAfJA0QimEJOoH2x4jI=; b=BAdmlhFmJyaEpo
	CAG9KcO/PqXC/kCfZA76Z/Iv1YY0iAeRb3X1OWYhKxHcY5P1qW3XdiuGOoZC87Uhh5oj19Z/AqZCa
	OGCG01Vk7Z1M19nMIb4AnNq/Bk+ki2Z0gPEzSuPvjX0iNhx8DnRS+xQBHKWHqiq26y+PGnVdrYk3z
	tQOkkNe+oFoF9et6Nls4NJow/wCoc/3T2G7YCJTVNLfWdph+c6dnUEOxEIBN6F1jKBbJLzrYIfxzP
	RTc9d9L3/yTJXOPmoG8KsO6YmpjeVIgLMJ1+xGOtgosb6fKCvbjtAgmCn8ese/BRAtVLWToB37Hgt
	5blxMsiqRCVs90RaaPCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7qh-00000000gjE-3lVw;
	Sun, 26 Jan 2025 18:59:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7qe-00000000gft-2Qve
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 18:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51DBBA40FB7;
	Sun, 26 Jan 2025 18:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 990C9C4CEE3;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917945;
	bh=O14r1qqxI0QT2llSScJucTEIHKL95nVBwpZogWhGWwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jlfftCyto9yufeiQxsS5xRcuoaGifNZZUisROjsaiAnASBvYa0OstRU9lsOEtE0/7
	 JPjMPN3TZaXnCmZ02o4OCE0HhKNFIJkRuVuXj34+JNRLcV0f6iCkTOfFoM2+bPM3GE
	 CNAUID/5p5OAaQV5+yv8ifAQWdPal9IXzLu3Q8D11NcsMHf6KkAXPtt/vHBuorSHFo
	 Yccvir5GVELnWqEtTZLDRgkqr4geflC3RuUGZUhMcs15rBP7GqYCJWanODtF/Mk1k/
	 HevOPUAumHwuzt1FMItH4M10+QWLJRNVdTgNUGFvC54KeU0iM+ybQxbnbFx/CQXROU
	 2XxRWvag0Gm9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDCDC0218E;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 26 Jan 2025 19:58:56 +0100
Subject: [PATCH 1/9] dt-bindings: powerpc: Add binding for Freescale/NXP
 MPC83xx SoCs
MIME-Version: 1.0
Message-Id: <20250126-ppcyaml-v1-1-50649f51c3dd@posteo.net>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
In-Reply-To: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Scott Wood <oss@buserror.net>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=2560;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=E5l46pAV8cFDwcEg1WB+Na8IX5nk86e/w9y8E+nF/Rs=;
 b=7Wr9qCpmJvIjC1lyC/O75ZA3WieLQA6qbLwT1LieeCLorQzrlbIXYDMvvtqnRyrQj24Aw3daO
 hPZJLmboPkyDjYCsfo5vaoRG6SUf127m1KfVqBMeMYa2W0PLimeRwsz
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_105908_745624_CCE4331F 
X-CRM114-Status: GOOD (  11.56  )
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
ZXRyZWVzLApidXQgdGhpcyBjb250cmFkaWN0cyB0aGUgc2ltcGxlLWJ1cyBiaW5kaW5nLgoKU2ln
bmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KLS0tCiAuLi4vYmlu
ZGluZ3MvcG93ZXJwYy9mc2wvZnNsLG1wYzgzeHgueWFtbCAgICAgICAgICB8IDY3ICsrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2ZzbCxt
cGM4M3h4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9m
c2wvZnNsLG1wYzgzeHgueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi5kNTFjODViNTA1YjBkZWMzYTI1ZDUwZTJi
ZGM5ODBjZDJlZTA0YjdjCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2ZzbCxtcGM4M3h4LnlhbWwKQEAgLTAsMCArMSw2NyBA
QAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9w
b3dlcnBjL2ZzbC9mc2wsbXBjODN4eC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBGcmVlc2NhbGUgUG93ZXJRVUlD
QyBJSSBQcm8gKE1QQzgzeHgpIHBsYXRmb3JtcworCittYWludGFpbmVyczoKKyAgLSBKLiBOZXVz
Y2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgorCitwcm9wZXJ0aWVzOgorICAkbm9kZW5hbWU6Cisg
ICAgY29uc3Q6ICcvJworICBjb21wYXRpYmxlOgorICAgIG9uZU9mOgorICAgICAgLSBkZXNjcmlw
dGlvbjogTVBDODN4eCBSZWZlcmVuY2UgRGVzaWduIEJvYXJkcworICAgICAgICBpdGVtczoKKyAg
ICAgICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0gZnNsLG1wYzgzMDhyZGIKKyAgICAgICAg
ICAgICAgLSBmc2wsbXBjODMxNWVyZGIKKyAgICAgICAgICAgICAgLSBmc2wsbXBjODM2MHJkawor
ICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc3cmRiCisgICAgICAgICAgICAgIC0gZnNsLG1wYzgz
Nzd3bGFuCisgICAgICAgICAgICAgIC0gZnNsLG1wYzgzNzhyZGIKKyAgICAgICAgICAgICAgLSBm
c2wsbXBjODM3OXJkYgorCitwYXR0ZXJuUHJvcGVydGllczoKKyAgIl5zb2NALiokIjoKKyAgICB0
eXBlOiBvYmplY3QKKyAgICBwcm9wZXJ0aWVzOgorICAgICAgY29tcGF0aWJsZToKKyAgICAgICAg
b25lT2Y6CisgICAgICAgICAgLSBpdGVtczoKKyAgICAgICAgICAgICAgLSBlbnVtOgorICAgICAg
ICAgICAgICAgICAgLSBmc2wsbXBjODMxNS1pbW1yCisgICAgICAgICAgICAgICAgICAtIGZzbCxt
cGM4MzA4LWltbXIKKyAgICAgICAgICAgICAgLSBjb25zdDogc2ltcGxlLWJ1cworICAgICAgICAg
IC0gaXRlbXM6CisgICAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxtcGM4MzYwLWltbXIKKyAgICAg
ICAgICAgICAgLSBjb25zdDogZnNsLGltbXIKKyAgICAgICAgICAgICAgLSBjb25zdDogZnNsLHNv
YworICAgICAgICAgICAgICAtIGNvbnN0OiBzaW1wbGUtYnVzCisgICAgICAgICAgLSBjb25zdDog
c2ltcGxlLWJ1cworCithZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQorCitleGFtcGxlczoKKyAg
LSB8CisgICAgLyB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLG1wYzgzMTVlcmRiIjsKKyAg
ICAgICAgbW9kZWwgPSAiTVBDODMxNUUtUkRCIjsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDE+OworCisgICAgICAgIHNvY0BlMDAwMDAwMCB7
CisgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgICAgICNzaXplLWNl
bGxzID0gPDE+OworICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAic29jIjsKKyAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiZnNsLG1wYzgzMTUtaW1tciIsICJzaW1wbGUtYnVzIjsKKyAgICAgICAg
ICAgIHJhbmdlcyA9IDwwIDB4ZTAwMDAwMDAgMHgwMDEwMDAwMD47CisgICAgICAgICAgICByZWcg
PSA8MHhlMDAwMDAwMCAweDAwMDAwMjAwPjsKKyAgICAgICAgICAgIGJ1cy1mcmVxdWVuY3kgPSA8
MD47CisgICAgICAgIH07CisgICAgfTsKKworLi4uCgotLSAKMi40OC4wLnJjMS4yMTkuZ2I2YjY3
NTdkNzcyCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
