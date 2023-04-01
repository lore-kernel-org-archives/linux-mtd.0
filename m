Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A85C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HqEmC+mh0ZMjgSIqafs3VuZpSnDYL1xPiUZirIEHcU=; b=ZYpwWEfTY4dpsb
	gqC3LaLncBfQ8y4oh1AY4KUrCbpozE7+mUdX/ZwSU662GGiPXoAz5BqHWrHl5UPPUqrF9WPIZ3j+w
	/xx7cISmJ9nCreFpq40O1xdcZi7aF/soLngSdy+gCTn43Gk8sRiSWBjg3uQ6GF+E1V8X7z3SAJZaE
	E+DPCO6k86f51bzd79KcYr9kKE+f4Pe3oTCz5NVlTGtpOnq4caKzJI/Gdi1+I8gK520TWLk7IBuwB
	gYB1kSfLt9lZGkEgr7bM9jUcqXXHpYVEMTm4jfX0FQxjEfN7pNqlhAkCqx+0phvboegy/3OOr2ZSD
	ntJFOEbrmdI7AMEkhGBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieFE-00AxAB-0I;
	Sat, 01 Apr 2023 16:38:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEP-00AwRk-0p
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=du27Q0n/f1QePymWPzjyyEdCxXBBRCPBaY+ZxA+VYGY=; b=oH2vw32YrdHfC/wqM00efTMOcK
	KNwkNtllzzjq48sXbXUqbO8iVx2q0yq9g0NZp7hvtSFkfY9eOyfxmAxsBKgSYAm5DJlUxz8I0ZmIo
	Jy6SGO3KEw7Cov0NuAnHc1QiTwRywiYeLMdHDHhP8afXtMpBbb11z8c5nbqIGMjkAnwUUirMyFgXI
	4ekYuCbNZ09dMWMb1P0XgPYaLuXvT0A0H5UWWITzQImTY8IzUQozLjeHPXIWKSlgiBwIG2Zjk3EyT
	I4930PAj0eWqafw1sfpx+T8qiF4An2rE8pH1HobeGLenGrZ1QUh6r0JoqlXMBsUbkMVrr6NwCTGK5
	8TbCztTg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxS-00CYO9-TF
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-0008SO-D6; Sat, 01 Apr 2023 18:19:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-008GSO-JB; Sat, 01 Apr 2023 18:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxJ-009khC-6c; Sat, 01 Apr 2023 18:19:53 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 33/49] mtd: rawnand: orion: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:22 +0200
Message-Id: <20230401161938.2503204-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=W+UYBgQAJFZeZsDfcOBfTmR0jObXHTo9YMzd82OzR4A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFk9+UQ+F5lK3o+3fgK7D1bp9dyovfn51We/3 fmkM0dwqDKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZPQAKCRCPgPtYfRL+ TrluCACDw5GELQM8EroSOXvPTA15GbyyDqV3n+WwfjlkxQJn4hAJSd3AoIPXvzE8kztRHhEUnr7 R9gilRSIYvDFRnVc3RRRJ2Fjeq28rViA/CYaApOe9twT2eDJ6XwKeuHk7zCQymFEdNzaOpuMWpB ai2t/0hequ367xyMS/RuPHtH0f65hzWNT66vDX+P5un7v5RsAcJ9tpGuy+U7LzIfQQw6DIQ7GVK DpIHJLZYJ+Bu/tOzZplxsiu8XrpT57+VzkI4IF0afS+o7FhsKgt7cnIwr6Gf82tF8iVOfzFbpJT Q9BWtYA/o9YqSk3R1mDZvJFwo6u7iY+6pIDbpOn+k8Jug7ZU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172003_029790_0C39CD0D 
X-CRM114-Status: GOOD (  12.88  )
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9tdGQvbmFuZC9yYXcvb3Jpb25fbmFuZC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvb3Jpb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvb3Jpb25fbmFu
ZC5jCmluZGV4IDFiZmVjZjUwMjIxNi4uMzlhNmM2MzYwNTg4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9vcmlvbl9uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvb3Jp
b25fbmFuZC5jCkBAIC0yMDcsNyArMjA3LDcgQEAgc3RhdGljIGludCBfX2luaXQgb3Jpb25fbmFu
ZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAK
LXN0YXRpYyBpbnQgb3Jpb25fbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKK3N0YXRpYyB2b2lkIG9yaW9uX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiB7CiAJc3RydWN0IG9yaW9uX25hbmRfaW5mbyAqaW5mbyA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKHBkZXYpOwogCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSAmaW5mby0+Y2hpcDsKQEAg
LTIxOSw4ICsyMTksNiBAQCBzdGF0aWMgaW50IG9yaW9uX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJbmFuZF9jbGVhbnVwKGNoaXApOwogCiAJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKGluZm8tPmNsayk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogI2lmZGVmIENPTkZJR19P
RgpAQCAtMjMyLDcgKzIzMCw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG9yaW9uX25hbmRf
b2ZfbWF0Y2hfdGFibGUpOwogI2VuZGlmCiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IG9yaW9uX25hbmRfZHJpdmVyID0gewotCS5yZW1vdmUJCT0gb3Jpb25fbmFuZF9yZW1vdmUsCisJ
LnJlbW92ZV9uZXcJPSBvcmlvbl9uYW5kX3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJ
PSAib3Jpb25fbmFuZCIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihvcmlvbl9u
YW5kX29mX21hdGNoX3RhYmxlKSwKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
