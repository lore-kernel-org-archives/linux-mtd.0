Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D4CC4167B
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aXL5mdmnKmsfZkmEB5xaljDtblp/MphP3PIyXLuiDE=; b=Sqe8curC/r/eXS
	dBV8TRYWSMjHCl37kt/RMTjNyGKTaQYjzSd8miYvvvc6oWHjP7toYjp+cdafikSPLutHxl0gAKlwJ
	zdvF/guT8M1jJuXuSe3ofXRCHZZkPKmYX3NN6xdtOcea3K3AC2TlNV5mZwbnRAvSkEeP/EnK3gvv4
	2PHNJbQYyYroR/paHtZPpvQ3lni2aG44u+tir6TxVDOsOUDUL8DgfhsE8GlRUY0UT/KD6X138PCQ1
	e1fgbsvLOaJp63gLuH5Z4XZFqt97t1YMz1oEYkW1Le1Bkh/UoksYeVKBQPIxDQ+1Eno7JJrIKtJfd
	RKy+EyaELbuOABNjj7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfmQ-00ALkf-1O;
	Thu, 02 Nov 2023 22:03:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfmL-00ALiN-1a
	for linux-mtd@lists.infradead.org;
	Thu, 02 Nov 2023 22:03:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmF-0007aU-Hy; Thu, 02 Nov 2023 23:02:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmF-006AFW-5H; Thu, 02 Nov 2023 23:02:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmE-00BwFU-SP; Thu, 02 Nov 2023 23:02:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 4/4] mtd: rawnand: txx9ndfmc: Convert to platform remove callback returning void
Date: Thu,  2 Nov 2023 23:02:51 +0100
Message-ID: <20231102220246.3336154-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102220246.3336154-6-u.kleine-koenig@pengutronix.de>
References: <20231102220246.3336154-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=D2umZaindGP0VzrOCEKK3u1BiYNq5//uhDQR07lOMq0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlRByMN6rzWlmQp87J364d3D+1qjDrQz+JuXR/v yAgP2k1wK+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUQcjAAKCRCPgPtYfRL+ Tj01B/wLvHbbu4MWlKieP3DrIU3Nlp+UJGiu9RlLb7DXAuf8NNy0KP0SjJ9WSTsa/wN2Y+zCoTB YkfIpEzyiVbcrHP5CiZZsIB9/7S1h2K8rrBUoAfNyGeT4G2GIvCTZOyovrJrTkhpnim8eWV17pI OSnP3pZrL7qRjRDNL12cx0emxzcIDk5uOPGREyUFvVUpFxjp3CXtjKdPLSr7Aw8ruJ66sUUy451 QOtBfDLIVMa44z/IF+WANf46rVrrmvjlOFRatUDcyp8QO/2ujM8VHJzmRHE5GR8dpCZGkMBpPk3 IQYbP+2eqUGKSpNm53bP3evSkX8rzo+dU0w544lvquNNwUer
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_150305_561324_3C445090 
X-CRM114-Status: GOOD (  16.11  )
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy90eHg5bmRmbWMuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvdHh4OW5kZm1jLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy90eHg5bmRmbWMuYwpp
bmRleCBmZGNkZmJlYTBjYmQuLjM3Zjc5YzAxOWE3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvdHh4OW5kZm1jLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5kZm1j
LmMKQEAgLTM2OSw3ICszNjksNyBAQCBzdGF0aWMgaW50IHR4eDluZGZtY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgdHh4OW5k
Zm1jX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCitzdGF0aWMgdm9pZCB0eHg5
bmRmbWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgdHh4
OW5kZm1jX2RydmRhdGEgKmRydmRhdGEgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkZXYpOwogCWlu
dCByZXQsIGk7CkBAIC0zOTAsNyArMzkwLDYgQEAgc3RhdGljIGludCB0eHg5bmRmbWNfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKIAkJa2ZyZWUodHh4OV9wcml2LT5tdGRuYW1l
KTsKIAkJa2ZyZWUodHh4OV9wcml2KTsKIAl9Ci0JcmV0dXJuIDA7CiB9CiAKICNpZmRlZiBDT05G
SUdfUE0KQEAgLTQwNiw3ICs0MDUsNyBAQCBzdGF0aWMgaW50IHR4eDluZGZtY19yZXN1bWUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciB0eHg5bmRmbWNfZHJpdmVyID0gewogCS5wcm9iZQkJPSB0eHg5bmRmbWNfcHJvYmUsCi0JLnJl
bW92ZQkJPSB0eHg5bmRmbWNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gdHh4OW5kZm1jX3JlbW92
ZSwKIAkucmVzdW1lCQk9IHR4eDluZGZtY19yZXN1bWUsCiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1l
CT0gInR4eDluZGZtYyIsCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
