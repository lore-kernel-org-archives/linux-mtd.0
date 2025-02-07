Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A05C021A2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 21:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CtSm1LoN1eSq8jnQiYyzikLrelQ/JX7xQrFvKgX6fI=; b=NkMcas5wHhrVm2
	5B8M6mZ5VqHEtsguhGf49URL0H2ckKdVGlV4nj32kn5YWNBqyTVMbp89Y0DtGF0f/Git+dCDwG3pu
	SQN4+fXgvxfHrae3qcfcraDvCjGYjFnRaDHr2o0Caa0TI+PXuPKxmN303G4P56NXk/k2Ql5lT0a4v
	cAoBSk+0KlBWiE86+n63jeNiNK56MpGpVSup4UJbU+TiA1QDs/W0mAbQftrs7V8IlUyqNKbO6Oo42
	HN/Kjgbgvat1Qu+AF7zOG60ngK+MHxmrljoEreT5iC+0SF298osZZP6aStPkFmHKZXBdOUmuMF8je
	jAVM/AiEH98z+RUBMNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwl-0000000BDmW-1oWe;
	Fri, 07 Feb 2025 21:31:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVvq-0000000BD7m-4193
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 21:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11D81A43CFC;
	Fri,  7 Feb 2025 21:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE809C116B1;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963835;
	bh=fqvAh3iKxOl03ArBCkYTvP/GeGQRKw1fc2EwMT7Iylc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P7kYzEbFv5XvnqA9e0Aw2hN/mJRZM27jQPH1NC1dLXOY023QXk/rORY52thAt4Mdz
	 IETcYpeRUiFbFi5nhNx5iYFzW6OsssSlEVnUg8NOz6WheSOyOrSQH4fRPJgwKwW/nJ
	 GUnAOxEjOCkKarOkpR4/dMMD9MKp/kyyu15l201GH1QFIgYUSLUeCuylliv+tyBS76
	 PZ3bBRkl3Jlf0aq/SQ22KHDfHe+UFncODbI+oH+5KAH+98cKh8mAVq9OAWv0I8QQuM
	 6d0sdji7khwUHKrFpdHXbdH+OXkYla7EFI9+U0yF4/dv1NRZ7/g9q/udgu16gysYi+
	 567gwgWihYFdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908A2C0219D;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:23 +0100
Subject: [PATCH v2 06/12] dt-bindings: pci: Convert fsl,mpc83xx-pcie to
 YAML
MIME-Version: 1.0
Message-Id: <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=5802;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=jBiH9+MQmhRrwEmLTkNNDzkIkSq8VyyQ3zetJ06KX9U=;
 b=sEBW0totelYgL1en7cVmNkknyNI5Sj/Sspm1mJTetH6lj+iSulPd72CfWDp7mXxTwMSsXTvC8
 CcPFFfl4jGrD9Ji4ICjmccGslMxPc79Ljlsx1zaFK/lzwD1MvefNj68
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133039_137286_6F983B24 
X-CRM114-Status: GOOD (  15.41  )
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

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKRm9ybWFsaXNlIHRoZSBi
aW5kaW5nIGZvciB0aGUgUENJIGNvbnRyb2xsZXJzIGluIHRoZSBGcmVlc2NhbGUgTVBDOHh4eApj
aGlwIGZhbWlseS4gSW5mb3JtYXRpb24gYWJvdXQgUENJLVgtc3BlY2lmaWMgcHJvcGVydGllcyB3
YXMgdGFrZW4gZnJvbQpmc2wscGNpLnR4dC4gVGhlIGV4YW1wbGVzIHdlcmUgdGFrZW4gZnJvbSBt
cGM4MzE1ZXJkYi5kdHMgYW5kCnhwZWRpdGU1MjAwX3htb24uZHRzLgoKU2lnbmVkLW9mZi1ieTog
Si4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KLS0tCgpWMjoKLSBtZXJnZSBmc2wscGNp
LnR4dCBpbnRvIGZzbCxtcGM4eHh4LXBjaS55YW1sCi0gcmVncm91cCBjb21wYXRpYmxlIHN0cmlu
Z3MsIGxpc3Qgc2luZ2xlLWl0ZW0gdmFsdWVzIGluIG9uZSBlbnVtCi0gdHJpbSBzdWJqZWN0IGxp
bmUgKHJlbW92ZSAiYmluZGluZyIpCi0gZml4IHByb3BlcnR5IG9yZGVyIHRvIGNvbXBseSB3aXRo
IGR0cyBjb2Rpbmcgc3R5bGUKLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLG1w
Yzh4eHgtcGNpLnlhbWwgICB8IDExNSArKysrKysrKysrKysrKysrKysrKysKIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLHBjaS50eHQgIHwgIDI3IC0tLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDExNSBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxtcGM4eHh4LXBj
aS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9mc2wsbXBjOHh4
eC1wY2kueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwLi41N2M1NTAzY2VjNDdlNmU5MGVkMmIwOTgzNWJmYWQxMDMw
OWRiOTI3Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BjaS9mc2wsbXBjOHh4eC1wY2kueWFtbApAQCAtMCwwICsxLDExNSBAQAorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAx
LjIKKy0tLQorCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BjaS9mc2wsbXBj
OHh4eC1wY2kueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sIworCit0aXRsZTogRnJlZXNjYWxlIE1QQzgzeHggUENJL1BDSS1YL1BDSWUg
Y29udHJvbGxlcnMKKworZGVzY3JpcHRpb246IHwKKyAgQmluZGluZyBmb3IgdGhlIFBDSS9QQ0kt
WC9QQ0llIGhvc3QgYnJpZGdlcyBvbiBNUEM4eHh4IFNvQ3MuCisgIFNlZSBhbHNvOiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxwY2kudHh0CisKK21haW50YWluZXJz
OgorICAtIEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+CisKK2FsbE9mOgor
ICAtICRyZWY6IC9zY2hlbWFzL3BjaS9wY2ktaG9zdC1icmlkZ2UueWFtbCMKKworcHJvcGVydGll
czoKKyAgY29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIC0gZW51bToKKyAgICAgICAgICAt
IGZzbCxtcGM4MzE0LXBjaWUKKyAgICAgICAgICAtIGZzbCxtcGM4MzQ5LXBjaQorICAgICAgICAg
IC0gZnNsLG1wYzg1NDAtcGNpCisgICAgICAgICAgLSBmc2wsbXBjODU0OC1wY2llCisgICAgICAg
ICAgLSBmc2wsbXBjODY0MS1wY2llCisgICAgICAtIGl0ZW1zOgorICAgICAgICAgIC0gZW51bToK
KyAgICAgICAgICAgICAgLSBmc2wsbXBjODMwOC1wY2llCisgICAgICAgICAgICAgIC0gZnNsLG1w
YzgzMTUtcGNpZQorICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc3LXBjaWUKKyAgICAgICAgICAg
ICAgLSBmc2wsbXBjODM3OC1wY2llCisgICAgICAgICAgLSBjb25zdDogZnNsLG1wYzgzMTQtcGNp
ZQorICAgICAgLSBpdGVtczoKKyAgICAgICAgICAtIGNvbnN0OiBmc2wsbXBjODM2MC1wY2kKKyAg
ICAgICAgICAtIGNvbnN0OiBmc2wsbXBjODM0OS1wY2kKKyAgICAgIC0gaXRlbXM6CisgICAgICAg
ICAgLSBjb25zdDogZnNsLG1wYzg1NDAtcGNpeAorICAgICAgICAgIC0gY29uc3Q6IGZzbCxtcGM4
NTQwLXBjaQorCisgIHJlZzoKKyAgICBtaW5JdGVtczogMQorICAgIGl0ZW1zOgorICAgICAgLSBk
ZXNjcmlwdGlvbjogaW50ZXJuYWwgcmVnaXN0ZXJzCisgICAgICAtIGRlc2NyaXB0aW9uOiBjb25m
aWcgc3BhY2UgYWNjZXNzIHJlZ2lzdGVycworCisgIGNsb2NrLWZyZXF1ZW5jeTogdHJ1ZQorCisg
IGludGVycnVwdHM6CisgICAgaXRlbXM6CisgICAgICAtIGRlc2NyaXB0aW9uOiBDb25zb2xpZGF0
ZWQgUENJIGludGVycnVwdAorCisgIGZzbCxwY2ktYWdlbnQtZm9yY2UtZW51bToKKyAgICB0eXBl
OiBib29sZWFuCisgICAgZGVzY3JpcHRpb246CisgICAgICBUeXBpY2FsbHkgYW55IEZyZWVzY2Fs
ZSBQQ0ktWCBicmlkZ2UgaGFyZHdhcmUgc3RyYXBwZWQgaW50byBBZ2VudCBtb2RlIGlzCisgICAg
ICBwcmV2ZW50ZWQgZnJvbSBlbnVtZXJhdGluZyB0aGUgYnVzLiBUaGUgUHJQTUMgZm9ybS1mYWN0
b3IgcmVxdWlyZXMgYWxsCisgICAgICBtZXp6YW5pbmVzIHRvIGJlIFBDSS1YIEFnZW50cywgYnV0
IG9uZSBwZXIgc3lzdGVtIG1heSBzdGlsbCBlbnVtZXJhdGUgdGhlCisgICAgICBidXMuCisKKyAg
ICAgIFRoaXMgcHJvcGVydHkgYWxsb3dzIGEgUENJLVggYnJpZGdlIHRvIGJlIHVzZWQgZm9yIGJ1
cyBlbnVtZXJhdGlvbgorICAgICAgZGVzcGl0ZSBiZWluZyBzdHJhcHBlZCBpbnRvIEFnZW50IG1v
ZGUuCisKK3JlcXVpcmVkOgorICAtIHJlZworICAtIGNvbXBhdGlibGUKKwordW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgorCisgICAgcGNpZUBlMDAwOTAwMCB7
CisgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLG1wYzgzMTUtcGNpZSIsICJmc2wsbXBjODMxNC1w
Y2llIjsKKyAgICAgICAgcmVnID0gPDB4ZTAwMDkwMDAgMHgwMDAwMTAwMD47CisgICAgICAgIHJh
bmdlcyA9IDwweDAyMDAwMDAwIDAgMHhhMDAwMDAwMCAweGEwMDAwMDAwIDAgMHgxMDAwMDAwMAor
ICAgICAgICAgICAgICAgICAgMHgwMTAwMDAwMCAwIDB4MDAwMDAwMDAgMHhiMTAwMDAwMCAwIDB4
MDA4MDAwMDA+OworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsKKyAgICAgICAgI3NpemUt
Y2VsbHMgPSA8Mj47CisgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47CisgICAgICAgIGRl
dmljZV90eXBlID0gInBjaSI7CisgICAgICAgIGJ1cy1yYW5nZSA9IDwwIDI1NT47CisgICAgICAg
IGludGVycnVwdC1tYXAtbWFzayA9IDwweGY4MDAgMCAwIDc+OworICAgICAgICBpbnRlcnJ1cHQt
bWFwID0gPDAgMCAwIDEgJmlwaWMgMSBJUlFfVFlQRV9MRVZFTF9MT1cKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAwIDAgMCAyICZpcGljIDEgSVJRX1RZUEVfTEVWRUxfTE9XCisgICAgICAgICAg
ICAgICAgICAgICAgICAgMCAwIDAgMyAmaXBpYyAxIElSUV9UWVBFX0xFVkVMX0xPVworICAgICAg
ICAgICAgICAgICAgICAgICAgIDAgMCAwIDQgJmlwaWMgMSBJUlFfVFlQRV9MRVZFTF9MT1c+Owor
ICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MD47CisgICAgfTsKKworICAtIHwKKyAgICBwY2lA
ZWYwMDgwMDAgeworICAgICAgICBjb21wYXRpYmxlID0gImZzbCxtcGM4NTQwLXBjaXgiLCAiZnNs
LG1wYzg1NDAtcGNpIjsKKyAgICAgICAgcmVnID0gPDB4ZWYwMDgwMDAgMHgxMDAwPjsKKyAgICAg
ICAgcmFuZ2VzID0gPDB4MDIwMDAwMDAgMCAweDgwMDAwMDAwIDB4ODAwMDAwMDAgMCAweDIwMDAw
MDAwCisgICAgICAgICAgICAgICAgICAweDAxMDAwMDAwIDAgMHgwMDAwMDAwMCAweGQwMDAwMDAw
IDAgMHgwMTAwMDAwMD47CisgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47CisgICAgICAg
ICNzaXplLWNlbGxzID0gPDI+OworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsKKyAgICAg
ICAgZGV2aWNlX3R5cGUgPSAicGNpIjsKKyAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDMzMzMz
MzMzPjsKKyAgICAgICAgaW50ZXJydXB0LW1hcC1tYXNrID0gPDB4ZjgwMCAweDAgMHgwIDB4Nz47
CisgICAgICAgIGludGVycnVwdC1tYXAgPSA8LyogSURTRUwgKi8KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAweGUwMDAgMCAwIDEgJm1waWMgMiAxCisgICAgICAgICAgICAgICAgICAgICAgICAg
MHhlMDAwIDAgMCAyICZtcGljIDMgMT47CisgICAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8
Jm1waWMgMjQgMj47CisgICAgICAgIGJ1cy1yYW5nZSA9IDwwIDA+OworICAgICAgICBmc2wscGNp
LWFnZW50LWZvcmNlLWVudW07CisgICAgfTsKKworCisuLi4KZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLHBjaS50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxwY2kudHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCBkOGFjNGE3NjhlN2U2NWI0NjVmODMzMDhjYzkxOGVjNDcxMzA5ZGNmLi4wMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLHBjaS50eHQKKysrIC9kZXYvbnVsbApAQCAtMSwy
NyArMCwwIEBACi0qIEJ1cyBFbnVtZXJhdGlvbiBieSBGcmVlc2NhbGUgUENJLVggQWdlbnQKLQot
VHlwaWNhbGx5IGFueSBGcmVlc2NhbGUgUENJLVggYnJpZGdlIGhhcmR3YXJlIHN0cmFwcGVkIGlu
dG8gQWdlbnQgbW9kZQotaXMgcHJldmVudGVkIGZyb20gZW51bWVyYXRpbmcgdGhlIGJ1cy4gVGhl
IFByUE1DIGZvcm0tZmFjdG9yIHJlcXVpcmVzCi1hbGwgbWV6emFuaW5lcyB0byBiZSBQQ0ktWCBB
Z2VudHMsIGJ1dCBvbmUgcGVyIHN5c3RlbSBtYXkgc3RpbGwKLWVudW1lcmF0ZSB0aGUgYnVzLgot
Ci1UaGUgcHJvcGVydHkgZGVmaW5lZCBiZWxvdyB3aWxsIGFsbG93IGEgUENJLVggYnJpZGdlIHRv
IGJlIHVzZWQgZm9yIGJ1cwotZW51bWVyYXRpb24gZGVzcGl0ZSBiZWluZyBzdHJhcHBlZCBpbnRv
IEFnZW50IG1vZGUuCi0KLVJlcXVpcmVkIHByb3BlcnRpZXM6Ci0tIGZzbCxwY2ktYWdlbnQtZm9y
Y2UtZW51bSA6IFRoZXJlIGlzIG5vIHZhbHVlIGFzc29jaWF0ZWQgd2l0aCB0aGlzCi0gIHByb3Bl
cnR5LiBUaGUgcHJvcGVydHkgaXRzZWxmIGlzIHRyZWF0ZWQgYXMgYSBib29sZWFuLgotCi1FeGFt
cGxlOgotCi0JLyogUENJLVggYnJpZGdlIGtub3duIHRvIGJlIFByUE1DIE1vbmFyY2ggKi8KLQlw
Y2kwOiBwY2lAZWYwMDgwMDAgewotCQlmc2wscGNpLWFnZW50LWZvcmNlLWVudW07Ci0JCSNpbnRl
cnJ1cHQtY2VsbHMgPSA8MT47Ci0JCSNzaXplLWNlbGxzID0gPDI+OwotCQkjYWRkcmVzcy1jZWxs
cyA9IDwzPjsKLQkJY29tcGF0aWJsZSA9ICJmc2wsbXBjODU0MC1wY2l4IiwgImZzbCxtcGM4NTQw
LXBjaSI7Ci0JCWRldmljZV90eXBlID0gInBjaSI7Ci0JCS4uLgotCQkuLi4KLQl9OwoKLS0gCjIu
NDguMC5yYzEuMjE5LmdiNmI2NzU3ZDc3MgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
