Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35E3C021A4
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 21:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwmzoE8SZEU+hdL+UjtBCAeOZRYES30f1HOJ9hEUE4E=; b=fnu5ZL0RD+CALb
	uYmMccMQIKi2PVs5MS21cyaGGA71+d7Dr7Oh7Trw4abYIVUoMzco1y8R5UJkXc/Er6LiaIzLGdmNX
	JXFkoBAM5PSuj4TS4dGy/EW5Sd2QMOZW5lf42YYzMthSgnE+ZP58u04iHAxQ01lAArKVkWSfQe/oa
	3SIfd6WxoD/WLmbr5kkNv5ZKYQ7aCNDzeVr//vQyYuzdIEyK1h/ypwQoSV1gWcE+oDuUdrlUS7dsE
	LoZEORyo9nalyijZy9dT8jDvGZnV9AjbjLmgb7BLf4yOEfzcan+DAIIjtFS/0b/LyiVseZNPtyD6R
	aP79v2NtOOKIKbIjPoow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwi-0000000BDje-34oY;
	Fri, 07 Feb 2025 21:31:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVvq-0000000BD6s-04gk
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 21:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 80C41A43CF4;
	Fri,  7 Feb 2025 21:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DA76C4CEE6;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963835;
	bh=nktEztgiNtX/g4rmdLEVKXUelw39pbboF7CNwlBd40Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kNRibzA0sw2Sw+B0fy2zZdwXVSxYwIYmTwqT33kjPkzxWMOTJkeCi7kZ+St1dYfJ8
	 sDsPsSvzLXHdK7tlUqACRftJt7E2CJ93vVMwrufGvdyalzrNO0up2+sN0gPyW5Bjuk
	 bq/+royUYXCZQ7BsBSVq8+G/SZ/L5oRONDOxcJNfGwws28/ZnwBbpD0jUFXJyyMbGJ
	 sMYQIW3/T7ibAELE7FzHc9n0ROzdEM5tdduEbXhUCz9oMQzTLKvi9eI2Rxjoc4faZN
	 3EUy9pC3HZ8m/nDI6FWey8qNm+N1t10AJzLBMdF3s+XseMSZjzyQDjr6Z9GPXGsJgL
	 YEZOfjytMwkow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2267DC0219D;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:19 +0100
Subject: [PATCH v2 02/12] dt-bindings: ata: Convert fsl,pq-sata to YAML
MIME-Version: 1.0
Message-Id: <20250207-ppcyaml-v2-2-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
In-Reply-To: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: imx@lists.linux.dev, Scott Wood <oss@buserror.net>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=3808;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=UpnIOgI342qJlYPCanJVhpXk4WK6YM5Ksj/vzI9NEeg=;
 b=IMEEL81nsnb2ijBv3LXOcNNng8dQqK5mDCiPuvJw5PIblvynwYV/YQROKecYzJSMsuTEb53Rb
 z5adZJegyg5CeBejUIlBGgfzgjd8CuS7MscsQzisoYwXCU7aFBlh0dZ
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133038_210348_83947C81 
X-CRM114-Status: GOOD (  12.23  )
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

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKQ29udmVydCB0aGUgRnJl
ZXNjYWxlIFBvd2VyUVVJQ0MgU0FUQSBjb250cm9sbGVyIGJpbmRpbmcgZnJvbSB0ZXh0IGZvcm0K
dG8gWUFNTC4gVGhlIGxpc3Qgb2YgY29tcGF0aWJsZSBzdHJpbmdzIHJlZmxlY3RzIGN1cnJlbnQg
dXNhZ2UuCgpUbyBjbGFyaWZ5IHRoZSBkZXNjcmlwdGlvbiwgSSBjaGFuZ2VkIGl0IHRvIG1lbnRp
b24gImVhY2ggU0FUQQpjb250cm9sbGVyIiBpbnN0ZWFkIG9mIGVhY2ggcG9ydC4KClJldmlld2Vk
LWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBK
LiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgotLS0KClYyOgotIHJlbW92ZSB1bm5lY2Vz
c2FyeSBtdWx0aWxpbmUgbWFya2VyICh8KQotIGNsYXJpZmllZCBjb250cm9sbGVycyB2cy4gcG9y
dHMgaW4gdGhlIGRlc2NyaXB0aW9uCi0gdHJpbSBzdWJqZWN0IGxpbmUgKHJlbW92ZSAiYmluZGlu
ZyIpCi0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXRhL2ZzbCxwcS1zYXRhLnlhbWwgICAg
ICAgfCA1OSArKysrKysrKysrKysrKysrKysrKysrCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXRhL2ZzbC1zYXRhLnR4dCB8IDI4IC0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgNTkgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9mc2wscHEtc2F0YS55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9mc2wscHEtc2F0YS55YW1sCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAuLjk3ZWVhMTFiNGZiYmI3NzM0ODdjMDA0YWJiZWRjYjdiZDI5MDYwNWMKLS0tIC9kZXYvbnVs
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXRhL2ZzbCxwcS1zYXRh
LnlhbWwKQEAgLTAsMCArMSw1OSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9hdGEvZnNsLHBxLXNhdGEueWFtbCMKKyRzY2hlbWE6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogRnJlZXNj
YWxlIDh4eHgvMy4wIEdiL3MgU0FUQSBub2RlcworCittYWludGFpbmVyczoKKyAgLSBKLiBOZXVz
Y2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgorCitkZXNjcmlwdGlvbjoKKyAgU0FUQSBub2RlcyBh
cmUgZGVmaW5lZCB0byBkZXNjcmliZSBvbi1jaGlwIFNlcmlhbCBBVEEgY29udHJvbGxlcnMuCisg
IEVhY2ggU0FUQSBjb250cm9sbGVyIHNob3VsZCBoYXZlIGl0cyBvd24gbm9kZS4KKworcHJvcGVy
dGllczoKKyAgY29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIC0gaXRlbXM6CisgICAgICAg
ICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc3LXNhdGEKKyAgICAgICAgICAg
ICAgLSBmc2wsbXBjODUzNi1zYXRhCisgICAgICAgICAgICAgIC0gZnNsLG1wYzgzMTUtc2F0YQor
ICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc5LXNhdGEKKyAgICAgICAgICAtIGNvbnN0OiBmc2ws
cHEtc2F0YQorICAgICAgLSBjb25zdDogZnNsLHBxLXNhdGEtdjIKKworICByZWc6CisgICAgbWF4
SXRlbXM6IDEKKworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgY2VsbC1pbmRl
eDoKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAg
ICBlbnVtOiBbMSwgMiwgMywgNF0KKyAgICBkZXNjcmlwdGlvbjogfAorICAgICAgMSBmb3IgY29u
dHJvbGxlciBAIDB4MTgwMDAKKyAgICAgIDIgZm9yIGNvbnRyb2xsZXIgQCAweDE5MDAwCisgICAg
ICAzIGZvciBjb250cm9sbGVyIEAgMHgxYTAwMAorICAgICAgNCBmb3IgY29udHJvbGxlciBAIDB4
MWIwMDAKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIGludGVycnVwdHMKKyAgLSBj
ZWxsLWluZGV4CisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAg
LSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5o
PgorICAgIHNhdGFAMTgwMDAgeworICAgICAgICBjb21wYXRpYmxlID0gImZzbCxtcGM4Mzc5LXNh
dGEiLCAiZnNsLHBxLXNhdGEiOworICAgICAgICByZWcgPSA8MHgxODAwMCAweDEwMDA+OworICAg
ICAgICBjZWxsLWluZGV4ID0gPDE+OworICAgICAgICBpbnRlcnJ1cHRzID0gPDQ0IElSUV9UWVBF
X0xFVkVMX0xPVz47CisgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmlwaWM+OworICAgIH07
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXRhL2ZzbC1z
YXRhLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdGEvZnNsLXNhdGEu
dHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmZDYzYmIzYmVjYzkzNjNjNTIwYThm
ZDA2NjI5ZmRjNTJjNGQ0Mjk5Li4wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdGEvZnNsLXNhdGEu
dHh0CisrKyAvZGV2L251bGwKQEAgLTEsMjggKzAsMCBAQAotKiBGcmVlc2NhbGUgOHh4eC8zLjAg
R2IvcyBTQVRBIG5vZGVzCi0KLVNBVEEgbm9kZXMgYXJlIGRlZmluZWQgdG8gZGVzY3JpYmUgb24t
Y2hpcCBTZXJpYWwgQVRBIGNvbnRyb2xsZXJzLgotRWFjaCBTQVRBIHBvcnQgc2hvdWxkIGhhdmUg
aXRzIG93biBub2RlLgotCi1SZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBjb21wYXRpYmxlICAgICAg
ICA6IGNvbXBhdGlibGUgbGlzdCwgY29udGFpbnMgMiBlbnRyaWVzLCBmaXJzdCBpcwotCQkgImZz
bCxDSElQLXNhdGEiLCB3aGVyZSBDSElQIGlzIHRoZSBwcm9jZXNzb3IKLQkJIChtcGM4MzE1LCBt
cGM4Mzc5LCBldGMuKSBhbmQgdGhlIHNlY29uZCBpcwotCQkgImZzbCxwcS1zYXRhIgotLSBpbnRl
cnJ1cHRzICAgICAgICA6IDxpbnRlcnJ1cHQgbWFwcGluZyBmb3IgU0FUQSBJUlE+Ci0tIGNlbGwt
aW5kZXggICAgICAgIDogY29udHJvbGxlciBpbmRleC4KLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgMSBmb3IgY29udHJvbGxlciBAIDB4MTgwMDAKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
MiBmb3IgY29udHJvbGxlciBAIDB4MTkwMDAKLSAgICAgICAgICAgICAgICAgICAgICAgICAgMyBm
b3IgY29udHJvbGxlciBAIDB4MWEwMDAKLSAgICAgICAgICAgICAgICAgICAgICAgICAgNCBmb3Ig
Y29udHJvbGxlciBAIDB4MWIwMDAKLQotT3B0aW9uYWwgcHJvcGVydGllczoKLS0gcmVnICAgICAg
ICAgICAgICAgOiA8cmVnaXN0ZXJzIG1hcHBpbmc+Ci0KLUV4YW1wbGU6Ci0Jc2F0YUAxODAwMCB7
Ci0JCWNvbXBhdGlibGUgPSAiZnNsLG1wYzgzNzktc2F0YSIsICJmc2wscHEtc2F0YSI7Ci0JCXJl
ZyA9IDwweDE4MDAwIDB4MTAwMD47Ci0JCWNlbGwtaW5kZXggPSA8MT47Ci0JCWludGVycnVwdHMg
PSA8MmMgOD47Ci0JCWludGVycnVwdC1wYXJlbnQgPSA8ICZpcGljID47Ci0JfTsKCi0tIAoyLjQ4
LjAucmMxLjIxOS5nYjZiNjc1N2Q3NzIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
