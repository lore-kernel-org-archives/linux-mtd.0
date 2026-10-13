Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F34CC6B0E
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4GSKDsukh2r1Jw9LmpH0Tbq2ADylBCxwdo1Z+NCUCw=; b=r+lm1i/7McC0A6
	VrWrxPRUAbW+jxog6hWGOeYCZWUPNPVNs6au10MBKu4hC1akBSHoy9PCey858bA3r65v7YUgLAvFF
	6WQ0qn8hvWPAOiaGVt5dlPV42EghfdKPc6rd0S8QMd2BCsI4JrS/iQr7lZVXtdUyVsXxrf3vfdzF3
	IvJ40c6fWBXjQppFEpMhLa3JXcqQXXWkzMQsZ4pKD/E6BMS8u+yqjNtL6eKcS+LNfcZDg4+XyzV17
	n186IUTbtnRwTfHqnmJS8TQf+0dqMZP6xKFNl0nIm+jcQ3a2kfSG0sATPRqRq/iDYiUdMxB+aqIuk
	CGEO0UlNgWXULjCng+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGf8v-0000000DTSN-0pWI;
	Tue, 13 Oct 2026 16:14:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGf8t-0000000DTSH-2uCR
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:14:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F7B943504;
	Tue, 13 Oct 2026 16:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895811F00893;
	Tue, 13 Oct 2026 16:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791908059;
	bh=6eyKpebv9TNIamEQgEHHHdcK9YmxDbNespoq0cpqeKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hseo+l/Z9mKx8QucAduEXzzhY5atMvnlEus5jocV418Rom6Xa/ikScVumoi/vmIyC
	 s4zg4qJlNEVnVqOU5sDj9a3k8ClyXExi6wH3ep1jM65xjgFiA2cNFShTaFpVGuWT7r
	 5rkzo2eRh8pNI7rMmYzWKVUsFj0C/FmfBmS1f/4R8WPSozJ6b9TC+WrvECg5N2A0mj
	 Zq2cUzoPZ/4vUGC1/TSYaXGavHLm9Mevrgtz009H0ufcWuHhNRA147wds3bkeX/zcS
	 EVm+uFxwjFcBayQM2jpCSytT/ui/lwUmKTPL1lIQF+8uRqAxAnHQUDyjPJDGj/3SoM
	 4cdW1tnb1hbwQ==
Message-ID: <sashiko-outbox-170101@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: micron-st: Add support for is25wx01g
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, linux-mtd@lists.infradead.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
In-Reply-To: <20261013-mtd-spi-nor-new-issi-chip-v3-1-099c58673142@analog.com>
References: <20261013-mtd-spi-nor-new-issi-chip-v3-1-099c58673142@analog.com>
Date: Tue, 13 Oct 2026 16:14:18 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBzcGktbm9y
OiBJU1NJIGZsYXNoIHN5c2ZzIG1hbnVmYWN0dXJlciBpbmNvcnJlY3RseSBleHBvc2VkIGFzIG1p
Y3JvbgotLQoKY29tbWl0IDFlMDNhZGU3NzdmOTdiMGIwNWFlNjcwYjY1Y2FhMDBkYWI0NzkxN2IK
QXV0aG9yOiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgoKbXRkOiBzcGktbm9yOiBtaWNy
b24tc3Q6IEFkZCBzdXBwb3J0IGZvciBpczI1d3gwMWcKCkFkZCBzdXBwb3J0IGZvciB0aGUgSVNT
SSBJUzI1V1gwMUcsIGEgMSBHYml0ICgxMjggTWlCKSBvY3RhbCBOT1IgZmxhc2guClRoZSBwYXJ0
IGlzIGZ1bGx5IGRlc2NyaWJlZCBieSBTRkRQLCBzbyBvbmx5IHRoZSBmbGFzaCBJRCBhbmQgYSBz
bWFsbApwb3N0X2JmcHQgZml4dXAgYXJlIG5lZWRlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvbWljcm9uLXN0LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5j
Cj4gaW5kZXggZjk3ZjJkZWFkOGMyZi4uZWJhMDdlZmRjYTc1MyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9t
aWNyb24tc3QuYwo+IEBAIC0yMTYsOSArMjE2LDM0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxh
c2hfaW5mbyBtaWNyb25fbm9yX3BhcnRzW10gPSB7Cj4gIAkJLnNpemUgPSBTWl8yNTZNLAo+ICAJ
CS5ub19zZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfT0NUQUxfUkVBRCwKPiAgCQkubWZy
X2ZsYWdzID0gVVNFX0ZTUiwKPiArCX0sIHsKPiArCQkvKiBpczI1d3gwMWcgKi8KPiArCQkuaWQg
PSBTTk9SX0lEKDB4OWQsIDB4NWIsIDB4MWIpLAo+ICsJCS5zZWN0b3Jfc2l6ZSA9IFNaXzEyOEss
Cj4gKwkJLmZsYWdzID0gU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCIHwgU1BJX05P
Ul80QklUX0JQIHwKPiArCQkJIFNQSV9OT1JfQlAzX1NSX0JJVDYsCj4gKwkJLm1mcl9mbGFncyA9
IFVTRV9GU1IsCj4gIAl9LAo+ICB9OwoKW1NldmVyaXR5OiBNZWRpdW1dCldpbGwgdGhpcyBpbmNv
cnJlY3RseSBleHBvc2UgdGhlIElTU0kgZmxhc2ggbWFudWZhY3R1cmVyIGFzICJtaWNyb24iIGlu
IHN5c2ZzPwoKQnkgcGxhY2luZyB0aGUgSVNTSSBjaGlwIGluc2lkZSB0aGUgbWljcm9uX25vcl9w
YXJ0c1tdIGFycmF5LCBpdCBsb29rcyBsaWtlIGl0cwptYW51ZmFjdHVyZXIgaWRlbnRpdHkgd2ls
bCBiZSBoYXJkY29kZWQgdG8gTWljcm9uLgoKV2hlbiBzcGlfbm9yX21hdGNoX2lkKCkgbWF0Y2hl
cyB0aGUgSUQsIGl0IHVuY29uZGl0aW9uYWxseSBsaW5rcyB0aGUgc3lzZnMKbWFudWZhY3R1cmVy
IHN0cmluZyB0byB0aGUgYXJyYXkgdGhlIGNoaXAgcmVzaWRlcyBpbjoKCmRyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jOnNwaV9ub3JfbWF0Y2hfaWQoKSB7CiAgICAuLi4KCQlpZiAocGFydC0+aWQg
JiYKCQkgICAgIW1lbWNtcChwYXJ0LT5pZC0+Ynl0ZXMsIGlkLCBwYXJ0LT5pZC0+bGVuKSkgewoJ
CQlub3ItPm1hbnVmYWN0dXJlciA9IG1hbnVmYWN0dXJlcnNbaV07CgkJCXJldHVybiBwYXJ0OwoJ
CX0KICAgIC4uLgp9CgpDb3VsZCB0aGlzIGJyZWFrIHN5c2ZzIEFCSSBleHBlY3RhdGlvbnMgZm9y
IGlkZW50aWZ5aW5nIHRoZSBjaGlwJ3MgdHJ1ZQptYW51ZmFjdHVyZXI/IFRoaXMgYWxzbyBzZWVt
cyB0byBjb250cmFkaWN0IHRoZSB0ZXN0IG91dHB1dCBpbiB0aGUgcGF0Y2gKbm90ZXMgd2hpY2gg
c2hvd3MgdGhlIG1hbnVmYWN0dXJlciBzeXNmcyBhdHRyaWJ1dGUgcmV0dXJuaW5nICJpc3NpIi4K
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjEwMTMtbXRkLXNwaS1ub3ItbmV3LWlzc2ktY2hpcC12My0xLTA5OWM1ODY3MzE0MkBhbmFs
b2cuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
