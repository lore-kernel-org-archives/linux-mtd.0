Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26CAC44523
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IUQ2tQZJFSAFSe4efbp/pPsvo//PlukxmBp4yFdtMgA=; b=R8NTIXT+5CzsUI
	DgcWbJvaIg1tjHwr8vPeXcQ5kIGVyG65BR4DGNlpWhOD9OD3vL5OkUln1pcCC1CXpUvSRulo0MIub
	XSxPXGFOaFIjukDhZ16m82c78nvQ8t619TUrFDImhUsZ4W9MCCpcgR6JKz8vbGELTExkWj+KrsCNs
	t2S8vdB4SHI/Yqt28VBPiCM9wwXT8IGogXkakr5LUDccZjCFhXnaiT/GFFPHMFx8IeSPl4R4ZExTz
	9q/L0m7o4cQlBN69d3GH0+E+l6wJK0HkvUsVeC2h2fdvfl3eJGOJfhF/cUzH3fGaObeCSfZvRxb/3
	6N8KowpMzmqd6umrbMhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkklN-00000002eF4-04sm;
	Fri, 17 Jul 2026 15:46:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkklK-00000002eEb-0w3v
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:46:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 600994E40E1F;
	Fri, 17 Jul 2026 15:46:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D51060361;
	Fri, 17 Jul 2026 15:46:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DEABB11BD0D05;
	Fri, 17 Jul 2026 17:45:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=60dv/NQOElMiQKNY9sUNsnTIiAzsgvykNHqlWxvOWTo=;
	b=0QsHsbW6X0yZ17F7ylhr0fvDXDSoJMHmgU5WHCOwXbm/7BRFPGlvR7WA/ZivfR/r02dLqd
	z8E66TdVCx2sGD/snaukPcY2bjYnMoDwZSEqkiHz842Af/z0g/oAHUA4CkAaR03qMymRy0
	8oFcDRPulzTJIu7lfU9LbffK6VEyFW5masnnZbJSNKx0sxBXwh+Hc3SN7+xoEMxiW2UAH1
	FXpgqUYw5e1nURgah/bwC7yGYbVBVUwQFd5/Wg2xuGfnSpst41vtToqddPpQ0K+gR/leGc
	l+FhTJbg6mkBBeyymNG8yFodjcIgCvP8aTbqtdYP3S7uGG3SNQb6FKw06+IxjQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Fixes for 7.2-rc4
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 17:45:57 +0200
Message-ID: <87wluthb62.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_084606_409912_9B385371 
X-CRM114-Status: UNSURE (   8.39  )
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

SGVsbG8sCgpUaGlzIGlzIGEgZml4ZXMgTVREIFBSIGZvciA3LjItcmM0LgoKVGhhbmtzLApNaXF1
w6hsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGRjNTllNGZlYTlkODNmMDNi
YWQ2YmRkZjNmYTJlNTI0OTE3Nzc0ODI6CgogIExpbnV4IDcuMi1yYzEgKDIwMjYtMDYtMjggMTI6
MDE6MzEgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5n
aXQgdGFncy9tdGQvZml4ZXMtZm9yLTcuMi1yYzQKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byAyYjUzM2U3NzVhZWM1ODBjZjYwMDc0NDE3ZjRjYTAwYWM5Y2YzNTgwOgoKICBSZXZlcnQg
Im10ZDogbWFwczogcmVtb3ZlIHVjbGludXggbWFwIGRyaXZlciIgKDIwMjYtMDctMDMgMTU6NDY6
MjggKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCkFtb25nIHRoZSBtb3N0IGltcG9ydGFudCBmaXhlcyB0aGF0IHdl
IGhhdmUgaGVyZSwgdGhlcmUgYXJlOgotIHRoZSByZXZlcnQgb2YgdGhlIHVjbGludXggbWFwIGRy
aXZlciB3aGljaCB3YXMgcHJlc3VtYWJseSBubyBsb25nZXIKICB1c2VkIGJ1dCBpbiBmYWN0IHdh
cwotIHRoZSB1c2Ugb2YgU1BJIG1hdGNoIGRhdGEgdG8gZ2V0IGNoaXAgY2FwYWJpbGl0aWVzIGlu
IHRoZSBtY2hwMjNrMjU2CiAgZHJpdmVyCi0gc2V2ZXJhbCBmaXhlcyBhZGRyZXNzaW5nIHRoZSBu
ZXdseSBpbnRyb2R1Y2VkIHZpcnQtY29uY2F0IHN1cHBvcnQKLSBhIG1pc3NpbmcgYnVpbGQgZGVw
ZW5kZW5jeSBvbiBuZGZjCgpUaGVyZSBpcyBhcyB3ZWxsIHRoZSB1c3VhbCBsb2FkIChpZiBub3Qg
YWN0dWFsbHkgYmlnZ2VyIHRoYW4gdXN1c2FsKSBvZgp1bmluaXRpYWxpemVkIHZhcmlhYmxlcywg
bGVha3MsIGRvdWJsZSBmcmVlLCBhbmQgQUkgZnV6emVkIGlzc3VlcyBiZWluZwpmaXhlZC4KCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KQXJuZCBCZXJnbWFubiAoMSk6CiAgICAgIG10ZDogcmF3bmFuZDogbmRmYzogYWRkIENP
TkZJR19PRiBkZXBlbmRlbmN5CgpEZWVwYW5zaHUgS2FydGlrZXkgKDEpOgogICAgICBtdGQ6IG10
ZHBhcnQ6IHZhbGlkYXRlIHBhcnRpdGlvbiBib3VuZHMgaW4gbXRkX2FkZF9wYXJ0aXRpb24oKQoK
SGFyc2hpdCBNb2dhbGFwYWxsaSAoMik6CiAgICAgIG10ZDogdmlydF9jb25jYXQ6IGZpeCB1c2Ut
YWZ0ZXItZnJlZSBpbiBtdGRfdmlydF9jb25jYXRfZGVzdHJveV9qb2lucygpCiAgICAgIG10ZDog
dmlydF9jb25jYXQ6IGZpeCB1c2UtYWZ0ZXItZnJlZSBpbiBtdGRfdmlydF9jb25jYXRfZGVzdHJv
eSgpCgpNaXF1ZWwgUmF5bmFsICgxKToKICAgICAgUmV2ZXJ0ICJtdGQ6IG1hcHM6IHJlbW92ZSB1
Y2xpbnV4IG1hcCBkcml2ZXIiCgpOaWtvbGF5IEl2Y2hlbmtvICgxKToKICAgICAgbXRkOiBtdGRw
YXJ0OiBmaXggdW5pbml0aWFsaXplZCBlcmFzZXNpemUgb24gTVREUEFSVF9PRlNfUkVUQUlOIGVy
cm9yIHBhdGgKClBlbmdwZW5nIEhvdSAoOSk6CiAgICAgIG10ZDogbmFuZDogZWNjLW10azogaGFu
ZGxlIEVDQyBjbG9jayBlbmFibGUgZmFpbHVyZXMKICAgICAgbXRkOiByYXduYW5kOiBpbmdlbmlj
OiBoYW5kbGUgRUNDIGNsb2NrIGVuYWJsZSBmYWlsdXJlcwogICAgICBtdGQ6IG10ZHN3YXA6IHJl
bW92ZSBkZWJ1Z2ZzIHN0YXRzIGZpbGUgb24gdGVhcmRvd24KICAgICAgbXRkOiBuYW5kOiBtdGst
ZWNjOiBzdG9wIG9uIEVDQyBpZGxlIHRpbWVvdXRzCiAgICAgIG10ZDogcmF3bmFuZDogbHBjMzJ4
eF9tbGM6IGZhaWwgRE1BIHRyYW5zZmVycyBvbiB0aW1lb3V0CiAgICAgIG10ZDogcmF3bmFuZDog
bHBjMzJ4eF9zbGM6IGZhaWwgRE1BIHRyYW5zZmVyIG9uIGNvbXBsZXRpb24gdGltZW91dAogICAg
ICBtdGQ6IG1jaHAyM2syNTY6IHVzZSBTUEkgbWF0Y2ggZGF0YSBmb3IgY2hpcCBjYXBzCiAgICAg
IG10ZDogcmF3bmFuZDogZnNsX2lmYzogcmV0dXJuIGVycm9ycyBmb3IgZmFpbGVkIHBhZ2UgcmVh
ZHMKICAgICAgbXRkOiBvbmVuYW5kOiBzYW1zdW5nOiByZXBvcnQgRE1BIGNvbXBsZXRpb24gdGlt
ZW91dHMKClJvc2VuIFBlbmV2ICgxKToKICAgICAgbXRkOiByYXduYW5kOiBuZGZjOiBmaXggZ2Nj
IHVuaW5pdGlhbGl6ZWQgdmFyCgpSdW95dSBXYW5nICgxKToKICAgICAgbXRkOiBzcGluYW5kOiBp
bml0aWFsaXplIHJldCBpbiByZWd1bGFyIHBhZ2UgcmVhZHMKClh1IFJhbyAoMSk6CiAgICAgIG10
ZDogdmlydC1jb25jYXQ6IGZyZWUgZHVwbGljYXRlIGdlbmVyYXRlZCBuYW1lCgpYdWUgTGVpICgx
KToKICAgICAgbXRkOiBmaXggZG91YmxlIGZyZWUgYW5kIFdBUk5fT04gaW4gYWRkX210ZF9kZXZp
Y2UoKSBlcnJvciBwYXRocwoKIGRyaXZlcnMvbXRkL2RldmljZXMvbWNocDIzazI1Ni5jICAgICAg
ICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbWFwcy9LY29uZmlnICAgICAgICAgICAgICAgICAg
IHwgICA2ICsrCiBkcml2ZXJzL210ZC9tYXBzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAg
IDEgKwogZHJpdmVycy9tdGQvbWFwcy91Y2xpbnV4LmMgICAgICAgICAgICAgICAgIHwgMTE4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL210ZC9tdGRfdmlydF9jb25jYXQu
YyAgICAgICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvbXRkL210ZGNvcmUuYyAgICAgICAgICAg
ICAgICAgICAgICB8ICAyMyArKysrKy0KIGRyaXZlcnMvbXRkL210ZHBhcnQuYyAgICAgICAgICAg
ICAgICAgICAgICB8ICAgOCArKwogZHJpdmVycy9tdGQvbXRkc3dhcC5jICAgICAgICAgICAgICAg
ICAgICAgIHwgICA1ICstCiBkcml2ZXJzL210ZC9uYW5kL2VjYy1tdGsuYyAgICAgICAgICAgICAg
ICAgfCAgMjQgKysrKy0tCiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9zYW1zdW5n
LmMgfCAgIDcgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcgICAgICAgICAgICAgICB8
ICAgMSArCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfaWZjX25hbmQuYyAgICAgICAgfCAgIDkg
KystCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfZWNjLmMgfCAgIDcgKy0K
IGRyaXZlcnMvbXRkL25hbmQvcmF3L2xwYzMyeHhfbWxjLmMgICAgICAgICB8ICAxMiArKy0KIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2xwYzMyeHhfc2xjLmMgICAgICAgICB8ICAxMiArKy0KIGRyaXZl
cnMvbXRkL25hbmQvcmF3L25kZmMuYyAgICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jICAgICAgICAgICAgICAgIHwgICAyICstCiAxNyBmaWxlcyBjaGFu
Z2VkLCAyMjQgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9tdGQvbWFwcy91Y2xpbnV4LmMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
