Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B5FC77B62
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxOt64Et4SLZ8fcaGsAIUk5Whocici2yicPDWevbLIA=; b=qp+HyN9FtX4BpX
	3IBSpxc03bnHs6fxlhk7X4GT9oaYe/2O5dgMqDua8e0gmGDdzZwLmaZQHJugPHqBLD8JIEzKiGOtC
	W/M7u1bXuD9S2LHISVCt/g55Ry3a0yudnb/PdQ0NW412bLY+ty6CeYQM6Ksjvg/Of1tIg+8OdrSGW
	n1NPsPlOxLmpxsdw7e0jn9J9Hpvlp9uS9nrof66+vToqQoVl79xZxijn7e6PKZvO3lyNg3f66BBek
	yAJKQw+bKYOUuB49i0SOjD5Df07kcf6uk9tCbylbq3PjCgoHjnTpqXHf/rXw26v/+5Nfra0IYIfcA
	7LvM1HD1JQZCS3IWKf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidyU-00Asog-1N;
	Sat, 01 Apr 2023 16:21:06 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As9E-15
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-0008C1-1z; Sat, 01 Apr 2023 18:19:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxG-008GQZ-3S; Sat, 01 Apr 2023 18:19:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxF-009kfw-5q; Sat, 01 Apr 2023 18:19:49 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 14/49] mtd: rawnand: fsl_ifc: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:03 +0200
Message-Id: <20230401161938.2503204-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=tILjMWwXKfgbmOVfr+Iz7CPm8Wx8v3dtR1CS5qHAr7g=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSNiP9t8//NLPvoMNNUk1mlNO+lYWezttwVjZknvtZtM cntihToZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiS0TY/ymFiJwuUOPVWihY s5TLwSFds8Aw1vrk740fLBXTsvOWiJxyKgqM3yUQq/37916VP/ktjx0iG0O2BPUw32k9lv2u8cg 7yQCztD8MUdwF9vH7VweEWH38+pb9zJlF91as/Og8XcTqG5P/3Ujry/NsV1zXsr0UUJTwV6XArJ yzel6K/yu7mpQlwT6s8hKu2zRPpKn8P7Mo+9hsLsNZ89g4AtZt8Vh8SODXar99UmunP2Jd7tz5Q fPNST/lSwrqG3+n1L2v4JHoV56WXWgxPSwrwU1SX+S8dqXdvM3TlBRbL2Vllj9buNnphOL9h1uN pi1zvBHmMGsP2z8hY/3dxZoTklsVJHgiz3OLzg4V/mwIAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_434211_665284A0 
X-CRM114-Status: GOOD (  15.86  )
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
dmVycy9tdGQvbmFuZC9yYXcvZnNsX2lmY19uYW5kLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9mc2xfaWZjX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9p
ZmNfbmFuZC5jCmluZGV4IDAyZDUwMDE3NjgzOC4uZmE1MzdmZWU2NzAxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfaWZjX25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9mc2xfaWZjX25hbmQuYwpAQCAtMTA5NCw3ICsxMDk0LDcgQEAgc3RhdGljIGludCBmc2xf
aWZjX25hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQogCXJldHVybiByZXQ7
CiB9CiAKLXN0YXRpYyBpbnQgZnNsX2lmY19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpkZXYpCitzdGF0aWMgdm9pZCBmc2xfaWZjX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgZnNsX2lmY19tdGQgKnByaXYgPSBkZXZfZ2V0X2Ry
dmRhdGEoJmRldi0+ZGV2KTsKIAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gJnByaXYtPmNoaXA7
CkBAIC0xMTEzLDggKzExMTMsNiBAQCBzdGF0aWMgaW50IGZzbF9pZmNfbmFuZF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQogCQlrZnJlZShpZmNfbmFuZF9jdHJsKTsKIAl9CiAJ
bXV0ZXhfdW5sb2NrKCZmc2xfaWZjX25hbmRfbXV0ZXgpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGZzbF9pZmNfbmFuZF9tYXRjaFtdID0gewpA
QCAtMTEzMSw3ICsxMTI5LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZnNsX2lm
Y19uYW5kX2RyaXZlciA9IHsKIAkJLm9mX21hdGNoX3RhYmxlID0gZnNsX2lmY19uYW5kX21hdGNo
LAogCX0sCiAJLnByb2JlICAgICAgID0gZnNsX2lmY19uYW5kX3Byb2JlLAotCS5yZW1vdmUgICAg
ICA9IGZzbF9pZmNfbmFuZF9yZW1vdmUsCisJLnJlbW92ZV9uZXcgID0gZnNsX2lmY19uYW5kX3Jl
bW92ZSwKIH07CiAKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZnNsX2lmY19uYW5kX2RyaXZlcik7
Ci0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
