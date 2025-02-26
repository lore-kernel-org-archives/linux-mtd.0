Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1E8C19F38
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 17:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Su4qBJI9vJPsTD8Ncsuj92U+ud4fSV9VgatyCVwCoqQ=; b=jvTNsChrDt3FiH
	nKAZhq9xeS2DpBAnHEM8tYOjkG/woNL+lRbN/B/r/ZQkMNWGRmA5jpcfP2l1M30EvaSD7oggfyEfY
	alf+Wv5eJ9zg6DPfrB7AJU6Vhc4kT3tuODU64PbjmB6VZa/Z0GDtEX8yaPk2QDNwRgiEZ7/UwsdHw
	N4L49FmzwYHqqcvVs8R+1JH0MpXfZuWf9S8x7jl5nS6R4LkD8GNYxpcwCcQJENbFtYr3uAASC/2WF
	EBTTZSuZlWdxk9bGF7iSDR0yPAnuCyXJpbvLpLd7pWUocrUQ9q47syOTGNFt4kuVGaxac6T/CI7n8
	T4QY8EEIh3QJs6Fu8exA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKwe-00000004epq-2F40;
	Wed, 26 Feb 2025 17:11:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKn7-00000004ciB-0vnB
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 17:01:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 619E25C73BB;
	Wed, 26 Feb 2025 17:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D9B3C4CEE8;
	Wed, 26 Feb 2025 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740589307;
	bh=LeKsNo2NfWVXxRjT54xweYUrvhD0ogZ4MMk7ujoSXro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jjSSZNTushNhFKrhTCVil2I2mO5OvNDQrugasDfbFqP9Dp0kNfXuge+vmXPdnqlv2
	 tzxK9Hm2pPJmRodD6q/2EsKVzpgdrqCgFMp2teixEWOXulUDc/rK44mR+Ol3Xj2ORX
	 jXHyL2KjM5fTH4yeuX+VhDjHp0xUQc0WGJjeHb8MfPXO8mmt/pT2wZZ0XqqfLTx7nd
	 htKCwq0azN1fUcO31/USFG8trLQWoGFNwzHTcSwPbQw05dDUiqFNlT73miY02X31Ld
	 NCVBDpl/pTSxBi0isHwISRGKErUTIGDqbWzZn0rcspoyL0LrTaQ5gdZ5tqwvo0J68b
	 nYbotQm6PnDOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D2EC19F2E;
	Wed, 26 Feb 2025 17:01:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Wed, 26 Feb 2025 18:01:40 +0100
Subject: [PATCH v3 1/3] dt-bindings: memory-controllers: Add
 fsl,elbc-gpcm-uio
MIME-Version: 1.0
Message-Id: <20250226-ppcyaml-elbc-v3-1-a90ed71da838@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740589304; l=2445;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=GvQhsrPLWmFseUJFQhIZZwPwr6QXxocmbC1FYpGExKA=;
 b=YTwN5WQsNt52pc+y19dW1o/2SJ407WY+kh68sINzXUXyxhcCylgHBz+OmYFDp7nOrjCrHgnut
 mMD/P+eIHSiCesKvovALmOyS//8Bpgc8VhwkENiFkyB32Ho5ErF7eTH
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_090149_360615_B59428D0 
X-CRM114-Status: GOOD (  10.89  )
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
ci4KClJldmlld2VkLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KUmV2aWV3ZWQtYnk6
IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEouIE5l
dXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQoKVjM6Ci0gYWRkIHJldmlldyB0YWdzCgpW
MjoKLSBzcGxpdCBvdXQgZnJvbSBmc2wsZWxiYyBwYXRjaAotIGFkZCBkZXNjcmlwdGlvbgotIHJl
bW92ZSAiZGV2aWNlX3R5cGUiIHByb3BlcnR5Ci0gbW92ZSB0byBiaW5kaW5ncy9tZW1vcnktY29u
dHJvbGxlcnMKLS0tCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2ZzbCxlbGJjLWdwY20tdWlvLnlh
bWwgICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1OSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy1ncGNtLXVpby55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy1ncGNt
LXVpby55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAuLjM4MTU4NGI0MDBhMGFkOThjNmQ5ZTBiMzhmMjg3N2Q0NDYw
M2VkODQKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVtb3J5LWNvbnRyb2xsZXJzL2ZzbCxlbGJjLWdwY20tdWlvLnlhbWwKQEAgLTAsMCArMSw1
OSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMtZ3BjbS11aW8ueWFtbCMKKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogVXNl
cnNwYWNlIEkvTyBpbnRlcmZhY2UgZm9yIEZyZWVzY2FsZSBlTEJDIGRldmljZXMKKworZGVzY3Jp
cHRpb246CisgIFRoZSBGcmVlc2NhbGUgRW5oYW5jZWQgTG9jYWwgQnVzIGNvbnRyb2xsZXIgKGVM
QkMpIHN1cHBvcnRzIGZsZXhpYmxlIGFjY2VzcworICB0byBtZW1vcnkgZGV2aWNlcywgdGhyb3Vn
aCB0aGUgR2VuZXJhbC1QdXJwb3NlIENoaXAtc2VsZWN0IE1hY2hpbmUgKEdQQ00pLgorICBUaGUg
cHVycG9zZSBvZiB0aGlzIGJpbmRpbmcgaXMgdG8gZGVzaWduYXRlIGRldmljZXMgYXR0YWNoZWQg
dG8gZUxCQy9HUE1DIGZvcgorICB1c2UgYnkgdXNlcnNwYWNlLgorCittYWludGFpbmVyczoKKyAg
LSBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgorCitwcm9wZXJ0aWVzOgorICBjb21w
YXRpYmxlOgorICAgIGNvbnN0OiBmc2wsZWxiYy1ncGNtLXVpbworCisgIHJlZzoKKyAgICBtYXhJ
dGVtczogMQorCisgIGVsYmMtZ3BjbS1icjoKKyAgICBkZXNjcmlwdGlvbjogQmFzZSBSZWdpc3Rl
ciAoQlIpIHZhbHVlIHRvIHNldAorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3VpbnQzMgorCisgIGVsYmMtZ3BjbS1vcjoKKyAgICBkZXNjcmlwdGlvbjogT3B0aW9u
IFJlZ2lzdGVyIChPUikgdmFsdWUgdG8gc2V0CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvdWludDMyCisKKyAgaW50ZXJydXB0czoKKyAgICBtYXhJdGVtczogMQor
CisgIHVpb19uYW1lOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3N0cmluZworCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisgIC0gZWxiYy1n
cGNtLWJyCisgIC0gZWxiYy1ncGNtLW9yCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQor
CitleGFtcGxlczoKKyAgLSB8CisgICAgbG9jYWxidXMgeworICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwyPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CisKKyAgICAgICAgc2ltcGxlLXBl
cmlwaEAyLDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsZWxiYy1ncGNtLXVpbyI7
CisgICAgICAgICAgICByZWcgPSA8MHgyIDB4MCAweDEwMDAwPjsKKyAgICAgICAgICAgIGVsYmMt
Z3BjbS1iciA9IDwweGZkODEwODAwPjsKKyAgICAgICAgICAgIGVsYmMtZ3BjbS1vciA9IDwweGZm
ZmYwOWY3PjsKKyAgICAgICAgfTsKKyAgICB9OwoKLS0gCjIuNDguMC5yYzEuMjE5LmdiNmI2NzU3
ZDc3MgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
