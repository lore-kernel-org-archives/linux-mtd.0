Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D69EED632
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jan 2026 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3ukwk9QCHoZUe/xkpFGJws8ji25zdrsfrjMj+Wp+tw=; b=Vgf3wnfDZnZzHb
	OYEDX+pflIF9hQC3ph1u/aIak82baAxXm8ughNAFncb4Gp8XxXSWtoOO6EgjfSnR3zvbGoZYSD/QZ
	CzLSKytMkb7JZDm50Fvyvb2FLzgLQrHHnmG2QhU6nphmQTA7e2NK1LNN7N/JnA8McQ0KVqqTiQkgt
	Tp0IDb8BjzTLkwcUsYCf/7m9UUHEqWD/XNJDY7YBa5335LwZddNkM6ZFSgqkXMUNvM8vL1rdcnM2m
	8/QOdYqHAG55R6F2SW7grDyF4qaR5wWOKo7pnAKQaxj8LIKf3H7egaaQvtq/+9WF4BWtrQzcPspLV
	4cVTlZ14sT/wvSWrQokw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbM0V-00000007MeZ-1Kih;
	Thu, 01 Jan 2026 16:58:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbM0R-00000007Mcl-2ef4
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jan 2026 16:58:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FD13444A7;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41A81C19425;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767286714;
	bh=fhmXssxhBNlCs0zh665Iq7qcZvHEm5U2VwJCLG+fhOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NpxoI6AFE7kLkmSBoCwK26CHexySuOrJKR+dVdyE0YHTUfsgUQFwjaceY6iS0T9Lv
	 jEMXQ/MIqgy1wHk4XQjXzYQg3WSL19xZiZ61p0SSbm4tGgQRhEWGV3VCqd5ZEcOWCC
	 JosjlEQndd+yED0b0jng08vaaBlM2aUy0Ep69Kugci+pbZi6iwrYnyLRVigPEAXa9L
	 OIf1Wo0mUEfa6q1Ka8F966mcKPvcKLotOhGKG8FYKnS4Koo8qkO0PS4KtiYcr2Wggp
	 1F3dOpHbKn/2kLmtr2G6/a0bXEBuUghj71PvUYcywns0HLba8YlhKfxGg7CREMUT9P
	 PAaNlZMIJiBig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C7DEED615;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 01 Jan 2026 17:58:16 +0100
Subject: [PATCH RESEND v5 3/4] dt-bindings: nand: Add fsl,elbc-fcm-nand
MIME-Version: 1.0
Message-Id: <20260101-ppcyaml-elbc-v5-3-251c7f14a06c@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767286712; l=3367;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=QLdf9vLAXUAKvlErg2D/OT+8iVdmJRWqWNiQX6ZbXMY=;
 b=M4Yy3BAUp003UUKWu2YOyhNmNNjOIDDEHTrRPnlEj2dNw3ersdrWm+wtRSPfmVQBoQH2rEu4N
 KUjO0tg9YwEDyLNQt+HXjdCC3OoJ8bh7q6o07l1P9OmC6b8r2m5EB26
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_085835_716506_CCB86747 
X-CRM114-Status: GOOD (  15.25  )
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
Cgl9OwoKUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgpSZXZpZXdlZC1i
eTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSi4g
TmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KLS0tCgpWNToKLSBhZGQgUm9iJ3MgcmV2aWV3
IHRhZwoKVjQ6Ci0gbm8gY2hhbmdlcwoKVjM6Ci0gcmVtb3ZlIHVubmVjZXNzYXJ5ICNhZGRyZXNz
L3NpemUtY2VsbHMgZnJvbSBuYW5kIG5vZGUgaW4gZXhhbXBsZQotIGFkZCBGcmFuayBMaSdzIHJl
dmlldyB0YWcKLSBhZGQgbWlzc2luZyBlbmQgb2YgZG9jdW1lbnQgbWFya2VyICguLi4pCi0gZXhw
bGFpbiBjaG9pY2UgdG8gcmVmZXJlbmNlIHJhdy1uYW5kLWNoaXAueWFtbAoKVjI6Ci0gc3BsaXQg
b3V0IGZyb20gZnNsLGVsYmMgYmluZGluZyBwYXRjaAotIGNvbnN0cmFpbiAjYWRkcmVzcy1jZWxs
cyBhbmQgI3NpemUtY2VsbHMKLSBhZGQgYSBnZW5lcmFsIGRlc2NyaXB0aW9uCi0gdXNlIHVuZXZh
bHVhdGVkUHJvcGVydGllcz1mYWxzZSBpbnN0ZWFkIG9mIGFkZGl0aW9uYWxQcm9wZXJ0aWVzPWZh
bHNlCi0gZml4IHByb3BlcnR5IG9yZGVyIHRvIGNvbXBseSB3aXRoIGR0cyBjb2Rpbmcgc3R5bGUK
LSBpbmNsdWRlIHJhdy1uYW5kLWNoaXAueWFtbCBpbnN0ZWFkIG9mIG5hbmQtY2hpcC55YW1sCi0t
LQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwgfCA2
OCArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZnNs
LGVsYmMtZmNtLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvZnNsLGVsYmMtZmNtLW5hbmQueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAwMC4uOTFlOGYyZjlmZjI2ZGEKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwKQEAgLTAs
MCArMSw2OCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9tdGQvZnNsLGVsYmMtZmNtLW5hbmQueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogTkFORCBmbGFzaCBh
dHRhY2hlZCB0byBGcmVlc2NhbGUgZUxCQworCitkZXNjcmlwdGlvbjoKKyAgVGhlIEZyZWVzY2Fs
ZSBFbmhhbmNlZCBMb2NhbCBCdXMgY29udHJvbGxlciAoZUxCQykgY29udGFpbnMgbG9naWMgdG8K
KyAgaW50ZXJmYWNlIHdpdGggTkFORCBmbGFzaCwgY2FsbGVkIHRoZSBOQU5EIEZsYXNoIENvbnRy
b2wgTWFjaGluZSAoRkNNKS4KKyAgVGhpcyBiaW5kaW5nIGRlc2NyaWJlcyBmbGFzaCBhdHRhY2hl
ZCB0byBhbiBlTEJDIHVzaW5nIHRoZSBGQ00uCisKK21haW50YWluZXJzOgorICAtIEouIE5ldXNj
aMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+CisKK2FsbE9mOgorICAtICRyZWY6IHJhdy1uYW5kLWNo
aXAueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAg
IC0gaXRlbXM6CisgICAgICAgICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGZzbCxtcGM4MzEz
LWZjbS1uYW5kCisgICAgICAgICAgICAgIC0gZnNsLG1wYzgzMTUtZmNtLW5hbmQKKyAgICAgICAg
ICAgICAgLSBmc2wsbXBjODM3Ny1mY20tbmFuZAorICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc4
LWZjbS1uYW5kCisgICAgICAgICAgICAgIC0gZnNsLG1wYzgzNzktZmNtLW5hbmQKKyAgICAgICAg
ICAgICAgLSBmc2wsbXBjODUzNi1mY20tbmFuZAorICAgICAgICAgICAgICAtIGZzbCxtcGM4NTY5
LWZjbS1uYW5kCisgICAgICAgICAgICAgIC0gZnNsLG1wYzg1NzItZmNtLW5hbmQKKyAgICAgICAg
ICAgICAgLSBmc2wscDEwMjAtZmNtLW5hbmQKKyAgICAgICAgICAgICAgLSBmc2wscDEwMjEtZmNt
LW5hbmQKKyAgICAgICAgICAgICAgLSBmc2wscDEwMjUtZmNtLW5hbmQKKyAgICAgICAgICAgICAg
LSBmc2wscDIwMjAtZmNtLW5hbmQKKyAgICAgICAgICAtIGNvbnN0OiBmc2wsZWxiYy1mY20tbmFu
ZAorICAgICAgLSBjb25zdDogZnNsLGVsYmMtZmNtLW5hbmQKKworICByZWc6CisgICAgbWF4SXRl
bXM6IDEKKworICAiI2FkZHJlc3MtY2VsbHMiOgorICAgIGNvbnN0OiAxCisKKyAgIiNzaXplLWNl
bGxzIjoKKyAgICBjb25zdDogMQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVn
CisKK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAg
IGxvY2FsYnVzIHsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47CisgICAgICAgICNzaXpl
LWNlbGxzID0gPDE+OworCisgICAgICAgIG5hbmRAMSwwIHsKKyAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiZnNsLG1wYzgzMTUtZmNtLW5hbmQiLAorICAgICAgICAgICAgICAgICAgICAgICAgICJm
c2wsZWxiYy1mY20tbmFuZCI7CisgICAgICAgICAgICByZWcgPSA8MHgxIDB4MCAweDIwMDA+Owor
ICAgICAgICB9OworICAgIH07CisKKy4uLgoKLS0gCjIuNTEuMAoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
