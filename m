Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00779C4707B
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 08:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oVMyaDlhrFN86AKRr/8otog0DrHcqIHqo4SN5/hhY88=; b=sqUqc/TUEg3o0V
	KU6Gz1yQlEYNRA7eraRzR+C+cvgMEVlW5jOWrZGVIa3i1Yzuz+PXP8NoOexkly8PIKN38tPHlDGtx
	DaD7NPc1p6LHTNjGbGnbgDp0tA00bNKUp7mXsZ4uuCMNBEC3m5HzM2k165o3SZ8BJQcpEVRuMeuQM
	7DmQDm/1Q+ZsroeFcdnh8BOBnKqEA+LBRbkh/MKTUQn7NPuCEg8DPvi8pNyaRgso4rrNASdP0VeAm
	DfHxzHdGV5pizf+yM+hxMOOJzOcAzkkHSM2xDdN+6ODscASx3SaFTNJSLu1EKkAYX0ljPY0WfbOSM
	rZIsbsiJc7uHQQsGUFFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLIsP-00DAkp-1q;
	Thu, 04 Jan 2024 08:14:53 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLIsM-00DAiU-0B
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jan 2024 08:14:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C032FF818;
	Thu,  4 Jan 2024 08:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704356087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F/Itr6Y/VIwCF+uZO027AZv42yQsW1Sdpj3r4D/Vu+M=;
	b=LMISAYgXVsK3KCT8te9O3kimiTINNXnCQdvi1FX16td9zwQ8hqQRrzEXEX5az2Lpfer1Te
	o0oc10KQP0AQvUq5EXPtjzhGepeT3/VTV5QGFuabKk1bHjTO0ijIHicZCd8imrjdUnkM/e
	0WcWqS2zImChWytbe/HececJG15BbiPBsRQuBh6AdLI3TN5wFrFqrDc3BUJqaZF8oKlBxT
	VzV1VwIOl2qdPw2I8119DZmXo3m2zr4BlVwNxG9ciAoZV1TKO6r3mQPNt2tZp0IYDz4i1J
	cmnkTrsuGIrtNQ5cDjZbWEvr0L4Nb6AJgaN871eG8RAZrVjBpW7FT6Qc9gmnqA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH v2] mtd: Fix possible refcounting issue when going through partition nodes
Date: Thu,  4 Jan 2024 09:14:46 +0100
Message-Id: <20240104081446.126540-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_001450_227612_0CC7179B 
X-CRM114-Status: GOOD (  11.78  )
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

VW5kZXIgbm9ybWFsIGNvbmRpdGlvbnMsIHRoZSBsb29wIGdvZXMgb3ZlciBhbGwgY2hpbGQgcGFy
dGl0aW9ucywgYW5kCidicmVha3MnIHdoZW4gdGhlIHJlbGV2YW50IHBhcnRpdGlvbiBpcyBmb3Vu
ZC4gSW4gdGhpcyBjYXNlIHdlIGdldCBhCnJlZmVyZW5jZSB0byB0aGUgcGFydGl0aW9uIG5vZGUg
d2l0aG91dCBldmVyIHJlbGVhc2luZyBpdC4gSW5kZWVkLCByaWdodAphZnRlciB0aGUgbXRkX2No
ZWNrX29mX25vZGUoKSBmdW5jdGlvbiByZXR1cm5zLCB3ZSBjYWxsIG9mX25vZGVfZ2V0KCkKYWdh
aW4gb3ZlciB0aGlzIHZlcnkgc2FtZSBub2RlLiBJdCBpcyBwcm9iYWJseSBzYWZlciB0byBrZWVw
IHRoZQpjb3VudGVycyBldmVuIGluIHRoaXMgaGVscGVyIGFuZCBjYWxsIG9mX25vZGVfcHV0KCkg
YmVmb3JlIGJyZWFrLWluZy4KClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGlu
dGVsLmNvbT4KUmVwb3J0ZWQtYnk6IEp1bGlhIExhd2FsbCA8anVsaWEubGF3YWxsQGlucmlhLmZy
PgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzEyMjUwNTQ2LklTemdsdk0y
LWxrcEBpbnRlbC5jb20vCkNjOiBDaHJpc3RpYW4gTWFyYW5naSA8YW5zdWVsc210aEBnbWFpbC5j
b20+CkNjOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+ClNpZ25lZC1vZmYtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ci0tLQpUaGlzIGlzIGNv
bXBpbGUtdGVzdGVkIG9ubHkuCgp2MjogRG9uJ3QgbW92ZSB0aGUgb2Zfbm9kZV9wdXQocGFydGl0
aW9ucykgYnV0IGFkZCBhbgogICAgb2Zfbm9kZV9wdXQobXRkX2RuKSBpbnN0ZWFkLCB3aGljaCBs
b29rcyBtb3JlIGxlZ2l0aW1hdGUgaW4gdGhpcwogICAgY2FzZS4gSW5kZWVkLCB0aGUgJ3BhcnRp
dGlvbnMnIG5vZGUgaXMgYWNxdWlyZWQgYmVmb3JlIHRoZSBsb29wIGFuZAogICAgcmVsZWFzZWQg
YWZ0ZXIsIHdoaWNoIHNlZW1zIHNhZmUuIEhvd2V2ZXIgd2hlbiB3ZSBicmVhayB0aGUgbG9vcCB3
ZQogICAgYXBwYXJlbnRseSBsZWFrIGEgcmVmZXJlbmNlIG92ZXIgbXRkX2RuIGluc3RlYWQuCi0t
LQogZHJpdmVycy9tdGQvbXRkY29yZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9t
dGRjb3JlLmMKaW5kZXggYmIwNzU5Y2ExMmYxLi5mZjZkMDNmNTc5MjQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbXRkL210ZGNvcmUuYworKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKQEAgLTYyMCw2
ICs2MjAsNyBAQCBzdGF0aWMgdm9pZCBtdGRfY2hlY2tfb2Zfbm9kZShzdHJ1Y3QgbXRkX2luZm8g
Km10ZCkKIAkJaWYgKHBsZW4gPT0gbXRkX25hbWVfbGVuICYmCiAJCSAgICAhc3RybmNtcChtdGQt
Pm5hbWUsIHBuYW1lICsgb2Zmc2V0LCBwbGVuKSkgewogCQkJbXRkX3NldF9vZl9ub2RlKG10ZCwg
bXRkX2RuKTsKKwkJCW9mX25vZGVfcHV0KG10ZF9kbik7CiAJCQlicmVhazsKIAkJfQogCX0KLS0g
CjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
