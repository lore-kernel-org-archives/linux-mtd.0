Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26E7C369B6
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Apr 2025 13:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DW6CWFwU7SIn4wl8xjfo8+oDtezCcKRe9xUg1+6U5UE=; b=Q9DaqoSd/q3gvG
	P3VMSIzdWxn1kqFE5cgVH/w3mwmpkQIb7bH27baImDD+pjzA24oIOfBZ2pcZaSWX1w/9C5c0AQONx
	Eqdltbvl2zdtEu1fkpG41rKFaxMTwoTqPXVPffsaJx3J7swXMkH5sENAuqjaQxeY4R559ueWO4aiz
	EA124AQCnpKbq4pDPeZ4lQNFs8mt5zFZQxicENJHb1rVQd2EC0FEqGff5Pn/pV/adXuk+FfhNR3wP
	HlLnCICmt03tSvcU/LReiiJk5/mCAYd8mlHH1G6NnuPTHrxVqedLzxNbgktzXqGi7bHXkJF5oLRzg
	06tXP4QaLizI2UNP2mNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3aib-0000000FuvC-0SKj;
	Sat, 12 Apr 2025 13:16:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3aiX-0000000Futd-1Xc0
	for linux-mtd@lists.infradead.org;
	Sat, 12 Apr 2025 13:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 395375C57E9;
	Sat, 12 Apr 2025 13:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98BD3C4CEED;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744463775;
	bh=tVWlsHyHnXCIGSgizl8HG7hmSOJbp84SHZlXyFf90fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iC8a/WC4yo3UI0nR+qdj4g9mJKJuSY3KdMM/puHRci2xFEhhKn+UIA1tIihfh0Vrk
	 g87Mg2IRd0WuHbtTsf7/obAM44hE3Y21xcjLZqzSRaXU1m744l8hj8nx38fn0YpRa2
	 2Q+vRq9jZUF6eLjIqssRMVoTST99fRxF4uULxdmjbVcvqXbVYDBzrUys0CJZ9e+vYX
	 JpqbGzka1Zm4Ia2pYuArzyOo2EHFdCoH94wflhO72zL9qky6LnBWWBbsbg8WwApLQ/
	 CduuWdars4/4ub4Bp+5YlfWxUHxGwnDN4MSG/o8DGpQIvnCm9aj9Lzk6DLyFdd+zJj
	 sxX9SSrmCrrbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED57C369AE;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 12 Apr 2025 15:16:04 +0200
Subject: [PATCH v5 3/4] dt-bindings: nand: Add fsl,elbc-fcm-nand
MIME-Version: 1.0
Message-Id: <20250412-ppcyaml-elbc-v5-3-03f0e577139f@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744463772; l=3440;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=WvJoQK0edpJeqo++ZsYt3pS+SZc6YBUbltPH3xZQKbg=;
 b=ZlwLLrnr0tnVcUvMUkmKmZgmWUTcpmFXhK0evY0sU2YAfzQ+KWPr7Ghb7DGrYHdgyVPkEjTeW
 Nl3W6FN2QgOAF2xXhTWmmHy05LriYY32Tb0O27Jash1igxQHD2JFsns
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_061617_524869_CCB120ED 
X-CRM114-Status: GOOD (  13.71  )
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
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi45MWU4ZjJmOWZmMjZkYTBmNWEz
ZjliZjI3Njk1NWVkMzJlOWU3YmM2Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9mc2wsZWxiYy1mY20tbmFuZC55YW1sCkBAIC0wLDAgKzEs
NjggQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IE5BTkQgZmxhc2ggYXR0YWNo
ZWQgdG8gRnJlZXNjYWxlIGVMQkMKKworZGVzY3JpcHRpb246CisgIFRoZSBGcmVlc2NhbGUgRW5o
YW5jZWQgTG9jYWwgQnVzIGNvbnRyb2xsZXIgKGVMQkMpIGNvbnRhaW5zIGxvZ2ljIHRvCisgIGlu
dGVyZmFjZSB3aXRoIE5BTkQgZmxhc2gsIGNhbGxlZCB0aGUgTkFORCBGbGFzaCBDb250cm9sIE1h
Y2hpbmUgKEZDTSkuCisgIFRoaXMgYmluZGluZyBkZXNjcmliZXMgZmxhc2ggYXR0YWNoZWQgdG8g
YW4gZUxCQyB1c2luZyB0aGUgRkNNLgorCittYWludGFpbmVyczoKKyAgLSBKLiBOZXVzY2jDpGZl
ciA8ai5uZUBwb3N0ZW8ubmV0PgorCithbGxPZjoKKyAgLSAkcmVmOiByYXctbmFuZC1jaGlwLnlh
bWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgb25lT2Y6CisgICAgICAtIGl0
ZW1zOgorICAgICAgICAgIC0gZW51bToKKyAgICAgICAgICAgICAgLSBmc2wsbXBjODMxMy1mY20t
bmFuZAorICAgICAgICAgICAgICAtIGZzbCxtcGM4MzE1LWZjbS1uYW5kCisgICAgICAgICAgICAg
IC0gZnNsLG1wYzgzNzctZmNtLW5hbmQKKyAgICAgICAgICAgICAgLSBmc2wsbXBjODM3OC1mY20t
bmFuZAorICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc5LWZjbS1uYW5kCisgICAgICAgICAgICAg
IC0gZnNsLG1wYzg1MzYtZmNtLW5hbmQKKyAgICAgICAgICAgICAgLSBmc2wsbXBjODU2OS1mY20t
bmFuZAorICAgICAgICAgICAgICAtIGZzbCxtcGM4NTcyLWZjbS1uYW5kCisgICAgICAgICAgICAg
IC0gZnNsLHAxMDIwLWZjbS1uYW5kCisgICAgICAgICAgICAgIC0gZnNsLHAxMDIxLWZjbS1uYW5k
CisgICAgICAgICAgICAgIC0gZnNsLHAxMDI1LWZjbS1uYW5kCisgICAgICAgICAgICAgIC0gZnNs
LHAyMDIwLWZjbS1uYW5kCisgICAgICAgICAgLSBjb25zdDogZnNsLGVsYmMtZmNtLW5hbmQKKyAg
ICAgIC0gY29uc3Q6IGZzbCxlbGJjLWZjbS1uYW5kCisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAx
CisKKyAgIiNhZGRyZXNzLWNlbGxzIjoKKyAgICBjb25zdDogMQorCisgICIjc2l6ZS1jZWxscyI6
CisgICAgY29uc3Q6IDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworCit1
bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBsb2Nh
bGJ1cyB7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+OworICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwxPjsKKworICAgICAgICBuYW5kQDEsMCB7CisgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImZzbCxtcGM4MzE1LWZjbS1uYW5kIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAiZnNsLGVs
YmMtZmNtLW5hbmQiOworICAgICAgICAgICAgcmVnID0gPDB4MSAweDAgMHgyMDAwPjsKKyAgICAg
ICAgfTsKKyAgICB9OworCisuLi4KCi0tIAoyLjQ4LjAucmMxLjIxOS5nYjZiNjc1N2Q3NzIKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
