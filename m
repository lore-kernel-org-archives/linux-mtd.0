Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF585C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+8I0Upe8sjGckFjbo9W2+okPR1LjY1RfofyoN2ecdQ=; b=ZfOKfDelqp0Vq8
	JJGiMTZ0tTsZwyEITu1Xb/c2tFXlBctzpEr1BdCTDfglde03LoKs3K/fw3La1u+ozuz7sFKxQHdok
	KT+ABYFeV+J+QB8b4BpSPg9hN0RQJxPlmUIf7Wn2bhUYot2JkK0qhP6tzNBzrtIbbh88YPvbT+Mc2
	22MIhOCh5D0iZycpwy7KNZo1c5bF46n27RI1CDal4Yx/zXI9KkbfFyPWVnRYCnzpy1nenwXM17xMx
	J0AN/h/5eGBYz9yucQ3XhBbwzBQ6G+GX7hIaR6Ajc54Tna5ujQUi4P09qkySIZNox6CwUcDTg9pxR
	Hj4wDI7Flui5Ec36qqnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEb-00Awhz-1q;
	Sat, 01 Apr 2023 16:37:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEK-00AwRk-39
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=iVOSM2Z37bCVGj4weZVcMNa8xT3KmUYLRmfHzRoboII=; b=b9fAZVcpljsH+GQDgL7izXjBVM
	zLKouvQdNrj/YWc1aM4pMUx3FL4lIB803rhZDR+llIiALIXe3IN0OL8Vqjx5MF4XPIjpIknTDdXbt
	oJZYQ51Sn8XA1e53kCpV9B8HnP0jw8lNlL4bPRQq4tvHA85oC5TIRejJe/PImAO8t+ZY8bJt5Rtnx
	ZzGtrFXsZ09cJJKe9PhlL/dhAVjhbhvTw5gUEhJCeohYtcJSY0yjE6WetxYv1GM49xbX3QEmJX2yy
	Ld/q1PftiIx70xo1SKGQ59ez7LwYhZenH9oCM67MHR84kx81N2xQqdQLanEp/bv/UqSC49T9t0S3R
	y/As6sIA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxT-00CYOI-RW
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxM-000071-Of; Sat, 01 Apr 2023 18:19:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-008GSe-Ah; Sat, 01 Apr 2023 18:19:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-009khe-Jg; Sat, 01 Apr 2023 18:19:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Phil Edworthy <phil.edworthy@renesas.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 40/49] mtd: rawnand: rockchip: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:29 +0200
Message-Id: <20230401161938.2503204-41-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5b0XHAUgin6YhP/t2Zk642ckRtz9ynLH1TjOf9h6WJk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlLKZ66exyKSWjWWPv7uJwM4AvwSe+dQqGRN rFNljS/ABGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZSwAKCRCPgPtYfRL+ Tqs+B/9BktD5yecoMur2/dGiT9krTJo3UN72YS1ieMgx8g55r7hlTahlQXa1TuHfAYJFUOufoVe au814z3dA45RnUTtHC4jsQ5EY7OuritRayjCfWRzh4lSp8mElLLDJA7qm3ty1+V16kp0iwDDxk6 jSa0tY5yjBAHdhCVVDNo31AEe4ThKEuWQOWWiNl6IbMZ6nRT9ph2zOhiQEfSMfSdcO7i3gvZW++ SCPDaDXLGdYeOlIg+hE1OhAm0tXJ2VsEz3fkO9KNACFRCcRzRc+2m9a0MYDOw/6yFOaZVMYC36l qgpj44JzTogpOXCA7OVjDUqtyvnKc+z0z3FMLUJv7k9suVh1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172003_974959_939BF35E 
X-CRM114-Status: GOOD (  13.63  )
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
dmVycy9tdGQvbmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMgfCA2ICsrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJvbGxlci5jCmluZGV4IGYxMzM5
ODVjYzA1My4uMjMxMmUyNzM2MmNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9y
b2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2Nr
Y2hpcC1uYW5kLWNvbnRyb2xsZXIuYwpAQCAtMTQyNyw3ICsxNDI3LDcgQEAgc3RhdGljIGludCBy
a19uZmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0Owog
fQogCi1zdGF0aWMgaW50IHJrX25mY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKK3N0YXRpYyB2b2lkIHJrX25mY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIHsKIAlzdHJ1Y3QgcmtfbmZjICpuZmMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsK
IApAQCAtMTQzNSw4ICsxNDM1LDYgQEAgc3RhdGljIGludCBya19uZmNfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJa2ZyZWUobmZjLT5vb2JfYnVmKTsKIAlya19uZmNfY2hp
cHNfY2xlYW51cChuZmMpOwogCXJrX25mY19kaXNhYmxlX2Nsa3MobmZjKTsKLQotCXJldHVybiAw
OwogfQogCiBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHJrX25mY19zdXNwZW5kKHN0cnVjdCBk
ZXZpY2UgKmRldikKQEAgLTE0NzYsNyArMTQ3NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2
X3BtX29wcyBya19uZmNfcG1fb3BzID0gewogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciBya19uZmNfZHJpdmVyID0gewogCS5wcm9iZSA9IHJrX25mY19wcm9iZSwKLQkucmVtb3ZlID0g
cmtfbmZjX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IHJrX25mY19yZW1vdmUsCiAJLmRyaXZlciA9
IHsKIAkJLm5hbWUgPSAicm9ja2NoaXAtbmZjIiwKIAkJLm9mX21hdGNoX3RhYmxlID0gcmtfbmZj
X2lkX3RhYmxlLAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
