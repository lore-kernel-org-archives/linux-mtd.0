Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607F5C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 06:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IW1RZINC/gDGqdnLiG3eXk5QYHITCSpIbw7AJYQ/1AY=; b=u2cnfDHISHFB5L
	LJy/d7K6dYoFa8MMwn6OUUH5lWkgv4HjfO6WYrO3NY99GmjIXz0rzDGaQHK3s9g8ShZ836kjS80Y7
	bQazddKU2AorFW43O9LVy6wj0Dj77JyTdwxWu406Zph0awo5n40sIUxhFWJr2qiNIgdV8rx/T9lGz
	XFS90TTKOplwk1EiijGzCTE8CgclOiVZDaJ6h78QPwBcbCuEblkXhMbo90TZOpFMq6Vj3OlEyBCF9
	9oDe2bubmzxxv0VOykkI9kh0LrUxmDDetNS4IW9+c3BBy8hYLZBbfZpRQGc7uIUZnnWo3LQOlYlFV
	8H2KeSMMI12GHPyHaOcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlliM-003pwC-Hn; Tue, 03 May 2022 06:08:50 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nllgb-003oxk-8I; Tue, 03 May 2022 06:07:03 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsqH75pfjz4ySs;
 Tue,  3 May 2022 16:06:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsqH21fgGz4xbw;
 Tue,  3 May 2022 16:06:53 +1000 (AEST)
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
Subject: [PATCH v6 02/11] dt-bindings: spi: Add Aspeed SMC controllers device
 tree binding
Date: Tue,  3 May 2022 08:06:25 +0200
Message-Id: <20220503060634.122722-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503060634.122722-1-clg@kaod.org>
References: <20220503060634.122722-1-clg@kaod.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_230701_498010_8F12E2F6 
X-CRM114-Status: GOOD (  14.98  )
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
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5mYThmNGFjMjA5ODUKLS0tIC9kZXYvbnVs
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
ICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM5IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCisgICAg
ICAgIGZsYXNoQDAgeworICAgICAgICAgICAgICAgIHJlZyA9IDwgMCA+OworICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CisgICAgICAgICAgICAgICAgc3BpLW1h
eC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworICAgICAgICAgICAgICAgIHNwaS1yeC1idXMtd2lk
dGggPSA8Mj47CisgICAgICAgIH07CisKKyAgICAgICAgZmxhc2hAMSB7CisgICAgICAgICAgICAg
ICAgcmVnID0gPCAxID47CisgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJqZWRlYyxzcGkt
bm9yIjsKKyAgICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47Cisg
ICAgICAgICAgICAgICAgc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKKyAgICAgICAgfTsKKworICAg
ICAgICBmbGFzaEAyIHsKKyAgICAgICAgICAgICAgICByZWcgPSA8IDIgPjsKKyAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOworICAgICAgICAgICAgICAgIHNwaS1t
YXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKyAgICAgICAgICAgICAgICBzcGktcngtYnVzLXdp
ZHRoID0gPDI+OworICAgICAgICB9OworICAgIH07CmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBi
L01BSU5UQUlORVJTCmluZGV4IGVkYzk2Y2RiODVlOC4uYWZiY2RhMjc0M2Y4IDEwMDY0NAotLS0g
YS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMzEwMSw2ICszMTAxLDE1IEBAIFM6
CU1haW50YWluZWQKIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYXNw
ZWVkLHNkaGNpLnlhbWwKIEY6CWRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXNwZWVkKgogCitB
U1BFRUQgU01DIFNQSSBEUklWRVIKK006CUNoaW4tVGluZyBLdW8gPGNoaW4tdGluZ19rdW9AYXNw
ZWVkdGVjaC5jb20+CitNOglDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgorTDoJbGlu
dXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmliZXJz
KQorTDoJb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3Jp
YmVycykKK0w6CWxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmcKK1M6CU1haW50YWluZWQKK0Y6CURv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlh
bWwKKwogQVNQRUVEIFZJREVPIEVOR0lORSBEUklWRVIKIE06CUVkZGllIEphbWVzIDxlYWphbWVz
QGxpbnV4LmlibS5jb20+CiBMOglsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKLS0gCjIuMzUu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
