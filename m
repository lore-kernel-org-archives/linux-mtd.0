Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E970EC369B7
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Apr 2025 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZTzBrVm+empRG2D+REjezljhmBZJL+/W5W/kihG9Ko=; b=pD3wMiPLcrNeG+
	/ACSguzKcmnjioSiJd1QMy75O24Qb/cEEL2wtB8cmueO/Zyc0n17OssWdDesM7PS2bCHwMekGm+By
	wXtlobDpNRO4TTatxowvqQQ2QPdLZV/2Yygt3kI4lWGKC+QxtJk/1jsMUOE/bfDLebtyBeU4j4o9M
	N8k6DVpQHsjMpD9wEwjBCf+BXsbPqR8qS+oZXCm0b8AZNblHJAe1aP7u4ywwbbrF5AsKhgkhKh8KW
	Kn2fY6bK8OKjCgsU48WVQ9KgibPqiHdWxEeQWaFLErBpnL6nMXdDRmtxFpy8ZFsqnq9ar/zOWMc7G
	jIxE0R2bTU3iEPLsFBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3aia-0000000Fuuv-2kGT;
	Sat, 12 Apr 2025 13:16:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3aiX-0000000Fute-1pBt
	for linux-mtd@lists.infradead.org;
	Sat, 12 Apr 2025 13:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09E0C61139;
	Sat, 12 Apr 2025 13:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B9D0C4CEEA;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744463775;
	bh=2+kp4MaC3RSy6/sDx1Q1zXdxCSyUK7FwxewK8RiuKJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HsP02/6U43ovEE7YZNpxd4S+Iy46KowSxjzf7/qJ0F4D5yVmeKMczPSdyop7JXl9F
	 qRDKgKOcPITEFKlM7F2MfdQb8zFTKfrxdGiz9C7Q/Myr48WEEupx+btJ9ENJ5TU/as
	 2zzkpJPbKLyZCMM7P93ExrfOS/aeQbd3Pak0F7ratZzD7PgtmOBNLal7UdyZW0clTP
	 nIOiUjeQfstjUErvf+90aHzbZzCnYiVEpB1tWWDPcbL9rhTB1B0lPUNZB1A1m8raLr
	 A3nNgdG62FwKhsocyG/rgkJSSgwaCYjwm8PUzETwwIVySblu9+QbW3mvC3m2osEXpL
	 CbnnoleMGyJ5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5FFC369B4;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 12 Apr 2025 15:16:03 +0200
Subject: [PATCH v5 2/4] dt-bindings: memory-controllers: Add
 fsl,elbc-gpcm-uio
MIME-Version: 1.0
Message-Id: <20250412-ppcyaml-elbc-v5-2-03f0e577139f@posteo.net>
References: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
In-Reply-To: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744463772; l=2469;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=htcrsqluVVMG19ijErGFIGHr6stqwWEXgWB5pMjKcH4=;
 b=L7V2ump9A5d9jp4bWUt0KbTAXdOHZ10gydSw7SETGRq77kppg00wUwSeExwU1SUgNZDq+dMcb
 wjIA+Lkd0xSCUgxamvxe+xKf7QJR2M2+MX6KEnMZnE4ylQIuY1dKOJv
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
IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjM4MTU4NGI0MDBhMGFk
OThjNmQ5ZTBiMzhmMjg3N2Q0NDYwM2VkODQKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2ZzbCxlbGJjLWdwY20t
dWlvLnlhbWwKQEAgLTAsMCArMSw1OSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMtZ3BjbS11
aW8ueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29y
ZS55YW1sIworCit0aXRsZTogVXNlcnNwYWNlIEkvTyBpbnRlcmZhY2UgZm9yIEZyZWVzY2FsZSBl
TEJDIGRldmljZXMKKworZGVzY3JpcHRpb246CisgIFRoZSBGcmVlc2NhbGUgRW5oYW5jZWQgTG9j
YWwgQnVzIGNvbnRyb2xsZXIgKGVMQkMpIHN1cHBvcnRzIGZsZXhpYmxlIGFjY2VzcworICB0byBt
ZW1vcnkgZGV2aWNlcywgdGhyb3VnaCB0aGUgR2VuZXJhbC1QdXJwb3NlIENoaXAtc2VsZWN0IE1h
Y2hpbmUgKEdQQ00pLgorICBUaGUgcHVycG9zZSBvZiB0aGlzIGJpbmRpbmcgaXMgdG8gZGVzaWdu
YXRlIGRldmljZXMgYXR0YWNoZWQgdG8gZUxCQy9HUE1DIGZvcgorICB1c2UgYnkgdXNlcnNwYWNl
LgorCittYWludGFpbmVyczoKKyAgLSBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0Pgor
Citwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBmc2wsZWxiYy1ncGNtLXVp
bworCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGVsYmMtZ3BjbS1icjoKKyAgICBkZXNj
cmlwdGlvbjogQmFzZSBSZWdpc3RlciAoQlIpIHZhbHVlIHRvIHNldAorICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorCisgIGVsYmMtZ3BjbS1vcjoKKyAg
ICBkZXNjcmlwdGlvbjogT3B0aW9uIFJlZ2lzdGVyIChPUikgdmFsdWUgdG8gc2V0CisgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCisKKyAgaW50ZXJydXB0
czoKKyAgICBtYXhJdGVtczogMQorCisgIHVpb19uYW1lOgorICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0cmluZworCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxl
CisgIC0gcmVnCisgIC0gZWxiYy1ncGNtLWJyCisgIC0gZWxiYy1ncGNtLW9yCisKK2FkZGl0aW9u
YWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgbG9jYWxidXMgewor
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47
CisKKyAgICAgICAgc2ltcGxlLXBlcmlwaEAyLDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJmc2wsZWxiYy1ncGNtLXVpbyI7CisgICAgICAgICAgICByZWcgPSA8MHgyIDB4MCAweDEwMDAw
PjsKKyAgICAgICAgICAgIGVsYmMtZ3BjbS1iciA9IDwweGZkODEwODAwPjsKKyAgICAgICAgICAg
IGVsYmMtZ3BjbS1vciA9IDwweGZmZmYwOWY3PjsKKyAgICAgICAgfTsKKyAgICB9OwoKLS0gCjIu
NDguMC5yYzEuMjE5LmdiNmI2NzU3ZDc3MgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
