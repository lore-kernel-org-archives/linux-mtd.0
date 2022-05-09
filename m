Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0847C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 17:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWa5UUEcLaIgBHQqpJL3iUGuu9oEE26Godw8bGWx34E=; b=KVTGaebRIvEr40
	0o9sccsOnt5tFmDtR+TNhuWSBjO9N5r13msxsMvvtPv+wtYeIoYS92qEpc7W3rTLqfM2rhE469DN0
	O31sBIpUwIOfuwiWNFEic/RIuhBSficVpBHSHOTIZPhDnyfQgTQnXg20fHsyImnvt4SCE6FVBz4zO
	18oFf4z1qdR7Yk9z2RtBM4xsV+fuX/o/eDxEwAedI5io8ztwTXdgXbqAGs8YX5c36aQWVkAKEacj8
	Wng7FUE4tVF9tItPK/ljefV2MvXsWXmvZKipG04L5b3iT/HoSTtV/y/UYC4R6/DKoy4B3GoOoZs7Z
	/bMlgFWc7pTkdLIGqVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no7d2-00Fexz-GF; Mon, 09 May 2022 17:57:04 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no7ck-00FerJ-Fm; Mon, 09 May 2022 17:56:49 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Kxpl92yNNz4xdK;
 Tue, 10 May 2022 03:56:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kxpl40c0lz4xVP;
 Tue, 10 May 2022 03:56:31 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Tao Ren <rentao.bupt@gmail.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH v7 01/11] ARM: dts: aspeed: Adjust "reg" property of FMC/SPI
 controllers
Date: Mon,  9 May 2022 19:56:06 +0200
Message-Id: <20220509175616.1089346-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509175616.1089346-1-clg@kaod.org>
References: <20220509175616.1089346-1-clg@kaod.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_105646_732482_8EE74B55 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhpcyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIGN1cnJlbnQgZHJpdmVyIGFuZCBhZGRyZXNzZXMg
aXNzdWVzIHdoZW4KcnVubmluZyAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJy4KCkNjOiBDaGluLVRp
bmcgS3VvIDxjaGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPgpUZXN0ZWQtYnk6IEpvZWwgU3Rh
bmxleSA8am9lbEBqbXMuaWQuYXU+ClRlc3RlZC1ieTogVGFvIFJlbiA8cmVudGFvLmJ1cHRAZ21h
aWwuY29tPgpUZXN0ZWQtYnk6IEphZSBIeXVuIFlvbyA8cXVpY19qYWVoeW9vQHF1aWNpbmMuY29t
PgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgotLS0KIGFy
Y2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNC5kdHNpIHwgNiArKy0tLS0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL2FzcGVlZC1nNS5kdHNpIHwgOSArKystLS0tLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC1nNi5kdHNpIHwgOSArKystLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQt
ZzQuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNC5kdHNpCmluZGV4IGZhOGI1ODFj
M2Q2Yy4uM2I3Yjk4ZTc4N2U3IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQt
ZzQuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQpAQCAtNTQsOCAr
NTQsNyBAQCBhaGIgewogCQlyYW5nZXM7CiAKIAkJZm1jOiBzcGlAMWU2MjAwMDAgewotCQkJcmVn
ID0gPCAweDFlNjIwMDAwIDB4OTQKLQkJCQkweDIwMDAwMDAwIDB4MTAwMDAwMDAgPjsKKwkJCXJl
ZyA9IDwweDFlNjIwMDAwIDB4OTQ+LCA8MHgyMDAwMDAwMCAweDEwMDAwMDAwPjsKIAkJCSNhZGRy
ZXNzLWNlbGxzID0gPDE+OwogCQkJI3NpemUtY2VsbHMgPSA8MD47CiAJCQljb21wYXRpYmxlID0g
ImFzcGVlZCxhc3QyNDAwLWZtYyI7CkBAIC05MSw4ICs5MCw3IEBAIGZsYXNoQDQgewogCQl9Owog
CiAJCXNwaTogc3BpQDFlNjMwMDAwIHsKLQkJCXJlZyA9IDwgMHgxZTYzMDAwMCAweDE4Ci0JCQkJ
MHgzMDAwMDAwMCAweDEwMDAwMDAwID47CisJCQlyZWcgPSA8MHgxZTYzMDAwMCAweDE4PiwgPDB4
MzAwMDAwMDAgMHgxMDAwMDAwMD47CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCSNzaXpl
LWNlbGxzID0gPDA+OwogCQkJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjQwMC1zcGkiOwpkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9hc3BlZWQtZzUuZHRzaQppbmRleCA0MTQ3YjM5N2M4ODMuLjFlNzI3Y2JhYWIxNCAxMDA2
NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kKKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvYXNwZWVkLWc1LmR0c2kKQEAgLTU1LDggKzU1LDcgQEAgYWhiIHsKIAkJcmFuZ2Vz
OwogCiAJCWZtYzogc3BpQDFlNjIwMDAwIHsKLQkJCXJlZyA9IDwgMHgxZTYyMDAwMCAweGM0Ci0J
CQkJMHgyMDAwMDAwMCAweDEwMDAwMDAwID47CisJCQlyZWcgPSA8MHgxZTYyMDAwMCAweGM0Piwg
PDB4MjAwMDAwMDAgMHgxMDAwMDAwMD47CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCSNz
aXplLWNlbGxzID0gPDA+OwogCQkJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjUwMC1mbWMiOwpA
QCAtODQsOCArODMsNyBAQCBmbGFzaEAyIHsKIAkJfTsKIAogCQlzcGkxOiBzcGlAMWU2MzAwMDAg
ewotCQkJcmVnID0gPCAweDFlNjMwMDAwIDB4YzQKLQkJCQkweDMwMDAwMDAwIDB4MDgwMDAwMDAg
PjsKKwkJCXJlZyA9IDwweDFlNjMwMDAwIDB4YzQ+LCA8MHgzMDAwMDAwMCAweDA4MDAwMDAwPjsK
IAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJI3NpemUtY2VsbHMgPSA8MD47CiAJCQljb21w
YXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLXNwaSI7CkBAIC0xMDYsOCArMTA0LDcgQEAgZmxhc2hA
MSB7CiAJCX07CiAKIAkJc3BpMjogc3BpQDFlNjMxMDAwIHsKLQkJCXJlZyA9IDwgMHgxZTYzMTAw
MCAweGM0Ci0JCQkJMHgzODAwMDAwMCAweDA4MDAwMDAwID47CisJCQlyZWcgPSA8MHgxZTYzMTAw
MCAweGM0PiwgPDB4MzgwMDAwMDAgMHgwODAwMDAwMD47CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKIAkJCSNzaXplLWNlbGxzID0gPDA+OwogCQkJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjUw
MC1zcGkiOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kgYi9h
cmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQppbmRleCAzZDVjZTlkYTQyYzMuLjZhZTVk
ZmVjYmRmMSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kKKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kKQEAgLTk1LDggKzk1LDcgQEAgZ2lj
OiBpbnRlcnJ1cHQtY29udHJvbGxlckA0MDQ2MTAwMCB7CiAJCQl9OwogCiAJCWZtYzogc3BpQDFl
NjIwMDAwIHsKLQkJCXJlZyA9IDwgMHgxZTYyMDAwMCAweGM0Ci0JCQkJMHgyMDAwMDAwMCAweDEw
MDAwMDAwID47CisJCQlyZWcgPSA8MHgxZTYyMDAwMCAweGM0PiwgPDB4MjAwMDAwMDAgMHgxMDAw
MDAwMD47CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCSNzaXplLWNlbGxzID0gPDA+Owog
CQkJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC1mbWMiOwpAQCAtMTI0LDggKzEyMyw3IEBA
IGZsYXNoQDIgewogCQl9OwogCiAJCXNwaTE6IHNwaUAxZTYzMDAwMCB7Ci0JCQlyZWcgPSA8IDB4
MWU2MzAwMDAgMHhjNAotCQkJCTB4MzAwMDAwMDAgMHgxMDAwMDAwMCA+OworCQkJcmVnID0gPDB4
MWU2MzAwMDAgMHhjND4sIDwweDMwMDAwMDAwIDB4MTAwMDAwMDA+OwogCQkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CiAJCQkjc2l6ZS1jZWxscyA9IDwwPjsKIAkJCWNvbXBhdGlibGUgPSAiYXNwZWVk
LGFzdDI2MDAtc3BpIjsKQEAgLTE0Niw4ICsxNDQsNyBAQCBmbGFzaEAxIHsKIAkJfTsKIAogCQlz
cGkyOiBzcGlAMWU2MzEwMDAgewotCQkJcmVnID0gPCAweDFlNjMxMDAwIDB4YzQKLQkJCQkweDUw
MDAwMDAwIDB4MTAwMDAwMDAgPjsKKwkJCXJlZyA9IDwweDFlNjMxMDAwIDB4YzQ+LCA8MHg1MDAw
MDAwMCAweDEwMDAwMDAwPjsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJI3NpemUtY2Vs
bHMgPSA8MD47CiAJCQljb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXNwaSI7Ci0tIAoyLjM1
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
