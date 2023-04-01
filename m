Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E4BC76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXI39vXAaViY4PVdoVsvafI0ia8k10fJhv6Vi/rWmCQ=; b=LaaypVsmhzR3VE
	ovs4Uggl8wM7BFRfIHowk5kWqUFAnUGdc3F74T5g/+To7Jcfbm41q/4ffYc/WiaHSLPGSsxKCf5R7
	map82D2FyqU0ap0idCNbZe8KOuGG8ef9NukFe8craiVoFeo9asP74yFWDkZq/ixBBeW82GUWejhlx
	YWFXRZgZ+mEuK4SKC1ebBUffPuM9UrG25cXGCcAI6sS+UcgiVQnDLaV/G0qMWom02Ohyy3j5d4pBR
	jvf7rkMJ03nx7hXbUyeLRlmc7SyNI4gFs7A8E97T85eqmvx/RX38dzAUBL/Vj3kYwAcgAM7L9Xno/
	pvvMcOx12FkzRF54m0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEK-00AwUT-1C;
	Sat, 01 Apr 2023 16:37:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEH-00AwRk-15
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ojvEeNTmk3GYW05R1yrHV6n8/z4ws20erldx3TZFspQ=; b=lEOEXAYEK/TPL1scevank4Hiza
	S4p/RHGCtqSeHblHwdhWHbrhhc6C/1oKAx1+mqckL1ItXf6Mcq9Oc15zSkB4DZxDYEogG7Lg4Fjq5
	zp12x71vWU/mTzck0bH4NTrOyr7r13DdIPtISJsNQwdKS4xakDz1MbG34lMp6sNvjRDFkeJUwwyBG
	5fP3Jd5XV3TkS6fQ5cpx/zhs5+Zab+W/gUc7VEK/0bXC4qBio0pFWJFINHTFH9hHyNL2gEK4K8Ctw
	X5buMv/FST22DleCBWJ+N/6015iWwD+k6a8klF74FEUygVsgvikYorldxoO9kQUB+D0J3IHZ5duEL
	1RwQfzJQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxW-00CYSj-CB
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxO-0000HA-E2; Sat, 01 Apr 2023 18:19:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxM-008GT4-N4; Sat, 01 Apr 2023 18:19:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-009khy-Mn; Sat, 01 Apr 2023 18:19:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jack Wang <jinpu.wang@ionos.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 45/49] mtd: rawnand: stm32_fmc2: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:34 +0200
Message-Id: <20230401161938.2503204-46-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=AEOfFfpg8jnamUficc+JbatV7+ft2JVAarvqxLIvw2c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlQYs1o0K6QqS7EEqapqX9nS62hboypZ4nf4 48fJjzJYDyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZUAAKCRCPgPtYfRL+ ThSrB/9r9Cg7UBQvFzPFrqICftflvmP1LawosdzFYl0KYvNmgvXQNCfcc1lYm206AYw6g9u/RZm PTw9ugnrMAvf9E8vDSRj9bTIG4ebb4w0kImvQgJOfv9VUKGmFETqUC3tBtvenGRt/9hmPxaUlmn xm0fR0IE+A2GT7JCh8TJmWYA6qiyTxUtW/QV7076WXcixvAffoE+u3CdFBpUH5ubfWFYKRl9V9I /OvaTYpY0+xvVvMqIylLWTmjuTKH7uhDic8Q6twEKy+ucYS4Doo6R+iY8zZOeZBPTWPfjVzYuzP Tt/hpkDNogojwR6qsfh5+RbvrACEJD6ittMOm+p4oG9Exytw
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172006_445454_74535D4A 
X-CRM114-Status: GOOD (  13.16  )
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
dmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3N0bTMyX2ZtYzJfbmFuZC5jCmluZGV4IDVkNjI3MDQ4YzQyMC4uZTNkMDlkZDU5NjNiIDEwMDY0
NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYworKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwpAQCAtMjAyMSw3ICsyMDIxLDcgQEAg
c3RhdGljIGludCBzdG0zMl9mbWMyX25mY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uZmNfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBzdG0zMl9mbWMyX25m
Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3RtMzJf
Zm1jMl9uZmMgKm5mYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCXN0cnVjdCBzdG0z
Ml9mbWMyX25hbmQgKm5hbmQgPSAmbmZjLT5uYW5kOwpAQCAtMjA0NSw4ICsyMDQ1LDYgQEAgc3Rh
dGljIGludCBzdG0zMl9mbWMyX25mY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAljbGtfZGlzYWJsZV91bnByZXBhcmUobmZjLT5jbGspOwogCiAJc3RtMzJfZm1jMl9uZmNf
d3BfZW5hYmxlKG5hbmQpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgX19tYXliZV91
bnVzZWQgc3RtMzJfZm1jMl9uZmNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCkBAIC0yMTAz
LDcgKzIxMDEsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzdG0zMl9mbWMyX25mY19tYXRj
aCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX2ZtYzJfbmZjX2RyaXZl
ciA9IHsKIAkucHJvYmUJPSBzdG0zMl9mbWMyX25mY19wcm9iZSwKLQkucmVtb3ZlCT0gc3RtMzJf
Zm1jMl9uZmNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gc3RtMzJfZm1jMl9uZmNfcmVtb3ZlLAog
CS5kcml2ZXIJPSB7CiAJCS5uYW1lID0gInN0bTMyX2ZtYzJfbmZjIiwKIAkJLm9mX21hdGNoX3Rh
YmxlID0gc3RtMzJfZm1jMl9uZmNfbWF0Y2gsCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
