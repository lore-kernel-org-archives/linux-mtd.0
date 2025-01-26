Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268B6C02190
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=si3k+2V3r6G1T5AKB5l8nfHJkSNnAcVoW1Z68Q6qR0Y=; b=ZLtT2DWn9PZi30
	baNHV4BnchHuSl6g3FfIgLhau/HdvDnlGL4XxAv8vNR1JTQ5zOm+BEFfG9z9CTSLWL8FE1KkuyIkj
	LutLpfevb7PXeBW463O46VEz4EajEMwTspTep9L8wHhgSpUfycRQ8AYKYN5boJf9vzq+CcndMntjg
	nw2tkPckA45APhZFYXZRQ3j/AYxfDV4Oai16kjpb1fnaBwWS0ukkKLOErYesYXb2GWxtaHXQ0Vy8V
	Bqv7aDuz7jyw/W7lPiqr7wN1YRviz5XIcQ065m5O7zgwGmcYLoOEoCAAQ9Dqc10itk29bUb0agENf
	PY1ZEssM3jKKGQ2i5qKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7qi-00000000gji-1bFM;
	Sun, 26 Jan 2025 18:59:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7qe-00000000gfw-2q3k
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 18:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D42AA40FE0;
	Sun, 26 Jan 2025 18:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBBB6C4AF10;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917945;
	bh=kdEy1mfULIpKzXm5eLphJofVfiUx8H2JQ4v42STBzbM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MXzfr+Tz8P9f6KUPhM0SxXHW0PqAxYpOGJCU4HMSLPyge1rxSylBFUrq+MNJVdHkG
	 IJVtgMmki/D5T1vnikZCw6Aq5PTLS7kfvlxlpKorDH5zFz9B/1e7/JgLB2VgMJZKH4
	 hqs8T354VkqpxYGXgv3EM/Icqe7mKRl1WxZZZChajsy10kfzTRY0iBtCc//yLWuP39
	 M8LUXKowx0JdvEl97VIiPb6VzfcNTTEpFTWFpRmcXstKxD7ygR2/aq2t5VGmvj3g/U
	 Eviey5yM16QoLEeuOJ7z2A0I/agegL1Kb9jPTRUhN8PzxOVREHQUKQyb3ysgYLtfzQ
	 RV92qF27kEwew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2CFC02190;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 26 Jan 2025 19:58:59 +0100
Subject: [PATCH 4/9] dt-bindings: mfd: Convert fsl,mcu-mpc8349emitx binding
 to YAML
MIME-Version: 1.0
Message-Id: <20250126-ppcyaml-v1-4-50649f51c3dd@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=2828;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Zs0qjqUn7j/PQS1DXYIjUgL76exzKlYYjv7eRLN8FW0=;
 b=X4UkPsnyhkPYNIFxPFYHZl/RaHmhkgyUlhH0nyS5nFtXhN07sT2qCw1iRrJR3NsSF3JvEDjxA
 t46J6h9PuZpAd2nDnX/8n4skfmikScso7OeLtftI+2fmvAKvGoDR8aF
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_105908_843488_C9D1DBA7 
X-CRM114-Status: GOOD (  11.21  )
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
cmVudGx5IGluIHVzZS4KClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rl
by5uZXQ+Ci0tLQogLi4uL2JpbmRpbmdzL21mZC9mc2wsbWN1LW1wYzgzNDllbWl0eC55YW1sICAg
ICAgICAgfCA1MyArKysrKysrKysrKysrKysrKysrKysrCiAuLi4vYmluZGluZ3MvcG93ZXJwYy9m
c2wvbWN1LW1wYzgzNDllbWl0eC50eHQgICAgICB8IDE3IC0tLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgNTMgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9mc2wsbWN1LW1wYzgzNDllbWl0eC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9mc2wsbWN1LW1wYzgzNDll
bWl0eC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAuLjhiZWIyZWQ5ZWRiNzQ1ZjUxM2RlYjU3NTVkNjgwMjMwOWIw
NjlmNDYKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL2ZzbCxtY3UtbXBjODM0OWVtaXR4LnlhbWwKQEAgLTAsMCArMSw1MyBAQAorIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFN
TCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZmQvZnNsLG1j
dS1tcGM4MzQ5ZW1pdHgueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRh
LXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogRnJlZXNjYWxlIE1QQzgzNDlFLW1JVFgtY29t
cGF0aWJsZSBQb3dlciBNYW5hZ2VtZW50IE1pY3JvIENvbnRyb2xsZXIgVW5pdCAoTUNVKQorCitt
YWludGFpbmVyczoKKyAgLSBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgorCitwcm9w
ZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIG9uZU9mOgorICAgICAgLSBpdGVtczoKKyAgICAg
ICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0gZnNsLG1jOXMwOHFnOC1tcGM4MzE1ZXJkYgor
ICAgICAgICAgICAgICAtIGZzbCxtYzlzMDhxZzgtbXBjODM0OWVtaXR4CisgICAgICAgICAgICAg
IC0gZnNsLG1jOXMwOHFnOC1tcGM4Mzc3ZXJkYgorICAgICAgICAgICAgICAtIGZzbCxtYzlzMDhx
ZzgtbXBjODM3OGVyZGIKKyAgICAgICAgICAgICAgLSBmc2wsbWM5czA4cWc4LW1wYzgzNzllcmRi
CisgICAgICAgICAgLSBjb25zdDogZnNsLG1jdS1tcGM4MzQ5ZW1pdHgKKworICByZWc6CisgICAg
bWF4SXRlbXM6IDEKKworICAiI2dwaW8tY2VsbHMiOgorICAgIGNvbnN0OiAyCisKKyAgZ3Bpby1j
b250cm9sbGVyOiB0cnVlCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAg
LSAiI2dwaW8tY2VsbHMiCisgIC0gZ3Bpby1jb250cm9sbGVyCisKK2FkZGl0aW9uYWxQcm9wZXJ0
aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgaTJjIHsKKyAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworCisgICAgICAgIG1j
dUBhIHsKKyAgICAgICAgICAgICNncGlvLWNlbGxzID0gPDI+OworICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJmc2wsbWM5czA4cWc4LW1wYzgzNDllbWl0eCIsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgImZzbCxtY3UtbXBjODM0OWVtaXR4IjsKKyAgICAgICAgICAgIHJlZyA9IDwweDBhPjsK
KyAgICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsKKyAgICAgICAgfTsKKyAgICB9OwpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL21jdS1t
cGM4MzQ5ZW1pdHgudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2Vy
cGMvZnNsL21jdS1tcGM4MzQ5ZW1pdHgudHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAzN2Y5MWZhNTc2NTQ1YWEyNDVkODkzYzI0MjQ4YmRiYjJjMGZjYzA3Li4wMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wb3dlcnBjL2ZzbC9tY3UtbXBjODM0OWVtaXR4LnR4dAorKysgL2Rldi9udWxs
CkBAIC0xLDE3ICswLDAgQEAKLUZyZWVzY2FsZSBNUEM4MzQ5RS1tSVRYLWNvbXBhdGlibGUgUG93
ZXIgTWFuYWdlbWVudCBNaWNybyBDb250cm9sbGVyIFVuaXQgKE1DVSkKLQotUmVxdWlyZWQgcHJv
cGVydGllczoKLS0gY29tcGF0aWJsZSA6ICJmc2wsPG1jdS1jaGlwPi08Ym9hcmQ+IiwgImZzbCxt
Y3UtbXBjODM0OWVtaXR4Ii4KLS0gcmVnIDogc2hvdWxkIHNwZWNpZnkgSTJDIGFkZHJlc3MgKDB4
MGEpLgotLSAjZ3Bpby1jZWxscyA6IHNob3VsZCBiZSAyLgotLSBncGlvLWNvbnRyb2xsZXIgOiBz
aG91bGQgYmUgcHJlc2VudC4KLQotRXhhbXBsZToKLQotbWN1QGEgewotCSNncGlvLWNlbGxzID0g
PDI+OwotCWNvbXBhdGlibGUgPSAiZnNsLG1jOXMwOHFnOC1tcGM4MzQ5ZW1pdHgiLAotCQkgICAg
ICJmc2wsbWN1LW1wYzgzNDllbWl0eCI7Ci0JcmVnID0gPDB4MGE+OwotCWdwaW8tY29udHJvbGxl
cjsKLX07CgotLSAKMi40OC4wLnJjMS4yMTkuZ2I2YjY3NTdkNzcyCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
