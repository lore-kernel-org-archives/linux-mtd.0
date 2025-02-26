Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7794C021B8
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNc9syChc/nUx4xYW3LFaom/xRukH8MbQHt7xZxgMLY=; b=BjHLsgS+5jJU+z
	vAjcGnF/G21KBkFYKXnyBW6a9f0ERq3/ikLzDAa7l+BDZgaYehMyeWZG3uUySpyvHegaZUrQqwdV0
	2t3rGi/IjnF+XPRfhVOCIhYCqZqCrnkaxeqvu8I9/lqRXP8uUrkjdJMRUO8UWUnRXVoxvtpAh9Tc0
	vmq9a88pEqRp+zQy7CfkI422tbUETmO7HdHJkxXMPyayU/QI01Eb5msqzX6PnCjDpwsSDj6l5JR5h
	YRQczwxN2CSCj17SS1ii29yuaEGPDJj3/M/oJvtH99GFJehrvwuMr7P8c+yskQvKvgGNl3z2Mmb9F
	cAz4ircEWBwJTfZtWrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKwd-00000004epP-2Dmi;
	Wed, 26 Feb 2025 17:11:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKn7-00000004ciN-0TDL
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 17:01:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67F3F61F20;
	Wed, 26 Feb 2025 17:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE6ECC4CEE9;
	Wed, 26 Feb 2025 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740589307;
	bh=mR8X2x+4upIZjxcvX9fZdAr30Xa5cx+18eEK9yFm0bk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IzK+yIvjtGcpCAWuhQPuFuWYDw3PRuP/iopY5U/F91CkdhnH563bOWE6iKnAXkWBu
	 u0Adw8tGsxCHpQcFaG+XePcavBbxZRWD/zQohOnm6luTDE/iXjwGzHthoTWeB78sz9
	 eEjT7ETFLsxo+zqR+CGyQCrF+1C5ii+UGNP6WJawz4iFlo3jR7TOsNQBbr4drAS1SE
	 hULTyaRyDEyj1yQrmzfYJErPCtiIg/zBo/UcUh4beAr4v4McIid2ODZlnY4Fa8aObv
	 6HWFa36OGGNPM4Zykpab8b+TICi2RFa4g/eKTcJKfVmRcX5v08XqWSsKUYe3suR3dQ
	 ffWRnEmFq1h7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFD0C19F38;
	Wed, 26 Feb 2025 17:01:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Wed, 26 Feb 2025 18:01:41 +0100
Subject: [PATCH v3 2/3] dt-bindings: nand: Add fsl,elbc-fcm-nand
MIME-Version: 1.0
Message-Id: <20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net>
References: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
In-Reply-To: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740589304; l=3338;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=CdXw6dR5bMVKNz3tQ2ZajhBrMGlazf+TPLV0IfPcsxQ=;
 b=ou0k0jl7pEz6u2l1Bp+HZXK2i2t4d4INlycakDeN/WIBbhWASIzDsh/9ARllj6+TJrAUIobNt
 PBZYX405vpjBssaH+g2YrR27om7vZv3GVW9RzROoCOA95mWOs191kqO
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
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
CgpyYXctbmFuZC1jaGlwLnlhbWwgaXMgcmVmZXJlbmNlZCBpbiBvcmRlciB0byBhY2NvbW1vZGF0
ZSBzaXR1YXRpb25zIGluCndoaWNoIHRoZSBFQ0MgcGFyYW1ldGVycyBzZXR0aW5ncyBhcmUgc2V0
IGluIHRoZSBkZXZpY2UgdHJlZS4gT25lIHN1Y2gKZXhhbXBsZSBpcyBpbiBhcmNoL3Bvd2VycGMv
Ym9vdC9kdHMvdHVycmlzMXguZHRzOgoKCS8qIE1UMjlGMkcwOEFCQUVBV1A6RSBOQU5EICovCglu
YW5kQDEsMCB7CgkJY29tcGF0aWJsZSA9ICJmc2wscDIwMjAtZmNtLW5hbmQiLCAiZnNsLGVsYmMt
ZmNtLW5hbmQiOwoJCXJlZyA9IDwweDEgMHgwIDB4MDAwNDAwMDA+OwoJCW5hbmQtZWNjLW1vZGUg
PSAic29mdCI7CgkJbmFuZC1lY2MtYWxnbyA9ICJiY2giOwoKCQlwYXJ0aXRpb25zIHsgLi4uIH07
Cgl9OwoKUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgpTaWduZWQtb2Zm
LWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgotLS0KClYzOgotIHJlbW92ZSB1
bm5lY2Vzc2FyeSAjYWRkcmVzcy9zaXplLWNlbGxzIGZyb20gbmFuZCBub2RlIGluIGV4YW1wbGUK
LSBhZGQgRnJhbmsgTGkncyByZXZpZXcgdGFnCi0gYWRkIG1pc3NpbmcgZW5kIG9mIGRvY3VtZW50
IG1hcmtlciAoLi4uKQotIGV4cGxhaW4gY2hvaWNlIHRvIHJlZmVyZW5jZSByYXctbmFuZC1jaGlw
LnlhbWwKClYyOgotIHNwbGl0IG91dCBmcm9tIGZzbCxlbGJjIGJpbmRpbmcgcGF0Y2gKLSBjb25z
dHJhaW4gI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzCi0gYWRkIGEgZ2VuZXJhbCBkZXNj
cmlwdGlvbgotIHVzZSB1bmV2YWx1YXRlZFByb3BlcnRpZXM9ZmFsc2UgaW5zdGVhZCBvZiBhZGRp
dGlvbmFsUHJvcGVydGllcz1mYWxzZQotIGZpeCBwcm9wZXJ0eSBvcmRlciB0byBjb21wbHkgd2l0
aCBkdHMgY29kaW5nIHN0eWxlCi0gaW5jbHVkZSByYXctbmFuZC1jaGlwLnlhbWwgaW5zdGVhZCBv
ZiBuYW5kLWNoaXAueWFtbAotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9mc2wsZWxi
Yy1mY20tbmFuZC55YW1sIHwgNjggKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDY4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4u
OTFlOGYyZjlmZjI2ZGEwZjVhM2Y5YmYyNzY5NTVlZDMyZTllN2JjNgotLS0gL2Rldi9udWxsCisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZnNsLGVsYmMtZmNtLW5h
bmQueWFtbApAQCAtMCwwICsxLDY4IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9mc2wsZWxiYy1mY20tbmFuZC55YW1sIworJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxl
OiBOQU5EIGZsYXNoIGF0dGFjaGVkIHRvIEZyZWVzY2FsZSBlTEJDCisKK2Rlc2NyaXB0aW9uOgor
ICBUaGUgRnJlZXNjYWxlIEVuaGFuY2VkIExvY2FsIEJ1cyBjb250cm9sbGVyIChlTEJDKSBjb250
YWlucyBsb2dpYyB0bworICBpbnRlcmZhY2Ugd2l0aCBOQU5EIGZsYXNoLCBjYWxsZWQgdGhlIE5B
TkQgRmxhc2ggQ29udHJvbCBNYWNoaW5lIChGQ00pLgorICBUaGlzIGJpbmRpbmcgZGVzY3JpYmVz
IGZsYXNoIGF0dGFjaGVkIHRvIGFuIGVMQkMgdXNpbmcgdGhlIEZDTS4KKworbWFpbnRhaW5lcnM6
CisgIC0gSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KKworYWxsT2Y6CisgIC0gJHJl
ZjogcmF3LW5hbmQtY2hpcC55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAg
IG9uZU9mOgorICAgICAgLSBpdGVtczoKKyAgICAgICAgICAtIGVudW06CisgICAgICAgICAgICAg
IC0gZnNsLG1wYzgzMTMtZmNtLW5hbmQKKyAgICAgICAgICAgICAgLSBmc2wsbXBjODMxNS1mY20t
bmFuZAorICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc3LWZjbS1uYW5kCisgICAgICAgICAgICAg
IC0gZnNsLG1wYzgzNzgtZmNtLW5hbmQKKyAgICAgICAgICAgICAgLSBmc2wsbXBjODM3OS1mY20t
bmFuZAorICAgICAgICAgICAgICAtIGZzbCxtcGM4NTM2LWZjbS1uYW5kCisgICAgICAgICAgICAg
IC0gZnNsLG1wYzg1NjktZmNtLW5hbmQKKyAgICAgICAgICAgICAgLSBmc2wsbXBjODU3Mi1mY20t
bmFuZAorICAgICAgICAgICAgICAtIGZzbCxwMTAyMC1mY20tbmFuZAorICAgICAgICAgICAgICAt
IGZzbCxwMTAyMS1mY20tbmFuZAorICAgICAgICAgICAgICAtIGZzbCxwMTAyNS1mY20tbmFuZAor
ICAgICAgICAgICAgICAtIGZzbCxwMjAyMC1mY20tbmFuZAorICAgICAgICAgIC0gY29uc3Q6IGZz
bCxlbGJjLWZjbS1uYW5kCisgICAgICAtIGNvbnN0OiBmc2wsZWxiYy1mY20tbmFuZAorCisgIHJl
ZzoKKyAgICBtYXhJdGVtczogMQorCisgICIjYWRkcmVzcy1jZWxscyI6CisgICAgY29uc3Q6IDEK
KworICAiI3NpemUtY2VsbHMiOgorICAgIGNvbnN0OiAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBh
dGlibGUKKyAgLSByZWcKKwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxl
czoKKyAgLSB8CisgICAgbG9jYWxidXMgeworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsK
KyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CisKKyAgICAgICAgbmFuZEAxLDAgeworICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbXBjODMxNS1mY20tbmFuZCIsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgImZzbCxlbGJjLWZjbS1uYW5kIjsKKyAgICAgICAgICAgIHJlZyA9IDwweDEg
MHgwIDB4MjAwMD47CisgICAgICAgIH07CisgICAgfTsKKworLi4uCgotLSAKMi40OC4wLnJjMS4y
MTkuZ2I2YjY3NTdkNzcyCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
