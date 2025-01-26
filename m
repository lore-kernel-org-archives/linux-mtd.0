Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCEFC02193
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkmOQAOxSRB/uVLCLssA3KuaNMNZBgY2MtpD55jHnc8=; b=20En+Ytn3n6dg0
	3+BPl9D03UF7P7dKUetvxTmyekCg/hPfV1Yp3pHA3ZsYugXP1pKKQZWHOQsGfX66/0b4YEKw9GtEV
	dkVbRr9u2OEgaCoXs0H29eOUelMP072t0GcZLOGGejVCNGYlQxULlOjRcOK43Ne2N31Q/0AR5dvpn
	GRWNpqtYW7IFg8dfEK8Uerq4Ow1iJnxza7qdwYosruS+p3fUvyb3fHx4DuVV8M1Zagm88+T9M1Wz4
	D1prYC7f2R07Q+0lYisjJF8or7u+HXYLhKN36oVNSECuZZVJmRO8+1cE9IMSTflxas+wLGUT7LOkR
	5VEfwmzUhDYGCpmhbWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7ql-00000000glb-1mUd;
	Sun, 26 Jan 2025 18:59:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7qg-00000000ghl-2IN9
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 18:59:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 175E7A4101B;
	Sun, 26 Jan 2025 18:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11B3FC19422;
	Sun, 26 Jan 2025 18:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917946;
	bh=r6w1TGpVSqKoSAo8UJWjBKkemEchRp94CZSpKLCcVic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VKQA9VPTPYPBXavTlj/t8VBkruGrWrint1cIPRTVYmzKcYSkLCACJ3dkx6YFGD5aF
	 I5j0anMoe7fWtO3sLpUNV/oYGmyZ6Pd/1IMgKDwtellO9zkx0HriAYlpGLEZ/hmMXU
	 X9JdBEmd63a57sa6SmidOk6bIjwFXbcLPOcE4pBEEPJRcMZE8RpbPZ0R5rRqT/aSkI
	 qLEU8dB2BSh7PNeKGe0KN7uw1wf0MLOqPex7UWVF4pcFmavGTl0z0ngohluNmDNOtz
	 xsmoello/jN78f1HAh4FwkYSl6GQEzR0w9qf1u6Zl3fdiae50NcCD6vrAii4IvLEl2
	 1iBMXM+cQuCOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F5BC0218D;
	Sun, 26 Jan 2025 18:59:06 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 26 Jan 2025 19:59:02 +0100
Subject: [PATCH 7/9] dt-bindings: watchdog: Convert mpc8xxx-wdt binding to
 YAML
MIME-Version: 1.0
Message-Id: <20250126-ppcyaml-v1-7-50649f51c3dd@posteo.net>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
In-Reply-To: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Scott Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=3719;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=INVkBCLHOPyRZgA3id7yu3YiJSlbpT9rkFYnjOPWGRw=;
 b=qIrd3NqNYsZmRHz4Bp4oEm0lNDz7AgiaFpCxd9WVkNnHgQgErhQ8oTpycy+6fz5u6+yLeokS7
 DjGnZr5OgjSAQorB4z4FQuYzKQmxCRJELg+Xp55lZMxlrTDHbra662w
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_105910_712285_78995AF8 
X-CRM114-Status: GOOD (  14.16  )
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

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKQ29udmVydCBtcGM4M3h4
LXdkdC50eHQgdG8gWUFNTCB0byBlbmFibGUgYXV0b21hdGljIHNjaGVtYSB2YWxpZGF0aW9uLgoK
U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KLS0tCiAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tcGM4eHh4LXdkdC50eHQgICB8IDI1IC0tLS0t
LS0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXBjOHh4eC13ZHQueWFtbCAg
fCA2NCArKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlv
bnMoKyksIDI1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tcGM4eHh4LXdkdC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXBjOHh4eC13ZHQudHh0CmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCBhMzg0ZmY1YjNjZThjNjJkODEzZmMyM2Q3MmY3NGUyMTU4ZmY1NDNl
Li4wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwCi0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tcGM4eHh4LXdkdC50eHQKKysrIC9k
ZXYvbnVsbApAQCAtMSwyNSArMCwwIEBACi0qIEZyZWVzY2FsZSBtcGM4eHh4IHdhdGNoZG9nIGRy
aXZlciAoRm9yIDgzeHgsIDg2eHggYW5kIDh4eCkKLQotUmVxdWlyZWQgcHJvcGVydGllczoKLS0g
Y29tcGF0aWJsZTogU2hhbGwgY29udGFpbiBvbmUgb2YgdGhlIGZvbGxvd2luZzoKLQkibXBjODN4
eF93ZHQiIGZvciBhbiBtcGM4M3h4Ci0JImZzbCxtcGM4NjEwLXdkdCIgZm9yIGFuIG1wYzg2eHgK
LQkiZnNsLG1wYzgyMy13ZHQiIGZvciBhbiBtcGM4eHgKLS0gcmVnOiBiYXNlIHBoeXNpY2FsIGFk
ZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgYXJlYSBob3N0aW5nIHRoZQotICAgICAgIHdhdGNoZG9n
IHJlZ2lzdGVycy4KLQkJT24gdGhlIDgzeHgsICJXYXRjaGRvZyBUaW1lciBSZWdpc3RlcnMiIGFy
ZWE6CTwweDIwMCAweDEwMD4KLQkJT24gdGhlIDg2eHgsICJXYXRjaGRvZyBUaW1lciBSZWdpc3Rl
cnMiIGFyZWE6CTwweGU0MDAwIDB4MTAwPgotCQlPbiB0aGUgOHh4LCAiR2VuZXJhbCBTeXN0ZW0g
SW50ZXJmYWNlIFVuaXQiIGFyZWE6IDwweDAgMHgxMD4KLQotT3B0aW9uYWwgcHJvcGVydGllczoK
LS0gcmVnOiBhZGRpdGlvbmFsIHBoeXNpY2FsIGFkZHJlc3MgYW5kIGxlbmd0aCAoNCkgb2YgbG9j
YXRpb24gb2YgdGhlCi0gICAgICAgUmVzZXQgU3RhdHVzIFJlZ2lzdGVyIChjYWxsZWQgUlNUUlND
UiBvbiB0aGUgbXBjODZ4eCkKLQkJT24gdGhlIDgzeHgsIGl0IGlzIGxvY2F0ZWQgYXQgb2Zmc2V0
IDB4OTEwCi0JCU9uIHRoZSA4Nnh4LCBpdCBpcyBsb2NhdGVkIGF0IG9mZnNldCAweGUwMDk0Ci0J
CU9uIHRoZSA4eHgsIGl0IGlzIGxvY2F0ZWQgYXQgb2Zmc2V0IDB4Mjg4Ci0KLUV4YW1wbGU6Ci0J
CVdEVDogd2F0Y2hkb2dAMCB7Ci0JCSAgICBjb21wYXRpYmxlID0gImZzbCxtcGM4MjMtd2R0IjsK
LQkJICAgIHJlZyA9IDwweDAgMHgxMCAweDI4OCAweDQ+OwotCQl9OwpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL21wYzh4eHgtd2R0LnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXBjOHh4eC13ZHQu
eWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwLi5jNzhhNDI0Mzg4YzZlMzBiYzQ2NTZmNTQ0NGU2MjFjMWIzOTczNjZi
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dh
dGNoZG9nL21wYzh4eHgtd2R0LnlhbWwKQEAgLTAsMCArMSw2NCBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0t
LQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy93YXRjaGRvZy9tcGM4eHh4LXdk
dC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjCisKK3RpdGxlOiBGcmVlc2NhbGUgTVBDOHh4eCB3YXRjaGRvZyB0aW1lciAoRm9yIDgz
eHgsIDg2eHggYW5kIDh4eCkKKworbWFpbnRhaW5lcnM6CisgIC0gSi4gTmV1c2Now6RmZXIgPGou
bmVAcG9zdGVvLm5ldD4KKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBlbnVtOgor
ICAgICAgLSBtcGM4M3h4X3dkdCAgICAgICAjIGZvciBhbiBtcGM4M3h4CisgICAgICAtIGZzbCxt
cGM4NjEwLXdkdCAgICMgZm9yIGFuIG1wYzg2eHgKKyAgICAgIC0gZnNsLG1wYzgyMy13ZHQgICAg
IyBmb3IgYW4gbXBjOHh4CisKKyAgZGV2aWNlX3R5cGU6CisgICAgY29uc3Q6IHdhdGNoZG9nCisK
KyAgcmVnOgorICAgIG1pbkl0ZW1zOiAxCisgICAgaXRlbXM6CisgICAgICAtIGRlc2NyaXB0aW9u
OiB8CisgICAgICAgICAgQmFzZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIGFy
ZWEgaG9zdGluZyB0aGUgd2F0Y2hkb2cKKyAgICAgICAgICByZWdpc3RlcnMuCisKKyAgICAgICAg
ICBPbiB0aGUgODN4eCwgIldhdGNoZG9nIFRpbWVyIFJlZ2lzdGVycyIgYXJlYTogICAgIDwweDIw
MCAweDEwMD4KKyAgICAgICAgICBPbiB0aGUgODZ4eCwgIldhdGNoZG9nIFRpbWVyIFJlZ2lzdGVy
cyIgYXJlYTogICAgIDwweGU0MDAwIDB4MTAwPgorICAgICAgICAgIE9uIHRoZSA4eHgsICJHZW5l
cmFsIFN5c3RlbSBJbnRlcmZhY2UgVW5pdCIgYXJlYTogPDB4MCAweDEwPgorCisgICAgICAtIGRl
c2NyaXB0aW9uOiB8CisgICAgICAgICAgQWRkaXRpb25hbCBvcHRpb25hbCBwaHlzaWNhbCBhZGRy
ZXNzIGFuZCBsZW5ndGggKDQpIG9mIGxvY2F0aW9uIG9mCisgICAgICAgICAgdGhlIFJlc2V0IFN0
YXR1cyBSZWdpc3RlciAoY2FsbGVkIFJTVFJTQ1Igb24gdGhlIG1wYzg2eHgpCisKKyAgICAgICAg
ICBPbiB0aGUgODN4eCwgaXQgaXMgbG9jYXRlZCBhdCBvZmZzZXQgMHg5MTAKKyAgICAgICAgICBP
biB0aGUgODZ4eCwgaXQgaXMgbG9jYXRlZCBhdCBvZmZzZXQgMHhlMDA5NAorICAgICAgICAgIE9u
IHRoZSA4eHgsIGl0IGlzIGxvY2F0ZWQgYXQgb2Zmc2V0IDB4Mjg4CisKK3JlcXVpcmVkOgorICAt
IGNvbXBhdGlibGUKKyAgLSByZWcKKworYWxsT2Y6CisgIC0gJHJlZjogd2F0Y2hkb2cueWFtbCMK
KworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBX
RFQ6IHdhdGNoZG9nQDAgeworICAgICAgICBjb21wYXRpYmxlID0gImZzbCxtcGM4MjMtd2R0IjsK
KyAgICAgICAgcmVnID0gPDB4MCAweDEwIDB4Mjg4IDB4ND47CisgICAgfTsKKworICAtIHwKKyAg
ICB3ZHQ6IHdhdGNoZG9nQDIwMCB7CisgICAgICAgIGRldmljZV90eXBlID0gIndhdGNoZG9nIjsK
KyAgICAgICAgY29tcGF0aWJsZSA9ICJtcGM4M3h4X3dkdCI7CisgICAgICAgIHJlZyA9IDwweDIw
MCAweDEwMD47CisgICAgfTsKKworLi4uCgotLSAKMi40OC4wLnJjMS4yMTkuZ2I2YjY3NTdkNzcy
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
