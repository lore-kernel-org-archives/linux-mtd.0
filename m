Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD563C021A0
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 21:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOCbWmgv0fnc0bp4r1mnRO1LTaCIrPJKq+G4YiAKQtc=; b=M0N6u1LiSlJt4D
	/TuCcDIfmBtYG3ekA2UfWV59cSnfHDCF6QS7u4zNIIJezU0YH50bJTKDRm6uPmjRGShNbJsZnQ73o
	vymI3f0C9TAqfrL55mKUlM2sFcPYw7vxTsiy4xoQIUHkqaWLu+xIrjX+tG2AVDX+VpjwoZ+9H0Y+X
	TrLO2XPbB4AV66VH5OhfpvcixbXw1wuBncQTfGtDWMvDDVBCpcmqzeVtpiHmAy28rJ5kOLTMHSqpT
	/Dp4NLTj0h1ewORjx205LhuqU/7wllsDXH+JUu7ka1lrvVEnCGsK525vYYVOSSrLURDmTu1MV942s
	4NWHA6L0fl/j42TVt/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwk-0000000BDkv-0E7z;
	Fri, 07 Feb 2025 21:31:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVvq-0000000BD7q-3kKl
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 21:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 532535C71FD;
	Fri,  7 Feb 2025 21:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EB13C4AF10;
	Fri,  7 Feb 2025 21:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963836;
	bh=RuAkLHcNPzAoRdo6BpE9kwkQgXaZNQeVgfwDORycGBA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=htVJpOejbXQWhe8jHGJAWKpyPz60TBThljZn9O7eII5mG/tHuyQw3AAVP6bnG4OBW
	 N7TMJID2KXI6LpFSP3IOheld8gdP+cAzxN/XCJ6c+ALuWgdHzgNleFP2YUE1dT1eoc
	 7id0urMFXjBD61eQ69fa76RFvE7fLaWi4yiRrCqThGrExM9L/uUwwkouMtWLK13KGs
	 jTL+0qXLrrjfiuuGUF3zoU85mGpItVNANt7iMIxv2cO0DIbVvBOmg+F2bL+5ZMPlaQ
	 JWxJwyTqiSLNKjeJhfZq3/gkFx1sUQJn2HOeZkOCEyfPXtKecp8jpkvfmR2fVEU+u8
	 kmHpjT/ZN1Umg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC49C0219E;
	Fri,  7 Feb 2025 21:30:36 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:27 +0100
Subject: [PATCH v2 10/12] dt-bindings: memory-controllers: Add
 fsl,elbc-gpcm-uio
MIME-Version: 1.0
Message-Id: <20250207-ppcyaml-v2-10-8137b0c42526@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=2327;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=LkemF+iJaT/609rtTCAj5OV7UUDgDJnkAiLlT9aG8EE=;
 b=IGiyO3zCvC30tHqbSQpswM01pqy9M52ANeFq4lodtrLUuOkaxDX7czh8YTYt1oGe4ku3Ffnah
 NTVhcN7NU36DyvvlburD8XDK2p3cgpWfPmuP85hC3kYOHiKRAnrQG3g
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133039_015738_4F3F534F 
X-CRM114-Status: GOOD (  10.73  )
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

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKRm9ybWFsaXplIHRoZSBi
aW5kaW5nIGFscmVhZHkgc3VwcG9ydGVkIGJ5IHRoZSB1aW9fZnNsX2VsYmNfZ3BjbS5jCmRyaXZl
ci4KClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQoK
VjI6Ci0gc3BsaXQgb3V0IGZyb20gZnNsLGVsYmMgcGF0Y2gKLSBhZGQgZGVzY3JpcHRpb24KLSBy
ZW1vdmUgImRldmljZV90eXBlIiBwcm9wZXJ0eQotIG1vdmUgdG8gYmluZGluZ3MvbWVtb3J5LWNv
bnRyb2xsZXJzCi0tLQogLi4uL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy1ncGNtLXVpby55
YW1sICAgICAgfCA1OSArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTkg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMtZ3BjbS11aW8ueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMtZ3Bj
bS11aW8ueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwLi4zODE1ODRiNDAwYTBhZDk4YzZkOWUwYjM4ZjI4NzdkNDQ2
MDNlZDg0Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy1ncGNtLXVpby55YW1sCkBAIC0wLDAgKzEs
NTkgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvbWVtb3J5LWNvbnRyb2xsZXJzL2ZzbCxlbGJjLWdwY20tdWlvLnlhbWwjCiskc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFVz
ZXJzcGFjZSBJL08gaW50ZXJmYWNlIGZvciBGcmVlc2NhbGUgZUxCQyBkZXZpY2VzCisKK2Rlc2Ny
aXB0aW9uOgorICBUaGUgRnJlZXNjYWxlIEVuaGFuY2VkIExvY2FsIEJ1cyBjb250cm9sbGVyIChl
TEJDKSBzdXBwb3J0cyBmbGV4aWJsZSBhY2Nlc3MKKyAgdG8gbWVtb3J5IGRldmljZXMsIHRocm91
Z2ggdGhlIEdlbmVyYWwtUHVycG9zZSBDaGlwLXNlbGVjdCBNYWNoaW5lIChHUENNKS4KKyAgVGhl
IHB1cnBvc2Ugb2YgdGhpcyBiaW5kaW5nIGlzIHRvIGRlc2lnbmF0ZSBkZXZpY2VzIGF0dGFjaGVk
IHRvIGVMQkMvR1BNQyBmb3IKKyAgdXNlIGJ5IHVzZXJzcGFjZS4KKworbWFpbnRhaW5lcnM6Cisg
IC0gSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KKworcHJvcGVydGllczoKKyAgY29t
cGF0aWJsZToKKyAgICBjb25zdDogZnNsLGVsYmMtZ3BjbS11aW8KKworICByZWc6CisgICAgbWF4
SXRlbXM6IDEKKworICBlbGJjLWdwY20tYnI6CisgICAgZGVzY3JpcHRpb246IEJhc2UgUmVnaXN0
ZXIgKEJSKSB2YWx1ZSB0byBzZXQKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZp
bml0aW9ucy91aW50MzIKKworICBlbGJjLWdwY20tb3I6CisgICAgZGVzY3JpcHRpb246IE9wdGlv
biBSZWdpc3RlciAoT1IpIHZhbHVlIHRvIHNldAorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMgorCisgIGludGVycnVwdHM6CisgICAgbWF4SXRlbXM6IDEK
KworICB1aW9fbmFtZToKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy9zdHJpbmcKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGVsYmMt
Z3BjbS1icgorICAtIGVsYmMtZ3BjbS1vcgorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UK
KworZXhhbXBsZXM6CisgIC0gfAorICAgIGxvY2FsYnVzIHsKKyAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8Mj47CisgICAgICAgICNzaXplLWNlbGxzID0gPDE+OworCisgICAgICAgIHNpbXBsZS1w
ZXJpcGhAMiwwIHsKKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGVsYmMtZ3BjbS11aW8i
OworICAgICAgICAgICAgcmVnID0gPDB4MiAweDAgMHgxMDAwMD47CisgICAgICAgICAgICBlbGJj
LWdwY20tYnIgPSA8MHhmZDgxMDgwMD47CisgICAgICAgICAgICBlbGJjLWdwY20tb3IgPSA8MHhm
ZmZmMDlmNz47CisgICAgICAgIH07CisgICAgfTsKCi0tIAoyLjQ4LjAucmMxLjIxOS5nYjZiNjc1
N2Q3NzIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
