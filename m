Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D04E95A97
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTO0moo5ES1B76HdL9txZA/r7qa3nOQstfPNqtTHp9E=; b=BrZGdh97jY5wPA
	Fiw+xL32012vbIylsFVEa67YSelCWV+hhMJtsXvvV8l0Ja66vjNzItznbF5FGrFUFa2SYq1/CObxL
	QDN4tUmkDATx3WqF7fWaA0/SyLifcl36B2tyHwlAy2GGH/dByT/BGXRtOLofxCKYizEheVyHs/Gq8
	2entxU2b1M0fBftPIoRm3cgKFVRTaQ5zfgI9FbSEfXbl4gqnnBE7kz6HfAv5K6ssb2EFgidb+AMYv
	9OgXm/RnbZNmD1Ckl441Eu9fom2C1ZdmaC2wf415FyuEHwQ8KzTAE3SLSD0uxaUeT2AqrFoLpccxK
	FKucXZpktpwV/J+oCLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyk-009E2k-37;
	Sun, 08 Oct 2023 20:02:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyW-009Dsy-2x
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyP-0001ZN-Bd; Sun, 08 Oct 2023 22:01:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyO-000Ezp-Rx; Sun, 08 Oct 2023 22:01:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyO-00Bf0m-Ii; Sun, 08 Oct 2023 22:01:56 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 12/20] mtd: maps: lantiq-flash: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:35 +0200
Message-Id: <20231008200143.196369-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ICxCmviUbnnaPTLbgfBlAHgRRe3igcPd5duF7qsvL60=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqPQmBlh7wu5rhdNXUovP3EptxI1ATLtV4vO mNcpq5lAPWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKjwAKCRCPgPtYfRL+ Tp2aB/41WQsZAZI36b2QAZuQUjyg79SiP491sapTHCs4YpFp5Pc6ooP+CacVYaCuN0iJXdy9LyP Ms0PMSe9vk+NsgBE+hbA7vxo4B9YxSccu6cvLpKQ6kiR8UAfYbqgw4bM6w4tjn6SXLKyoY7u8io JKnqDR4BTQFbkUIUDPIrs7U+D+FrtK7kq7nHGMGHiWa/nDqbs0WhVOjpJBk2FyYVK4R6B4xvFNB bWzlV87QXY58ROOqjfoanECueMQwuGUe6dzmPWz/bki9Clan8dGv72/05fZP+syXg8G/54gXUCN Hf7nPDUTKRdircywBI2UQCvwgDUDTBnVY/3AVWUHHbHJtpih
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130204_950642_B65A7E54 
X-CRM114-Status: GOOD (  15.17  )
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
ZXJzL210ZC9tYXBzL2xhbnRpcS1mbGFzaC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bWFwcy9sYW50aXEtZmxhc2guYyBiL2RyaXZlcnMvbXRkL21hcHMvbGFudGlxLWZsYXNoLmMKaW5k
ZXggYTFkYTFjODk3M2MwLi4xMjRiMTNjNWQ3NDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL21h
cHMvbGFudGlxLWZsYXNoLmMKKysrIGIvZHJpdmVycy9tdGQvbWFwcy9sYW50aXEtZmxhc2guYwpA
QCAtMTY2LDggKzE2Niw3IEBAIGx0cV9tdGRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlyZXR1cm4gZXJyOwogfQogCi1zdGF0aWMgaW50Ci1sdHFfbXRkX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgbHRxX210ZF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbHRxX210ZCAqbHRxX210ZCA9
IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCkBAIC0xNzUsNyArMTc0LDYgQEAgbHRxX210
ZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJbXRkX2RldmljZV91bnJl
Z2lzdGVyKGx0cV9tdGQtPm10ZCk7CiAJCW1hcF9kZXN0cm95KGx0cV9tdGQtPm10ZCk7CiAJfQot
CXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBsdHFfbXRk
X21hdGNoW10gPSB7CkBAIC0xODYsNyArMTg0LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
bHRxX210ZF9tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGx0cV9tdGRf
ZHJpdmVyID0gewogCS5wcm9iZSA9IGx0cV9tdGRfcHJvYmUsCi0JLnJlbW92ZSA9IGx0cV9tdGRf
cmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gbHRxX210ZF9yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJ
Lm5hbWUgPSAibHRxLW5vciIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IGx0cV9tdGRfbWF0Y2gsCi0t
IAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
