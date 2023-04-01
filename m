Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E67C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFBgulmdF1Jj9Awj0wgudBu0MCxwczECIVlTh1nj620=; b=fMiQ4kkiNZGgPJ
	doJ2BNL2fx6w0okvDE6yZO5uhxqyaxTIDQj9jQms16XS9p+KZEXkBOl0XagEHUCD0fKLBQygwg1V5
	vs+4y/2FhOSknZ/cJOe289NMU8f/E3ofE3ZqhG7OQt6O35Mdn33mByBbckUJR6CWBQpYMbcpm8X1A
	BDkXnpM9aEe4CyhXL47I9ArYDyojdKnSz3hL2PxSlTuSv/PMjPAwpm5p85Mvjb8yE7rO0DWLeEvOk
	p+2olNxvoRF6zCMgfpciW1MCEGBpX9ONUllDpa6gBrq8TuylU6lxUCWl+dvdCFRBN+kAuJWpwPu5F
	DoNUanYOX1HsXkInpu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidz8-00AtPX-2M;
	Sat, 01 Apr 2023 16:21:46 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxg-00AsJU-0V
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PvIIyOgWTRJ/ZciFDr04PorRcSxoJ3RyFpQBQxFwan4=; b=gdmgChvY14OgzzoMs7CmLnN7Ga
	JUIMMj6ZwFc+luAa0LxewTf+WsVAwe7HsMUYpyjU9u/5ejV9x7qv4pp4ecVTa7JCvACEUm+tP9caX
	94ijTN7+kWDk8TZCPzH4C2/0XSloBOlxxSE6klguh4iitp1GHgB98vc0Tx0vOvcoKIYwV/5El//5n
	Ih4UcXl+HkY/oQwizFunaZbeYpWkZ0VYgCrWZvv1Sn3CGxlWr2PnZNiV4AT8H4TJutUqgqpK1253Y
	6+n2A2HIBIX4pKWLe5Xn8kt1nQ9TbI/WrpcWJNLs3Wqxz0D/ib62rCnGUqIEt/QVHMM0kL3xng/zW
	yRlmIMfw==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-008DKo-14
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-0008Nj-AD; Sat, 01 Apr 2023 18:19:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxJ-008GRp-3x; Sat, 01 Apr 2023 18:19:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-009kgw-Bd; Sat, 01 Apr 2023 18:19:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 29/49] mtd: rawnand: mxic: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:18 +0200
Message-Id: <20230401161938.2503204-30-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rWPkYqoEydSYHk43eQLy3o1FwM6CRP1SaxcZbhcEOt0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkvxAwMTjlzxl5e/Lo/aYyDwbCiiDeaeyWOt nZ6UXAjodKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZLwAKCRCPgPtYfRL+ TncBB/oDqI9rby3kUJ5uf4k4YlV0zGefT6LlTjpE5julwHre+/93kY5WMwVn/ZOrY0t8zbzrBmW spDsLPEGV7+U7PHDo/BSzrPzoyOULf8sKHXiU4JwarNREkOcYdPii48XZ4j7AH+cufDXpadqANY giiL17O5U3OOGjkI/lwQmUBp7OvbtHLLfXcKNjzsIBH3mvm4fnDoRRtlYochm4I2996cn0j9HFc aomcXtFpJL6bYPYE89yEcoRgNlOUyq3ul1USFK2EJ7EKyRSMPIHwiHVpLHLJBkLSjcA3eDxs+57 dRUlMB6pW5eBM1q0cBdNC5DM+pkDuvAYvUm8nrv4SXSohme+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172007_729231_35A7161A 
X-CRM114-Status: GOOD (  16.72  )
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
dmVycy9tdGQvbmFuZC9yYXcvbXhpY19uYW5kLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L214aWNfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXhpY19uYW5kLmMK
aW5kZXggZGExMDcwOTkzOTk0Li5iZTgwNTBlODRiNGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L214aWNfbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L214aWNfbmFu
ZC5jCkBAIC01NTMsNyArNTUzLDcgQEAgc3RhdGljIGludCBteGljX25mY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiBlcnI7CiB9CiAKLXN0YXRpYyBpbnQgbXhp
Y19uZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBt
eGljX25mY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qg
bXhpY19uYW5kX2N0bHIgKm5mYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCXN0cnVj
dCBuYW5kX2NoaXAgKmNoaXAgPSAmbmZjLT5jaGlwOwpAQCAtNTY0LDcgKzU2NCw2IEBAIHN0YXRp
YyBpbnQgbXhpY19uZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJbmFu
ZF9jbGVhbnVwKGNoaXApOwogCiAJbXhpY19uZmNfY2xrX2Rpc2FibGUobmZjKTsKLQlyZXR1cm4g
MDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXhpY19uZmNfb2ZfaWRz
W10gPSB7CkBAIC01NzUsNyArNTc0LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXhpY19u
ZmNfb2ZfaWRzKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXhpY19uZmNfZHJp
dmVyID0gewogCS5wcm9iZSA9IG14aWNfbmZjX3Byb2JlLAotCS5yZW1vdmUgPSBteGljX25mY19y
ZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBteGljX25mY19yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJ
Lm5hbWUgPSAibXhpYy1uZmMiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBteGljX25mY19vZl9pZHMs
Ci0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
