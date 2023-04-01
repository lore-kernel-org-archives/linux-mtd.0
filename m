Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6634C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+t6cWT83TznZyeDyWZv+6QQHvpKbuvVMUqhb6fM6bo=; b=kPAeUzZorVBi3A
	2dlY/675C96PrXDBtxEm0y8Br3Pket4/tlv7dvD6GCDSR4vTfBG1/2mQqFPeORh0BgZRPegkzTf3f
	Yc3tUDBSErsJAgNJP4aaNst4YdXEp1iJ5UiyrQnyViZmTAtdH1By4bs3uDSyLMRt5W/Qgwk57dL3w
	5qfizxCk/y3gkk/2/J4Jwvk4fLzU/E0CiiwqEVIKdDoBdixahM2AHCgTDPnlLhC9z8BcyscbplLEz
	ceGkJi8Y5d+hNv+9i+Dcmgv5dEQaWpXLloZCJ1WJxW1Xj6Pc7SzDhrIdwPNCungktNqcYn6lDaOJh
	usY0TbdWT1lAFgRSQ7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidyq-00At65-2f;
	Sat, 01 Apr 2023 16:21:29 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxe-00AsIW-1g
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XeoA3VXnYeL85qkIJ3C4q8nryJqrAD1lDdJN55Ny8eM=; b=bH5Z+GF/l+jpBnR1f5HnyXYUWZ
	yLya3Wp3Z/LpABaLIWVBk2Zphv90Btxte5082eMZ0LZYAyorM03t6boawJ8ah2IeUTB7aealTXiNH
	x1airFqL1Zk+1MQE29PxaJly4ZSYdsH7jN5+jGivjuEK4zmfk06L8mR6WMKNJ4obilUUZQ6vfNp47
	FS6xDqvvW+IqxFzMF0hKflN32LndpKZtN9INSMKL29G81dRc4lek4csBdUh36YVUNwXGFiyOLAsoF
	wz3SGNW+oAUtj5rq+s/KAhxyDzar7i+77kxkygxunWd4txdOfC8PU6NFIzaHug6HO6/3NnYCKCK9T
	w1I5KjsA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-008DKq-0e
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-0008IJ-Ob; Sat, 01 Apr 2023 18:19:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-008GQx-GI; Sat, 01 Apr 2023 18:19:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxG-009kgB-0V; Sat, 01 Apr 2023 18:19:50 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 18/49] mtd: rawnand: gpmi: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:07 +0200
Message-Id: <20230401161938.2503204-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=I6EVSr6QGjL8lpfPKlM/3fhcolF1XVFCCRUURQirUmQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkEuJ3wIJOaK4fGO8lU70GEV7wfz1ww4Yfnm nKMVt+eyOCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZBAAKCRCPgPtYfRL+ To05CAC6UtwPrRzoXurRptFLYotS3M5Kil56Bdf1CCJmTqG4kBX6ubgsiSA/QMvUYHceB40ms9Z 4jemDbyLX7AqqQhH+8Ku3YJCqALI6LCkSyrg5y5SJazaU4/OZtp17GPj/vwgQNl5cpjeYntFI2w gltO5yM2tvyG2uDKmC92I1qlCkfR4DTPzbKUALDfvxgMV2c4kZ45IpaFvJFDDr+wPhYzA2xkFoZ PJAYigY9RcFzWklErD6iTKEP0oV0XWwnZosxC1+CMkyI3TWr1LKl/IIaoBWfpEobALztasBsH9l EZ0yoCtwc5guuXXxJsPDRolJDsN4958FAEplScKTVsyYKQmU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172007_343403_8F1E5AB6 
X-CRM114-Status: GOOD (  16.06  )
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
dmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jIHwgNSArKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKaW5kZXggYWRhODMzNDRiMGY5Li41MDBlN2Ey
OGQyZTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5h
bmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKQEAg
LTI3NzcsNyArMjc3Nyw3IEBAIHN0YXRpYyBpbnQgZ3BtaV9uYW5kX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBncG1pX25h
bmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBncG1p
X25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGdw
bWlfbmFuZF9kYXRhICp0aGlzID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAJc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCA9ICZ0aGlzLT5uYW5kOwpAQCAtMjc5MSw3ICsyNzkxLDYgQEAgc3Rh
dGljIGludCBncG1pX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
bmFuZF9jbGVhbnVwKGNoaXApOwogCWdwbWlfZnJlZV9kbWFfYnVmZmVyKHRoaXMpOwogCXJlbGVh
c2VfcmVzb3VyY2VzKHRoaXMpOwotCXJldHVybiAwOwogfQogCiAjaWZkZWYgQ09ORklHX1BNX1NM
RUVQCkBAIC0yODYwLDcgKzI4NTksNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBn
cG1pX25hbmRfZHJpdmVyID0gewogCQkub2ZfbWF0Y2hfdGFibGUgPSBncG1pX25hbmRfaWRfdGFi
bGUsCiAJfSwKIAkucHJvYmUgICA9IGdwbWlfbmFuZF9wcm9iZSwKLQkucmVtb3ZlICA9IGdwbWlf
bmFuZF9yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBncG1pX25hbmRfcmVtb3ZlLAogfTsKIG1vZHVs
ZV9wbGF0Zm9ybV9kcml2ZXIoZ3BtaV9uYW5kX2RyaXZlcik7CiAKLS0gCjIuMzkuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
