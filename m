Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F141EEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yYyEyfHGGrzP1WiefQPDlpM5BbyOOwpqxk1wFCBbXQ=; b=AZJsRTurUullv8
	JqGrYkQ89oz+lc6uBkU0jqBKZiBDHsB9w10U7ldiAxcMjmsZgxMHrCcVT3jBmKzCXYm/YR5TqSscN
	8PFRK6Emw+90U8afBjh0pzAxA7arBiSl+xGuKjQYAN/Vbz9Az4ZXutFT4YSSqv49+DKp0LTJ6Jb4S
	JxPZm0jDCbJirplaBI7jwMLGUeRzUi+W6HS/fc0CGxqtnQO/an7fReATPJqPsDYB5HD2NxMuhK8Uv
	WwCy/kUiWus1JYKT/211Ox+g8Y7sBX+x9e/B6UtCqw8VgWH+DWgCz4rseK61mScjkL21t5REvMJK6
	YGtHQxiZEZLKyawbl4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzgL-005HcG-07;
	Wed, 19 Jul 2023 05:25:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzg5-005HQP-0o
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5gEUn549HX6Kut5VTQH3vbjTC7LCGLE2/fOFWaktOz4=; b=U4GTqOF5VCaj3I6Z4wBS0j8Olu
	A+hhVFxDMarPjw9hgxGOKzQXaxn9nNL0Kz8Xe4geFpYGWPxaxUI1DmKD9F0dH5BCpql03Iekd6UU4
	IAl0kkbK2Juo9zm7XZEMYrxna7OHYdp4Zs2rXBvN0gfdHo6bQeSsfSmigk6J+tCAfDb1etsZZjAW8
	zo5k3iJ141NljFRol5eSr2I7A9c7iuIQRFUUxPlT0uAokjF113eDdWN/6johkkzyqhMy/A1dwCUqI
	3/dEX6wlhC1fK2xbdN1Jgc7XpFBYyP4JK9rFJX8dg4KNsEXLxTaAjmDTkk0jwJK81RUvqLuI6/dfJ
	kOiO/xmQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLU7k-009FWr-1I
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 19:43:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3D871BF205;
	Mon, 17 Jul 2023 19:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689622947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5gEUn549HX6Kut5VTQH3vbjTC7LCGLE2/fOFWaktOz4=;
	b=fbQxt2fNLkhDxfzd7Vt8XwYtMdwJgL/QKaWkeSdLrmz0X5uQpYQIzRM+m2/a4bcTGRBsz7
	ka/0eEzwcx2uKW6lFPovIDVYLpAYM7+Iho11pdvW0KM64QUkxOD9x59Aglgdr/V23gmK0V
	VFqLWiM61he5e0hGSgjc4FYqXGg1670S/MvWBqYicIqyPwd/Mjqf+m/aCFoRcUvcy7b1yt
	IHEaa6ajvEgFO8jtn/nPf2N0k9HD6f/Msuzg73pmdp4T1maWUs9tiX+VRFYlzX1OnTkeT0
	8DmPB+k/zxJ6dMZYdrvgSd0/DKxpoaIyrz8QTWNDvyNIpXEGvN8s23lR1J7dhw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] mtd: rawnand: arasan: Ensure program page operations are successful
Date: Mon, 17 Jul 2023 21:42:20 +0200
Message-Id: <20230717194221.229778-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717194221.229778-1-miquel.raynal@bootlin.com>
References: <20230717194221.229778-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_204312_906470_F4A626DE 
X-CRM114-Status: GOOD (  17.26  )
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

VGhlIE5BTkQgY29yZSBjb21wbGllcyB3aXRoIHRoZSBPTkZJIHNwZWNpZmljYXRpb24sIHdoaWNo
IGl0c2VsZgptZW50aW9ucyB0aGF0IGFmdGVyIGFueSBwcm9ncmFtIG9yIGVyYXNlIG9wZXJhdGlv
biwgYSBzdGF0dXMgY2hlY2sKc2hvdWxkIGJlIHBlcmZvcm1lZCB0byBzZWUgd2hldGhlciB0aGUg
b3BlcmF0aW9uIHdhcyBmaW5pc2hlZCAqYW5kKgpzdWNjZXNzZnVsLgoKVGhlIE5BTkQgY29yZSBv
ZmZlcnMgaGVscGVycyB0byBmaW5pc2ggYSBwYWdlIHdyaXRlIChzZW5kaW5nIHRoZQoiUEFHRSBQ
Uk9HIiBjb21tYW5kLCB3YWl0aW5nIGZvciB0aGUgTkFORCBjaGlwIHRvIGJlIHJlYWR5IGFnYWlu
LCBhbmQKY2hlY2tpbmcgdGhlIG9wZXJhdGlvbiBzdGF0dXMpLiBCdXQgaW4gc29tZSBjYXNlcywg
YWR2YW5jZWQgY29udHJvbGxlcgpkcml2ZXJzIG1pZ2h0IHdhbnQgdG8gb3B0aW1pemUgdGhpcyBh
bmQgY3JhZnQgdGhlaXIgb3duIHBhZ2Ugd3JpdGUKaGVscGVyIHRvIGxldmVyYWdlIGFkZGl0aW9u
YWwgaGFyZHdhcmUgY2FwYWJpbGl0aWVzLCB0aHVzIG5vdCBhbHdheXMKdXNpbmcgdGhlIGNvcmUg
ZmFjaWxpdGllcy4KClNvbWUgZHJpdmVycywgbGlrZSB0aGlzIG9uZSwgZG8gbm90IHVzZSB0aGUg
Y29yZSBoZWxwZXIgdG8gZmluaXNoIGEgcGFnZQp3cml0ZSBiZWNhdXNlIHRoZSBmaW5hbCBjeWNs
ZXMgYXJlIGF1dG9tYXRpY2FsbHkgbWFuYWdlZCBieSB0aGUKaGFyZHdhcmUuIEluIHRoaXMgY2Fz
ZSwgdGhlIGFkZGl0aW9uYWwgY2FyZSBtdXN0IGJlIHRha2VuIHRvIG1hbnVhbGx5CnBlcmZvcm0g
dGhlIGZpbmFsIHN0YXR1cyBjaGVjay4KCkxldCdzIHJlYWQgdGhlIE5BTkQgY2hpcCBzdGF0dXMg
YXQgdGhlIGVuZCBvZiB0aGUgcGFnZSB3cml0ZSBoZWxwZXIgYW5kCnJldHVybiAtRUlPIHVwb24g
ZXJyb3IuCgpDYzogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4KQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcKRml4ZXM6IDg4ZmZlZjFiNjVjZiAoIm10ZDogcmF3bmFuZDogYXJh
c2FuOiBTdXBwb3J0IHRoZSBoYXJkd2FyZSBCQ0ggRUNDIGVuZ2luZSIpClNpZ25lZC1vZmYtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgotLS0KCkhlbGxvIE1p
Y2hhbCwKCkkgaGF2ZSBub3QgdGVzdGVkIHRoaXMsIGJ1dCBiYXNlZCBvbiBhIHJlcG9ydCBvbiBh
bm90aGVyIGRyaXZlciwgSQpiZWxpZXZlIHRoZSBzdGF0dXMgY2hlY2sgaXMgYWxzbyBtaXNzaW5n
IGhlcmUgYW5kIGNvdWxkIHNvbWV0aW1lcwpsZWFkIHRvIHVubm90aWNlZCBwYXJ0aWFsIHdyaXRl
cy4KClBsZWFzZSB0ZXN0IG9uIHlvdXIgc2lkZSB0aGF0IGV2ZXJ5dGhpbmcgc3RpbGwgd29ya3Mg
YW5kIGxldCBtZQprbm93IGhvdyBpdCBnb2VzLgoKVGhhbmtzIGEgbG90LgpNaXF1w6hsCi0tLQog
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIHwgMTYgKysrKysr
KysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJv
bGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jCmlu
ZGV4IDkwNmVlZjcwY2I2ZC4uNDg3YzEzOTMxNmZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jCkBAIC01MTUsNiArNTE1LDcgQEAgc3RhdGljIGlu
dCBhbmZjX3dyaXRlX3BhZ2VfaHdfZWNjKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHU4
ICpidWYsCiAJc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKIAl1bnNp
Z25lZCBpbnQgbGVuID0gbXRkLT53cml0ZXNpemUgKyAob29iX3JlcXVpcmVkID8gbXRkLT5vb2Jz
aXplIDogMCk7CiAJZG1hX2FkZHJfdCBkbWFfYWRkcjsKKwl1OCBzdGF0dXM7CiAJaW50IHJldDsK
IAlzdHJ1Y3QgYW5mY19vcCBuZmNfb3AgPSB7CiAJCS5wa3RfcmVnID0KQEAgLTU2MSwxMCArNTYy
LDIxIEBAIHN0YXRpYyBpbnQgYW5mY193cml0ZV9wYWdlX2h3X2VjYyhzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLCBjb25zdCB1OCAqYnVmLAogCX0KIAogCS8qIFNwYXJlIGRhdGEgaXMgbm90IHByb3Rl
Y3RlZCAqLwotCWlmIChvb2JfcmVxdWlyZWQpCisJaWYgKG9vYl9yZXF1aXJlZCkgewogCQlyZXQg
PSBuYW5kX3dyaXRlX29vYl9zdGQoY2hpcCwgcGFnZSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4g
cmV0OworCX0KIAotCXJldHVybiByZXQ7CisJLyogQ2hlY2sgd3JpdGUgc3RhdHVzIG9uIHRoZSBj
aGlwIHNpZGUgKi8KKwlyZXQgPSBuYW5kX3N0YXR1c19vcChjaGlwLCAmc3RhdHVzKTsKKwlpZiAo
cmV0KQorCQlyZXR1cm4gcmV0OworCisJaWYgKHN0YXR1cyAmIE5BTkRfU1RBVFVTX0ZBSUwpCisJ
CXJldHVybiAtRUlPOworCisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgYW5mY19zZWxfd3Jp
dGVfcGFnZV9od19lY2Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdTggKmJ1ZiwKLS0g
CjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
