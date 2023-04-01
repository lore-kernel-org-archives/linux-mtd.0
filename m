Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55151C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4UjYDz/+WQ5GUNHw5ahvCxaGiFXLywwBgGGmRvAX4s=; b=bUGq/qIhLsig9x
	pPlwjm5Ylk28mD0jan7solRZPn5Ray6/wMWBkS1dr3qzkyl0tQFBa9bQuWlwDmBIVqIU6XON6nFfk
	JGksMgDQ4x4XZxaezS2bzfronO+uGbtkstYCwOkRDZXCl6PeVQ5EQQxLot9JidMA6Qd5nb6PDSHCJ
	Di/khPHcvk4PttbkhfZUy4bseZVgXqVGZ/jFb4AyhSq6roHyPktkSpp1mM3Xql3vNRNaiJFR3axVy
	f/iw+1wTASxB3/XCNTaLfTaxviTIg0E03Hv+5RndbKghqTtMz6xm01jh3KOdBtjuSnMN+Ingkik09
	e+8lp0UvsmPH4vrcZGpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieF8-00Ax5A-0s;
	Sat, 01 Apr 2023 16:38:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEO-00AwRk-0g
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=TeXN6K3AIPHjYsLgWZHGmyqOlz8GF0S1emngmyYWmu4=; b=BlDrWoaMAn3VFqI62ZCL3zJulG
	OEgG2/yxn0MGEHvRZZGbXmQ5wyKuVWIKlfB1zQuqNpPlUkJIRNIS+HoLXSQTTXK696eNYW1qnXBJ2
	KKbJn4jIGaPTCo/RYgzV2Xifv0VCBL4klBkv/egOxT3iUClUsVKEXWhm85pXMzw010lXPPQlqNRYT
	KnoHhe4bNmne1PNuUuzwq6ZSGxLszsXaZ181+Rjszkii6ZUV2czXanoRPbGbCOhjO+uJ1a+iSAs9B
	cq3zMnRFFLO0XJ27nFOwCb++CSdExcXj1ZzmDZOrFfgJ99uQYJicoRk/5P3pdcaL/RMfjqccFxTqM
	bOJqdtCg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxT-00CYOG-AN
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-0008RY-9o; Sat, 01 Apr 2023 18:19:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-008GSG-EW; Sat, 01 Apr 2023 18:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxJ-009khM-QI; Sat, 01 Apr 2023 18:19:53 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 36/49] mtd: rawnand: pl35x: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:25 +0200
Message-Id: <20230401161938.2503204-37-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1738; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=AxtPLgQzR7Pws7jjdB4styL0Lqk95tDnFAYXhQ+R31g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlGQpBjusXQRZBv2p3prtnlHRb7v3esbGEmf 1ONCIeg4xqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZRgAKCRCPgPtYfRL+ TslAB/40NjSbGLG+7p+aKQKsumeNDWD7s5i2MGUHDybYdgGbnvNFU00IM6ngRS7NYAJQ2mPgBb3 V+Yme9xEOZXI+MjVYBnzQbKURiGnspzgy9kzm/kSD5TPoDR7hDgoDPLDCZyrXFMEdEvtzHvrf2k LKN/Fa4ievxfrO8wPJoxq+AOXZ3N0ffXuTg/WVIdOEuo8ADqkh9+2hSiV1BS2yftmPTPEeHnDmA S1R2bvRlidMaqY2a9sU3V+0Zx313mNy/2fS6iChIoMEnNOeYndpUzhu+EIlza/DSOz/k7SjwXGF TMVES0N7vGdzh0Ga8Bae8XsaALR8un3speUJxNW+/0KQ1LQY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172003_528342_05757122 
X-CRM114-Status: GOOD (  13.04  )
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
dmVycy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVyLmMgfCA2ICsrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jCmluZGV4IDNjNmY2YWZmNjQ5Zi4u
MjhiN2JkN2UyMmViIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5k
LWNvbnRyb2xsZXIuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRy
b2xsZXIuYwpAQCAtMTE2MywxMyArMTE2MywxMSBAQCBzdGF0aWMgaW50IHBsMzV4X25hbmRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGlj
IGludCBwbDM1eF9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3Rh
dGljIHZvaWQgcGwzNXhfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IHsKIAlzdHJ1Y3QgcGwzNXhfbmFuZGMgKm5mYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYp
OwogCiAJcGwzNXhfbmFuZF9jaGlwc19jbGVhbnVwKG5mYyk7Ci0KLQlyZXR1cm4gMDsKIH0KIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcGwzNXhfbmFuZF9vZl9tYXRjaFtdID0g
ewpAQCAtMTE4MCw3ICsxMTc4LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgcGwzNXhfbmFu
ZF9vZl9tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHBsMzV4X25hbmRj
X2RyaXZlciA9IHsKIAkucHJvYmUgPSBwbDM1eF9uYW5kX3Byb2JlLAotCS5yZW1vdmUJPSBwbDM1
eF9uYW5kX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IHBsMzV4X25hbmRfcmVtb3ZlLAogCS5kcml2
ZXIgPSB7CiAJCS5uYW1lID0gUEwzNVhfTkFORENfRFJJVkVSX05BTUUsCiAJCS5vZl9tYXRjaF90
YWJsZSA9IHBsMzV4X25hbmRfb2ZfbWF0Y2gsCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
