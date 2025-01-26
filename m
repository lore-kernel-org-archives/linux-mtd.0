Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3EEC0218F
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 18:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUX46Qyfi8sx0NuCgori3m9Fkj8UxGlhzUc593KRgNY=; b=Mk1vesIMqs0kuw
	gSP8tlq1V2dJV67PiXoOiDiZtyWUK7Loq0TMGMHDOuqxtzf9fu/9AnhYzyXPiTZT5pYgNQKFTeS6C
	JdLodJY49ikp50oOB1GZtcUCOkQ2ctqdE4WfpNWHZgRehq9ztjZG7nwg5sP4GFtcyM7OkWDCtfmqY
	afMlKBpdbjQT0bzGj4yYDRo4bP03eNgv/bG8wmM3pame+XofSzxN06go4PW11PS2scxs7yguoaeTy
	mbRMZhXm/WE8A0sqDScd5rOFZEOdx5PSMe34bd3DRTI7YcuN+WhKICekuyAdK2wju/MyBvCtpmcvs
	3WOwT/TAJGL62jZhbowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7qj-00000000gkE-1cif;
	Sun, 26 Jan 2025 18:59:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7qf-00000000gh2-2auK
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 18:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00AFDA41002;
	Sun, 26 Jan 2025 18:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3B89C4AF1B;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917946;
	bh=5XCExjbd/gPubOXYpsr7rABeBjCpjSYExLXU0tOI0LY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=quQJIISy488kggkk/qUhZslV/d1ZmYFeRwALGcQEPbBi2h8W6Sm/5VO6z4kR/Et85
	 awiwKs4/D0MP7E2sSGTcR0+kJ2nQMt33AdJyeLP/TqNEkmn7kXSke/VBKc5yW1uOLa
	 kdO3UDYwEthSI6IVhJ8nGHlCEnQWtfS+py2lNy7qvx3uGROuwhkDgnFZQcOjTAxSyj
	 tqbP92gkkpqCzf/hZGhebqI4AQSglz8eX9qbjHd2exqXDFUaktnmljm0PbiR+X+8Je
	 QuYWxwV3c1jcUPoQ3KCCOY2m+Bt993vviFTXG/NLHI6p+CqVbxjbocJ0ox6FjrTLFe
	 2w1l4UX8HEzXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E2CC0218F;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 26 Jan 2025 19:59:01 +0100
Subject: [PATCH 6/9] dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
MIME-Version: 1.0
Message-Id: <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=3075;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=FQ86ArTRbtYapZ+OdNjSwmXsUKuvNxgsJkLWcXU8vL4=;
 b=/vrsRJm6P5La8dsDwOVQ6eswy9pjJEMA+/9/xmb7cy6W3UlNGJUHTns1MgAOIJh2MnjMvbm71
 B7AFiUB9fFmCttFV7fseyezhA/JwDM7xbQO09sxNWHowpiclOJskGNT
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_105909_819549_62C0F0DB 
X-CRM114-Status: GOOD (  11.09  )
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

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKU3VwcGxlbWVudCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxwY2kudHh0IHdpdGggYSBtb3Jl
CmZvcm1hbCBiaW5kaW5nIGluIFlBTUwgZm9ybWF0LgoKU2lnbmVkLW9mZi1ieTogSi4gTmV1c2No
w6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kv
ZnNsLG1wYzh4eHgtcGNpLnlhbWwgICB8IDgzICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9mc2wsbXBjOHh4eC1wY2kueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLG1wYzh4eHgtcGNpLnlhbWwKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MC4uMTJlODZhOWMyMGRmZTIzNjJkMTFmMDg1YmQ5YWU0NzIzOGM0YTM3ZgotLS0gL2Rldi9udWxs
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLG1wYzh4eHgt
cGNpLnlhbWwKQEAgLTAsMCArMSw4MyBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorCiskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BjaS9mc2wsbXBjOHh4eC1wY2kueWFtbCMKKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRs
ZTogRnJlZXNjYWxlIE1QQzgzeHggUENJL1BDSS1YL1BDSWUgY29udHJvbGxlcnMKKworZGVzY3Jp
cHRpb246IHwKKyAgQmluZGluZyBmb3IgdGhlIFBDSS9QQ0ktWC9QQ0llIGhvc3QgYnJpZGdlcyBv
biBNUEM4eHh4IFNvQ3MuCisgIFNlZSBhbHNvOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGNpL2ZzbCxwY2kudHh0CisKK21haW50YWluZXJzOgorICAtIEouIE5ldXNjaMOkZmVy
IDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+CisKK2FsbE9mOgorICAtICRyZWY6IC9zY2hlbWFzL3Bj
aS9wY2ktaG9zdC1icmlkZ2UueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAg
ICBvbmVPZjoKKyAgICAgIC0gaXRlbXM6CisgICAgICAgICAgLSBlbnVtOgorICAgICAgICAgICAg
ICAtIGZzbCxtcGM4MzA4LXBjaWUKKyAgICAgICAgICAgICAgLSBmc2wsbXBjODMxNS1wY2llCisg
ICAgICAgICAgICAgIC0gZnNsLG1wYzgzNzctcGNpZQorICAgICAgICAgICAgICAtIGZzbCxtcGM4
Mzc4LXBjaWUKKyAgICAgICAgICAtIGNvbnN0OiBmc2wsbXBjODMxNC1wY2llCisgICAgICAtIGNv
bnN0OiBmc2wsbXBjODMxNC1wY2llCisgICAgICAtIGl0ZW1zOgorICAgICAgICAgIC0gY29uc3Q6
IGZzbCxtcGM4MzYwLXBjaQorICAgICAgICAgIC0gY29uc3Q6IGZzbCxtcGM4MzQ5LXBjaQorICAg
ICAgLSBjb25zdDogZnNsLG1wYzgzNDktcGNpCisgICAgICAtIGl0ZW1zOgorICAgICAgICAgIC0g
Y29uc3Q6IGZzbCxtcGM4NTQwLXBjaXgKKyAgICAgICAgICAtIGNvbnN0OiBmc2wsbXBjODU0MC1w
Y2kKKyAgICAgIC0gY29uc3Q6IGZzbCxtcGM4NTQwLXBjaQorICAgICAgLSBpdGVtczoKKyAgICAg
ICAgICAtIGNvbnN0OiBmc2wsbXBjODU0MC1wY2l4CisgICAgICAgICAgLSBjb25zdDogZnNsLG1w
Yzg1NDAtcGNpCisgICAgICAtIGNvbnN0OiBmc2wsbXBjODU0OC1wY2llCisgICAgICAtIGNvbnN0
OiBmc2wsbXBjODU0OC1wY2llCisgICAgICAtIGNvbnN0OiBmc2wsbXBjODY0MS1wY2llCisKKyAg
cmVnOgorICAgIG1pbkl0ZW1zOiAxCisgICAgaXRlbXM6CisgICAgICAtIGRlc2NyaXB0aW9uOiBp
bnRlcm5hbCByZWdpc3RlcnMKKyAgICAgIC0gZGVzY3JpcHRpb246IGNvbmZpZyBzcGFjZSBhY2Nl
c3MgcmVnaXN0ZXJzCisKKyAgY2xvY2stZnJlcXVlbmN5OgorICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorCityZXF1aXJlZDoKKyAgLSByZWcKKyAgLSBj
b21wYXRpYmxlCisKK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6Cisg
IC0gfAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEu
aD4KKworICAgIHBjaTE6IHBjaWVAZTAwMDkwMDAgeworICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwzPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47CisgICAgICAgICNpbnRlcnJ1cHQtY2Vs
bHMgPSA8MT47CisgICAgICAgIGRldmljZV90eXBlID0gInBjaSI7CisgICAgICAgIGNvbXBhdGli
bGUgPSAiZnNsLG1wYzgzMTUtcGNpZSIsICJmc2wsbXBjODMxNC1wY2llIjsKKyAgICAgICAgcmVn
ID0gPDB4ZTAwMDkwMDAgMHgwMDAwMTAwMD47CisgICAgICAgIHJhbmdlcyA9IDwweDAyMDAwMDAw
IDAgMHhhMDAwMDAwMCAweGEwMDAwMDAwIDAgMHgxMDAwMDAwMAorICAgICAgICAgICAgICAgICAg
MHgwMTAwMDAwMCAwIDB4MDAwMDAwMDAgMHhiMTAwMDAwMCAwIDB4MDA4MDAwMDA+OworICAgICAg
ICBidXMtcmFuZ2UgPSA8MCAyNTU+OworICAgICAgICBpbnRlcnJ1cHQtbWFwLW1hc2sgPSA8MHhm
ODAwIDAgMCA3PjsKKyAgICAgICAgaW50ZXJydXB0LW1hcCA9IDwwIDAgMCAxICZpcGljIDEgSVJR
X1RZUEVfTEVWRUxfTE9XCisgICAgICAgICAgICAgICAgICAgICAgICAgMCAwIDAgMiAmaXBpYyAx
IElSUV9UWVBFX0xFVkVMX0xPVworICAgICAgICAgICAgICAgICAgICAgICAgIDAgMCAwIDMgJmlw
aWMgMSBJUlFfVFlQRV9MRVZFTF9MT1cKKyAgICAgICAgICAgICAgICAgICAgICAgICAwIDAgMCA0
ICZpcGljIDEgSVJRX1RZUEVfTEVWRUxfTE9XPjsKKyAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0g
PDA+OworICAgIH07CisKKy4uLgoKLS0gCjIuNDguMC5yYzEuMjE5LmdiNmI2NzU3ZDc3MgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
