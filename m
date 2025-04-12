Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AD2C369B8
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Apr 2025 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CshAxzM5vFMv6KbAyuxbRrlZLkfI94oqomgbX7w+S3s=; b=ZcIRoxmxQ1ERlh
	qf/lrgNSeT0rSINAiUErrUxSOAnZ+xc7ovRvBm8nzQHDDvLBdSB562bZdNC9KjfaNcJcFfcfyBs6P
	dZjoA3ItcbYviDouNr6dXs1q60krf0C+u5/TzZDWTM28gFvdkpD1QFSGrDQLgAvk48kMpyyubHuMC
	VRX44x9ix0QnFViAHA+vrkCVRxx6TY/eOWrc9k8g5Vlv7mnk1BJltFru+oFH4mZcb7AJR/rzyV3r9
	8XPZwYHglEgHkbhdWWkDSFNqs4t+OgM8IAFU/kqBRO798k0z0U0mdriHknlTh0AWlM96pr1554WXd
	lPD7NL+mPusHz1LCwS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3aic-0000000Fuw7-2Xiv;
	Sat, 12 Apr 2025 13:16:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3aiX-0000000Futc-36Te
	for linux-mtd@lists.infradead.org;
	Sat, 12 Apr 2025 13:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D90CA40A2D;
	Sat, 12 Apr 2025 13:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F0A6C4CEE9;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744463775;
	bh=sDmeVGHitZSfQDaX8FV1eo5UbMMDoWgDE63yAq2budU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lJdk0iiBGm6tynEY/QosWaZy2cBbcR1A9W3CRDwkijjCww7XwEOhQ0pa5zG4P4pus
	 fman/cYhBfXIH+0eqzLeRLLl5bDUQ4Al/qDDvX7iqSKLmXNSp60U7wysjjYf/UKwHq
	 Xv/eKlP3z3MdEKHfFsUVinlxmO6qlcXA6OG4LafZdK0n3w24DYhk/SYoRJKo4G0DJ8
	 gVv096PrSryfZnsJFmYRBUshGdYT+UDABnz5yoACMiTVAhNH2H/68Fxv2WKmN0R6dE
	 R2QQlX62MMoq0ChBLlhDvjcdhKjv3x0yrYN7TM/8haPjX3Vl8FpGtv2xg9YybDhNBo
	 rpG14Vn1+ivoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682E9C369B2;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 12 Apr 2025 15:16:02 +0200
Subject: [PATCH v5 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
MIME-Version: 1.0
Message-Id: <20250412-ppcyaml-elbc-v5-1-03f0e577139f@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744463772; l=1564;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=pxFM9O27wqy9fcJew44o1PX/qgcWx5g0CLREATU2JSs=;
 b=QPWzJKXuu2pDA7ddayiQm8050PDpnlNu5Ss5jLRmkr8q7le4OSnoDHRIDwwDewQpf0ccFnNtR
 h9QIpWTh3OqCqs2AqSBvTctWleweoYhYidrpUvvP7tbiqTlD7sJO2wA
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_061617_913707_A708744B 
X-CRM114-Status: GOOD (  10.71  )
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

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKSW4gc29tZSBzY2VuYXJp
b3MsIHN1Y2ggYXMgdW5kZXIgdGhlIEZyZWVzY2FsZSBlTEJDIGJ1cywgdGhlcmUgYXJlIHJhdwpO
QU5EIGNoaXBzIHdpdGggYSB1bml0IGFkZHJlc3MgdGhhdCBoYXMgYSBjb21tYSBpbiBpdCAoY3Ms
b2Zmc2V0KS4KRm9yIHJlYXNvbnMgb2YgY29tcGF0aWJpbGl0eSB3aXRoIGhpc3RvcmljYWwgZGV2
aWNlIHRyZWVzIGFuZApyZWFkYWJpbGl0eSBvZiB0aGUgdW5pdCBhZGRyZXNzZXMsIHRoaXMgZm9y
bWF0IGlzIGtlcHQuCgpSZWxheCB0aGUgJG5vZGVuYW1lIHBhdHRlcm4gaW4gcmF3LW5hbmQtY2hp
cC55YW1sIHRvIGFsbG93IHN1Y2ggdW5pdAphZGRyZXNzZXMuIFVuZm9ydHVuYXRlbHkgJG5vbmVu
YW1lcyBkZWZpbmVkIGluIGJpbmRpbmdzIHRoYXQgcmVmZXJlbmNlCnJhdy1uYW5kCgpSZXZpZXdl
ZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTog
Si4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KLS0tCgpWNToKLSBBZGQgUm9iJ3MgcmV2
aWV3IHRhZwoKVjQ6Ci0gcmVpbnRyb2R1Y2UgcGF0Y2ggdG8gc2lsZW5jZSBkdGMgdmFsaWRhdGlv
biBlcnJvciwgYWZ0ZXIgZGlzY3Vzc2lvbgogIHdpdGggUm9iIEhlcnJpbmcgYW5kIE1pcXXDqGwg
UmF5bmFsCi0gYWRkIHNvbWUgbW9yZSBkZXRhaWwgdG8gdGhlIGNvbW1pdCBtZXNzYWdlCi0gcmVt
b3ZlIHVuaXQgYWRkcmVzcyBmb3JtYXQgcmF0aGVyIHRoYW4gZXh0ZW5kaW5nIGl0CiAgKG9sZCBw
YXR0ZXJuOiAiXm5hbmRAW2EtZjAtOV0oLFswLTlhLWZdKik/JCIpCgpWMzoKLSByZW1vdmUgcGF0
Y2ggYWZ0ZXIgZGlzY3Vzc2lvbiB3aXRoIE1pcXXDqGwgUmF5bmFsCgpWMjoKLSBuZXcgcGF0Y2gK
LS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Jhdy1uYW5kLWNoaXAu
eWFtbCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmF3
LW5hbmQtY2hpcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9y
YXctbmFuZC1jaGlwLnlhbWwKaW5kZXggMDkyNDQ4ZDdiZmM1Y2NkMjQ2Y2E0YjIzNDE0NjRlMTg3
MjJhMmQ1MS4uZDY1NWY2NjczZmMzMWIxZDllZTdjZDczNGNiZTFkMzEwZjg4MDkwYiAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9yYXctbmFuZC1jaGlw
LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9yYXctbmFu
ZC1jaGlwLnlhbWwKQEAgLTI1LDcgKzI1LDcgQEAgZGVzY3JpcHRpb246IHwKIAogcHJvcGVydGll
czoKICAgJG5vZGVuYW1lOgotICAgIHBhdHRlcm46ICJebmFuZEBbYS1mMC05XSQiCisgICAgcGF0
dGVybjogIl5uYW5kQCIKIAogICByZWc6CiAgICAgZGVzY3JpcHRpb246CgotLSAKMi40OC4wLnJj
MS4yMTkuZ2I2YjY3NTdkNzcyCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
