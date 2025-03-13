Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD2FC35FF3
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 21:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1w/GIl+cBXherWPCpNBEDbxDLZZlWBMEeRcbADTY2+Q=; b=FycyVaGHWov1tp
	ihr7d8AcRtLedG3lroYlQivpAwNIaqv9uY8E8tjZsKZcqVq11ttswVIbWWpCJA0lbEucH32WDWDCr
	BfreNu+J+VwBxW1jXhCIsfBQt4piMcgE8uit00Exjnu6nXPKzmZ+j5iWeZ9qwQj9h6BMPc4K//Bzi
	wlvCDezdGL6iHCTA3EHzphGTGJjYQeFgBLgvXn+GL2bDwr1HZp0hBNgLyNDiUHHfizPUv7OK88LPR
	PJCraNMqqU9hq0UDM+t4nkon5s5kb0MZZh0YDFXZ7hhuSlmAOpzJEcnvUY01UvwUwLHeyZ3Mjm78Z
	fdjD3CW140rb1Bidu/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqDb-0000000CX0q-3IN1;
	Thu, 13 Mar 2025 21:35:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqDV-0000000CWy1-1yOP
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 21:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 409C9A48763;
	Thu, 13 Mar 2025 21:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E616C4CEEF;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741901747;
	bh=N9vjOO0ppP0Y2mdFuJUbpBLs8pEFcObKLSdjXsIWfMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=noqCH8N/bx1mUQjnBXRnaVuZD5iVgUmz18QmQBioCf0PHuKzYJbUN/DQLnWTuog2o
	 IbJfpCmRc645H/03pMaAkz2xHre1ZFt6pO9cXfeZ1ww5NgD9wFTR9Z1CExr01aNGJA
	 +e60svISAgYKnyNrt62iDXDo8zaMxb8+wX9AZkWvvFCLuav8zStJC7Halx+T7pOUU4
	 l3QeSeyPcpAsCC5KV8ruauvO3rUTmVzQogUyVkQRYvsSueXCSzVZdOF0M7+yre8KFd
	 DIJV3RmHnI/CsfSTXQsMg5C+i2jhvWTlDj+Gu68C9iuoHoUBzXn9CGg0LiWaF2ixMv
	 NBCWU5O+8raIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE7DC35FF3;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 13 Mar 2025 22:35:46 +0100
Subject: [PATCH v4 3/4] dt-bindings: nand: Add fsl,elbc-fcm-nand
MIME-Version: 1.0
Message-Id: <20250313-ppcyaml-elbc-v4-3-55903722d9ea@posteo.net>
References: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
In-Reply-To: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741901745; l=3359;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=/umUf9hJGqJZQnH4lp0VYOs75H+hiudpQPeFtynlqq0=;
 b=rut2FT9YxXNoUww0z5Ik0lSdReicEKdzbFg0FYIlmovOGHWwcVanj66uf0QrEhrZv+Z7u1jeu
 6hjm8X+fciVCNioGM8E33XDtOLxgnpaaWy/0lbuwKT8QtBAFfcftpKY
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_143549_643331_08FB4994 
X-CRM114-Status: GOOD (  14.14  )
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
LWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgotLS0KClY0OgotIG5vIGNoYW5n
ZXMKClYzOgotIHJlbW92ZSB1bm5lY2Vzc2FyeSAjYWRkcmVzcy9zaXplLWNlbGxzIGZyb20gbmFu
ZCBub2RlIGluIGV4YW1wbGUKLSBhZGQgRnJhbmsgTGkncyByZXZpZXcgdGFnCi0gYWRkIG1pc3Np
bmcgZW5kIG9mIGRvY3VtZW50IG1hcmtlciAoLi4uKQotIGV4cGxhaW4gY2hvaWNlIHRvIHJlZmVy
ZW5jZSByYXctbmFuZC1jaGlwLnlhbWwKClYyOgotIHNwbGl0IG91dCBmcm9tIGZzbCxlbGJjIGJp
bmRpbmcgcGF0Y2gKLSBjb25zdHJhaW4gI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzCi0g
YWRkIGEgZ2VuZXJhbCBkZXNjcmlwdGlvbgotIHVzZSB1bmV2YWx1YXRlZFByb3BlcnRpZXM9ZmFs
c2UgaW5zdGVhZCBvZiBhZGRpdGlvbmFsUHJvcGVydGllcz1mYWxzZQotIGZpeCBwcm9wZXJ0eSBv
cmRlciB0byBjb21wbHkgd2l0aCBkdHMgY29kaW5nIHN0eWxlCi0gaW5jbHVkZSByYXctbmFuZC1j
aGlwLnlhbWwgaW5zdGVhZCBvZiBuYW5kLWNoaXAueWFtbAotLS0KIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9mc2wsZWxiYy1mY20tbmFuZC55YW1sIHwgNjggKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5k
LnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMC4uOTFlOGYyZjlmZjI2ZGEwZjVhM2Y5YmYyNzY5NTVlZDMyZTllN2Jj
NgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvZnNsLGVsYmMtZmNtLW5hbmQueWFtbApAQCAtMCwwICsxLDY4IEBACisjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgor
LS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9mc2wsZWxiYy1mY20t
bmFuZC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjCisKK3RpdGxlOiBOQU5EIGZsYXNoIGF0dGFjaGVkIHRvIEZyZWVzY2FsZSBlTEJD
CisKK2Rlc2NyaXB0aW9uOgorICBUaGUgRnJlZXNjYWxlIEVuaGFuY2VkIExvY2FsIEJ1cyBjb250
cm9sbGVyIChlTEJDKSBjb250YWlucyBsb2dpYyB0bworICBpbnRlcmZhY2Ugd2l0aCBOQU5EIGZs
YXNoLCBjYWxsZWQgdGhlIE5BTkQgRmxhc2ggQ29udHJvbCBNYWNoaW5lIChGQ00pLgorICBUaGlz
IGJpbmRpbmcgZGVzY3JpYmVzIGZsYXNoIGF0dGFjaGVkIHRvIGFuIGVMQkMgdXNpbmcgdGhlIEZD
TS4KKworbWFpbnRhaW5lcnM6CisgIC0gSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4K
KworYWxsT2Y6CisgIC0gJHJlZjogcmF3LW5hbmQtY2hpcC55YW1sIworCitwcm9wZXJ0aWVzOgor
ICBjb21wYXRpYmxlOgorICAgIG9uZU9mOgorICAgICAgLSBpdGVtczoKKyAgICAgICAgICAtIGVu
dW06CisgICAgICAgICAgICAgIC0gZnNsLG1wYzgzMTMtZmNtLW5hbmQKKyAgICAgICAgICAgICAg
LSBmc2wsbXBjODMxNS1mY20tbmFuZAorICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc3LWZjbS1u
YW5kCisgICAgICAgICAgICAgIC0gZnNsLG1wYzgzNzgtZmNtLW5hbmQKKyAgICAgICAgICAgICAg
LSBmc2wsbXBjODM3OS1mY20tbmFuZAorICAgICAgICAgICAgICAtIGZzbCxtcGM4NTM2LWZjbS1u
YW5kCisgICAgICAgICAgICAgIC0gZnNsLG1wYzg1NjktZmNtLW5hbmQKKyAgICAgICAgICAgICAg
LSBmc2wsbXBjODU3Mi1mY20tbmFuZAorICAgICAgICAgICAgICAtIGZzbCxwMTAyMC1mY20tbmFu
ZAorICAgICAgICAgICAgICAtIGZzbCxwMTAyMS1mY20tbmFuZAorICAgICAgICAgICAgICAtIGZz
bCxwMTAyNS1mY20tbmFuZAorICAgICAgICAgICAgICAtIGZzbCxwMjAyMC1mY20tbmFuZAorICAg
ICAgICAgIC0gY29uc3Q6IGZzbCxlbGJjLWZjbS1uYW5kCisgICAgICAtIGNvbnN0OiBmc2wsZWxi
Yy1mY20tbmFuZAorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgICIjYWRkcmVzcy1jZWxs
cyI6CisgICAgY29uc3Q6IDEKKworICAiI3NpemUtY2VsbHMiOgorICAgIGNvbnN0OiAxCisKK3Jl
cXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVz
OiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgbG9jYWxidXMgeworICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwyPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CisKKyAgICAgICAg
bmFuZEAxLDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbXBjODMxNS1mY20tbmFu
ZCIsCisgICAgICAgICAgICAgICAgICAgICAgICAgImZzbCxlbGJjLWZjbS1uYW5kIjsKKyAgICAg
ICAgICAgIHJlZyA9IDwweDEgMHgwIDB4MjAwMD47CisgICAgICAgIH07CisgICAgfTsKKworLi4u
CgotLSAKMi40OC4wLnJjMS4yMTkuZ2I2YjY3NTdkNzcyCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
