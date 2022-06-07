Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD15C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 06:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G87KzxjMVdp4hgi2IgrrBiLWxMxpeV7DwePQLr5PEQs=; b=etriIq1l4fZNb5
	qhh+Ov94KkA2BqRMkavM0XyYPJZhaKkTs6B/kjzxha7iI0TQTjT3IxeyKhs1MEVulbJRPxZaM0wFe
	zL0p/pXlOiksKVKup6wIdcsaodN0glKdPI3LbfVH60DHeUq9c6t9QrGfAWjnejGWKaU9YZR/E6DeH
	bcfOt2PtZ8ArGkZrxLHYlwC1uCkVG06t4CYDfo8Wf+piaqDPSaNBchJMoMa9sOf6vef2Uz+ySlbkm
	xzJojc9+X2CzH4Bfmr04QPcXYoNouxrkxw05SpTJqaIPJ0QJMqC4BhSwqYRNKxoW6N+BUuL3oOs8j
	j0LMxos1ig53JQzHL8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySee-0050ZI-Bg; Tue, 07 Jun 2022 06:25:28 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySeb-0050X6-4d
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 06:25:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nySeP-0003YU-V0; Tue, 07 Jun 2022 08:25:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nySeP-006wRp-Kc; Tue, 07 Jun 2022 08:25:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nySeN-00EiJA-J6; Tue, 07 Jun 2022 08:25:11 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v2] mtd: rawnand: atmel: Warn about failure to unregister mtd device
Date: Tue,  7 Jun 2022 08:25:03 +0200
Message-Id: <20220607062503.211345-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559; h=from:subject; bh=/PhYGoyIDevNeTkHoclXF/TyC5W4vXAS1ShgFSUHjGg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBinu88YzkAnZpn20AOrgT52nscC/b6K/0DRL8Dv41D G8RspjWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYp7vPAAKCRDB/BR4rcrsCbPoB/ 48cK/7dXQwGKxLE8lYRk1sonHw9kbs/2HX2+3h4R9KQlcdGTYFRJ0kOxTXAGAFwoQn7KjciK+fIT5z 3pDiKLoQrF/Q0kPFstcNnZFkaPr/cOqYFD5k4WyGh+EWUf66apzdw0WuASCSEKKuoyeDxgJxkbkC6Y JmNjeo2vFJ3PwWT1xym7ez2QfOnNvXbP7wwll+SEfZT3ml8E+zgLoTtBlToYe3TlX+7L1m0drcDTCm c3x6YOf9eJ44+gbzN0DDnKcgJGAgH9IvwBRRAzDFKYXrFU4NRuVaoC7gaU6Jhygsfrj+pC5Mm0W59y 1fOik69WLFFwv02VMBmciQqUdXP1LV
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_232525_216558_F6CB90F7 
X-CRM114-Status: GOOD (  16.42  )
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

VGhlIExpbnV4IGRldmljZSBjb3JlIGRvZXNuJ3QgaW50ZW5kIHJlbW92ZSBjYWxsYmFja3MgdG8g
ZmFpbC4gSWYgYW4KZXJyb3IgY29kZSBpcyByZXR1cm5lZCB0aGUgZGV2aWNlIGlzIHJlbW92ZWQg
YW55aG93LiBTbyB3YWlsIGxvdWRseSBpZgp0aGUgYXRtZWwgc3BlY2lmaWMgcmVtb3ZlIGNhbGxi
YWNrIGZhaWxzIGFuZCByZXR1cm4gMCBhbnlob3cgdG8gc3VwcHJlc3MKdGhlIGdlbmVyaWMgKGFu
ZCBsaXR0bGUgaGVscGZ1bCkgZXJyb3IgbWVzc2FnZSBieSB0aGUgZGV2aWNlIGNvcmUuCgpUaGlz
IGlzIGEgcHJlcGFyYXRpb24gZm9yIG1ha2luZyBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2tzIHJl
dHVybiB2b2lkLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCkhlbGxvLAoKdGhpcyBwYXRjaCB3YXMgcGFydCBvZiBh
IGJpZ2dlciBzZXJpZXNbMV0gZm9yIChpbXBsaWNpdCkgdjEuIEFzIHRoZSBwYXRjaGVzCm9mIHRo
aXMgc2VyaWVzIGhhdmUgbm8gaW50ZXJkZXBlbmRlbmNpZXMgYW5kIGFsbCBidXQgdGhpcyBvbmUg
d2VyZQp3ZXJlIGNvbnNpZGVyZWQgb2ssIEknbSBqdXN0IHJlc2VuZGluZyB0aGlzIHBhdGNoLCBh
cyBhZHZpY2VkIGJ5IE1pcXVlbApSYXluYWwuCgpCZXN0IHJlZ2FyZHMKVXdlCgpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjIwNjAzMjEwNzU4LjE0ODQ5My05LXUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZQoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25h
bmQtY29udHJvbGxlci5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwv
bmFuZC1jb250cm9sbGVyLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRy
b2xsZXIuYwppbmRleCA2ZWYxNDQ0MmM3MWEuLmM5YWMzYmFmNjhjMCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMKKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMKQEAgLTI2MjksNyArMjYyOSw5IEBA
IHN0YXRpYyBpbnQgYXRtZWxfbmFuZF9jb250cm9sbGVyX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBhdG1lbF9uYW5kX2NvbnRyb2xsZXIgKm5jID0gcGxh
dGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKLQlyZXR1cm4gbmMtPmNhcHMtPm9wcy0+cmVtb3Zl
KG5jKTsKKwlXQVJOX09OKG5jLT5jYXBzLT5vcHMtPnJlbW92ZShuYykpOworCisJcmV0dXJuIDA7
CiB9CiAKIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgYXRtZWxfbmFuZF9jb250cm9sbGVyX3Jl
c3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCgpiYXNlLWNvbW1pdDogNGIwOTg2YTM2MTNjOTJmNGVj
MWJkYzdmNjBlYzY2ZmVhMTM1OTkxZgotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
