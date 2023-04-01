Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68355C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKWeC3wNwHifLVF/Chf0GLb2K1LhmBuppV6BD6BV0dE=; b=X746vr2UYiDvRI
	a1VsbVuvDw3ADtWo/BDO+eleHm0/n4G5wt6wxOtl0IxuUxnQPseGoT+acSDPv7eXXMNNuqYoA6Ja3
	V9XWBrTxRPW0vhRPCm6T4ghbgL2hQtE5efSsU1O+QgHleEUTC6YYHcokmi2efPEMllbiH2Sy72c4Z
	J0JGh4LfYDXjxac4o5XhvbsGdZlPcdjnJG6mEseP30dvkO4pWqiLL/JKpO2GFs/ZJajYXXF9ubgUR
	rV6h28JSEoO9xq7SGDi9lGXQ7aznDZzAKAsi4ujB9YTxxIE/F1PNObANnbIqNNdP3I+D9QClL8tIR
	4zxP0WJeNeSSU5WyMxyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEZ-00AwgM-30;
	Sat, 01 Apr 2023 16:37:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEK-00AwRk-1t
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=6YTKVNhVYU62naPvmcQkueKVrUUgKaFRioux7XyGtTQ=; b=fB2H+t16Fsi5z7arKOuipN4yDp
	c80PvoTslVnOssAKA7b5kjCZQxU3baj06leEYxnPkD+UI0u800S+6XsUdBrVI+mahZSW3K5b04lo/
	61/YDmHWok0XBhUK64QWEANf3If7SpuFNxLZzM18WAZUDcV8RoVEz6BPq7FBUOZdMt4zVXKMxYtGX
	GvBQI68mbd+c/WMU6xtgggbFDucCpZM0+lFHu45Rj2Of+k359j5dxYYaAbiBslcIUZ3zhQTwzD64B
	MQlXkCBsaFFk9jiv782UoPLkNcIo2qjONstRtBmWhTTQa48D3KjmgleFuInwhkcrspkdEr7I1Oykn
	Pr4URbWw==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxT-00CYPV-TS
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxP-0000KV-3K; Sat, 01 Apr 2023 18:19:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxN-008GTF-5z; Sat, 01 Apr 2023 18:19:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxM-009ki9-B8; Sat, 01 Apr 2023 18:19:56 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Agner <stefan@agner.ch>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 48/49] mtd: rawnand: vf610_nfc: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:37 +0200
Message-Id: <20230401161938.2503204-49-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=GrOH76yu1PLnzUKUatdG4MKq+Rlpxkq3aALTBWGM8g0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlUJYg3gY/NAkBfrkLhlIZgasPREVAV91JkC IdFJVgdItuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZVAAKCRCPgPtYfRL+ Ts1RB/wN3Lp3pwj/SNhPT4HWNXt1w8rPHZM2lc6ay7a/MDHYe93frEjuBQvMy/HwYGVU5NyIkjY FGgb1UjzTvm7HJ7ypQSrzPW1smfQQC6knc2BbRd2GczYAVHDyTtsfO9axrz1rEs0kPBOU5xnt7Y /6erqh4aT9NmPGzkYT7rCoOEfLL9A1QPT105S6Qvj+gc7dfG7CypS4+mF5xgrxfF/l3u+FVBHrT VCVTY9shVs9JBVelCL4PW/QNC+4cB6FVlpHREhi26z29ETB6HR14DwX5krCAifd/s/9oVgydagC K3Nst8HQGbuzNUyeJL8yrtDCTraawyiKm4pNbj8SXyp831mH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172003_993994_7BC6C177 
X-CRM114-Status: GOOD (  12.66  )
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
dmVycy9tdGQvbmFuZC9yYXcvdmY2MTBfbmZjLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3ZmNjEwX25mYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBfbmZjLmMK
aW5kZXggYjY0MzMzMmVhMWZmLi44NjUyMjA0OGUyNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3ZmNjEwX25mYy5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25m
Yy5jCkBAIC05MDksNyArOTA5LDcgQEAgc3RhdGljIGludCB2ZjYxMF9uZmNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gZXJyOwogfQogCi1zdGF0aWMgaW50IHZm
NjEwX25mY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lk
IHZmNjEwX25mY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1
Y3QgdmY2MTBfbmZjICpuZmMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwID0gJm5mYy0+Y2hpcDsKQEAgLTkxOSw3ICs5MTksNiBAQCBzdGF0aWMg
aW50IHZmNjEwX25mY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlXQVJO
X09OKHJldCk7CiAJbmFuZF9jbGVhbnVwKGNoaXApOwogCWNsa19kaXNhYmxlX3VucHJlcGFyZShu
ZmMtPmNsayk7Ci0JcmV0dXJuIDA7CiB9CiAKICNpZmRlZiBDT05GSUdfUE1fU0xFRVAKQEAgLTk1
NSw3ICs5NTQsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciB2ZjYxMF9uZmNfZHJp
dmVyID0gewogCQkucG0JPSAmdmY2MTBfbmZjX3BtX29wcywKIAl9LAogCS5wcm9iZQkJPSB2ZjYx
MF9uZmNfcHJvYmUsCi0JLnJlbW92ZQkJPSB2ZjYxMF9uZmNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3
CT0gdmY2MTBfbmZjX3JlbW92ZSwKIH07CiAKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIodmY2MTBf
bmZjX2RyaXZlcik7Ci0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
