Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96C4C35FF1
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 21:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60Vs6ZM62vY66pV5G7CQbS4OC1/iOlhv7wb/6BljhNQ=; b=rLqnt7ny3qOGVC
	DZ2zBELiCm0V6cf6y17xxoJdbHd0ZR11j3Vk8eidlwmSVjBRobnplAEQGfc/BuemumGZSQ4r6cZuh
	diDWGdVShibPfsJ6eamodhaxCl8qLvTG75aVUKmj6zLtHoOGcGl1IGokF07mwgIY/8k+PviuFTRnO
	QTFeNrqBhWIpjiTFphHulMX+TuZiwzjX9FLDmf7eTL5wy0dary/WQbu/DfU8ni3dNx0ydCfb2NmZN
	BrEPZccyAW+FAnXfGY2Vl8ULivQn2TAlUy3HVO9tfQpMsJGpPOt8vrz0MWi+m/UUvGIHBx1VMfS+Z
	yeEwJVl/PmD7jttv58LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqDa-0000000CX03-1ELj;
	Thu, 13 Mar 2025 21:35:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqDV-0000000CWy0-1Lha
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 21:35:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 451B05C5F50;
	Thu, 13 Mar 2025 21:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50B8EC4CEE5;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741901747;
	bh=6jT7E3dszeoggTWfBvp5Ah7Bk+esnWTVsyo2RUzuXeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lAgXyM8bqhkLfV1VkAiUtvDuwN9EfxEjA44VgoGzD8Qh9aMAaTZv15+KjP/XGL6I+
	 blmU8GiIAlmPQD2CKmWE42tgBfvZEgMYvCpfsCl6ehT+xROnlb6JQtsfxbJMtnj3K1
	 T2KBiaJd7De3zKIbjADB+2TrjrZw4JwpUA9z0W1ObjU26J3gjEwJqrkrkcRgNLKfh/
	 nzMN/PaIErScaA1qk52SEY9jlx0TsMBrWGHASK5y+92FRYklF0akTbjcQhLz5wfYVP
	 G+4IN4xsNwU9h1FpW3H/IV33pWjg+A3YLgndw5Cs/b2n8N79dW/IetTgSU1G43IocU
	 azqKqeNPJasSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF55C35FF6;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 13 Mar 2025 22:35:45 +0100
Subject: [PATCH v4 2/4] dt-bindings: memory-controllers: Add
 fsl,elbc-gpcm-uio
MIME-Version: 1.0
Message-Id: <20250313-ppcyaml-elbc-v4-2-55903722d9ea@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741901745; l=2466;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=GqmRkAlOewBuTl80Xuqu1vck/4Qgv6V5ggfAWvSwWKQ=;
 b=wZeK9XEU61C7ky528WxfxleojI3r9yrM8qUzgijGXLV4l9QQ4TjOLOv5yUDEA4CBKOtuWtlnT
 HTOsyhSE2xTBXvX8GopYmSWIBsRpEmgSPf795+QssgqqpNTNNRkl6Yq
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_143549_445434_6C5CB9D0 
X-CRM114-Status: GOOD (  10.86  )
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
dXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQoKVjQ6Ci0gbm8gY2hhbmdlcwoKVjM6Ci0g
YWRkIHJldmlldyB0YWdzCgpWMjoKLSBzcGxpdCBvdXQgZnJvbSBmc2wsZWxiYyBwYXRjaAotIGFk
ZCBkZXNjcmlwdGlvbgotIHJlbW92ZSAiZGV2aWNlX3R5cGUiIHByb3BlcnR5Ci0gbW92ZSB0byBi
aW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMKLS0tCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Zz
bCxlbGJjLWdwY20tdWlvLnlhbWwgICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy1ncGNtLXVp
by55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9s
bGVycy9mc2wsZWxiYy1ncGNtLXVpby55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjM4MTU4NGI0MDBhMGFkOThj
NmQ5ZTBiMzhmMjg3N2Q0NDYwM2VkODQKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2ZzbCxlbGJjLWdwY20tdWlv
LnlhbWwKQEAgLTAsMCArMSw1OSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMtZ3BjbS11aW8u
eWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIworCit0aXRsZTogVXNlcnNwYWNlIEkvTyBpbnRlcmZhY2UgZm9yIEZyZWVzY2FsZSBlTEJD
IGRldmljZXMKKworZGVzY3JpcHRpb246CisgIFRoZSBGcmVlc2NhbGUgRW5oYW5jZWQgTG9jYWwg
QnVzIGNvbnRyb2xsZXIgKGVMQkMpIHN1cHBvcnRzIGZsZXhpYmxlIGFjY2VzcworICB0byBtZW1v
cnkgZGV2aWNlcywgdGhyb3VnaCB0aGUgR2VuZXJhbC1QdXJwb3NlIENoaXAtc2VsZWN0IE1hY2hp
bmUgKEdQQ00pLgorICBUaGUgcHVycG9zZSBvZiB0aGlzIGJpbmRpbmcgaXMgdG8gZGVzaWduYXRl
IGRldmljZXMgYXR0YWNoZWQgdG8gZUxCQy9HUE1DIGZvcgorICB1c2UgYnkgdXNlcnNwYWNlLgor
CittYWludGFpbmVyczoKKyAgLSBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgorCitw
cm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBmc2wsZWxiYy1ncGNtLXVpbwor
CisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGVsYmMtZ3BjbS1icjoKKyAgICBkZXNjcmlw
dGlvbjogQmFzZSBSZWdpc3RlciAoQlIpIHZhbHVlIHRvIHNldAorICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorCisgIGVsYmMtZ3BjbS1vcjoKKyAgICBk
ZXNjcmlwdGlvbjogT3B0aW9uIFJlZ2lzdGVyIChPUikgdmFsdWUgdG8gc2V0CisgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCisKKyAgaW50ZXJydXB0czoK
KyAgICBtYXhJdGVtczogMQorCisgIHVpb19uYW1lOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3N0cmluZworCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisg
IC0gcmVnCisgIC0gZWxiYy1ncGNtLWJyCisgIC0gZWxiYy1ncGNtLW9yCisKK2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgbG9jYWxidXMgeworICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CisK
KyAgICAgICAgc2ltcGxlLXBlcmlwaEAyLDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJm
c2wsZWxiYy1ncGNtLXVpbyI7CisgICAgICAgICAgICByZWcgPSA8MHgyIDB4MCAweDEwMDAwPjsK
KyAgICAgICAgICAgIGVsYmMtZ3BjbS1iciA9IDwweGZkODEwODAwPjsKKyAgICAgICAgICAgIGVs
YmMtZ3BjbS1vciA9IDwweGZmZmYwOWY3PjsKKyAgICAgICAgfTsKKyAgICB9OwoKLS0gCjIuNDgu
MC5yYzEuMjE5LmdiNmI2NzU3ZDc3MgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
