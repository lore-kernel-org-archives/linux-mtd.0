Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D142CC3DA4A
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 17:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/KXxx3dWvVW+HGeEdty+WUV3p5d77wztkV22eZcEgek=; b=WDHjTCdEZsKnE1
	oy5Sm6x/5lycu7+GqKfBxmWlGr56OWbt/XSdR/KmhaU3gr5+xC2DFdzpo/MfyP5n4EYoXcdFMKnDQ
	D/fujN+QgMEsWhw9bME3+CoiIhsuEb3ZknIeW10brvY7qUzBmjIYSW8d2nq2483MDsz33Z6X86FW1
	/gkBUiV2pYdhEhLikM+fdVuXzFbZ7dz6AfOWYcYbBPoezyB5h4WIiTZfk5l60/m8Jj/PAqVFEOcrw
	KACnqYMaucK+qXVPCrgFJ9oGP0/O5ogzKMdM65zy5hYtvWw9w9awPxk2VlDq1ePADHsADexLn/tU9
	ho9jWAj/77x8Do90b8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKwe-00000004epc-06yD;
	Wed, 26 Feb 2025 17:11:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKn6-00000004chv-4AaQ
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 17:01:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 105E45C4E46;
	Wed, 26 Feb 2025 17:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89349C4CED6;
	Wed, 26 Feb 2025 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740589307;
	bh=R5tzNYvtjhOaDyxzJC0f6+X4b3pNjCCckOHTIvF9CVA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lddC6Qx1vkIXMTeR3YILpyu/xvH3kvlmnJnELovtHG/P9DT+OpGOp6/r83cboztdY
	 Q2MQcWD26gsTDQ/E8IGcmtNfhYSbGsg4KtPh8vg5PxIN38F+9bGvmNDvOVeOxLtHph
	 E9qn+KYWNZI/TAA/71UYdJJYdhi18Y5MAo4ibPnKZDRRQnidA/gFXf1OOl/ktcUHwp
	 S8cyvl+4aAeKMQLFk0czpqvdXwr4V71nlNwGJwvP2CsylaYgE8cb9OPcv5WU0R5fXI
	 qFnJII17Yph0mBVTV27Hd43ijcGa4U4xUvSjreMZ4Mj0wQY+I5zZiH1LuuOW4RUUg4
	 AUJ+kEy9qdEqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F33C021B8;
	Wed, 26 Feb 2025 17:01:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v3 0/3] Freescale Enhanced Local Bus Controller (eLBC)
 binding YAML conversion
Date: Wed, 26 Feb 2025 18:01:39 +0100
Message-Id: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPNIv2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3YKC5MrE3Bzd1JykZN2kJAtTSxPDtCSgpBJQS0FRalpmBdi46Nj
 aWgAMf7h7XgAAAA==
X-Change-ID: 20250220-ppcyaml-elbc-bb85941fb250
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740589304; l=1815;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=R5tzNYvtjhOaDyxzJC0f6+X4b3pNjCCckOHTIvF9CVA=;
 b=0qKDVcRkFGxCn+NY56CjSspN6QlXp1cLjAOYBuEWa1S1LDEyjDaRCQQz+qML97HvBVtxAhApo
 xKOFpwBpbV8AI8ySIhJklM26eF7se02o22WNERJs3oyIt8wMqvbSs2p
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_090149_145036_F373423B 
X-CRM114-Status: UNSURE (   6.74  )
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
MDAgaW5zdGVhZCBvZiBAMSwwKQoKLSBUaGUgZUxCQyBOQU5EIGZsYXNoIGJpbmRpbmcgKGZzbCxl
bGJjLWZjbS1uYW5kKSByZWZlcmVuY2VzCiAgcmF3LW5hbmQtY2hpcC55YW1sLCB3aGljaCBhZ2Fp
biByZXF1aXJlcyBhIGxpbmVhciB1bml0IGFkZHJlc3MKClRoZSBwYXRjaGVzIGluIHRoaXMgc2Vy
aWVzIHdlcmUgcHJldmlvdXNseSBwYXJ0IG9mIHRoZSBmb2xsb3dpbmcgc2VyaWVzLAp3aGljaCB0
dXJuZWQgb3V0IHRvIGJlIHRvbyBsYXJnZSBhbmQgdW53aWVsZHk6CltQQVRDSCB2MiAwMC8xMl0g
WUFNTCBjb252ZXJzaW9uIG9mIHNldmVyYWwgRnJlZXNjYWxlL1Bvd2VyUEMgRFQgYmluZGluZ3MK
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDIwNy1wcGN5YW1sLXYyLTAtODEzN2Iw
YzQyNTI2QHBvc3Rlby5uZXQvCgpDaGFuZ2Vsb2dzIGFyZSBwcmVzZW50IGluIHRoZSBpbmRpdmlk
dWFsIHBhdGNoZXMuCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8u
bmV0PgotLS0KSi4gTmV1c2Now6RmZXIgKDMpOgogICAgICBkdC1iaW5kaW5nczogbWVtb3J5LWNv
bnRyb2xsZXJzOiBBZGQgZnNsLGVsYmMtZ3BjbS11aW8KICAgICAgZHQtYmluZGluZ3M6IG5hbmQ6
IEFkZCBmc2wsZWxiYy1mY20tbmFuZAogICAgICBkdC1iaW5kaW5nczogbWVtb3J5LWNvbnRyb2xs
ZXJzOiBDb252ZXJ0IGZzbCxlbGJjIHRvIFlBTUwKCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Zz
bCxlbGJjLWdwY20tdWlvLnlhbWwgICAgICB8ICA1OSArKysrKysrKwogLi4uL2JpbmRpbmdzL21l
bW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy55YW1sICAgICAgfCAxNTggKysrKysrKysrKysrKysr
KysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZnNsLGVsYmMtZmNtLW5hbmQueWFt
bCB8ICA2OCArKysrKysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2xi
Yy50eHQgICAgICAgIHwgIDQzIC0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyODUgaW5zZXJ0aW9u
cygrKSwgNDMgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogMjAxNGM5NWFmZWNlZTNlNzZj
YTRhNTY5NTZhOTM2ZTIzMjgzZjA1YgpjaGFuZ2UtaWQ6IDIwMjUwMjIwLXBwY3lhbWwtZWxiYy1i
Yjg1OTQxZmIyNTAKCkJlc3QgcmVnYXJkcywKLS0gCkouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rl
by5uZXQ+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
