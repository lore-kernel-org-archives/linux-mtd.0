Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D7DC021A1
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 21:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=caROh1CrFNMwkA/5um8oeL9rDJ7kK2W5DCKmaT2s5Ak=; b=PSVc0p0q+oECOA
	ign5Id0mDMAmCYyDKJYszLqOxzqBG7/NuMN81MbuY/KY1Kv3ztjX/pc8OF8yUUvf68odB3+4e62/S
	E2bTyljacXdzASPBLMiCGLIFuRObwwmy6TneSIfmsd9Shvt7xKkWgAc20ey46z6sFLqFZaTjOIzDP
	Wt+BRyTEmNBJvmk+x15E7r13uALnZexaFaIov6e7opNNZJ310eCq9BFO+6wZ1lxxLdMMYjELtyl5I
	w5GcgzVnh9fL4gwllNBnXOG55Rz9r31EJZSdzGsKM0k/zAwLISUunIh+WoK2LSO/zf+YGIZPA7hzS
	r+2eHw5H/LqFY/kNyNoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwo-0000000BDs1-3Kt8;
	Fri, 07 Feb 2025 21:31:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVvs-0000000BD9o-3ZQe
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 21:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3D49A43D88;
	Fri,  7 Feb 2025 21:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49856C4CEEB;
	Fri,  7 Feb 2025 21:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963836;
	bh=U5UemYYck+g6K/d3gcb9OegxZyY2n//O2XiyL7ugTcw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nBjy4UuM3SUjIdxik6BR5rm/ASIJDNQxPXN6mSjlI/9OhbWm0pZ67xR8x2mMfUhJ2
	 pmCvmwPfQNJr7yMaXgaW3IiGDMuUfwMsP2wZrEiXIdiePG6DyLpOc/jVvLhKwMUvma
	 i+DRou6NNxW1lQyr6j3oepEfzlI7mFHYShrjOEAX3ss/mvHQq7j6TSmzceRed2Kyeg
	 22SUIbA3CvdGchhzow9F3mV0iGlv7y+4IPzE/IFPZ8cxKv37/E4K6uo59XGKcp1WcA
	 Sdb1YkwjH0iM0Dz45WKyVSeHDPyPae/84FQDUuxGixxRDv7L3IWgcuMOxBIVZH3//b
	 0GhrBdgdRLEKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38036C021A0;
	Fri,  7 Feb 2025 21:30:36 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:28 +0100
Subject: [PATCH v2 11/12] dt-bindings: nand: Add fsl,elbc-fcm-nand
MIME-Version: 1.0
Message-Id: <20250207-ppcyaml-v2-11-8137b0c42526@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=2741;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=A7t/u30eqpoJx8jMTUhNPC2EH5W9JFBL9vrCsuCzJiM=;
 b=6cIaRoAnn733LBvmUf6ToU9hIJ7bv+M0rf3gbWNtCLaOwrVFONlFsub9Dce/9cDwwRNLlYNWC
 H/IAes0Q6zqDDWsbACciyF+d+riDCoYn9mhlEeFsw3WbFpHU26/6A9t
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133041_090261_61193FEE 
X-CRM114-Status: GOOD (  12.40  )
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
aW5kaW5nIGFscmVhZHkgc3VwcG9ydGVkIGJ5IHRoZSBmc2xfZWxiY19uYW5kLmMgZHJpdmVyCmFu
ZCB1c2VkIGluIHNldmVyYWwgZGV2aWNlIHRyZWVzIGluIGFyY2gvcG93ZXJwYy9ib290L2R0cy8u
CgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgotLS0KClYy
OgotIHNwbGl0IG91dCBmcm9tIGZzbCxlbGJjIGJpbmRpbmcgcGF0Y2gKLSBjb25zdHJhaW4gI2Fk
ZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzCi0gYWRkIGEgZ2VuZXJhbCBkZXNjcmlwdGlvbgot
IHVzZSB1bmV2YWx1YXRlZFByb3BlcnRpZXM9ZmFsc2UgaW5zdGVhZCBvZiBhZGRpdGlvbmFsUHJv
cGVydGllcz1mYWxzZQotIGZpeCBwcm9wZXJ0eSBvcmRlciB0byBjb21wbHkgd2l0aCBkdHMgY29k
aW5nIHN0eWxlCi0gaW5jbHVkZSByYXctbmFuZC1jaGlwLnlhbWwgaW5zdGVhZCBvZiBuYW5kLWNo
aXAueWFtbAotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9mc2wsZWxiYy1mY20tbmFu
ZC55YW1sIHwgNjggKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMWRlOTdiYjI0
ZmE0YTgzZTJlYTVkOTRhYjgyMmRkMGUzN2JhYTEwMgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZnNsLGVsYmMtZmNtLW5hbmQueWFtbApA
QCAtMCwwICsxLDY4IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL210ZC9mc2wsZWxiYy1mY20tbmFuZC55YW1sIworJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBOQU5EIGZs
YXNoIGF0dGFjaGVkIHRvIEZyZWVzY2FsZSBlTEJDCisKK2Rlc2NyaXB0aW9uOgorICBUaGUgRnJl
ZXNjYWxlIEVuaGFuY2VkIExvY2FsIEJ1cyBjb250cm9sbGVyIChlTEJDKSBjb250YWlucyBsb2dp
YyB0bworICBpbnRlcmZhY2Ugd2l0aCBOQU5EIGZsYXNoLCBjYWxsZWQgdGhlIE5BTkQgRmxhc2gg
Q29udHJvbCBNYWNoaW5lIChGQ00pLgorICBUaGlzIGJpbmRpbmcgZGVzY3JpYmVzIGZsYXNoIGF0
dGFjaGVkIHRvIGFuIGVMQkMgdXNpbmcgdGhlIEZDTS4KKworbWFpbnRhaW5lcnM6CisgIC0gSi4g
TmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KKworYWxsT2Y6CisgIC0gJHJlZjogcmF3LW5h
bmQtY2hpcC55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIG9uZU9mOgor
ICAgICAgLSBpdGVtczoKKyAgICAgICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0gZnNsLG1w
YzgzMTMtZmNtLW5hbmQKKyAgICAgICAgICAgICAgLSBmc2wsbXBjODMxNS1mY20tbmFuZAorICAg
ICAgICAgICAgICAtIGZzbCxtcGM4Mzc3LWZjbS1uYW5kCisgICAgICAgICAgICAgIC0gZnNsLG1w
YzgzNzgtZmNtLW5hbmQKKyAgICAgICAgICAgICAgLSBmc2wsbXBjODM3OS1mY20tbmFuZAorICAg
ICAgICAgICAgICAtIGZzbCxtcGM4NTM2LWZjbS1uYW5kCisgICAgICAgICAgICAgIC0gZnNsLG1w
Yzg1NjktZmNtLW5hbmQKKyAgICAgICAgICAgICAgLSBmc2wsbXBjODU3Mi1mY20tbmFuZAorICAg
ICAgICAgICAgICAtIGZzbCxwMTAyMC1mY20tbmFuZAorICAgICAgICAgICAgICAtIGZzbCxwMTAy
MS1mY20tbmFuZAorICAgICAgICAgICAgICAtIGZzbCxwMTAyNS1mY20tbmFuZAorICAgICAgICAg
ICAgICAtIGZzbCxwMjAyMC1mY20tbmFuZAorICAgICAgICAgIC0gY29uc3Q6IGZzbCxlbGJjLWZj
bS1uYW5kCisgICAgICAtIGNvbnN0OiBmc2wsZWxiYy1mY20tbmFuZAorCisgIHJlZzoKKyAgICBt
YXhJdGVtczogMQorCisgICIjYWRkcmVzcy1jZWxscyI6CisgICAgY29uc3Q6IDEKKworICAiI3Np
emUtY2VsbHMiOgorICAgIGNvbnN0OiAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAg
LSByZWcKKwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8
CisgICAgbG9jYWxidXMgeworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKKyAgICAgICAg
I3NpemUtY2VsbHMgPSA8MT47CisKKyAgICAgICAgbmFuZEAxLDAgeworICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJmc2wsbXBjODMxNS1mY20tbmFuZCIsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgImZzbCxlbGJjLWZjbS1uYW5kIjsKKyAgICAgICAgICAgIHJlZyA9IDwweDEgMHgwIDB4MjAw
MD47CisgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgICAgICNzaXpl
LWNlbGxzID0gPDE+OworICAgICAgICB9OworICAgIH07CgotLSAKMi40OC4wLnJjMS4yMTkuZ2I2
YjY3NTdkNzcyCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
