Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43764E95A92
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBsi3C+9zy1GBAs+5VCRgVhJmrRj9XzLBI89aZBH/C4=; b=nsEsEpJB+u/mU+
	IbGYH5RvOPRVMU9NWBL5KI/thV20p4YubZXwQdtIMcrE9xBm2XCPTd4aJyH5xFLsXJqMuPu/JHLye
	SOEGKZcTL0hvvcn+wcOEUhftu7b9T2rf2wLkL8mH+Q8KS/AXs+1fGDH/xLiW+Uizu3uDD/3xUPBYu
	oyGbQoKqYauKl0OowObmFs+tYEesZwOHgB0TJR9m2jWAcGAHRWNBOPXXjCADKxnGvwoFV2kA109nu
	ne0L0cK1hSMFc5JTTB9I6nx05VFOt3DaZBRjOkeQa3IkK7ntLblcA5O4zgww9X1yl3LpvkKfS/4s2
	uOSuIzYRSTemjrSIemWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyZ-009Dv5-1k;
	Sun, 08 Oct 2023 20:02:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyV-009Dqb-1W
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyM-0001SM-Ca; Sun, 08 Oct 2023 22:01:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyL-000EzH-Vf; Sun, 08 Oct 2023 22:01:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyL-00Bf07-M4; Sun, 08 Oct 2023 22:01:53 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 03/20] mtd: bcm47xxsflash: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:26 +0200
Message-Id: <20231008200143.196369-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8L087lsHdadPRL+6+A15IYiahQ9MePUiLPLe532Be24=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwp9jIeqQgIIv4zXX2m31HB6PoAb3mqGajgzs VoK34PEPaGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKfQAKCRCPgPtYfRL+ TkVfB/9C1UGGdjmaDp7hkukW1xUeBmlOQjtfTaMmONZ8OLqNyumrMCsxE95xAM7pmOnQOXx0Lk8 CQNUmZkskRftFX+gna4YJF96YzgLPy68FqzPGBOnA20ophmf8KO2+jat7agHlp3O3Fb1xojUcqV Ba312U4efDh2BQROEG4Mu4wjwmkqBhqj7F6ZJc5jeo106s5ThhOM/Ol16oVMuSx69wSC6QgUZx1 UghUr9IpFmvDbsoNEIdBq+VGkBek8EqXHekmtkcQKx4RfeZWo8Yk9833E8mLKqUXR0pPxsACvUy UNF20iWTcd/fzieTfU38utIqm5FWBlzGIs6HwwCR4QeT19RQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130203_532607_D67185C4 
X-CRM114-Status: GOOD (  15.33  )
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
ZXJzL210ZC9kZXZpY2VzL2JjbTQ3eHhzZmxhc2guYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL2RldmljZXMvYmNtNDd4eHNmbGFzaC5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9iY200N3h4
c2ZsYXNoLmMKaW5kZXggM2FmNTBkYjhiMjFiLi43NGY1NTliZjhkZmIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbXRkL2RldmljZXMvYmNtNDd4eHNmbGFzaC5jCisrKyBiL2RyaXZlcnMvbXRkL2Rldmlj
ZXMvYmNtNDd4eHNmbGFzaC5jCkBAIC0zNTcsMTkgKzM1NywxNyBAQCBzdGF0aWMgaW50IGJjbTQ3
eHhzZmxhc2hfYmNtYV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVy
biAwOwogfQogCi1zdGF0aWMgaW50IGJjbTQ3eHhzZmxhc2hfYmNtYV9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIGJjbTQ3eHhzZmxhc2hfYmNtYV9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgYmNtNDd4eHNmbGFz
aCAqYjQ3cyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCiAJbXRkX2RldmljZV91bnJl
Z2lzdGVyKCZiNDdzLT5tdGQpOwogCWlvdW5tYXAoYjQ3cy0+d2luZG93KTsKLQotCXJldHVybiAw
OwogfQogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBiY21hX3NmbGFzaF9kcml2ZXIg
PSB7CiAJLnByb2JlCT0gYmNtNDd4eHNmbGFzaF9iY21hX3Byb2JlLAotCS5yZW1vdmUgPSBiY200
N3h4c2ZsYXNoX2JjbWFfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gYmNtNDd4eHNmbGFzaF9iY21h
X3JlbW92ZSwKIAkuZHJpdmVyID0gewogCQkubmFtZSA9ICJiY21hX3NmbGFzaCIsCiAJfSwKLS0g
CjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
