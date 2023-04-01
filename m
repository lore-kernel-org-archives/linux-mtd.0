Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CFAC76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBX4KuB6rnJvJMe9uLa9RK3m5LJA6sezsNiGlxPU6cs=; b=kOKF9VSxGh6fNl
	Udx4bHrxgX5dw8Do965JoEexj8mmze2vLQkzZK4c0Tdq6xOgVteQEkXBqCPuIJ2cBKpqwHO3Sgwgu
	Yk2ldsu+y/SGZO/+pK7i8DkF09b6XVsGHRAJhBRxUJ2t949YKOmaBdnung1KFDEm8lH67LucT1kgY
	tey0VEgm5KMS8YQ3ZzECs5cUMtEhKQBB/ibyoczgnGJcGLoZp7v28mGfzwdEJysUNGdYRK4J3ZJGe
	nwPz2eKleMtmJojwFGDYrOXYKvzU11g9Xu3hQM1kb9qOxurpJ+Db9Pz1gRZja6bIcwPKZhiQg74YC
	ZVrrJiRjpxyp2n1nfjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxm-00AsMF-0m;
	Sat, 01 Apr 2023 16:20:22 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As9J-07
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-0008Ic-C4; Sat, 01 Apr 2023 18:19:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-008GQz-HG; Sat, 01 Apr 2023 18:19:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxG-009kgF-7U; Sat, 01 Apr 2023 18:19:50 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 19/49] mtd: rawnand: hisi504: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:08 +0200
Message-Id: <20230401161938.2503204-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=h8KzG0qUANsFBO3MML34oItRa53SpBDKuXSmd1dfVzs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkKbW+23FNTo1YB000C/ol/uznYjrhjefjfu PF2LzAHgnyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZCgAKCRCPgPtYfRL+ TlOAB/9FjvEzimZ5MyccbAGNS8giH/4Kbmp3kdvxbbDDGQNRdz7FsczesyWDi8bNvkgdbc5c8VI MX1hBxMD/k5xnitqPqNmkd0Zq4l7prkJAk7NhR1n81U9Pmdf6hqbmkTlmXxdZIaCC7aY+fwRV6S p95ycHwxS8DSu0FuRdRLD/zWXgTy0jF42R44/26h0jdS+Xj4mEq+GyOSU7FvvUt+NJ8rQ0ambAH Lt8ebFqF0cDvFQ+Am42wv3rqhCFvTBoEYDNshNhoDkxp9GTE2yJ7d3sAK/sIlxqQ/+cH5k1V6S0 gsFj3xNqb8WH5X6lCJg65ROEpydMzis+WmC0kGGJoJuewPkY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_098934_296B4DF1 
X-CRM114-Status: GOOD (  15.84  )
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
dmVycy9tdGQvbmFuZC9yYXcvaGlzaTUwNF9uYW5kLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9oaXNpNTA0X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2hpc2k1
MDRfbmFuZC5jCmluZGV4IGM3NGY2YjIxOTJmYy4uZmUyOTFhMmU1Yzc3IDEwMDY0NAotLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9oaXNpNTA0X25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9oaXNpNTA0X25hbmQuYwpAQCAtNzk4LDcgKzc5OCw3IEBAIHN0YXRpYyBpbnQgaGlzaV9u
ZmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsKIH0KIAot
c3RhdGljIGludCBoaXNpX25mY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
K3N0YXRpYyB2b2lkIGhpc2lfbmZjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogewogCXN0cnVjdCBoaW5mY19ob3N0ICpob3N0ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRl
dik7CiAJc3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9ICZob3N0LT5jaGlwOwpAQCAtODA3LDggKzgw
Nyw2IEBAIHN0YXRpYyBpbnQgaGlzaV9uZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJcmV0ID0gbXRkX2RldmljZV91bnJlZ2lzdGVyKG5hbmRfdG9fbXRkKGNoaXApKTsK
IAlXQVJOX09OKHJldCk7CiAJbmFuZF9jbGVhbnVwKGNoaXApOwotCi0JcmV0dXJuIDA7CiB9CiAK
ICNpZmRlZiBDT05GSUdfUE1fU0xFRVAKQEAgLTg2MCw3ICs4NTgsNyBAQCBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBoaXNpX25mY19kcml2ZXIgPSB7CiAJCS5wbSA9ICZoaXNpX25mY19w
bV9vcHMsCiAJfSwKIAkucHJvYmUJCT0gaGlzaV9uZmNfcHJvYmUsCi0JLnJlbW92ZQkJPSBoaXNp
X25mY19yZW1vdmUsCisJLnJlbW92ZV9uZXcJPSBoaXNpX25mY19yZW1vdmUsCiB9OwogCiBtb2R1
bGVfcGxhdGZvcm1fZHJpdmVyKGhpc2lfbmZjX2RyaXZlcik7Ci0tIAoyLjM5LjIKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
