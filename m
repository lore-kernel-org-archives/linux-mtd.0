Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A028DC3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jan 2024 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eYN5hBRGlct6h2Ilxhbh7bXGjtiSIuCJHT/WnGaT+gw=; b=xr2qq1hDDEwshF
	KrvUVtKzcVgu/ErqbuBSXdQllT4wSBS/8v2/WvNetu0MT7Hf7+YQx0mkywYn0eqbvDToJsa2ZBTdK
	wS8C2dlG4uB/4/QA4SBn96J0zk418EYpuD0fxcPcGolTO3+/7D8I9cF1mipXahJwLCyxiE1KFpZJD
	tSFJlJtD6bWJqRIPUZvVF+Ml7sIj5G4KsLKvGLZ+RUxQYobj2F5J9iSkqsIMGcVJ3aFBjN3+wmHVB
	MC535+hwEJky/lrF1lQ0maecVGrTlvwLbs5ISJ48ZLY6r87n0d5qWadjRktnlOuRzjGt+q14KT6WA
	P/PMhpKsiu0Xrk3R7Bqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3Hi-00BGzw-32;
	Wed, 03 Jan 2024 15:35:58 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3Hg-00BGz8-0w
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jan 2024 15:35:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B96360010;
	Wed,  3 Jan 2024 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704296150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PiImE412lJQgqtEGLZrMYE42Z6p53awQ3y9c75mFNDQ=;
	b=By9e61sulWU151JLCX9Kf4WXZbx2KAgoCAaK6j41OOUEZrL5RhL+b74NyQcjZN8q0KdT27
	QsHKGXuhWfborC4k9I2AAhUuXruwdlSFdnPyeBOHYH+fS2rkTOCp3x1c/0A2t4hY7oCI4d
	uyu5OotSq+ZtavdbIRyKEoXhyKfoquyNKUYvLjqvkGtwAddge/DcSsg8w09xOyavO71oDc
	q0WvYUQrg87a1aVIZZIRcwvBsRyL8mw2oihp1g/DUfMIqMVz3dcwRaUM8UG27/siytwV4k
	8ZN84WT/dp+MHgRK6gs5cq9Yd7nE7o2ymR6tXJVXAFyGkVdFHOEjxO2xUcXbAg==
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
Subject: [PATCH] mtd: Fix possible refcounting issue when going through partition nodes
Date: Wed,  3 Jan 2024 16:35:49 +0100
Message-Id: <20240103153549.106681-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_073556_633225_72886591 
X-CRM114-Status: GOOD (  12.48  )
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

VW5kZXIgIm5vcm1hbCIgY29uZGl0aW9ucywgdGhlIGxvb3AgZ29lcyBvdmVyIGFsbCB0aGUgcGFy
dGl0aW9ucywgYW5kCidicmVha3MnIHdoZW4gdGhlIHJlbGV2YW50IHBhcnRpdGlvbiBpcyBmb3Vu
ZC4gQWZ0ZXIgdGhlIGJyZWFrIGFuZApvdXRzaWRlIHRoZSBsb29wLCBvZl9ub2RlX3B1dCgpIGlz
IGNhbGxlZCB0byByZWxlYXNlIHRoZSAncGFydGl0aW9ucycKb2Zfbm9kZS4gSG93ZXZlciBpZiBu
byBwYXJ0aXRpb24gbWF0Y2hlcyAoSSdtIG5vdCBzdXJlIHRoaXMgaXMgYQpyZWFsLXdvcmxkIHVz
ZSBjYXNlKSwgdGhlIGxvb3AgdGVybWluYXRlcyBub3JtYWxseSBhbmQgb2Zfbm9kZV9wdXQoKQpn
ZXRzIGNhbGxlZCBvbiB0aGUgaGVhZCBvZiB0aGUgbGlzdCwgbWVhbmluZyBvZl9ub2RlX3B1dCgp
IHdpbGwgYmUKY2FsbGVkIHR3aWNlIG9uIHRoZSBsb29wIGhlYWRlciwgd2hpY2ggaXMgbm90IGFw
cHJvcHJpYXRlLgoKUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
PgpSZXBvcnRlZC1ieTogSnVsaWEgTGF3YWxsIDxqdWxpYS5sYXdhbGxAaW5yaWEuZnI+CkNsb3Nl
czogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTIyNTA1NDYuSVN6Z2x2TTItbGtwQGlu
dGVsLmNvbS8KQ2M6IENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KQ2M6
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KU2lnbmVkLW9mZi1ieTogTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KLS0tClRoaXMgaXMgY29tcGlsZS10
ZXN0ZWQgb25seS4KLS0tCiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKaW5kZXggYmIwNzU5Y2ExMmYx
Li4xMDQ5ZDgyMjM4OTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYworKysgYi9k
cml2ZXJzL210ZC9tdGRjb3JlLmMKQEAgLTYyMCwxMSArNjIwLDExIEBAIHN0YXRpYyB2b2lkIG10
ZF9jaGVja19vZl9ub2RlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQogCQlpZiAocGxlbiA9PSBtdGRf
bmFtZV9sZW4gJiYKIAkJICAgICFzdHJuY21wKG10ZC0+bmFtZSwgcG5hbWUgKyBvZmZzZXQsIHBs
ZW4pKSB7CiAJCQltdGRfc2V0X29mX25vZGUobXRkLCBtdGRfZG4pOworCQkJb2Zfbm9kZV9wdXQo
cGFydGl0aW9ucyk7CiAJCQlicmVhazsKIAkJfQogCX0KIAotCW9mX25vZGVfcHV0KHBhcnRpdGlv
bnMpOwogZXhpdF9wYXJlbnQ6CiAJb2Zfbm9kZV9wdXQocGFyZW50X2RuKTsKIH0KLS0gCjIuMzQu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
