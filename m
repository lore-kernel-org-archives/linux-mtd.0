Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69499C77B62
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dq6+3cLPH3RYIhypk1n7ILUuIVK/bZDYjZW5lX261nc=; b=sYpW2wdXAEHsVA
	8iCp9LW+d+Vp+scmuSTCBVRGns5pDQ4lj1uffu/TZn/4NKO0LIaNUd8qXnfb/0sySK2CcYbzgDs7Q
	LOUng4Nc8cZzL898+R4iVUyg/4SAzTF9UShCl6K4cCZXFLX0jZeeFKUtFDVRFtr7HZYWHDhrB/qyc
	zy2jpEgK3Y18RQJn2UWAzjLI7tO5Pryzyl0fzhCpGbOls2bvTeFIFZFYTBEECuDXPoTr0O1Fb+qAp
	qw5B1mLcdQJ5lhUODAiNgxFXjpMbCcUJ5n3Bp2UBW3YTS92dtuEqJ8Jmj5TUknt9drnke2BqS1EQj
	GnjT09jPT/wI1dDXAN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxn-00AsMd-0A;
	Sat, 01 Apr 2023 16:20:23 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxb-00AsFu-02
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=82OGQX4FQHKXC/0gh6rSGyigQm/ixNj7n6g/PqGRZFc=; b=hWccJAjAyD0Qyjx0+EgoPdEn0d
	OFDWMJNJt8N+9LrnBYdEzU+jzMamKOjjSwb+Tn9YORQkl8d2ojLmbO5424yvdYWJkf6bQ+0I4Zr7V
	5lQLX2Lm2LwRizajZopNwQlyxNt5Uobx1mjPVXwdzNBI26kwyNAhBxwgYRlgN4sehC11454R3DyBQ
	A2wqWchq4k2pBOXNldhAkI3YTqgDAZLaL+gX7JCzM4M6vP/TDOGiQJxTx4H8YCNFqc7jV9ztYBhcq
	mtEERMyKRYDVpgY+32PEyI+bie42NIRvJ7vtSTIEzUx8kanWIVeZVFrdFV0PlGLMNlzvEGWJmk9nP
	F3OssBbg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxW-008DKx-1G
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-0008JG-Jd; Sat, 01 Apr 2023 18:19:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-008GRD-L5; Sat, 01 Apr 2023 18:19:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxG-009kgS-QD; Sat, 01 Apr 2023 18:19:50 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 22/49] mtd: rawnand: lpc32xx_mlc: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:11 +0200
Message-Id: <20230401161938.2503204-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=TWFefpDxHWfkuMQsZUU/YYnQA1Ncz9g/YAZzkYUP7N4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkd8KJ2FC0m02q7GglRFellH7wX4OKY4WkZK fheCZgA7i+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZHQAKCRCPgPtYfRL+ TvECCACow5b8t+Hq5gDTf6e+tnBdhSOgrsnyqDBhEiYEqa77h150Sgy1x+wfRmsH5/b88M4R4WD 8qKRyef2PAKE55ATKvBO68X0fZqz5iO85iunO+VG58sH+4wzGbUjrWcmrVENgZgWhPh55dDADA5 GJdr6qn9zRKR+b982z12byIVLj942NSZTVNwAlSNk2bHOE+gMJYR87UFWVze+MOxm9zqZYpECFX ROd4IiNuKolA0ytb9DVyK+t7Wl4rN2gzUgsavWjDRpcoI9z33qAlwPwwfaYKzc4zNexhTMWEhfQ h5XWkNg/OZ3N6f6vG+ofuD1Z3FiUEAy4KKvcjf9M0Xb5boak
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172006_626945_54B03295 
X-CRM114-Status: GOOD (  16.28  )
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
dmVycy9tdGQvbmFuZC9yYXcvbHBjMzJ4eF9tbGMuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2xwYzMyeHhfbWxjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9scGMzMnh4
X21sYy5jCmluZGV4IGFlN2Y2NDI5YTVmNi4uYjMxMzZhZTZmNGU5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9scGMzMnh4X21sYy5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2xwYzMyeHhfbWxjLmMKQEAgLTgyNyw3ICs4MjcsNyBAQCBzdGF0aWMgaW50IGxwYzMyeHhfbmFu
ZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogLyoKICAqIFJlbW92ZSBOQU5E
IGRldmljZQogICovCi1zdGF0aWMgaW50IGxwYzMyeHhfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIGxwYzMyeHhfbmFuZF9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbHBjMzJ4eF9uYW5kX2hvc3QgKmhv
c3QgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlw
ID0gJmhvc3QtPm5hbmRfY2hpcDsKQEAgLTg0Niw4ICs4NDYsNiBAQCBzdGF0aWMgaW50IGxwYzMy
eHhfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWxwYzMyeHhf
d3BfZW5hYmxlKGhvc3QpOwogCWdwaW9kX3B1dChob3N0LT53cF9ncGlvKTsKLQotCXJldHVybiAw
OwogfQogCiBzdGF0aWMgaW50IGxwYzMyeHhfbmFuZF9yZXN1bWUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKQEAgLTg4OSw3ICs4ODcsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBs
cGMzMnh4X25hbmRfbWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBscGMz
Mnh4X25hbmRfZHJpdmVyID0gewogCS5wcm9iZQkJPSBscGMzMnh4X25hbmRfcHJvYmUsCi0JLnJl
bW92ZQkJPSBscGMzMnh4X25hbmRfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gbHBjMzJ4eF9uYW5k
X3JlbW92ZSwKIAkucmVzdW1lCQk9IHBtX3B0cihscGMzMnh4X25hbmRfcmVzdW1lKSwKIAkuc3Vz
cGVuZAk9IHBtX3B0cihscGMzMnh4X25hbmRfc3VzcGVuZCksCiAJLmRyaXZlcgkJPSB7Ci0tIAoy
LjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
