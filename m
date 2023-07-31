Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66368C001DF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9jag8jIfshOgYHUGISzVRH8ZH8QQlkyLvW+zHY9zjFU=; b=PbunTeeEgpF+Rh
	by9lJ20lAkLfR8eTqk8+gsc+PveBYjWaTtVJGKZdZo2Vq1CEa4bzsFfkkhvM4XdXVC27n/IJEZ3PL
	QYHN+1TNU4h8nyxd42/iFmD+l7jyE7LghhvKvPEhesnF2nSC50jwDdbPaunzRgdlq3T6YKUhZKBnF
	UVtgm+umcSHy7+nydvR+T50ewxdiPCbfTLZySAXGgjKL0+uIKVV3f1GgiILcchLvo60Bu6g6JWj/w
	rKR9v/mgzqHCi02Evr1riZXLhpOg1w4gYWSaSfsr3AS3HAMZDlInOGwBj2vbov/omh9/XLq6KXTk2
	m/O+tMk83Eob6Lu//0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQO8t-00EVzK-2m;
	Mon, 31 Jul 2023 08:20:39 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQO8r-00EVxs-00
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 08:20:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1122C0005;
	Mon, 31 Jul 2023 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690791632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vh0LBuc712RYG6dXLPZbJhzecgDZyKrFvEGeieJODz0=;
	b=cJLlsIhY5UoVr3HfNGEn9ugyK2lbtgNprRKyO2tQ65z6IclwFQeEtlcoDC4wbnR6QTW04D
	msCMk48Vz0V+BCIop77ArW6lEYVWFAmyuRMmQj7vXliLABG5FWBVgMGDpWjJJCk/gxeAn9
	hCNvkm4/M8IEMxjVc7QxeAlNgF5Qi3jCjyi1KEKfeEe9lrIfScLMdO0sf3zipHelcqH1LF
	nlQKnVkqwMv9ioKUR66EF+rBkQ94o2n9CwVr2ISw6yhjYvm01dXtO2Qt4TrVOF5BOa0LqB
	mRCmIAV24hM9mY5B6Zukxp6rB4kNFbBpqaX+GV5w2ta9gWoUc+E3LxHRyAeWSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Tomas Winkler <tomas.winkler@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: [PATCH] mtd: Fix refcounting with MTD_PARTITIONED_MASTER
Date: Mon, 31 Jul 2023 10:20:29 +0200
Message-Id: <20230731082029.762385-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_012037_326440_0A2A37F2 
X-CRM114-Status: GOOD (  15.41  )
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

VGhlIGxvZ2ljIGlzIHdheSB0b28gY29udm9sdXRlZCwgbGV0J3MgY2xlYW4gdGhlIGtyZWZfZ2V0
L3B1dCBzZWN0aW9uIHRvCmNsYXJpZnkgd2hhdCB0aGlzIGJsb2NrIGRvZXMsIGhvcGVmdWxseSBz
b2x2aW5nIHRoZSByZWZjb3VudGluZyBpc3N1ZQp3aGVuIHVzaW5nIENPTkZJR19NVERfUEFSVElU
SU9ORURfTUFTVEVSIGF0IHRoZSBzYW1lIHRpbWU6Ci0gSXRlcmF0ZSB0aHJvdWdoIGFsbCB0aGUg
cGFyZW50IG10ZCBkZXZpY2VzCi0gR3JhYiBhIHJlZmVyZW5jZSBvdmVyIHRoZW0gYWxsIGJ1dCB0
aGUgbWFzdGVyCi0gT25seSBncmFiIHRoZSBtYXN0ZXIgd2hpdGggQ09ORklHX01URF9QQVJUSVRJ
T05FRF9NQVNURVIKU2FtZSBsb2dpYyBtdXN0IGFwcGx5IGluIHRoZSBwdXQgcGF0aCwgb3RoZXJ3
aXNlIGl0IHdvdWxkIGJlIGJyb2tlbi4KCkNjOiBUb21hcyBXaW5rbGVyIDx0b21hcy53aW5rbGVy
QGludGVsLmNvbT4KQ2M6IEFsZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRl
bC5jb20+CkNjOiBaaGFuZyBYaWFveHUgPHpoYW5neGlhb3h1NUBodWF3ZWkuY29tPgpGaXhlczog
MTliZmE5ZWJlYmI1ICgibXRkOiB1c2UgcmVmY291bnQgdG8gcHJldmVudCBjb3JydXB0aW9uIikK
U2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
Ci0tLQoKSGVsbG8sCgpBbGV4YW5kZXIsIFpoYW5nLCBwbGVhc2UgdGVzdCB0aGlzIHZlcnNpb24s
IGl0IGlzIGNsb3NlIHRvIHdoYXQgWmhhbmcKcHJvZHVjZWQgd2hpbGUgbm90IHN0cmljdGx5IGlk
ZW50aWNhbC4gVGhpcyBjb21waWxlLXRlc3RlZCBvbmx5LCBwbGVhc2UKY2hlY2sgb24geW91IHNp
ZGUgd2hldGhlciBpdCBmaXhlcyB0aGUgcmVmY291bnRpbmcgaXNzdWUgd2l0aCBhbmQKd2l0aG91
dCBQQVJUSVRJT05FRF9NQVNURVIsIGFzIHdlbGwgYXMgd2l0aCBLYXNhbi4KCkFsZXhhbmRlciwg
bWF5YmUgdGhlcmUgaXMgc29tZXRoaW5nIGVsc2UgdG8gZml4LCBpbiBhbGwgY2FzZXMgdGhlIGxv
Z2ljCmhlcmUgd2FzIGJyb2tlbiBzbyBsZXQncyBzdGFydCBieSB0aGlzIG9uZSBhbmQgc2VlIGlm
IHdlIG5lZWQgc29tZXRoaW5nCmVsc2Ugb24gdG9wLgoKVGhhbmtzLApNaXF1w6hsCi0tLQogZHJp
dmVycy9tdGQvbXRkY29yZS5jIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKaW5kZXggMjQ2NmVhNDY2
NDY2Li45YjkwZTFiZTQzZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYworKysg
Yi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKQEAgLTEyNDEsMTQgKzEyNDEsMTUgQEAgaW50IF9fZ2V0
X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpCiAJCXJldHVybiAtRU5PREVWOwogCX0K
IAotCWtyZWZfZ2V0KCZtdGQtPnJlZmNudCk7Ci0KLQl3aGlsZSAobXRkLT5wYXJlbnQpIHsKLQkJ
aWYgKElTX0VOQUJMRUQoQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIpIHx8IG10ZC0+cGFy
ZW50ICE9IG1hc3RlcikKLQkJCWtyZWZfZ2V0KCZtdGQtPnBhcmVudC0+cmVmY250KTsKKwl3aGls
ZSAobXRkKSB7CisJCWlmIChtdGQgIT0gbWFzdGVyKQorCQkJa3JlZl9nZXQoJm10ZC0+cmVmY250
KTsKIAkJbXRkID0gbXRkLT5wYXJlbnQ7CiAJfQogCisJaWYgKElTX0VOQUJMRUQoQ09ORklHX01U
RF9QQVJUSVRJT05FRF9NQVNURVIpKQorCQlrcmVmX2dldCgmbWFzdGVyLT5yZWZjbnQpOworCiAJ
cmV0dXJuIDA7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChfX2dldF9tdGRfZGV2aWNlKTsKQEAgLTEz
MzIsMTEgKzEzMzMsMTAgQEAgdm9pZCBfX3B1dF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAq
bXRkKQogewogCXN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyID0gbXRkX2dldF9tYXN0ZXIobXRkKTsK
IAotCXdoaWxlIChtdGQgIT0gbWFzdGVyKSB7Ci0JCXN0cnVjdCBtdGRfaW5mbyAqcGFyZW50ID0g
bXRkLT5wYXJlbnQ7Ci0KLQkJa3JlZl9wdXQoJm10ZC0+cmVmY250LCBtdGRfZGV2aWNlX3JlbGVh
c2UpOwotCQltdGQgPSBwYXJlbnQ7CisJd2hpbGUgKG10ZCkgeworCQlpZiAobXRkICE9IG1hc3Rl
cikKKwkJCWtyZWZfcHV0KCZtdGQtPnJlZmNudCwgbXRkX2RldmljZV9yZWxlYXNlKTsKKwkJbXRk
ID0gbXRkLT5wYXJlbnQ7CiAJfQogCiAJaWYgKElTX0VOQUJMRUQoQ09ORklHX01URF9QQVJUSVRJ
T05FRF9NQVNURVIpKQotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
