Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B62DC76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAnO4dtTI1SXYO7iq2uDkdLc89Q9QBhyN4si8I/5MFs=; b=0y1QOJuwdhlvcN
	8gVLdBu0cZmjNKJToJcoHgr1Id2OrFjwBXueE+JHXCgMf55e5n+4FWygqG7iquhLYefTiT+jm0BM3
	qOXw2lYOMDX5eOXvLF9zp2ypphzvRbo+dmrkFbJQcVKDSazdT5hBkWkS0QhN/lp0L3JoIi9xzW9zw
	/fkXcvz49PMb0e2ItWCjYhg7sJhge/a59WzB6rBXtrJ/Mb5KCABPXIrNWumfDu1VGZQqevg8MPc7g
	LB0mxK94qlYBfApJ59fBp1Nu/ctefIAmp9sFHHcjcnKf/nYYRDzJW9bFXhbiPdwYdCgS0NAAVptvs
	DJOw7XnHrPR0b/bjpqHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieET-00Awal-0C;
	Sat, 01 Apr 2023 16:37:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEJ-00AwRk-1K
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0dlD/ciAM1mAdaJeniyJfYCyGG0Ji/lVaYEE5QDKm2E=; b=Nv+T9WWuXEbu7y/xXtdfMX0n+v
	B+XJM7nLMk5OO1B7csW/KYMDADbbfXbsn86OFQQv/j5D55hAO2Sx5tTDiA46paopj/LrXJ4vpzmBb
	LQMNpwgcedUmhDSjbhme+bV7/3fjOmc8iwhLC72JALNt8yljVkoarv7eVXw+7HZG2eHfvgwFdUtV6
	xfu0eYy5KUyhwhUh/+Nkv0PHMf6L2WCSfmPxUR0cSItEL7PVCrKZIxVQxL4PoioEVqfvVkgTxZ+S4
	yr9/Gd4B16aQfwuUMEIoOchW5bKNs5devjAAYehEgqRLvz8CexwO9dL7gaMmhKJBTwutYOvCVmN6X
	CFDhpxkA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxU-00CYS4-Ps
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxP-0000N0-LF; Sat, 01 Apr 2023 18:19:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxN-008GTQ-M0; Sat, 01 Apr 2023 18:19:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-009khu-Fr; Sat, 01 Apr 2023 18:19:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 44/49] mtd: rawnand: socrates: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:33 +0200
Message-Id: <20230401161938.2503204-45-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ubqLpURaWIdRpwU4SbY9gA9Nj93h7rIhZhWsYkx7Yqk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlPiK0nHU5VZtlcPwHjM3pOl5BJPTRkzbG14 XLSiYjIDzqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZTwAKCRCPgPtYfRL+ ToxGB/4wV1VkjAunagUxV/4qSr4uxkRG2WdKKpGYttkUj99xWx/hMpZGFQ3ZEQHPG1KTRraaiHT UPo7kvnhcQb+dWyH8zs8WkN/GIf04OAuU+rXpnfgIX8g+mJkJhBhFF0xDE2siVQGqN02fe7iZHK vWtWU/ZvX9a1wNrYyOspdc8hxI4wZlAjiCuQ91fzZnIcNB4sA18MEp0GrHiYNdVkkQ99A91J5rK ki4FvLhxpoPpe3TH+EuvMLulTBOPBpB4CcAn2jI3fCXD1LzsnBHcffyS7iTJ/+lYdn7pTpGnvYp XN3pF6JPg9JOwQ0gmB3ttsMKzitOUUFwDecbqB90agJW1H6X
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172004_877285_DA77E0E8 
X-CRM114-Status: GOOD (  13.39  )
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
dmVycy9tdGQvbmFuZC9yYXcvc29jcmF0ZXNfbmFuZC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvc29jcmF0ZXNfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc29j
cmF0ZXNfbmFuZC5jCmluZGV4IGZiMzljYzdlYmNlMC4uYThiNzIwZmZlOWU4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zb2NyYXRlc19uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc29jcmF0ZXNfbmFuZC5jCkBAIC0yMDEsNyArMjAxLDcgQEAgc3RhdGljIGludCBz
b2NyYXRlc19uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9mZGV2KQogLyoKICAq
IFJlbW92ZSBhIE5BTkQgZGV2aWNlLgogICovCi1zdGF0aWMgaW50IHNvY3JhdGVzX25hbmRfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9mZGV2KQorc3RhdGljIHZvaWQgc29jcmF0ZXNf
bmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb2ZkZXYpCiB7CiAJc3RydWN0IHNv
Y3JhdGVzX25hbmRfaG9zdCAqaG9zdCA9IGRldl9nZXRfZHJ2ZGF0YSgmb2ZkZXYtPmRldik7CiAJ
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9ICZob3N0LT5uYW5kX2NoaXA7CkBAIC0yMTIsOCArMjEy
LDYgQEAgc3RhdGljIGludCBzb2NyYXRlc19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpvZmRldikKIAluYW5kX2NsZWFudXAoY2hpcCk7CiAKIAlpb3VubWFwKGhvc3QtPmlvX2Jh
c2UpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IHNvY3JhdGVzX25hbmRfbWF0Y2hbXSA9CkBAIC0yMzIsNyArMjMwLDcgQEAgc3RhdGljIHN0cnVj
dCBwbGF0Zm9ybV9kcml2ZXIgc29jcmF0ZXNfbmFuZF9kcml2ZXIgPSB7CiAJCS5vZl9tYXRjaF90
YWJsZSA9IHNvY3JhdGVzX25hbmRfbWF0Y2gsCiAJfSwKIAkucHJvYmUJCT0gc29jcmF0ZXNfbmFu
ZF9wcm9iZSwKLQkucmVtb3ZlCQk9IHNvY3JhdGVzX25hbmRfcmVtb3ZlLAorCS5yZW1vdmVfbmV3
CT0gc29jcmF0ZXNfbmFuZF9yZW1vdmUsCiB9OwogCiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHNv
Y3JhdGVzX25hbmRfZHJpdmVyKTsKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
