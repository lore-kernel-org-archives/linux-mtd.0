Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF04C3DA4A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 21:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3/jtQs51r0gGN4l0eKhJylr89tE/5O2MlCP8hiESJo=; b=doK/a2Pj51OZhl
	dcghhkulKkYrxZ8L58x6BWp1h4RK3mVr0L7Z6hWp+KZY1Sn0XSi+Dq9XJB/eHu/ExXhXVaQgXgAFm
	4XMWk/FwYLs3TIG7iBdf2QytYeoOL8yhjNP3y/05J5XWr4Z4tC4rw6vQG0uelCL+fOBhn3D8WAIRj
	7cSmq6zUDDtdTsyRx/eRJPg+qcgACg9c+nh8TAE9tiDXXQXve6CZAYw1KfkT+/gEt2Bk+fLd+wVAZ
	RmSsAPWlEt9Yo2SlDnvTZKH6eerZBYaOvO1UjVL4P/O3JNczZufXG/2pU/6Y6bbSFVFG/u4lajwgV
	fh3p8BZoz+th75eGmedg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwh-0000000BDiW-1oXK;
	Fri, 07 Feb 2025 21:31:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVvp-0000000BD6c-2Ky2
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 21:30:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 98D5BA43D0A;
	Fri,  7 Feb 2025 21:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F2F6C4CEF1;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963835;
	bh=VDKy0G4btahVEWRST+u5g6rVWKGNcsy17PizxiolF6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oM70wMCbm8HWkBH6z7oKM1NUTfn70hHgBbUHq/YjJzO/mUBDv64r+HuhEsfCBYc2F
	 iAAbrZrZryeZ9y8SvQwRAyXqbNHsGMLN9mcmvElMEsIiUfq8KorF3t49jyEVCsg3rw
	 SYenBMNYx9Y4lV3BOZXh0qdhXrVWXhA2CPD5ZgBzuRg8ZblSNd1/siDeehl0uFVDwK
	 DSB0qa9hwYW4bBFO3Q6YuRhZ4fljDodOalRcZwvpqegMK654OTH07R9Kl8P3hznWRh
	 XMzykbNRbT9GIPDWK/l5G/ZoWgUUM5OAZSRB9Vd6eCT+bzP10hWmxkdQ1hHKShCp9v
	 cXo+yopl3mY+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E52EC0219E;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:21 +0100
Subject: [PATCH v2 04/12] dt-bindings: mfd: Convert fsl,mcu-mpc8349emitx to
 YAML
MIME-Version: 1.0
Message-Id: <20250207-ppcyaml-v2-4-8137b0c42526@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=2984;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=uDy6u7+vjMysytDO3zWjx3Kn3oUqiW3GteoXfkCwZKA=;
 b=iFXGU+mNZUpUqA9uza05gJYMsMBoJdg86aLQh1PgURVUwU/03DcfeAfebz0wdehh60plhBbPb
 sqQK+Qjx2SFBGdyjhZLJG40nneXpeIDU6GM+y26pfUBo0zsE2hF9wE4
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133037_723987_2C1BA5A3 
X-CRM114-Status: GOOD (  10.66  )
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

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKQ29udmVydCBtY3UtbXBj
ODM0OWVtaXR4LnR4dCB0byBZQU1MIGFuZCBsaXN0IHRoZSBjb21wYXRpYmxlIHN0cmluZ3MKY3Vy
cmVudGx5IGluIHVzZS4KClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJu
ZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0Pgot
LS0KClYyOgotIHRyaW0gc3ViamVjdCBsaW5lIChyZW1vdmUgImJpbmRpbmciKQotIGZpeCBwcm9w
ZXJ0eSBvcmRlciB0byBjb21wbHkgd2l0aCBkdHMgY29kaW5nIHN0eWxlCi0tLQogLi4uL2JpbmRp
bmdzL21mZC9mc2wsbWN1LW1wYzgzNDllbWl0eC55YW1sICAgICAgICAgfCA1MyArKysrKysrKysr
KysrKysrKysrKysrCiAuLi4vYmluZGluZ3MvcG93ZXJwYy9mc2wvbWN1LW1wYzgzNDllbWl0eC50
eHQgICAgICB8IDE3IC0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwg
MTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21mZC9mc2wsbWN1LW1wYzgzNDllbWl0eC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9mc2wsbWN1LW1wYzgzNDllbWl0eC55YW1sCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAu
LmQyMGRlN2E0MTQyNTQ2Yzk1ZjY1ODE0YTNmMWIwM2RkMDk0OWNmZmIKLS0tIC9kZXYvbnVsbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2ZzbCxtY3UtbXBjODM0
OWVtaXR4LnlhbWwKQEAgLTAsMCArMSw1MyBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZmQvZnNsLG1jdS1tcGM4MzQ5ZW1pdHgueWFtbCMK
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwor
Cit0aXRsZTogRnJlZXNjYWxlIE1QQzgzNDlFLW1JVFgtY29tcGF0aWJsZSBQb3dlciBNYW5hZ2Vt
ZW50IE1pY3JvIENvbnRyb2xsZXIgVW5pdCAoTUNVKQorCittYWludGFpbmVyczoKKyAgLSBKLiBO
ZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxl
OgorICAgIG9uZU9mOgorICAgICAgLSBpdGVtczoKKyAgICAgICAgICAtIGVudW06CisgICAgICAg
ICAgICAgIC0gZnNsLG1jOXMwOHFnOC1tcGM4MzE1ZXJkYgorICAgICAgICAgICAgICAtIGZzbCxt
YzlzMDhxZzgtbXBjODM0OWVtaXR4CisgICAgICAgICAgICAgIC0gZnNsLG1jOXMwOHFnOC1tcGM4
Mzc3ZXJkYgorICAgICAgICAgICAgICAtIGZzbCxtYzlzMDhxZzgtbXBjODM3OGVyZGIKKyAgICAg
ICAgICAgICAgLSBmc2wsbWM5czA4cWc4LW1wYzgzNzllcmRiCisgICAgICAgICAgLSBjb25zdDog
ZnNsLG1jdS1tcGM4MzQ5ZW1pdHgKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICAiI2dw
aW8tY2VsbHMiOgorICAgIGNvbnN0OiAyCisKKyAgZ3Bpby1jb250cm9sbGVyOiB0cnVlCisKK3Jl
cXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSAiI2dwaW8tY2VsbHMiCisgIC0g
Z3Bpby1jb250cm9sbGVyCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxl
czoKKyAgLSB8CisgICAgaTJjIHsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAg
ICAgICNzaXplLWNlbGxzID0gPDA+OworCisgICAgICAgIG1jdUBhIHsKKyAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiZnNsLG1jOXMwOHFnOC1tcGM4MzQ5ZW1pdHgiLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICJmc2wsbWN1LW1wYzgzNDllbWl0eCI7CisgICAgICAgICAgICByZWcgPSA8MHgw
YT47CisgICAgICAgICAgICAjZ3Bpby1jZWxscyA9IDwyPjsKKyAgICAgICAgICAgIGdwaW8tY29u
dHJvbGxlcjsKKyAgICAgICAgfTsKKyAgICB9OwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL21jdS1tcGM4MzQ5ZW1pdHgudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL21jdS1tcGM4MzQ5ZW1p
dHgudHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzN2Y5MWZhNTc2NTQ1YWEyNDVk
ODkzYzI0MjQ4YmRiYjJjMGZjYzA3Li4wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlcnBjL2Zz
bC9tY3UtbXBjODM0OWVtaXR4LnR4dAorKysgL2Rldi9udWxsCkBAIC0xLDE3ICswLDAgQEAKLUZy
ZWVzY2FsZSBNUEM4MzQ5RS1tSVRYLWNvbXBhdGlibGUgUG93ZXIgTWFuYWdlbWVudCBNaWNybyBD
b250cm9sbGVyIFVuaXQgKE1DVSkKLQotUmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJs
ZSA6ICJmc2wsPG1jdS1jaGlwPi08Ym9hcmQ+IiwgImZzbCxtY3UtbXBjODM0OWVtaXR4Ii4KLS0g
cmVnIDogc2hvdWxkIHNwZWNpZnkgSTJDIGFkZHJlc3MgKDB4MGEpLgotLSAjZ3Bpby1jZWxscyA6
IHNob3VsZCBiZSAyLgotLSBncGlvLWNvbnRyb2xsZXIgOiBzaG91bGQgYmUgcHJlc2VudC4KLQot
RXhhbXBsZToKLQotbWN1QGEgewotCSNncGlvLWNlbGxzID0gPDI+OwotCWNvbXBhdGlibGUgPSAi
ZnNsLG1jOXMwOHFnOC1tcGM4MzQ5ZW1pdHgiLAotCQkgICAgICJmc2wsbWN1LW1wYzgzNDllbWl0
eCI7Ci0JcmVnID0gPDB4MGE+OwotCWdwaW8tY29udHJvbGxlcjsKLX07CgotLSAKMi40OC4wLnJj
MS4yMTkuZ2I2YjY3NTdkNzcyCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
