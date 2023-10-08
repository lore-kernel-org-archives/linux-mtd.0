Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F82E95A67
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xF0yz52ElJV00UFYRSBS9PLLbLQd1k/OtHnKm5olfDA=; b=sNkarmyrp6LzeN
	MrnyzX1Zy4hnrTsIe8BEATszgVKsDRm6izLKGPHoKeVvXYqVDD+1x2tyPeFaaqV1upPw9gOkQjjFP
	ihnYNTUAXIMqiGWSl4+vjqJ5SChqyw8nlIXK3Y2dALQzyinxL3B6nrczPddjV0EuWADYBNecYQ5n1
	C0GUccTfs5dXX38Sqrg6fhezyG18NZZRxp0WZB2dNVY+bs3nll81dRrMHdlJgV2BvSjXcRPzlI1gn
	tnbQVbVYOHKZdYUZiqCBmw0AV1RMfP0CA3dbYjO9MlD2NmVdwkBCLiwHrJTgyuhbw6hgLF+Yw3Lly
	aZala9+Pirh+iFlyO68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyt-009ECI-0T;
	Sun, 08 Oct 2023 20:02:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyq-009E8X-2Z
	for linux-mtd@bombadil.infradead.org;
	Sun, 08 Oct 2023 20:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4mTuqr2LKIU4Uy8BJH+p5wmw6vu4uehOeJbsorgEYz8=; b=mSb2Czjo6Jf2OlQ+zR0BFQOIC4
	8QWTUuIQuLw3khhb/Gd04X+8O49Oz+OTPs284/2MwYweTGQwABEFEYoOe67zYLSAuyyMlVnn9W84e
	m8gffncqhek2qvPtQmT5EpfNSZO1ssMtcSFq98ymanKuzvpUKoGAnqKr4kO7b63QoEjYd4OHfr5Cl
	GLAVn5Xn48Ms/lSxC0lsQHW/MjvzChRlHQ20Sf6jIuUxj/ermXdwbxTE11Si6hNZUjedznx3QCzHE
	GVTRzr3odU64IJ20sxbqwp8ti4WshRaRwKhJev9eAVGz57a6UcVTrk2OBsJqDVaQAcLu3H/kIlUaX
	eQ9PSRrA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyd-00ExWI-1G
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyQ-0001cf-5I; Sun, 08 Oct 2023 22:01:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyP-000Ezs-5E; Sun, 08 Oct 2023 22:01:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyO-00Bf0q-SB; Sun, 08 Oct 2023 22:01:56 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 13/20] mtd: maps: physmap-core: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:36 +0200
Message-Id: <20231008200143.196369-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=u8yBoMcdGGgUA+k3FnrD7sJDTk865MYT3ug3juJaXu0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqRDP8W42K6l8I2UQTMtr2DkV47tTDcM4zR6 lZm2GvObNeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKkQAKCRCPgPtYfRL+ TtASCACuBL3AHH2MVIFOgfVByMLXbXToBnMx3yKG6fuXrWdypKdLmrGkhYxW/269Q8NcBpFBrjf pIHwGQ97ENYofcSmAD5OwFbf4n7AbMtGYWm0bWIG6thk5Pjb9qq7pFOCHRUQVCnoRphLEWDNCgY WLtd0dOs0BORNA7CKUzzN5kf7DEX9+0GC6gH/CPc7cMmP9udnWA9iBlOWJtJRvJNx14vg0jNnEQ PF2EgOpEAc2kRcQU2Z4/hJhWdid/FRZbQqGK0WbEFUrOeCHh5OhCMLi4I9XqP7FvKHHkxb215T3 IjN55+qVUiJPoFgyCgQVUjAaiGu9h8Kkpz3aB014Qpbow6ee
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_210214_645378_1E875EF2 
X-CRM114-Status: GOOD (  16.43  )
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
ZXJzL210ZC9tYXBzL3BoeXNtYXAtY29yZS5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9t
YXBzL3BoeXNtYXAtY29yZS5jIGIvZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWNvcmUuYwppbmRl
eCA3ODcxMGZiYzhlN2YuLmI5MDZhNmQ1MzY5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbWFw
cy9waHlzbWFwLWNvcmUuYworKysgYi9kcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtY29yZS5jCkBA
IC02Miw3ICs2Miw3IEBAIHN0cnVjdCBwaHlzbWFwX2ZsYXNoX2luZm8gewogCXVuc2lnbmVkIGlu
dAkJd2luX29yZGVyOwogfTsKIAotc3RhdGljIGludCBwaHlzbWFwX2ZsYXNoX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCitzdGF0aWMgdm9pZCBwaHlzbWFwX2ZsYXNoX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHBoeXNtYXBfZmxhc2hf
aW5mbyAqaW5mbzsKIAlzdHJ1Y3QgcGh5c21hcF9mbGFzaF9kYXRhICpwaHlzbWFwX2RhdGE7CkBA
IC04OCw3ICs4OCw2IEBAIHN0YXRpYyBpbnQgcGh5c21hcF9mbGFzaF9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqZGV2KQogCiAJcG1fcnVudGltZV9wdXQoJmRldi0+ZGV2KTsKIAlwbV9y
dW50aW1lX2Rpc2FibGUoJmRldi0+ZGV2KTsKLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHZvaWQg
cGh5c21hcF9zZXRfdnBwKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBpbnQgc3RhdGUpCkBAIC02MTUs
NyArNjE0LDcgQEAgc3RhdGljIHZvaWQgcGh5c21hcF9mbGFzaF9zaHV0ZG93bihzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpkZXYpCiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHBoeXNt
YXBfZmxhc2hfZHJpdmVyID0gewogCS5wcm9iZQkJPSBwaHlzbWFwX2ZsYXNoX3Byb2JlLAotCS5y
ZW1vdmUJCT0gcGh5c21hcF9mbGFzaF9yZW1vdmUsCisJLnJlbW92ZV9uZXcJPSBwaHlzbWFwX2Zs
YXNoX3JlbW92ZSwKIAkuc2h1dGRvd24JPSBwaHlzbWFwX2ZsYXNoX3NodXRkb3duLAogCS5kcml2
ZXIJCT0gewogCQkubmFtZQk9ICJwaHlzbWFwLWZsYXNoIiwKLS0gCjIuNDAuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
