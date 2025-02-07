Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8828C021A6
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 21:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4Z4HW120vQpXfwHFGTqpw2mG25UMfd6v6vPM5vBhTY=; b=EkvsX75ZuBwa8K
	49W9GDlTPnhH/PMTMS1RKhgitycWmeZBw1619K+7dpXOM4fqOMxk5WWMoOK/KRY9obvigp80zjr9z
	WNAKrSr7aBC4/Y7Q3Kg5Jn5we5PqAWSdgY5N4GBnTR65qVz1H1lIeg1yXa8N80SYR3taWFpi1HJ9D
	tnDqlbRE7cQflT4xHsqalWeE+KP/PGCVAq7OxpNOqOvs0yAzaaMf6FGb0ceTzOJCeiPt5q3CyFVA2
	J37rCej+8Wu4oHgX1tKHGNbAVGi0Y069oLfWbJdKAdi9HswsZdCPqGa8Bhn4WBsxioc41oZFetydJ
	sCDPXw3natlh09sC+acA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwm-0000000BDnR-0Yeh;
	Fri, 07 Feb 2025 21:31:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVvs-0000000BD8s-0bUq
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 21:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6ECBDA43CED;
	Fri,  7 Feb 2025 21:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0E9BC2BCAF;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963835;
	bh=9PfartHueaGr5g/oiEQ4N02BOdiK1bkzjtmyOp5ecwc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XSQHX1P/S2G1qfpQ/lXzX+rfcRzNCc7YQw1t5fQx/FBgV+6eHzOT1kZEdBWqpqcly
	 73zaH8p3WSTU8UjGDULSrGjSDdK/Rf+GGnTH4uFRAD7/j70M6M2AankYYiGMYbBSMM
	 cgr4PIqZniKAB6xga3cp41m4GXZxSwIibQDUGj5+kfDLg2rf30/ItfSa8vcj7chlmC
	 2StvUoQuTlhv8p7j595JyvCQvdqOAvjNkLKrSx2gm+76GA2Rv97LRFxqUXo8CCiNGE
	 blO3mYTf427SgHgvEjwxnLwC1wLoEq/6Gfq98VlpqbWunDNMJT7FxQwud840BYV2ds
	 1SfseSF+JAEJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E86C021A0;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:24 +0100
Subject: [PATCH v2 07/12] dt-bindings: watchdog: Convert mpc8xxx-wdt to
 YAML
MIME-Version: 1.0
Message-Id: <20250207-ppcyaml-v2-7-8137b0c42526@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=3875;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=IzmYTjKFSaMe8r78V7lDGgTUX3OYdgsgRQLqgb3+W5E=;
 b=TIcbvGAq3Pd5vRP/+yayQPTA4eKxHfJJoBevDPlnNqk/TGLY/RAUlfbrPChXuI2XTMp9PTJ3j
 xT5C+X1jArUDzNFPHWmc4Z83M+LYPrzacfBFMNuxejNmMMtEVUUSfdW
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133040_354143_4ABB77CA 
X-CRM114-Status: GOOD (  13.76  )
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
UmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+ClNpZ25lZC1v
ZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQoKVjI6Ci0gdHJpbSBz
dWJqZWN0IGxpbmUgKHJlbW92ZSAiYmluZGluZyIpCi0gZml4IHByb3BlcnR5IG9yZGVyIHRvIGNv
bXBseSB3aXRoIGR0cyBjb2Rpbmcgc3R5bGUKLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy93
YXRjaGRvZy9tcGM4eHh4LXdkdC50eHQgICB8IDI1IC0tLS0tLS0tLQogLi4uL2RldmljZXRyZWUv
YmluZGluZ3Mvd2F0Y2hkb2cvbXBjOHh4eC13ZHQueWFtbCAgfCA2NCArKysrKysrKysrKysrKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRv
Zy9tcGM4eHh4LXdkdC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0
Y2hkb2cvbXBjOHh4eC13ZHQudHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBhMzg0
ZmY1YjNjZThjNjJkODEzZmMyM2Q3MmY3NGUyMTU4ZmY1NDNlLi4wMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy93YXRjaGRvZy9tcGM4eHh4LXdkdC50eHQKKysrIC9kZXYvbnVsbApAQCAtMSwyNSArMCww
IEBACi0qIEZyZWVzY2FsZSBtcGM4eHh4IHdhdGNoZG9nIGRyaXZlciAoRm9yIDgzeHgsIDg2eHgg
YW5kIDh4eCkKLQotUmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZTogU2hhbGwgY29u
dGFpbiBvbmUgb2YgdGhlIGZvbGxvd2luZzoKLQkibXBjODN4eF93ZHQiIGZvciBhbiBtcGM4M3h4
Ci0JImZzbCxtcGM4NjEwLXdkdCIgZm9yIGFuIG1wYzg2eHgKLQkiZnNsLG1wYzgyMy13ZHQiIGZv
ciBhbiBtcGM4eHgKLS0gcmVnOiBiYXNlIHBoeXNpY2FsIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0
aGUgYXJlYSBob3N0aW5nIHRoZQotICAgICAgIHdhdGNoZG9nIHJlZ2lzdGVycy4KLQkJT24gdGhl
IDgzeHgsICJXYXRjaGRvZyBUaW1lciBSZWdpc3RlcnMiIGFyZWE6CTwweDIwMCAweDEwMD4KLQkJ
T24gdGhlIDg2eHgsICJXYXRjaGRvZyBUaW1lciBSZWdpc3RlcnMiIGFyZWE6CTwweGU0MDAwIDB4
MTAwPgotCQlPbiB0aGUgOHh4LCAiR2VuZXJhbCBTeXN0ZW0gSW50ZXJmYWNlIFVuaXQiIGFyZWE6
IDwweDAgMHgxMD4KLQotT3B0aW9uYWwgcHJvcGVydGllczoKLS0gcmVnOiBhZGRpdGlvbmFsIHBo
eXNpY2FsIGFkZHJlc3MgYW5kIGxlbmd0aCAoNCkgb2YgbG9jYXRpb24gb2YgdGhlCi0gICAgICAg
UmVzZXQgU3RhdHVzIFJlZ2lzdGVyIChjYWxsZWQgUlNUUlNDUiBvbiB0aGUgbXBjODZ4eCkKLQkJ
T24gdGhlIDgzeHgsIGl0IGlzIGxvY2F0ZWQgYXQgb2Zmc2V0IDB4OTEwCi0JCU9uIHRoZSA4Nnh4
LCBpdCBpcyBsb2NhdGVkIGF0IG9mZnNldCAweGUwMDk0Ci0JCU9uIHRoZSA4eHgsIGl0IGlzIGxv
Y2F0ZWQgYXQgb2Zmc2V0IDB4Mjg4Ci0KLUV4YW1wbGU6Ci0JCVdEVDogd2F0Y2hkb2dAMCB7Ci0J
CSAgICBjb21wYXRpYmxlID0gImZzbCxtcGM4MjMtd2R0IjsKLQkJICAgIHJlZyA9IDwweDAgMHgx
MCAweDI4OCAweDQ+OwotCQl9OwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3dhdGNoZG9nL21wYzh4eHgtd2R0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXBjOHh4eC13ZHQueWFtbApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi4wOWU2
ZGNmNWJmMTg2ZTRkMTVlZTg0ZjAzY2U2NGRkNTMxNTUxOThkCi0tLSAvZGV2L251bGwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL21wYzh4eHgtd2R0Lnlh
bWwKQEAgLTAsMCArMSw2NCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAt
b25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy93YXRjaGRvZy9tcGM4eHh4LXdkdC55YW1sIworJHNjaGVtYTogaHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBGcmVl
c2NhbGUgTVBDOHh4eCB3YXRjaGRvZyB0aW1lciAoRm9yIDgzeHgsIDg2eHggYW5kIDh4eCkKKwor
bWFpbnRhaW5lcnM6CisgIC0gSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KKworcHJv
cGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBlbnVtOgorICAgICAgLSBtcGM4M3h4X3dkdCAg
ICAgICAjIGZvciBhbiBtcGM4M3h4CisgICAgICAtIGZzbCxtcGM4NjEwLXdkdCAgICMgZm9yIGFu
IG1wYzg2eHgKKyAgICAgIC0gZnNsLG1wYzgyMy13ZHQgICAgIyBmb3IgYW4gbXBjOHh4CisKKyAg
ZGV2aWNlX3R5cGU6CisgICAgY29uc3Q6IHdhdGNoZG9nCisKKyAgcmVnOgorICAgIG1pbkl0ZW1z
OiAxCisgICAgaXRlbXM6CisgICAgICAtIGRlc2NyaXB0aW9uOiB8CisgICAgICAgICAgQmFzZSBw
aHlzaWNhbCBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIGFyZWEgaG9zdGluZyB0aGUgd2F0Y2hk
b2cKKyAgICAgICAgICByZWdpc3RlcnMuCisKKyAgICAgICAgICBPbiB0aGUgODN4eCwgIldhdGNo
ZG9nIFRpbWVyIFJlZ2lzdGVycyIgYXJlYTogICAgIDwweDIwMCAweDEwMD4KKyAgICAgICAgICBP
biB0aGUgODZ4eCwgIldhdGNoZG9nIFRpbWVyIFJlZ2lzdGVycyIgYXJlYTogICAgIDwweGU0MDAw
IDB4MTAwPgorICAgICAgICAgIE9uIHRoZSA4eHgsICJHZW5lcmFsIFN5c3RlbSBJbnRlcmZhY2Ug
VW5pdCIgYXJlYTogPDB4MCAweDEwPgorCisgICAgICAtIGRlc2NyaXB0aW9uOiB8CisgICAgICAg
ICAgQWRkaXRpb25hbCBvcHRpb25hbCBwaHlzaWNhbCBhZGRyZXNzIGFuZCBsZW5ndGggKDQpIG9m
IGxvY2F0aW9uIG9mCisgICAgICAgICAgdGhlIFJlc2V0IFN0YXR1cyBSZWdpc3RlciAoY2FsbGVk
IFJTVFJTQ1Igb24gdGhlIG1wYzg2eHgpCisKKyAgICAgICAgICBPbiB0aGUgODN4eCwgaXQgaXMg
bG9jYXRlZCBhdCBvZmZzZXQgMHg5MTAKKyAgICAgICAgICBPbiB0aGUgODZ4eCwgaXQgaXMgbG9j
YXRlZCBhdCBvZmZzZXQgMHhlMDA5NAorICAgICAgICAgIE9uIHRoZSA4eHgsIGl0IGlzIGxvY2F0
ZWQgYXQgb2Zmc2V0IDB4Mjg4CisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcK
KworYWxsT2Y6CisgIC0gJHJlZjogd2F0Y2hkb2cueWFtbCMKKworYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBXRFQ6IHdhdGNoZG9nQDAgeworICAg
ICAgICBjb21wYXRpYmxlID0gImZzbCxtcGM4MjMtd2R0IjsKKyAgICAgICAgcmVnID0gPDB4MCAw
eDEwIDB4Mjg4IDB4ND47CisgICAgfTsKKworICAtIHwKKyAgICB3ZHQ6IHdhdGNoZG9nQDIwMCB7
CisgICAgICAgIGNvbXBhdGlibGUgPSAibXBjODN4eF93ZHQiOworICAgICAgICByZWcgPSA8MHgy
MDAgMHgxMDA+OworICAgICAgICBkZXZpY2VfdHlwZSA9ICJ3YXRjaGRvZyI7CisgICAgfTsKKwor
Li4uCgotLSAKMi40OC4wLnJjMS4yMTkuZ2I2YjY3NTdkNzcyCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
