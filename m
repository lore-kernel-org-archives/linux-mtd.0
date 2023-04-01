Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54079C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40lrhw7Ivb7Zcq+WQdQzOQ4N3BHRe7Q/u4aspCFCRJs=; b=gFjq2OHAlchT6c
	shmjfn2VOXtaxdRR/yewNetFmFrf9ySd+LHjvQRBk385OxJxb2Rzuy1MqEObEcGLS7RGI+MrEgWo/
	rKoswLPiExYlza0jb6mRWEveHcuusm6sm2myIm+tP1ZeDP3PlItMHF+UZ4u1CFbfCPEo3yua2kGrI
	JIzaHf/C6p0vOR/gJJSn4ROjVA3egP+tLEn5EUPCtJDKsUft0UsKyWhB8OsQUPeEP7T9dvybvERwY
	I8EJ5UAi/FU+8I7NcTmqkFlLsbmV41k9tDdrRqP7IDlOpDKPmYxlJIIR2YratHafp/s9j9pRzGP5Q
	Ks0cAFzBs7N9E8dr9Yfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidyX-00Asr0-1l;
	Sat, 01 Apr 2023 16:21:10 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxe-00AsIJ-1J
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Nwv+hEef3prAOF1uQ9Zm+GfCP3l9mNoBs/uqeuaNDEo=; b=EArabt7hC8xVBUXz5FBrRJ6pB+
	Rpt8AdpkArbsB0XVfobIFQXziYYr2gox+q8TNxR8rtwvElJa0W+NjGNQl7MW2v2W0IirHu1MOMmCr
	dD4wO+LQ/wIEMM1cXKd0Ux8RtzFlMvTtNweQOX/SK7MuUUqmP7aQ+jcnePD7ftQqIJeL6y0egoGnn
	5oVl9oZk7etZKmmVzzAdHBO+1sBv86nJYM1YB3VvJAvp6QVE703eRVmymuKgvVUZX5+Povi1n74K/
	8pxY4SGR+osgY8v87p2G0cF7sJPLetdWHaYfP7zPlEScZcjgg76dl9XTeW6dhAN4d9xtsZL8ZzlyR
	VMYU6G8Q==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-008DLN-0F
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-0008AK-ES; Sat, 01 Apr 2023 18:19:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxF-008GQL-6g; Sat, 01 Apr 2023 18:19:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-009kfl-Hz; Sat, 01 Apr 2023 18:19:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Wang Weiyang <wangweiyang2@huawei.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 11/49] mtd: rawnand: davinci: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:00 +0200
Message-Id: <20230401161938.2503204-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6j4UEMrS0KAskczZmMyNk/+K1HHRyJInNQcZ4a0+R0Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFj8fcpEjzOi6DvCXPaMB0evheDUt0RmkpGpN hHgNMlZ84qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY/AAKCRCPgPtYfRL+ TixZB/48yF9uUDKNS9Fnz11n8XadIQGt+Ylz38EWBRn4873wNGddvYixBptRmXHLKsAJIKfxZnu 1jRmuo3URW0hzvdLNyX4oRQqZ3GGF9sdvljx+tE8a5acJEMvFoMA8ZVK98HY1+KHo4gqy72kCa+ qxenn0j4JKMdn3EuVWC79gV5SRJX2w/gfoJMvZSoUuYWdvbsCSZa5jE28Ape5x30dbzOBJyrYAH xkXuzO7u6Q9dJY2HUaOyBpnveGkL7LJSA1mvsQJxKzYB1Blqh1l0f4B89HtZUyBtFcDnTXo9vz4 hkhUHxPg7Wn6sQVsBs1Pxd3AdkrAzGvmHqOs6VQpBWjN/cz/
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172007_222374_6461F151 
X-CRM114-Status: GOOD (  16.17  )
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
dmVycy9tdGQvbmFuZC9yYXcvZGF2aW5jaV9uYW5kLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9kYXZpbmNpX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Rhdmlu
Y2lfbmFuZC5jCmluZGV4IDNlOThlM2MyNTViZi4uNDE1ZDZhYWE4MjU1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9kYXZpbmNpX25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9kYXZpbmNpX25hbmQuYwpAQCAtODIxLDcgKzgyMSw3IEBAIHN0YXRpYyBpbnQgbmFuZF9k
YXZpbmNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsK
IH0KIAotc3RhdGljIGludCBuYW5kX2RhdmluY2lfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCitzdGF0aWMgdm9pZCBuYW5kX2RhdmluY2lfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGRhdmluY2lfbmFuZF9pbmZvICppbmZvID0gcGxh
dGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAJc3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9ICZpbmZv
LT5jaGlwOwpAQCAtODM1LDEzICs4MzUsMTEgQEAgc3RhdGljIGludCBuYW5kX2RhdmluY2lfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0ID0gbXRkX2RldmljZV91bnJl
Z2lzdGVyKG5hbmRfdG9fbXRkKGNoaXApKTsKIAlXQVJOX09OKHJldCk7CiAJbmFuZF9jbGVhbnVw
KGNoaXApOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IG5hbmRfZGF2aW5jaV9kcml2ZXIgPSB7CiAJLnByb2JlCQk9IG5hbmRfZGF2aW5jaV9wcm9iZSwK
LQkucmVtb3ZlCQk9IG5hbmRfZGF2aW5jaV9yZW1vdmUsCisJLnJlbW92ZV9uZXcJPSBuYW5kX2Rh
dmluY2lfcmVtb3ZlLAogCS5kcml2ZXIJCT0gewogCQkubmFtZQk9ICJkYXZpbmNpX25hbmQiLAog
CQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIoZGF2aW5jaV9uYW5kX29mX21hdGNoKSwK
LS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
