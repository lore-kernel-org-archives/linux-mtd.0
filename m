Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16817606D802
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X5hZ+Cei;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HllXUFhc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H+XKpxAByIn03yGCpmTu5onxzIPEkD0ijZ/TSowU1hc=; b=X5hZ+CeiFayTJlPA+E2jZqGp5k
	UnbwQkYvsOyxO3J95LP1h49NHhbwIzYuTWwis5kOrlCqzedDd8D2DjbM5UwJdEwqq9t1hmj73fbSe
	F76PtJ6P0Zhi1lO9A65/bQ4WJlpG+uq4glf6J3IrD9KKFaFQuLr+HuM/w4L3bSG1Zt2T06TqSFJdU
	gN8gS72SVwka7O/mOcc7MOtURj3VLBWBOb7t5plJanN5X6ZsmXf805NiEfVhHejhf5LSM4iHm1mk9
	i9JVciQq4fLhcmeTi5aE9RWuB5QntVsZTSAedes/KKGlpjoFiulqKHVpagvePwzLK1iyLLyDDAf+V
	2YP8ZIOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOusp-00000008U4z-0Gst;
	Thu, 05 Nov 2026 10:39:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOusn-00000008U4h-3qIu
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 10:39:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DFDE60267;
	Thu,  5 Nov 2026 10:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8AD1F000C1;
	Thu,  5 Nov 2026 10:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793875188;
	bh=S0lQGcZ2eVZ2H87dToHJurXFAdWacHjZn3b7RiEzmRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HllXUFhc1RXCzPaYZihQbgOim3h/tURX9M4/FRp89tYWr/vnWdPjgx7ez7BW0eHWE
	 o/1YCjTzdRgVn0nad05ATG337UbJzuCgfrjjUa1/ZOO7LemyVO/+NKp6FJ7QZsYObr
	 HFROEtp7qF95zccz/ctmZ6maoy50xA6UCzECzlceM+HQzkTwAzb6416BLTtBpBKo/g
	 zMMoekbHTiHRcsGmbhlhjwL4KSrlZ0zfrXJ52b8WaaENdYz7ObuZOSJf+2X7RP0FHu
	 3JdJLroMdk6ux2eucfV5wEKoCgR9SzNP4FdBeMYHaV5pesck1b2M1bReZE41MTybFL
	 U8/H60KDrCAwQ==
Message-ID: <sashiko-outbox-198870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix possible NULL pointer
 dereference in gpmi_nfc_exec_op()
To: "Stefan Ghetu" <stefan.ghetu@nxp.com>, han.xu@nxp.com, miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, s.hauer@pengutronix.de, imx@lists.linux.dev, daniel.baluta@nxp.com, linux-mtd@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20261105103410.4424-1-stefan.ghetu@nxp.com>
References: <20261105103410.4424-1-stefan.ghetu@nxp.com>
Date: Thu, 05 Nov 2026 10:39:47 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0NyaXRpY2FsXSBtdGQ6IHJhd25h
bmQ6IGdwbWk6IGxvc3QgZXJyb3IgYW5kIE9PQiBhY2Nlc3MgaW4gZ3BtaV9uZmNfZXhlY19vcCgp
Ci0tCgpjb21taXQgMTdkYjEwODJkNjlmNzUyYzdlMDkzMzI0ZmVmNDhmNDkxODQzOTFmNQpBdXRo
b3I6IEhhbiBYdSA8aGFuLnh1QG54cC5jb20+CgptdGQ6IHJhd25hbmQ6IGdwbWk6IEZpeCBwb3Nz
aWJsZSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gZ3BtaV9uZmNfZXhlY19vcCgpCgpUaGlz
IGNvbW1pdCBtb3ZlcyB0aGUgTlVMTCBjaGVjayBvbiB0aGUgRE1BIGRlc2NyaXB0b3IgcG9pbnRl
ciBpbgpncG1pX25mY19leGVjX29wKCkgZnJvbSBpbnNpZGUgdGhlIGluc3RydWN0aW9uIGxvb3Ag
dG8gYWZ0ZXIgdGhlIGxvb3AKY29tcGxldGVzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3Bt
aS1uYW5kL2dwbWktbmFuZC5jCj4gaW5kZXggNTI3MTY1Y2NjODM5ZC4uMzMzYmE0NjhlY2FmNiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiBAQCAt
MjYxNiwxMSArMjYxNiwxMSBAQCBzdGF0aWMgaW50IGdwbWlfbmZjX2V4ZWNfb3Aoc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwKPiAgCQkJCQkJICAgJmRpcmVjdCk7Cj4gIAkJCWJyZWFrOwo+ICAJCX0K
PiArCX0KPiAgCj4gLQkJaWYgKCFkZXNjKSB7Cj4gLQkJCXJldCA9IC1FTlhJTzsKPiAtCQkJZ290
byB1bm1hcDsKPiAtCQl9Cj4gKwlpZiAoIWRlc2MpIHsKPiArCQlyZXQgPSAtRU5YSU87Cj4gKwkJ
Z290byB1bm1hcDsKPiAgCX0KCltTZXZlcml0eTogQ3JpdGljYWxdCkRvZXMgbW92aW5nIHRoZSAh
ZGVzYyBjaGVjayBvdXRzaWRlIHRoZSBpbnN0cnVjdGlvbiBsb29wIG1hc2sgZmFpbHVyZXMgb24K
aW50ZXJtZWRpYXRlIGluc3RydWN0aW9ucyBhbmQgYWxsb3cgb3V0LW9mLWJvdW5kcyBhY2Nlc3Nl
cyBvbgp0aGlzLT50cmFuc2ZlcnNbXT8KCkluIGdwbWlfbmZjX2V4ZWNfb3AoKSwgZWFjaCBpdGVy
YXRpb24gb2YgdGhlIGZvciAoaSA9IDA7IGkgPCBvcC0+bmluc3RyczsgaSsrKQpsb29wIG92ZXJ3
cml0ZXMgZGVzYyB3aXRoIHRoZSBkZXNjcmlwdG9yIHJldHVybmVkIGJ5IGdwbWlfY2hhaW5fd2Fp
dF9yZWFkeSgpLApncG1pX2NoYWluX2NvbW1hbmQoKSwgZ3BtaV9jaGFpbl9kYXRhX3dyaXRlKCks
IG9yIGdwbWlfY2hhaW5fZGF0YV9yZWFkKCkuCgpJZiBhbiBpbnRlcm1lZGlhdGUgaW5zdHJ1Y3Rp
b24gZmFpbHMgdG8gcHJlcGFyZSBhIERNQSBkZXNjcmlwdG9yIGFuZCBzZXRzIGRlc2MKdG8gTlVM
TCwgdGhlIGxvb3Agbm8gbG9uZ2VyIGFib3J0cy4gV2hlbiBteHNfZG1hX3ByZXBfc2xhdmVfc2co
KSBpbgpkcml2ZXJzL2RtYS9teHMtZG1hLmMgZmFpbHMgb24gYW4gaW50ZXJtZWRpYXRlIGluc3Ry
dWN0aW9uLCBpdCBzZXRzCm14c19jaGFuLT5zdGF0dXMgPSBETUFfRVJST1IgYW5kIHJldHVybnMg
TlVMTDoKCmRyaXZlcnMvZG1hL214cy1kbWEuYzpteHNfZG1hX3ByZXBfc2xhdmVfc2coKSB7Cgku
Li4KCWlmIChteHNfY2hhbi0+c3RhdHVzID09IERNQV9JTl9QUk9HUkVTUykKCQlpZHggPSBteHNf
Y2hhbi0+ZGVzY19jb3VudDsKCglpZiAoc2dfbGVuICsgaWR4ID4gTlVNX0NDVykgewoJCWRldl9l
cnIobXhzX2RtYS0+ZG1hX2RldmljZS5kZXYsCgkJCQkibWF4aW11bSBudW1iZXIgb2Ygc2cgZXhj
ZWVkZWQ6ICVkID4gJWRcbiIsCgkJCQlzZ19sZW4sIE5VTV9DQ1cpOwoJCWdvdG8gZXJyX291dDsK
CX0KCglteHNfY2hhbi0+c3RhdHVzID0gRE1BX0lOX1BST0dSRVNTOwoJLi4uCmVycl9vdXQ6Cglt
eHNfY2hhbi0+c3RhdHVzID0gRE1BX0VSUk9SOwoJcmV0dXJuIE5VTEw7Cn0KCk9uIHRoZSBuZXh0
IGluc3RydWN0aW9uIGluIHRoZSBsb29wLCBteHNfZG1hX3ByZXBfc2xhdmVfc2coKSBzZWVzCm14
c19jaGFuLT5zdGF0dXMgIT0gRE1BX0lOX1BST0dSRVNTLCByZXNldHMgaWR4IHRvIDAsIG92ZXJ3
cml0ZXMKbXhzX2NoYW4tPmNjd1swXSwgYW5kIHJldHVybnMgYSBub24tTlVMTCBkZXNjcmlwdG9y
LiBUaGUgcG9zdC1sb29wICFkZXNjIGNoZWNrCnRoZW4gcGFzc2VzIGFuZCBzdWJtaXRzIGEgdHJ1
bmNhdGVkIERNQSBjaGFpbiB0byBoYXJkd2FyZS4KCkluIGFkZGl0aW9uLCBnZXRfbmV4dF90cmFu
c2ZlcigpIGNoZWNrcyBmb3IgYXJyYXkgZXhoYXVzdGlvbiB1c2luZyBleGFjdAplcXVhbGl0eSBh
ZnRlciBpbmNyZW1lbnRpbmcgdGhpcy0+bnRyYW5zZmVyczoKCmRyaXZlcnMvbXRkL25hbmQvcmF3
L2dwbWktbmFuZC9ncG1pLW5hbmQuYzpnZXRfbmV4dF90cmFuc2ZlcigpIHsKCXN0cnVjdCBncG1p
X3RyYW5zZmVyICp0cmFuc2ZlciA9ICZ0aGlzLT50cmFuc2ZlcnNbdGhpcy0+bnRyYW5zZmVyc107
CgoJdGhpcy0+bnRyYW5zZmVycysrOwoKCWlmICh0aGlzLT5udHJhbnNmZXJzID09IEdQTUlfTUFY
X1RSQU5TRkVSUykKCQlyZXR1cm4gTlVMTDsKCglyZXR1cm4gdHJhbnNmZXI7Cn0KClByZXZpb3Vz
bHksIHJldHVybmluZyBOVUxMIGltbWVkaWF0ZWx5IGFib3J0ZWQgdGhlIGxvb3AgdmlhIGdvdG8g
dW5tYXAuIElmIHRoZQpsb29wIGNvbnRpbnVlcyBhZnRlciB0aGlzLT5udHJhbnNmZXJzIHJlYWNo
ZXMgR1BNSV9NQVhfVFJBTlNGRVJTLCBhIHN1YnNlcXVlbnQKY2FsbCB0byBnZXRfbmV4dF90cmFu
c2ZlcigpIGluZGV4ZXMgcGFzdCB0aGUgZW5kIG9mIHRoaXMtPnRyYW5zZmVyc1tdLAppbmNyZW1l
bnRzIHRoaXMtPm50cmFuc2ZlcnMgcGFzdCBHUE1JX01BWF9UUkFOU0ZFUlMsIGFuZCByZXR1cm5z
IHRoZQpvdXQtb2YtYm91bmRzIHBvaW50ZXIsIHdoaWNoIGFsc28gY2F1c2VzIHRoZSB1bm1hcCBj
bGVhbnVwIGxvb3AgdG8gaXRlcmF0ZQpvdXQgb2YgYm91bmRzOgoKCWZvciAoaSA9IDA7IGkgPCB0
aGlzLT5udHJhbnNmZXJzOyBpKyspIHsKCQlzdHJ1Y3QgZ3BtaV90cmFuc2ZlciAqdHJhbnNmZXIg
PSAmdGhpcy0+dHJhbnNmZXJzW2ldOwoKCQlpZiAodHJhbnNmZXItPmRpcmVjdGlvbiAhPSBETUFf
Tk9ORSkKCQkJZG1hX3VubWFwX3NnKHRoaXMtPmRldiwgJnRyYW5zZmVyLT5zZ2wsIDEsCgkJCQkg
ICAgIHRyYW5zZmVyLT5kaXJlY3Rpb24pOwoJfQoKQWxzbywgdGhlIGNvbnRpbnVlIGluIHRoZSBO
QU5EX09QX0NNRF9JTlNUUiBjYXNlIGlzIGd1YXJkZWQgYnk6CgoJaWYgKGkgKyAxICE9IG9wLT5u
aW5zdHJzICYmCgkgICAgb3AtPmluc3Ryc1tpICsgMV0udHlwZSA9PSBOQU5EX09QX0FERFJfSU5T
VFIpCgkJY29udGludWU7CgpzbyB0aGUgbmV4dCBpdGVyYXRpb24gaXMgZ3VhcmFudGVlZCB0byBl
eGVjdXRlIHRoZSBOQU5EX09QX0FERFJfSU5TVFIgY2FzZSBhbmQKY2hlY2sgZGVzYy4gU2hvdWxk
IHRoZSAhZGVzYyBjaGVjayBpbnNpZGUgdGhlIGxvb3AgYmUga2VwdCAob3IgcHJlc2VudCBpbiBi
b3RoCnBsYWNlcyB0byBhbHNvIGhhbmRsZSBhIHplcm8tbGVuZ3RoIE5BTkRfT1BfREFUQV9JTl9J
TlNUUik/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYxMTA1MTAzNDEwLjQ0MjQtMS1zdGVmYW4uZ2hldHVAbnhwLmNvbT9wYXJ0PTEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
