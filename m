Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71167D44167
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Nov 2024 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QAs4tfKC0OSoj4JKSHWuWFyz7uBx3snDbDiQOQT0oCA=; b=TZmOzehdV8ez0Q
	/EcrMGmMNE4y0OCMc9as23xsomPswNox40lTGDsOIUgYkuA1l3PXvJ2gLEJ1bUMCxkrsGU5QzpjQi
	Af3f8g1489mrV97Q3dQySfME28z6Tjv0+jZyMS432tn2LIQKZ9bWczsV+hOmEk84fe+K5pNPBfNmB
	99DMHCDJO242lLCfjVfzxQ6C3z33igZLX4LzncGWhVYgRHH76dfzIKVd3dKhvntfoYlrgfJ9KsHkk
	fv5OJwX+vdvRTeMdi46L9gFhjZaeXi6ZL44LTzFccRA9wFx61XatdgXWBdBsJTJQSyvUg/OMYLYec
	YM2gzubD20dp+QBo7zaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQ1T-0000000Cpwo-46qP;
	Tue, 19 Nov 2024 15:20:11 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPug-0000000CoJK-46Qt
	for linux-mtd@lists.infradead.org;
	Tue, 19 Nov 2024 15:13:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F25FFF80A;
	Tue, 19 Nov 2024 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732029187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0fLVMUA1Ubbixg33NXYaOb3PKrEpVeIQ2V3aHvWHe4k=;
	b=FAqorVgnZSPXlfxl29nFmil+GuTVG24rVTK2hRoU1FDm5vhA9hLyo474xn6ZvJTG6z+v4d
	/feDwvHa24eE5EhYHn8GB4hfcHLD6/oZsRVh/LV7dqT/F1gFPyQwGth/9LHG5NGZgtsCLF
	aat4PUXa6iJxVQQSW9KGqEreFEtgYZdJ1g/GvN5XGTR9NohtHYpbbCfhjuVSY0ZTL30PTd
	xaz9d2ZDIUNY3VTnxIaIpIyJZ/vM83sHH+4Z+s16llYku8PdEL1Ep5RU/WJ2C1O8HOMjIQ
	v2QKz4bPgfCYc10bUkJThAX4XHHnFLJWG1oJykWVXisl/6AwasAciZb3hWOqPQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: nand: Changes for 6.13
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 19 Nov 2024 16:13:05 +0100
Message-ID: <87ttc3z27y.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_071311_307112_DC3A33F2 
X-CRM114-Status: UNSURE (   8.74  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpUaGlzIGlzIHRoZSBOQU5EIFBSIGZvciA2LjEzLgoKVGhhbmtzLApNaXF1w6hsCgpU
aGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDk4NTJkODVlYzlkNDkyZWJlZjU2ZGM1
ZjIyOTQxNmM5MjU3NThlZGM6CgogIExpbnV4IDYuMTItcmMxICgyMDI0LTA5LTI5IDE1OjA2OjE5
IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRh
Z3MvbmFuZC9mb3ItNi4xMwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGFmMjY0ZTU5
ODkwNTVhYzMzZjQxM2M0YzgwODc0MzQ1Y2RhMGNjOTc6CgogIG10ZDogc3BpbmFuZDogQ29uc3Rp
Znkgc3RydWN0IG5hbmRfZWNjX2VuZ2luZV9vcHMgKDIwMjQtMTAtMjEgMTE6NTU6NTAgKzAyMDAp
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tClNQSS1OQU5EIGNoYW5nZXM6CkEgbG9hZCBvZiBmaXhlcyB0byBXaW5ib25kIG1h
bnVmYWN0dXJlciBkcml2ZXIgaGF2ZSBiZWVuIGRvbmUsIHBsdXMgYQpzdHJ1Y3R1cmUgY29uc3Rp
ZmljYXRpb24uCgpSYXcgTkFORCBjaGFuZ2VzOgpUaGUgR1BNSSBkcml2ZXIgaGFzIGJlZW4gaW1w
cm92ZWQgb24gdGhlIHBvd2VyIG1hbmFnZW1lbnQgc2lkZS4KVGhlIERhdmluY2kgZHJpdmVyIGhh
cyBiZWVuIGNsZWFuZWQgdXAuCkEgbGVhayBpbiB0aGUgQXRtZWwgZHJpdmVyIHBsdXMgc29tZSB0
eXBvcyBpbiB0aGUgY29yZSBoYXZlIGJlZW4gZml4ZWQuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkJhcnRvc3ogR29sYXN6
ZXdza2kgKDMpOgogICAgICBtdGQ6IHJhd25hbmQ6IGRhdmluY2k6IG9yZGVyIGhlYWRlcnMgYWxw
aGFiZXRpY2FsbHkKICAgICAgbXRkOiByYXduYW5kOiBkYXZpbmNpOiBicmVhayB0aGUgbGluZSBj
b3JyZWN0bHkKICAgICAgbXRkOiByYXduYW5kOiBkYXZpbmNpOiB1c2UgZ2VuZXJpYyBkZXZpY2Ug
cHJvcGVydHkgaGVscGVycwoKQ2hyaXN0b3BoZSBKQUlMTEVUICgxKToKICAgICAgbXRkOiBzcGlu
YW5kOiBDb25zdGlmeSBzdHJ1Y3QgbmFuZF9lY2NfZW5naW5lX29wcwoKSGFuIFh1ICgzKToKICAg
ICAgbXRkOiBuYW5kOiByYXc6IGdwbWk6IHN3aXRjaCB0byBTWVNURU1fU0xFRVBfUE1fT1BTCiAg
ICAgIG10ZDogbmFuZDogcmF3OiBncG1pOiBpbXByb3ZlIHBvd2VyIG1hbmFnZW1lbnQgaGFuZGxp
bmcKICAgICAgTUFJTlRBSU5FUlM6IGFkZCBtYWlsaW5nIGxpc3QgZm9yIEdQTUkgTkFORCBkcml2
ZXIKCk1pcXVlbCBSYXluYWwgKDUpOgogICAgICBtdGQ6IHJhd25hbmQ6IGF0bWVsOiBGaXggcG9z
c2libGUgbWVtb3J5IGxlYWsKICAgICAgbXRkOiBzcGluYW5kOiB3aW5ib25kOiBGaXggNTEyR1cg
YW5kIDAySlcgT09CIGxheW91dAogICAgICBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IEZpeCA1MTJH
VywgMDFHVywgMDFKVyBhbmQgMDJKVyBFQ0MgaW5mb3JtYXRpb24KICAgICAgbXRkOiBzcGluYW5k
OiB3aW5ib25kOiBJZ25vcmUgdGhlIGxhc3QgSUQgY2hhcmFjdGVycwogICAgICBtdGQ6IHNwaW5h
bmQ6IHdpbmJvbmQ6IFNvcnQgdGhlIGRldmljZXMKClNoZW4gTGljaHVhbiAoMSk6CiAgICAgIG10
ZDogcmF3bmFuZDogQ29ycmVjdCBtdWx0aXBsZSB0eXBvcyBpbiBjb21tZW50cwoKIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9t
dGQvbmFuZC9lY2MtbXhpYy5jICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9t
dGQvbmFuZC9lY2Mtc3ctYmNoLmMgICAgICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9t
dGQvbmFuZC9lY2Mtc3ctaGFtbWluZy5jICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvYXRtZWwvcG1lY2MuYyAgICAgICAgICAgICB8ICAgOCArLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvYXRtZWwvcG1lY2MuaCAgICAgICAgICAgICB8ICAgMiAtCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jICAgICAgIHwgICAyICstCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9jYWRlbmNlLW5hbmQtY29udHJvbGxlci5jIHwgICAyICstCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9jczU1M3hfbmFuZC5jICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9kYXZpbmNpX25hbmQuYyAgICAgICAgICAgIHwgIDU4ICsrKysrKy0tLS0tLS0K
IGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyAgICAgfCAgNjUgKysr
KysrKy0tLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYyAgICAgICAg
ICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5j
ICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYyAgICAgICAgICAgICAgICAg
ICAgfCAgIDQgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3NtX2NvbW1vbi5jICAgICAgICAgICAg
ICAgfCAgIDQgKy0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAgICAgICAgICAgICAgICAg
ICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYyAgICAgICAgICAgICAg
ICAgfCAxMTMgKysrKysrKysrKysrKystLS0tLS0tLS0tLQogZHJpdmVycy9zcGkvc3BpLW10ay1z
bmZpLmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9zcGkvc3BpLW14aWMu
YyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArLS0KIGluY2x1ZGUvbGludXgvbXRkL25h
bmQtZWNjLW14aWMuaCAgICAgICAgICAgICAgfCAgIDQgKy0KIGluY2x1ZGUvbGludXgvbXRkL25h
bmQuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIDIxIGZpbGVzIGNoYW5nZWQsIDE1
MyBpbnNlcnRpb25zKCspLCAxNDIgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
