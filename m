Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A098C001DC
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5aSCzvtm5AUdSdaitgxCpP35UJP9SNIkfJvIUvUDwA0=; b=1e5TDW6Hns46YN
	MXGyRaqCaIVGOSMDsWw5f3nAzJn+Sse5oWKx/72YoPbt5NcUIMs670OvETpArFei0q5NfOf8CHSOo
	1fvGYYi3ttd7iotLt/TE/1gsP4JBCk9eX9Z3fjPHXE9los5dCL4ZwX3VmxIjeaTCVAHfk8NLl6ccL
	XhZ8yp0pdPQ39JBdpoSNBJ3JPHqylBDd0OZ3ojBFVbikQf0vNXYTahnyOhGNX+K2NusPKFequpMCl
	pUG8zucIIDGpFQEyWVXwOS2FshZEX0bAcGqauA75vzPorj/pcx8vLIHGf7YjasdZbZtvZmYKQJrQW
	M9qWQHFBUtYzBWBKbQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOtu-00EiiU-32;
	Mon, 31 Jul 2023 09:09:14 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOtr-00EigH-1o
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 09:09:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B16624000C;
	Mon, 31 Jul 2023 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690794547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0zygv9OONeF6w5wsQcuKYwJZsD4TU+ixmH4WXl55vos=;
	b=ks963aFFPRnkvTahy7pXrEJXzcJTm9danfhusAgNm88hBkk8FImIQ6Ky+H2RU889ghBe/j
	qcIkyDwAtdG1kP05bn4LA94760KnxS4uNEx3ALRUGU/kOo/0Zhc+Geq7A/V8oAOUHfM/Jk
	h+0Gar1qmgpugeCb3RReyZ9o98YIyJp9WP3J2eO2YXxCCuvALRvV0s1Tx7EMmKrVTf4bKT
	xziutgSpSZHnoDwhnU4yazFtj+OsAd+DbCVhmZOim+o36/mAHkbRH2D6PknGgqTuqpL4pN
	vTphC+o0mUqAxM96nv3sc1MobriJ6ITwmfxZevcnx9XmE3ZicucFbxoyv161eg==
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
Subject: [PATCH v2] mtd: Fix refcounting with MTD_PARTITIONED_MASTER
Date: Mon, 31 Jul 2023 11:09:03 +0200
Message-Id: <20230731090903.770277-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_020911_881247_96FCCDF6 
X-CRM114-Status: GOOD (  15.49  )
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
IHdlIG5lZWQgc29tZXRoaW5nCmVsc2Ugb24gdG9wLgoKQ2hhbmdlcyBpbiB2MjoKKiBHcmFiIHRo
ZSBwYXJlbnQgYmVmb3JlIGNhbGxpbmcga3JlZl9wdXQoKSB0byBhdm9pZCBhY2Nlc3NpbmcgYSBm
cmVlZAogIG10ZCBwb2ludGVyLgoKVGhhbmtzLApNaXF1w6hsCi0tLQogZHJpdmVycy9tdGQvbXRk
Y29yZS5jIHwgMTcgKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUu
YyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwppbmRleCAyNDY2ZWE0NjY0NjYuLjllOGZmM2E5OTlk
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL210
ZGNvcmUuYwpAQCAtMTI0MSwxNCArMTI0MSwxNSBAQCBpbnQgX19nZXRfbXRkX2RldmljZShzdHJ1
Y3QgbXRkX2luZm8gKm10ZCkKIAkJcmV0dXJuIC1FTk9ERVY7CiAJfQogCi0Ja3JlZl9nZXQoJm10
ZC0+cmVmY250KTsKLQotCXdoaWxlIChtdGQtPnBhcmVudCkgewotCQlpZiAoSVNfRU5BQkxFRChD
T05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUikgfHwgbXRkLT5wYXJlbnQgIT0gbWFzdGVyKQot
CQkJa3JlZl9nZXQoJm10ZC0+cGFyZW50LT5yZWZjbnQpOworCXdoaWxlIChtdGQpIHsKKwkJaWYg
KG10ZCAhPSBtYXN0ZXIpCisJCQlrcmVmX2dldCgmbXRkLT5yZWZjbnQpOwogCQltdGQgPSBtdGQt
PnBhcmVudDsKIAl9CiAKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1BBUlRJVElPTkVEX01B
U1RFUikpCisJCWtyZWZfZ2V0KCZtYXN0ZXItPnJlZmNudCk7CisKIAlyZXR1cm4gMDsKIH0KIEVY
UE9SVF9TWU1CT0xfR1BMKF9fZ2V0X210ZF9kZXZpY2UpOwpAQCAtMTMzMiwxMCArMTMzMywxMiBA
QCB2b2lkIF9fcHV0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpCiB7CiAJc3RydWN0
IG10ZF9pbmZvICptYXN0ZXIgPSBtdGRfZ2V0X21hc3RlcihtdGQpOwogCi0Jd2hpbGUgKG10ZCAh
PSBtYXN0ZXIpIHsKKwl3aGlsZSAobXRkKSB7CisJCS8qIGtyZWZfcHV0KCkgY2FuIHJlbGVzZSBt
dGQsIHNvIGtlZXAgYSByZWZlcmVuY2UgbXRkLT5wYXJlbnQgKi8KIAkJc3RydWN0IG10ZF9pbmZv
ICpwYXJlbnQgPSBtdGQtPnBhcmVudDsKIAotCQlrcmVmX3B1dCgmbXRkLT5yZWZjbnQsIG10ZF9k
ZXZpY2VfcmVsZWFzZSk7CisJCWlmIChtdGQgIT0gbWFzdGVyKQorCQkJa3JlZl9wdXQoJm10ZC0+
cmVmY250LCBtdGRfZGV2aWNlX3JlbGVhc2UpOwogCQltdGQgPSBwYXJlbnQ7CiAJfQogCi0tIAoy
LjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
