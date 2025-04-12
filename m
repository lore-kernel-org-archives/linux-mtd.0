Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F99C369B5
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Apr 2025 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zOKVGkApESv8q7miWKksXDDRUxrVQFCNxhKHVTIqEo0=; b=HfmrH89WMmorr1
	gYvgNLTEAxbqHuVMYx6neHQqGzGxwj1YRiVD84guAL/zB1zEMggnXDvwrr2+WWdyHni3n7Z8Yl1FJ
	D0dbkN90oHBG3q78Xddl57n6w3OfRoupLCEcf5z5bbWfb7vmWbCwajXPYlIA4OTbrU8MYTRgKTf0n
	pnVkvR2GIO+fDzFR/v7hVXjh4w4E9Xt4aK1w5GyrL8yWlxSVhgUIhPIKQaSiSGJo1vk2WxJhzvFcB
	BUjrSbVvCIkEKBzw82Ep+6fNG4Fss73385JT/NVnPeFtJecsSSAWRmFBkSeOWonZ2T48P6nOvtDwD
	FvRUxivq9Hz5I5IuZhyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3aic-0000000Fuvu-0RPD;
	Sat, 12 Apr 2025 13:16:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3aiX-0000000Futb-2LWs
	for linux-mtd@lists.infradead.org;
	Sat, 12 Apr 2025 13:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB8AB5C57BF;
	Sat, 12 Apr 2025 13:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 688AFC4CEE3;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744463775;
	bh=ooT2t/4HDi3rmfv8HHUPwediCnOQ2VSqg+dxjAIoQhg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=m6KoERnmQRTnT6xlveWbaJaIFNSpG0ku5DPDSID2PVeZQCApVmd4dufC4AZvzwZBo
	 rm7OAjgXJZuWM77c2WfCRSXP4727I7Iy477WxRh9FY+cu7N5k6Y3B5HwAoISbl6LX1
	 zoscBCeZqdKTMgh5q6cUfwRr/60r5giKZgfB3RTzx1yyZ+T0I24cEaJ18B//+1ElKa
	 xcqXodYXSJ1kUbD8CtLUhRNYMJHEZIL13mfMuLzaQi24P8L5tOdlVY3bp35EdLFNOM
	 4QkcpE7t+2te6tzl1YgFF1vEN93eopLuoqtUO1xKNFsRvPqROOzb/kh6seMIYnPSRd
	 jlRg4YgLHfjHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D569C369AE;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v5 0/4] Freescale Enhanced Local Bus Controller (eLBC)
 binding YAML conversion
Date: Sat, 12 Apr 2025 15:16:01 +0200
Message-Id: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJJn+mcC/12M0QqDIBhGXyX+6zlMc+Wu9h5jF5p/S2gpGrKI3
 n0WjNEuz/dxzgIRg8UI12KBgMlG68YM4lRA26vxicSazMAoE5QxSrxvZ/UaCA66JVo3QlZlp/M
 JWfEBO/vec/dH5t7GyYV5rye+rd/Q5RhKnFCiJEVTl0Y1vLl5Fyd05xEn2Eqp+tm85H92lW0hJ
 OU1Y0aiOtjrun4A3zenyecAAAA=
X-Change-ID: 20250220-ppcyaml-elbc-bb85941fb250
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744463772; l=2344;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=ooT2t/4HDi3rmfv8HHUPwediCnOQ2VSqg+dxjAIoQhg=;
 b=l8PaOuZLZFLI6LwsdeDccOzUR5+w3wL0myBNaBkGAkjCETbCBt7yiXeoObNwacrPSy2z+vcwW
 DeL3eMq8UnHAa+kP3OoEG0MKsMRHNlchAXiL/mnJA48QconA9bwH2yb
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_061617_711484_47285EA8 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
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

VGhpcyBzZXJpZXMgY29udmVydHMgdGhlIGZzbCxlbGJjIGJpbmRpbmcgdG8gWUFNTCBhbmQgYWRk
cyBuZXcgYmluZGluZ3MKZm9yIHJlbGF0ZWQgZGV2aWNlcyAocGFydGljdWxhciBraW5kcyBvZiBj
aGlwIG9uIHRoZSBlTEJDKS4KCkZvciByZWFkYWJpbGl0eSwgdGhlIGV4aXN0aW5nIHVuaXQgYWRk
cmVzcyBzeW50YXggb2YgPGNzPiw8b2Zmc2V0PgooZS5nLiBuYW5kQDEsMCkgaXMga2VwdC4gVGhp
cyByZXN1bHRzIGluIGEgZmV3IGR0YyB2YWxpZGF0aW9uIHdhcm5pbmdzLAp3aGVuIGNvbWJpbmVk
IHdpdGggb3RoZXIgY2hvaWNlcyBpbiB0aGlzIHBhdGNoc2V0OgoKLSBGb3IgY29tcGF0aWJpbGl0
eSB3aXRoIGV4aXN0aW5nIGtlcm5lbHMgd2hpY2ggZG9uJ3QgZXhwbGljaXRseSBwcm9iZQogIHVu
ZGVyIGFuIGVMQkMgY29udHJvbGxlciwgdGhlICJzaW1wbGUtYnVzIiBjb21wYXRpYmxlIHN0cmlu
ZyBpcyBrZXB0CiAgb24gZUxCQyBjb250cm9sbGVyIG5vZGVzLiBUaGUgdmFsaWRhdGlvbiBsb2dp
YyByZXF1aXJlcyBhIGxpbmVhciB1bml0CiAgYWRkcmVzcywgdGhvdWdoIChlLmcuIEAxMDAwMDAw
MDAgaW5zdGVhZCBvZiBAMSwwKQoKVGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgd2VyZSBwcmV2
aW91c2x5IHBhcnQgb2YgdGhlIGZvbGxvd2luZyBzZXJpZXMsCndoaWNoIHR1cm5lZCBvdXQgdG8g
YmUgdG9vIGxhcmdlIGFuZCB1bndpZWxkeToKW1BBVENIIHYyIDAwLzEyXSBZQU1MIGNvbnZlcnNp
b24gb2Ygc2V2ZXJhbCBGcmVlc2NhbGUvUG93ZXJQQyBEVCBiaW5kaW5ncwpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sLzIwMjUwMjA3LXBwY3lhbWwtdjItMC04MTM3YjBjNDI1MjZAcG9zdGVv
Lm5ldC8KCkNoYW5nZWxvZ3MgYXJlIHByZXNlbnQgaW4gdGhlIGluZGl2aWR1YWwgcGF0Y2hlcy4K
ClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQpDaGFu
Z2VzIGluIHY1OgotIFJlYmFzZSBvbiB2Ni4xNS1yYzEKLSBBZGQgUm9iIEhlcnJpbmcncyByZXZp
ZXdlZC1ieSB0YWdzIHRvIHBhdGNoZXMgMSwzCi0gRml4IGRvY3VtZW50YXRpb24gcmVmZXJlbmNl
IGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3NzZDEyODlmYi50
eHQKLSBMaW5rIHRvIHY0OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMzEzLXBwY3lh
bWwtZWxiYy12NC0wLTU1OTAzNzIyZDllYUBwb3N0ZW8ubmV0CgpDaGFuZ2VzIGluIHY0OgotIFJl
aW50cm9kdWNlIHBhdGNoICJkdC1iaW5kaW5nczogbXRkOiByYXctbmFuZC1jaGlwOiBSZWxheCBu
b2RlIG5hbWUgcGF0dGVybiIKLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjUwMjI2LXBwY3lhbWwtZWxiYy12My0wLWE5MGVkNzFkYTgzOEBwb3N0ZW8ubmV0CgotLS0K
Si4gTmV1c2Now6RmZXIgKDQpOgogICAgICBkdC1iaW5kaW5nczogbXRkOiByYXctbmFuZC1jaGlw
OiBSZWxheCBub2RlIG5hbWUgcGF0dGVybgogICAgICBkdC1iaW5kaW5nczogbWVtb3J5LWNvbnRy
b2xsZXJzOiBBZGQgZnNsLGVsYmMtZ3BjbS11aW8KICAgICAgZHQtYmluZGluZ3M6IG5hbmQ6IEFk
ZCBmc2wsZWxiYy1mY20tbmFuZAogICAgICBkdC1iaW5kaW5nczogbWVtb3J5LWNvbnRyb2xsZXJz
OiBDb252ZXJ0IGZzbCxlbGJjIHRvIFlBTUwKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3NzZDEyODlmYi50eHQgICAgICB8ICAgMiArLQogLi4uL21lbW9yeS1jb250cm9sbGVycy9m
c2wsZWxiYy1ncGNtLXVpby55YW1sICAgICAgfCAgNTkgKysrKysrKysKIC4uLi9iaW5kaW5ncy9t
ZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMueWFtbCAgICAgIHwgMTU4ICsrKysrKysrKysrKysr
KysrKysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlh
bWwgfCAgNjggKysrKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmF3LW5hbmQt
Y2hpcC55YW1sICAgICB8ICAgMiArLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9m
c2wvbGJjLnR4dCAgICAgICAgfCAgNDMgLS0tLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDI4NyBpbnNl
cnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiAwYWYyZjZiZTFiNDI4
MTM4NWI2MThjYjg2YWQ5NDZlZGVkMDg5YWM4CmNoYW5nZS1pZDogMjAyNTAyMjAtcHBjeWFtbC1l
bGJjLWJiODU5NDFmYjI1MAoKQmVzdCByZWdhcmRzLAotLSAKSi4gTmV1c2Now6RmZXIgPGoubmVA
cG9zdGVvLm5ldD4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
