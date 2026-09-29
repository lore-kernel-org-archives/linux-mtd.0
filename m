Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3F0CA5FA7
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 20:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qH38q0wURyJSIGCveIXJMBoQHxF6Yu8Myw1iG3Tu9bA=; b=EYIz4tMgN8+xZW
	qUdizS0DlzLvRK2KNG6Vkc7gI9gm2H+zaRN8BvS2sFtIsC3cwJc00cEeuQX8fzYeVlIXlPFBhTL4v
	7OVAKTpsyyvm6T+bQwn9h60w52w2auk3VIPK53nuB++Ni/1/0fgeBFlK6W+qgXNxklHZPyFMUFfQ4
	a/qexyNJpwCMf8322cX3L5ODCB14O66iSoHXIYE2uscRWW5HwlT4HsapbsjBoV8i3DmQBo7kxrQHS
	gc6twMc47+lLMCh6ckYW0P1oP6NuY5q6D15SGsJ4qPqHEtc52p5qWsxqtFwRFrfxErwHU7c8IDVaD
	Y3Xd7WYOhP/5ZncqKEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBegX-00000004WSs-3Ao0;
	Tue, 29 Sep 2026 20:44:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBegU-00000004WSI-14cg
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 20:44:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5D7AA4E410BE;
	Tue, 29 Sep 2026 20:44:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A2A9601BD;
	Tue, 29 Sep 2026 20:44:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8631E10329819;
	Tue, 29 Sep 2026 22:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790714650; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=UcpK74RYdGuh8GqY90xeGxwSK/JHZZ3MpYcQqOPPiJI=;
	b=14XshEfu3KWSt/8Bf9fgcE63E6hIUvNn+BYwLsDA2sxaHBamlcQi+RoOxntQtTpT6nWYdp
	Sh5g9sakYBKsRloJL0gN94kNjUePkjTuRgkffldUzX2aRqqDIZVAxtfgMhDuoPk4Opcz3f
	1qBpEIvx38lu3RlCu5yTRcJwphnJt41bxQkzEIGs+vUR2PfDLEGm1HK7G71YyZUQQV9/ON
	8+EamJfpPHRhbA31eP9Wr65beOTnbPJzXO4KQc1KfCnGi4w1Jh05CLvvmhvnLu89pGJ3wn
	uKTFoh/h5x+TNtN0S4kozxNtu8rCncSqBor5JMykSTLGVxSWqA8HIKsv+cdXlQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Michael Walle <michael@walle.cc>, Pratyush Yadav
 <pratyush@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Fixes for 7.3-rc6
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 29 Sep 2026 22:44:05 +0200
Message-ID: <87v77n4wkq.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_134418_483584_DFD35FF6 
X-CRM114-Status: UNSURE (   7.86  )
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

SGVsbG8sCgpUaGlzIGlzIGFuIE1URCBmaXhlcyBQUiBmb3IgNy4zLXJjNi4KClRoYW5rcywKTWlx
dcOobAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjZWU5Mzk1YWNkODA0M2Jl
MDY0NGIyNWMzNGJmYTg2NjIzZjJiOTM1OgoKICBMaW51eCA3LjMtcmMxICgyMDI2LTA4LTMwIDEz
OjM0OjQwIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cgog
IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXgu
Z2l0IHRhZ3MvbXRkL2ZpeGVzLWZvci03LjMtcmM2Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gMWMxYTM0MmFjZWVjNzk1MjhiM2JhNTFmMzc2ZWNhMmJlNTkyOGZlNzoKCiAgbXRkOiBz
cGluYW5kOiBEbyBub3QgdXBkYXRlIHRoZSBRRSBiaXQgb24gZGV2aWNlcyB3aXRob3V0IG9uZSAo
MjAyNi0wOS0yNSAxNjo1Mzo1MSArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KVGhlIG1vc3QgaW1wb3J0YW50IHNl
dCBvZiBmaXhlcyBhcmUgYXJvdW5kIHRoZSBoYW5kbGluZyBvZiB0aGUgUUUgYml0IGluClNQSSBO
QU5ELgoKVGhlcmUgYXJlIGFsc28gYSBjb3VwbGUgb2YgYmVoYXZpb3JhbCBmaXhlcyAobXV0ZXgg
aXNzdWUgaW4gU1BJLU5PUiwKc3B1cmlvdXMgYml0ZmxpcHMgb24gdmY2MTBfbmZjLCBPT0IgYnl0
ZXMgY291bnQgaW4gU1BJIE5BTkQgYW5kCmNmaV9jbWRzZXQgc3RhY2sgdXNhZ2UpLgoKVGhlIHJl
c3QgaXMgbW9zdGx5IEFJIGZ1enppbmcgcmVzdWx0cy4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSGFuIFh1ICgxKToKICAg
ICAgbXRkOiBzcGluYW5kOiBFbmFibGUgUUUgb24gYWxsIGRpZXMKCkthcmwgTWVobHRyZXR0ZXIg
KDMpOgogICAgICBtdGQ6IGNvcmU6IGF2b2lkIGRvdWJsZS1mcmVlIG9mIE9UUCBOVk1FTSBkZXZp
Y2UKICAgICAgbXRkOiBjb3JlOiBjYWxsIF9nZXRfZGV2aWNlKCkgd2l0aCB0aGUgbWFzdGVyIE1U
RAogICAgICBtdGQ6IGNmaV9jbWRzZXRfMDAwMTogc2hyaW5rIGRvX3dyaXRlX2J1ZmZlcigpIHN0
YWNrIGZyYW1lCgpNZWhtZXQgRmlkZSAoMik6CiAgICAgIG10ZDogcmF3bmFuZDogdmY2MTBfbmZj
OiBmaXggcmVhZHMgb24gY2hpcHMgd2l0aCBtb3JlIHRoYW4gNjQgYnl0ZXMgb2YgT09CCiAgICAg
IG10ZDogcmF3bmFuZDogdmY2MTBfbmZjOiBmaXggZmFsc2UgYml0ZmxpcHMgb24gcmVhZHMgb2Yg
ZXJhc2VkIHBhZ2VzCgpNZW5hY2hlbSBBZGluICgxKToKICAgICAgbXRkOiBtdGRfaW50ZWxfZGc6
IHJlc2V0IHBvbGwgY291bnRlciBmb3IgZWFjaCBlcmFzZQoKTnVubyBTw6EgKDIpOgogICAgICBt
dGQ6IHNwaW5hbmQ6IGZpeCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugd2l0aCBubyBFQ0MgZW5n
aW5lCiAgICAgIG10ZDogc3BpbmFuZDogZml4IHplcm8gb29iYXZhaWwgd2hlbiBubyBFQ0MgZW5n
aW5lIGlzIHVzZWQKClBlaSBYaWFvICgxKToKICAgICAgbXRkOiBibG9jazJtdGQ6IEZpeCBkaXZp
ZGUgZXJyb3Igd2hlbiBlcmFzZV9zaXplIGlzIHplcm8KClJ1bnl1IFhpYW8gKDIpOgogICAgICBt
dGQ6IHJhd25hbmQ6IGNhZGVuY2U6IEluaXRpYWxpemUgSVJRIHN0YXRlIGJlZm9yZSByZXF1ZXN0
aW5nIElSUQogICAgICBtdGQ6IHNwaS1ub3I6IGNvcmU6IEZpeCBtdXRleCBsZWFrIGluIHNwaV9u
b3Jfcnd3X3N0YXJ0X2V4Y2x1c2l2ZSgpCgpTYWduaWsgU2FzbWFsICgxKToKICAgICAgbXRkOiBz
cGluYW5kOiBEbyBub3QgdXBkYXRlIHRoZSBRRSBiaXQgb24gZGV2aWNlcyB3aXRob3V0IG9uZQoK
IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMS5jICAgICAgICAgICAgfCA0MiArKysr
KysrKy0tLS0tCiBkcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jICAgICAgICAgICAgICAg
IHwgIDIgKy0KIGRyaXZlcnMvbXRkL2RldmljZXMvbXRkX2ludGVsX2RnLmMgICAgICAgICAgICAg
fCAgMyArLQogZHJpdmVycy9tdGQvbXRkY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAzICstCiBkcml2ZXJzL210ZC9uYW5kL2VjYy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDcgKysrCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWRlbmNlLW5hbmQtY29udHJvbGxlci5jIHwg
IDYgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5jICAgICAgICAgICAgICAgfCA4
NSArKysrKysrKysrKysrKysrKysrKystLS0tLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
ICAgICAgICAgICAgICAgICAgICB8IDUzICsrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogaW5jbHVkZS9saW51eC9t
dGQvbmFuZC5oICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIDEwIGZpbGVzIGNoYW5nZWQs
IDE1MSBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
