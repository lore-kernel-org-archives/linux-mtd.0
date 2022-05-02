Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EB4C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 08:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPXBYbyM4tBUDrPb0CAcKa5ePKeu2BdBCKCjS4Uh+YU=; b=VByJozY3ei4UlE
	nvHRK0DnABUZ5BOvXzORtSnWd9ZUvYAb/3EFPoIw8jaQ28aH/lHOsx4MjmS5JXOf2ZRByqO+549ah
	PaXf+YYDD8ku6rc+1jsKn3A4x8B3TFgrddhK1Iyz7hUfJ9DJG1F0wM0MD9XbxXJ3Fr2Sote2WNBTW
	O1yygEJ6+2KKx+WnYGutsQvfxP2QMUOkY7z3IOCVGO750a7iihl8chgBa9LZs9zdwLJqDvFyAyMRt
	J2yf7gLB5aqTJj0K5QrYi3XPz4LgOmFGh9pTGvtGw2+xa0CT+bOfHXyVjzdEL1wU+9k1aYKkH0m3+
	f+h3HepYz2mJK0lVvOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlRCd-000G7Y-Q1; Mon, 02 May 2022 08:14:43 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlRC2-000FrQ-6c; Mon, 02 May 2022 08:14:08 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsG8D6dZxz4ySx;
 Mon,  2 May 2022 18:14:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsG872SpXz4x7Y;
 Mon,  2 May 2022 18:13:59 +1000 (AEST)
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
 Tao Ren <rentao.bupt@gmail.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v5 02/11] dt-bindings: spi: Add Aspeed SMC controllers device
 tree binding
Date: Mon,  2 May 2022 10:13:32 +0200
Message-Id: <20220502081341.203369-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502081341.203369-1-clg@kaod.org>
References: <20220502081341.203369-1-clg@kaod.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_011406_444799_777BBD94 
X-CRM114-Status: GOOD (  15.19  )
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

VGhlICJpbnRlcnJ1cHQiIHByb3BlcnR5IGlzIG9wdGlvbmFsIGJlY2F1c2UgaXQgaXMgb25seSBu
ZWNlc3NhcnkgZm9yCmNvbnRyb2xsZXJzIHN1cHBvcnRpbmcgRE1BcyAoTm90IGltcGxlbWVudGVk
IHlldCBpbiB0aGUgbmV3IGRyaXZlcikuCgpDYzogQ2hpbi1UaW5nIEt1byA8Y2hpbi10aW5nX2t1
b0Bhc3BlZWR0ZWNoLmNvbT4KVGVzdGVkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1
PgpUZXN0ZWQtYnk6IFRhbyBSZW4gPHJlbnRhby5idXB0QGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBK
YWUgSHl1biBZb28gPHF1aWNfamFlaHlvb0BxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEpvZWwg
U3RhbmxleSA8am9lbEBqbXMuaWQuYXU+ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3Jn
PgotLS0KIC4uLi9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwgICAgICB8IDgy
ICsrKysrKysrKysrKysrKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA5ICsrCiAyIGZpbGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2Fz
cGVlZCxhc3QyNjAwLWZtYy55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi40MmE1NmYzYzMzN2MKLS0tIC9kZXYvbnVs
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3Qy
NjAwLWZtYy55YW1sCkBAIC0wLDAgKzEsODIgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFtbCMKKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRs
ZTogQXNwZWVkIFNNQyBjb250cm9sbGVycyBiaW5kaW5ncworCittYWludGFpbmVyczoKKyAgLSBD
aGluLVRpbmcgS3VvIDxjaGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPgorICAtIEPDqWRyaWMg
TGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+CisKK2Rlc2NyaXB0aW9uOiB8CisgIFRoaXMgYmluZGlu
ZyBkZXNjcmliZXMgdGhlIEFzcGVlZCBTdGF0aWMgTWVtb3J5IENvbnRyb2xsZXJzIChGTUMgYW5k
CisgIFNQSSkgb2YgdGhlIEFTVDI0MDAsIEFTVDI1MDAgYW5kIEFTVDI2MDAgU09Dcy4KKworYWxs
T2Y6CisgIC0gJHJlZjogInNwaS1jb250cm9sbGVyLnlhbWwjIgorCitwcm9wZXJ0aWVzOgorICBj
b21wYXRpYmxlOgorICAgIGVudW06CisgICAgICAtIGFzcGVlZCxhc3QyNjAwLWZtYworICAgICAg
LSBhc3BlZWQsYXN0MjYwMC1zcGkKKyAgICAgIC0gYXNwZWVkLGFzdDI1MDAtZm1jCisgICAgICAt
IGFzcGVlZCxhc3QyNTAwLXNwaQorICAgICAgLSBhc3BlZWQsYXN0MjQwMC1mbWMKKyAgICAgIC0g
YXNwZWVkLGFzdDI0MDAtc3BpCisKKyAgcmVnOgorICAgIGl0ZW1zOgorICAgICAgLSBkZXNjcmlw
dGlvbjogcmVnaXN0ZXJzCisgICAgICAtIGRlc2NyaXB0aW9uOiBtZW1vcnkgbWFwcGluZworCisg
IGNsb2NrczoKKyAgICBtYXhJdGVtczogMQorCisgIGludGVycnVwdHM6CisgICAgbWF4SXRlbXM6
IDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGNsb2NrcworCit1
bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgorICAgICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hc3BlZWQtc2N1LWljLmg+
CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2FzdDI2MDAtY2xvY2suaD4KKworICAg
IHNwaUAxZTYyMDAwMCB7CisgICAgICAgIHJlZyA9IDwweDFlNjIwMDAwIDB4YzQ+LCA8MHgyMDAw
MDAwMCAweDEwMDAwMDAwPjsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAg
ICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAw
LWZtYyI7CisgICAgICAgIGNsb2NrcyA9IDwmc3lzY29uIEFTUEVFRF9DTEtfQUhCPjsKKyAgICAg
ICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM5IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCisJZmxh
c2hAMCB7CisgICAgICAgICAgICAgICAgcmVnID0gPCAwID47CisgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKKyAgICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1
ZW5jeSA9IDw1MDAwMDAwMD47CisgICAgICAgICAgICAgICAgc3BpLXJ4LWJ1cy13aWR0aCA9IDwy
PjsKKyAgICAgICAgfTsKKworCWZsYXNoQDEgeworICAgICAgICAgICAgICAgIHJlZyA9IDwgMSA+
OworICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CisgICAgICAg
ICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworICAgICAgICAgICAgICAg
IHNwaS1yeC1idXMtd2lkdGggPSA8Mj47CisgICAgICAgIH07CisKKwlmbGFzaEAyIHsKKyAgICAg
ICAgICAgICAgICByZWcgPSA8IDIgPjsKKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImpl
ZGVjLHNwaS1ub3IiOworICAgICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAw
MDAwPjsKKyAgICAgICAgICAgICAgICBzcGktcngtYnVzLXdpZHRoID0gPDI+OworICAgICAgICB9
OworICAgIH07CmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDVl
OGMyZjYxMTc2Ni4uM2Q3NGI1MDEwY2JiIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9N
QUlOVEFJTkVSUwpAQCAtMzEwMCw2ICszMTAwLDE1IEBAIFM6CU1haW50YWluZWQKIEY6CURvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYXNwZWVkLHNkaGNpLnlhbWwKIEY6CWRy
aXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXNwZWVkKgogCitBU1BFRUQgU01DIFNQSSBEUklWRVIK
K006CUNoaW4tVGluZyBLdW8gPGNoaW4tdGluZ19rdW9AYXNwZWVkdGVjaC5jb20+CitNOglDw6lk
cmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgorTDoJbGludXgtYXNwZWVkQGxpc3RzLm96bGFi
cy5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmliZXJzKQorTDoJb3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKK0w6CWxpbnV4LXNwaUB2
Z2VyLmtlcm5lbC5vcmcKK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwKKwogQVNQRUVEIFZJREVPIEVO
R0lORSBEUklWRVIKIE06CUVkZGllIEphbWVzIDxlYWphbWVzQGxpbnV4LmlibS5jb20+CiBMOgls
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKLS0gCjIuMzUuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
