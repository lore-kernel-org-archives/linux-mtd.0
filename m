Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0F4EED630
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jan 2026 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0esJA3N/eRqqf5apQb9j991EFJcKh55Ed2PToe2k9dY=; b=ZT93QwX/P/b0Fp
	25jrYc4pdzGjwZbc/6DzyLYbD2UPwqZHUQmJebbm3LvZiurU9uGFmzrwlkK2+S1/kkBPFDmrHulD+
	XN3+BMhVqs9Gp54K07rNkMGO903zv7daOXcRn4Rp9jsyGsY0tqf1OISWbRohm4USJ+TmFsRV0dJmq
	tgdUtJ3lDXWx0bUY4ckmSVMa9Ktv8jfKxLG8wULbLmFP6WJQPVejavj4RGyoK3NXsek8GC8GZpeUw
	9XsKWyTpSQcnJvFsW25dHxVAI7MzT7X+nKsB6ycXq+KCn9ZN6Pt4bwp+QSH0UFFq1T/giXV3T37Se
	XWLfw3ZnGhmj/dodHgXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbM0V-00000007Mej-2XIq;
	Thu, 01 Jan 2026 16:58:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbM0R-00000007Mcn-31dL
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jan 2026 16:58:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FD22444AB;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39D17C16AAE;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767286714;
	bh=Q9LLHnvTxiDMFvAfLdjpxxShPJnvDv5Otm4KvImTOx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YdzdoozZ7gZDIqBuUmTQ4wt1jPil4F/I1uQcfpGwWA99opcezPzb5IyTjiiuuECxj
	 3e2nS82OyrRmyllMdqyeYfl7g1nglwwWeJZiZWC5Wo38HlDGchh69UUjEVAJoWzq3r
	 EgO5IfWlAS0KOpS6cFA8tATnnfDaa8kiFk+c7DFZCItk3DW0wfEeNV//rFnux4d/lR
	 0cIiRR7kf57YQ74SyQewQDFm7fiFqffBvDQ/VVZVCr8bIjtkWJCS5UUgJqn1buQb/N
	 9nTznv6wqUN29L1Dzsv3MqF952AnDnsB0BNkCpUbOJFQb9iyv2AaIgKi7Ome19CuAv
	 ezyE0cIG8AZiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25668EED628;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 01 Jan 2026 17:58:15 +0100
Subject: [PATCH RESEND v5 2/4] dt-bindings: memory-controllers: Add
 fsl,elbc-gpcm-uio
MIME-Version: 1.0
Message-Id: <20260101-ppcyaml-elbc-v5-2-251c7f14a06c@posteo.net>
References: <20260101-ppcyaml-elbc-v5-0-251c7f14a06c@posteo.net>
In-Reply-To: <20260101-ppcyaml-elbc-v5-0-251c7f14a06c@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Naveen N Rao <naveen@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Christophe Leroy <chleroy@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767286712; l=2396;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=bUAGbzS6p74FR6LkzbFgL5RNEAyIuDnK2zSEZn2z+XU=;
 b=2ApK1JqrIreJZ2Rl3uI4oev0BN99TTYjK1Vd/Ao9Xn5xZp5RnvxYNhV6Mpu/MblJzAYcs/61d
 ORSF2ZcDNHQD2nkrLDlFoK+inZAJcRp8ureEo9DLeANwi0lI531kXNM
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_085835_800691_31C18E82 
X-CRM114-Status: GOOD (  11.97  )
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
dXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQoKVjQsVjU6Ci0gbm8gY2hhbmdlcwoKVjM6
Ci0gYWRkIHJldmlldyB0YWdzCgpWMjoKLSBzcGxpdCBvdXQgZnJvbSBmc2wsZWxiYyBwYXRjaAot
IGFkZCBkZXNjcmlwdGlvbgotIHJlbW92ZSAiZGV2aWNlX3R5cGUiIHByb3BlcnR5Ci0gbW92ZSB0
byBiaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMKLS0tCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJz
L2ZzbCxlbGJjLWdwY20tdWlvLnlhbWwgICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy1ncGNt
LXVpby55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250
cm9sbGVycy9mc2wsZWxiYy1ncGNtLXVpby55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMDAwLi4zODE1ODRiNDAwYTBhZAotLS0gL2Rldi9udWxsCisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMt
Z3BjbS11aW8ueWFtbApAQCAtMCwwICsxLDU5IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy1n
cGNtLXVpby55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjCisKK3RpdGxlOiBVc2Vyc3BhY2UgSS9PIGludGVyZmFjZSBmb3IgRnJlZXNj
YWxlIGVMQkMgZGV2aWNlcworCitkZXNjcmlwdGlvbjoKKyAgVGhlIEZyZWVzY2FsZSBFbmhhbmNl
ZCBMb2NhbCBCdXMgY29udHJvbGxlciAoZUxCQykgc3VwcG9ydHMgZmxleGlibGUgYWNjZXNzCisg
IHRvIG1lbW9yeSBkZXZpY2VzLCB0aHJvdWdoIHRoZSBHZW5lcmFsLVB1cnBvc2UgQ2hpcC1zZWxl
Y3QgTWFjaGluZSAoR1BDTSkuCisgIFRoZSBwdXJwb3NlIG9mIHRoaXMgYmluZGluZyBpcyB0byBk
ZXNpZ25hdGUgZGV2aWNlcyBhdHRhY2hlZCB0byBlTEJDL0dQTUMgZm9yCisgIHVzZSBieSB1c2Vy
c3BhY2UuCisKK21haW50YWluZXJzOgorICAtIEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5u
ZXQ+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGZzbCxlbGJjLWdw
Y20tdWlvCisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgZWxiYy1ncGNtLWJyOgorICAg
IGRlc2NyaXB0aW9uOiBCYXNlIFJlZ2lzdGVyIChCUikgdmFsdWUgdG8gc2V0CisgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCisKKyAgZWxiYy1ncGNtLW9y
OgorICAgIGRlc2NyaXB0aW9uOiBPcHRpb24gUmVnaXN0ZXIgKE9SKSB2YWx1ZSB0byBzZXQKKyAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKworICBpbnRl
cnJ1cHRzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgdWlvX25hbWU6CisgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvc3RyaW5nCisKK3JlcXVpcmVkOgorICAtIGNvbXBh
dGlibGUKKyAgLSByZWcKKyAgLSBlbGJjLWdwY20tYnIKKyAgLSBlbGJjLWdwY20tb3IKKworYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBsb2NhbGJ1
cyB7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+OworICAgICAgICAjc2l6ZS1jZWxscyA9
IDwxPjsKKworICAgICAgICBzaW1wbGUtcGVyaXBoQDIsMCB7CisgICAgICAgICAgICBjb21wYXRp
YmxlID0gImZzbCxlbGJjLWdwY20tdWlvIjsKKyAgICAgICAgICAgIHJlZyA9IDwweDIgMHgwIDB4
MTAwMDA+OworICAgICAgICAgICAgZWxiYy1ncGNtLWJyID0gPDB4ZmQ4MTA4MDA+OworICAgICAg
ICAgICAgZWxiYy1ncGNtLW9yID0gPDB4ZmZmZjA5Zjc+OworICAgICAgICB9OworICAgIH07Cgot
LSAKMi41MS4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
