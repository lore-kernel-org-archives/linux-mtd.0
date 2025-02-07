Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC554C021A8
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 21:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySSjYrVRzGLfOClSmzJFz+7hID+8s3f5y+haJnOa1J0=; b=4wtKNUu4ilQFf5
	e2sIK47t8ocrXLXbTErzrNo+20pKlqlRGaUmCmIzg7mGkrysmMXtCoDTpjVJbfwmVK/w0Yg766K+1
	6yjQp+FXf2G+xcWDBWveuYG79+M1mJSFMXeFTkbXjd5FebqMWT62pfLo1CjPv7TUdl1pDvxKMAgRU
	DGrnCgpuInAxptY4ECYqMW2XXMBmU63lwEOzUT4zLW8nU7u2Sj379yObjcr7J65B/CIZ6OAdWUDih
	rlyKkaL9xxb/BAgqxwxFcYSJOvCJGBreJbm3GXJYC2UHoIZZfBMe24vgtzABgL/b91JwL/Rm9NMkS
	4n3Q9T1vnbjbUSmg/5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwn-0000000BDpN-2ubl;
	Fri, 07 Feb 2025 21:31:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVvs-0000000BD9v-3cET
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 21:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26ADBA43DBC;
	Fri,  7 Feb 2025 21:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65FC1C32786;
	Fri,  7 Feb 2025 21:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963836;
	bh=eMHZF1DoORYUOyj/ZZ8qW5nusClbM6PqWbv1Pix9bx8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FBR5wURbRuGofUwX3skGdx1JxCFVESLiBAv/GnH08tQfthqbiBBq4cbTUy1dehvZw
	 ht1acFtuTNTnsnM3UvNHJSl4aZzHLBiaJ7pUHx8hX6JI5lWM2Lrmcn8HOBSDrIr2A5
	 edZ7uvs9OpL38qyeXTP1JplcHBIPOcBZ/qNHev2LjJ/d2i6o33mSVAzLzQv6XDvwAe
	 yF+IXDTZDos5P3vE9uVeLHp92+rqA5b0gG+ADiHssXc8zzyG4QaUdLcy8b1OtQGXxt
	 ZyEEOVy+iScUVZLU98g9o8mx/Dm1kThZv3gbeawthjlV+QhWLIIbBfWUPJ3gpGT4qT
	 a0T24uUixoYSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525B3C021A1;
	Fri,  7 Feb 2025 21:30:36 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:29 +0100
Subject: [PATCH v2 12/12] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
MIME-Version: 1.0
Message-Id: <20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=986;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Bwo7Oi0fdIfwt2t5GuE37lozFcZAE9exVW1MqG+hZ/k=;
 b=SZzc/30AQUy3Myphn35PzhnrkOhxogqN5IKE9FSo7Vsu0rw8Ixof6uIexKpSYOqpZo3vubTfH
 x4L8/aEDHCICwoOgSwgmZwqJ/eM9pYppzwxGKFGZBkefo7Qh/p8tu1l
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133041_113341_1E913A60 
X-CRM114-Status: UNSURE (   9.20  )
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
Reply-To: j.ne@posteo.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKSW4gc29tZSBzY2VuYXJp
b3MsIHN1Y2ggYXMgdW5kZXIgdGhlIEZyZWVzY2FsZSBlTEJDIGJ1cywgdGhlcmUgYXJlIHJhdwpO
QU5EIGNoaXBzIHdpdGggYSB1bml0IGFkZHJlc3MgdGhhdCBoYXMgYSBjb21tYSBpbiBpdCAoY3Ms
b2Zmc2V0KS4KUmVsYXggdGhlICRub2RlbmFtZSBwYXR0ZXJuIGluIHJhdy1uYW5kLWNoaXAueWFt
bCB0byBhbGxvdyBzdWNoIHVuaXQKYWRkcmVzc2VzLgoKU2lnbmVkLW9mZi1ieTogSi4gTmV1c2No
w6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KLS0tCgpWMjoKLSBuZXcgcGF0Y2gKLS0tCiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Jhdy1uYW5kLWNoaXAueWFtbCB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmF3LW5hbmQtY2hpcC55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9yYXctbmFuZC1jaGlw
LnlhbWwKaW5kZXggMDkyNDQ4ZDdiZmM1Y2NkMjQ2Y2E0YjIzNDE0NjRlMTg3MjJhMmQ1MS4uMWM5
ZTNhNDBkOGY5Zjc3MTE1NTI1ZTVhNmJlMDk1MWFhZTAwMWFlMCAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9yYXctbmFuZC1jaGlwLnlhbWwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9yYXctbmFuZC1jaGlwLnlhbWwK
QEAgLTI1LDcgKzI1LDcgQEAgZGVzY3JpcHRpb246IHwKIAogcHJvcGVydGllczoKICAgJG5vZGVu
YW1lOgotICAgIHBhdHRlcm46ICJebmFuZEBbYS1mMC05XSQiCisgICAgcGF0dGVybjogIl5uYW5k
QFthLWYwLTldKCxbMC05YS1mXSopPyQiCiAKICAgcmVnOgogICAgIGRlc2NyaXB0aW9uOgoKLS0g
CjIuNDguMC5yYzEuMjE5LmdiNmI2NzU3ZDc3MgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
