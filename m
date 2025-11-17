Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10764CEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nyFGq1a75NQHtgzhOIvtfbL63L2bb1Ss8W5UEHBRR2s=; b=E7W3FxbNj1M7nI
	85DxE2x3/76SXHVwrxtGns3BPxHavaCC+jXPI6USaIj3lc7g4fxngJiTqd2QiT5p1KAqjU8tjT18L
	EjGpgij5sNCgvvnsUb1Dgdwtle/Dpfefrym1UJu1m782opNAOM1hsUYQzs9qKEBk51HdptThf3XZV
	rO0+SxL9jKhBoUtbjq6J141vTweRHFbc581cQ57j6WPpTkAS0DfXqRXa99WEmPj7qTA81tpxhPSLf
	QF15SYQFHUXVRmuw3geQbgAZ9R4SPxBoNnU8IQOcHnrENlJN7qy+yGDf4e2yze6fTPNv20cSrr3Vf
	APFD89II0UmWPNdKzO2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxDf-0000000FxNf-3EoZ;
	Mon, 17 Nov 2025 11:16:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxDb-0000000FxNA-3Rzj
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 11:16:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9FDBCC12641;
	Mon, 17 Nov 2025 11:15:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B16AA606B9;
	Mon, 17 Nov 2025 11:16:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8ACE010371CD4;
	Mon, 17 Nov 2025 12:16:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763378179; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5zD0x5QAECEJDlIR8UuDYP8ME1YYTXO8g6pQABpEw04=;
	b=a4snqPjimbLEf2HKgIDHsGAU4zuDAX+f9/YIqBpaU/6aZ3xzX0gDdYciqYns0YvKX/i38n
	MpqkgOEM2E1rnBtbx0qAhU2PNqa++madd5N3kB7rnA/bUzJBWfcFY8c/dkz+HKGBYnEipK
	yGQxTAH5hd74zM7vI+VO2v6iRaKW8HZuVPW+/qfA0RUzbD85aQ63g+0wj/+f6PEw4Z1D9u
	a4SZtF/SR2J21H3NMX0V7fv1HrumzzniUQgWY4I6ztKayAWlpPyOBZTq4+/iiaT6E/N9s7
	aBGTTlWPRpT078PX26d6rOaBeGAqiOIPbwANhepobX9Dw1qROeStFzj7yws6Sw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Fixes for 6.18-rc7
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 17 Nov 2025 12:16:14 +0100
Message-ID: <87fracewox.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_031624_039238_D77AD3E4 
X-CRM114-Status: UNSURE (   7.66  )
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

SGVsbG8sCgpUaGlzIGlzIGEgTVREIGZpeGVzIFBSIGZvciA2LjE4LXJjNy4KClRoYW5rcywKTWlx
dcOobAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzYTg2NjA4Nzg4MzlmYWFk
YjRmMWE2ZGQ3MmMzMTc5YzFkZjU2Nzg3OgoKICBMaW51eCA2LjE4LXJjMSAoMjAyNS0xMC0xMiAx
Mzo0MjozNiAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4
LmdpdCB0YWdzL210ZC9maXhlcy1mb3ItNi4xOC1yYzcKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdl
cyB1cCB0byA5NzMxNWU3YzkwMWExZGU2MGU4Y2E5YjExZTBlOTZkMGY5MjUzZTE4OgoKICBtdGQ6
IG9uZW5hbmQ6IFBhc3MgY29ycmVjdCBwb2ludGVyIHRvIElSUSBoYW5kbGVyICgyMDI1LTExLTAz
IDExOjM3OjU3ICswMTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNb3N0bHkgc21hbGwgbWlzYyBmaXhlcywgaGVyZSB0
aGV5IGFyZSBzb3J0ZWQgYnkgc3ViLXN1YnN5c3RlbToKCkVDQyBmaXhlczoKLSBSZWFsdGVrIEtj
b25maWcgZml4CgpTUEkgTkFORCBmaXhlczoKLSBSZW1vdmUgdW5leGlzdGVudCBRRSBiaXQgb24g
Rk1TSCBGTTI1UzAxQQoKUmF3IE5BTkQgZml4ZXM6Ci0gUHJldmVudCBETUEgZGV2aWNlIE5VTEwg
cG9pbnRlciBkZXJlZmVyZW5jZSBpbiBDYWRlbmNlIGRyaXZlcgoKTVREIGRldmljZXMgZml4ZXM6
Ci0gUG9zc2libGUgaW50ZWdlciBvdmVyZmxvdyBpbiByZWFkL3dyaXRlIGlvY3RscwotIEZpeCB0
aGUgSVJRIGhhbmRsZXIgcG9pbnRlciBpbiB0aGUgb25lbmFuZCBkcml2ZXIsIGV2ZW4gaWYgaW4g
cHJhY3RpY2UKICBpdCBpcyBuZXZlciBkZXJlZmVyZW5jZWQuCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkRhbiBDYXJwZW50
ZXIgKDMpOgogICAgICBtdGRjaGFyOiBmaXggaW50ZWdlciBvdmVyZmxvdyBpbiByZWFkL3dyaXRl
IGlvY3RscwogICAgICBtdGQ6IG5hbmQ6IHJlYWx0ZWstZWNjOiBGaXggYSBJU19FUlIoKSB2cyBO
VUxMIGJ1ZyBpbiBwcm9iZQogICAgICBtdGQ6IG9uZW5hbmQ6IFBhc3MgY29ycmVjdCBwb2ludGVy
IHRvIElSUSBoYW5kbGVyCgpHZWVydCBVeXR0ZXJob2V2ZW4gKDEpOgogICAgICBtdGQ6IG5hbmQ6
IE1URF9OQU5EX0VDQ19SRUFMVEVLIHNob3VsZCBkZXBlbmQgb24gSEFTX0RNQQoKTGkgUWlhbmcg
KDEpOgogICAgICBtdGQ6IHJhd25hbmQ6IHJlYWx0ZWs6IE1ha2UgcnRsX2VjY19lbmdpbmVfb3Bz
IGNvbnN0CgpNaWtoYWlsIEtzaGV2ZXRza2l5ICgxKToKICAgICAgbXRkOiBzcGluYW5kOiBmbXNo
OiByZW1vdmUgUUUgYml0IGZvciBGTTI1UzAxQSBmbGFzaAoKTmlyYXZrdW1hciBMIFJhYmFyYSAo
MSk6CiAgICAgIG10ZDogcmF3bmFuZDogY2FkZW5jZTogZml4IERNQSBkZXZpY2UgTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlCgogZHJpdmVycy9tdGQvbXRkY2hhci5jICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDYgKysrKy0tCiBkcml2ZXJzL210ZC9uYW5kL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgIHwgMiArLQogZHJpdmVycy9tdGQvbmFuZC9lY2MtcmVhbHRlay5jICAgICAgICAg
ICAgICAgICB8IDYgKysrLS0tCiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9zYW1z
dW5nLmMgICAgIHwgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FkZW5jZS1uYW5kLWNvbnRy
b2xsZXIuYyB8IDMgKystCiBkcml2ZXJzL210ZC9uYW5kL3NwaS9mbXNoLmMgICAgICAgICAgICAg
ICAgICAgIHwgMiArLQogNiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
