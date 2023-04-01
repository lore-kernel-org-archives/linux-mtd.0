Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DCAC6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYTkrMhvPOmh+W6GL3dZsGiVgJAOknqKCLQEX5ynwgo=; b=r4FK43QdLzSYMb
	6KjdJv9jZAaFbDwNpxqJ/ubkyz9cLvp8GOnCYSE2LSeWKECjNHeJFxkFEvp8xAMVNvIVCKSMIr3aJ
	KgwD1tVbiXIVJCFXz/d+3vUi9xiUeko5rDmld8+6hM264CV7NgfL/t39OivbJ+XKC076p4yGZDwFo
	Ra55dMJBercQxheWN0BkGIQz53bChbmBJAdyf5eNy6BxemWz3BWclOY25KY5JjaX08BrTSlgQOXm7
	T5odQye/iwWklqAAF1s5b5EhS1kIaA3jcKerq6llNY0hflIyRJQGjwMtcl9Eqjsj6P1gQxM4bTzoU
	ZnVZUn+2lVr1CREY8Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidz1-00AtHf-0U;
	Sat, 01 Apr 2023 16:21:39 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxg-00AsJW-0g
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/4VgSFI99GQlsIZfx+4Tl0jOWRRxkDfP1BWBHQUPIv4=; b=qPxQHeIheC3uZY5eVKa1zMEV+/
	B16kEmm4klPspgNT2S+trLdAcSx1r3r/4wCEUiCLOTRYGAddA3zaiIBWcztr6EA3Wnr4FKF1tVE5J
	37QqlMZBACHBdjWVQqyEH3kugUwG2TXtpTnBQlY4BEyUqlTQE/8UeRarLbTiyxeO78Y88Wp4hhj5G
	CZ7i99NltjAZUgfoIZU9X4bcv37byLgrhLdlzaXJo9yBwjX8jJf3QhBbSPNbgTRQC6Fq+Lx5cwgb9
	yvv3ZGcE2ztHHhuD4QoHO0mvxavosCVGR/0f1SUgKDWFhhVuq/TT+mFF2h20aAhWltYjfr6ppDBnC
	qpz+n07Q==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxc-008DL0-0o
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxO-0000H3-NT; Sat, 01 Apr 2023 18:19:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxM-008GT3-M6; Sat, 01 Apr 2023 18:19:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-009ki1-Tu; Sat, 01 Apr 2023 18:19:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 46/49] mtd: rawnand: sunxi: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:35 +0200
Message-Id: <20230401161938.2503204-47-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=X08OgOol1r208v7SCAuNsUZxIRp3p+XIkNYqv7E4PHI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSNyKCo+xreZc9zV8yU2Oldn8YmpmtaVS3SNHWHwrkTq SZWMYc6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZjIoXPs/xRCHErE9lhOFfhr rvixW1s9IPn0X48I7hPuaZudfAx+3dQ8OFdLWrHCb7nk0+a+VUrVfgXfnm+2Wbhq+YSTy2dwcs+ 8e2tFQdANicKeA6zJNw7M6PZw2fj89Zk70kGa/h/eeOV5bOzPXqBtae5UWLf2N6/T6fYfhZ0dS+ Wbb13Ub7QIqTUpqTt5lq2ivUeB1ShjgmuPR/CaxnW3fu/5lVJ1S/72oUXSj1m3Ho27/nBZ5h5t5 YYfl9ikhC4ozomcsKcnIKxkYs+K1PBT+uqJ91Q9PTdN8WF7kKk1N3ddjXBC29RC6bV8SZse1My9 W8pkWy4mXp94ZOkj/qCL7z7r1iis4swumHU3uD9p7oG9AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172012_500334_A853021E 
X-CRM114-Status: GOOD (  15.96  )
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
dmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFu
ZC5jCmluZGV4IDEzZTNlMDE5OGQxNS4uOTg4NDMwNDYzNGY2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3Vu
eGlfbmFuZC5jCkBAIC0yMTczLDcgKzIxNzMsNyBAQCBzdGF0aWMgaW50IHN1bnhpX25mY19wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRp
YyBpbnQgc3VueGlfbmZjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3Rh
dGljIHZvaWQgc3VueGlfbmZjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewogCXN0cnVjdCBzdW54aV9uZmMgKm5mYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwog
CkBAIC0yMTg1LDggKzIxODUsNiBAQCBzdGF0aWMgaW50IHN1bnhpX25mY19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZG1hX3JlbGVhc2VfY2hhbm5lbChuZmMtPmRtYWMp
OwogCWNsa19kaXNhYmxlX3VucHJlcGFyZShuZmMtPm1vZF9jbGspOwogCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShuZmMtPmFoYl9jbGspOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc3VueGlfbmZjX2NhcHMgc3VueGlfbmZjX2ExMF9jYXBzID0gewpAQCAtMjIxOSw3ICsy
MjE3LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3VueGlfbmZjX2RyaXZlciA9
IHsKIAkJLm9mX21hdGNoX3RhYmxlID0gc3VueGlfbmZjX2lkcywKIAl9LAogCS5wcm9iZSA9IHN1
bnhpX25mY19wcm9iZSwKLQkucmVtb3ZlID0gc3VueGlfbmZjX3JlbW92ZSwKKwkucmVtb3ZlX25l
dyA9IHN1bnhpX25mY19yZW1vdmUsCiB9OwogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihzdW54aV9u
ZmNfZHJpdmVyKTsKIAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
