Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143EFC77B62
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcNMJeXwVRhiXARdoZHJSJTND4p/X1g8w3oDhca0Sa4=; b=tJuWllaYzUjTUL
	ytGm4vzEuycWLa+Fh9wn0YlPg+65WuP4UeqsfZVMNBTgo1k0g/eyk4UERTibwgFiPZ1YbF0Xp1Qfd
	E/u13V1lihACanWyrnjhGLyRmE0teKf5c5PrT3x+1Piu2g7F97s16OqeywTF9Qo1vlXEPDgmGOvQ5
	ygivSIH0k1ROumt6a8soBZeSe47T+7GHrLkSff7OSFuHqhTp4aoApEH2eFXn1IGaCXqwPdo46aqNp
	UDGMFFwR8IgF9ASY56AzwQIijeSl4zL5373TbV29g68gWJZSo8sZ/YykO9ExPXj01a8Hn76HIb34t
	gaYPNhcdlWgn5tOEVMlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxk-00AsLZ-2O;
	Sat, 01 Apr 2023 16:20:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As9l-0T
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxF-00089L-G6; Sat, 01 Apr 2023 18:19:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-008GQ2-Ha; Sat, 01 Apr 2023 18:19:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxD-009kfW-ME; Sat, 01 Apr 2023 18:19:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 07/49] mtd: rawnand: atmel: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:18:56 +0200
Message-Id: <20230401161938.2503204-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1836; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=62cKYMuQ2K4bCDqUddzPQqOui91z2yoxLirMj5OqyIw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFj3fMxmiwaw2cqjh+N0F9jtTWUeARgGXppEG 1PhiAMKj6qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY9wAKCRCPgPtYfRL+ TrtdB/9bzK2R2buQkl9VCUAENhS1Gej5ViZ+GoP0PvV7+G/LtX3e1z9iBhYzfhAP3TwJbf7VRLF pS6rAiUrwH6Rt25hqTWbo0h7OAQ+iHm4qQiUPa7Udr3N86wQiWo49IKajg2KIIoSOmUNlgTtEPe m/mZbb5oUFlkyJdJfRQkcqpcH66dv0h+7YkaMgUJ11LTJuQ3Rs6TVIPxWFyawNPoQy6tPTbSeS8 clPUcTbbUa1V0QcxANMnaghXINlKzwPKH90Lj1UgopMAjO0n5xpOzvFgDUgmlmMCcumpB74KqvM wsTd6c+p4maEnFvGC87iP1WduOpZ7wNv5yrwdi+IVlX0oeTb
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_200908_E825E993 
X-CRM114-Status: GOOD (  15.58  )
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
dmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMgfCA2ICsrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCmluZGV4IDQxYzZiZDZlMmQ3Mi4u
ODFlM2Q2ODJhOGNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5k
LWNvbnRyb2xsZXIuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRy
b2xsZXIuYwpAQCAtMjYyNiwxMyArMjYyNiwxMSBAQCBzdGF0aWMgaW50IGF0bWVsX25hbmRfY29u
dHJvbGxlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiBjYXBz
LT5vcHMtPnByb2JlKHBkZXYsIGNhcHMpOwogfQogCi1zdGF0aWMgaW50IGF0bWVsX25hbmRfY29u
dHJvbGxlcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lk
IGF0bWVsX25hbmRfY29udHJvbGxlcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIHsKIAlzdHJ1Y3QgYXRtZWxfbmFuZF9jb250cm9sbGVyICpuYyA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKHBkZXYpOwogCiAJV0FSTl9PTihuYy0+Y2Fwcy0+b3BzLT5yZW1vdmUobmMpKTsKLQot
CXJldHVybiAwOwogfQogCiBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IGF0bWVsX25hbmRfY29u
dHJvbGxlcl9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQpAQCAtMjY2Myw3ICsyNjYxLDcgQEAg
c3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgYXRtZWxfbmFuZF9jb250cm9sbGVyX2RyaXZl
ciA9IHsKIAkJLnBtID0gJmF0bWVsX25hbmRfY29udHJvbGxlcl9wbV9vcHMsCiAJfSwKIAkucHJv
YmUgPSBhdG1lbF9uYW5kX2NvbnRyb2xsZXJfcHJvYmUsCi0JLnJlbW92ZSA9IGF0bWVsX25hbmRf
Y29udHJvbGxlcl9yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBhdG1lbF9uYW5kX2NvbnRyb2xsZXJf
cmVtb3ZlLAogfTsKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoYXRtZWxfbmFuZF9jb250cm9sbGVy
X2RyaXZlcik7CiAKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
