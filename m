Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB3FC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 15:41:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0014361076
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 15:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0014361076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwznJu4ysmYleKWouWGU2bBAuDqLayjc6yUZzBExejw=; b=kYQahMGvva5xlh
	mLHFPFsJY7UrYNtVXS8Y8p6gtTddVdPk4cLvhKjArzv6Pyk4XmbA1G1cb8GNt92AK5ljSAnNNHosN
	uIjc3DvcyjfhbNHsUv4khRFuzXLoGXx9gWLQG8M4yY2nYpNp2Lz5QlhtEacF0kWwEy3F01LdHUCUe
	ITqeDKQY4pa924KDD+FGw3H1qYryl4qPfAHAcVzaxaoo6caf0VrKXcFDYmm4iMkEfnZh3UjEfU8FX
	MjNmi+1dUuQpvoULysfQwbF8PDf6Qr7NiI0I4Ug3yPR9fwHYFRYvu9OQovDfYU3i8HrSUdXmHLIJk
	7cW9G/PddCiiaJa00UMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maJtG-00DN6W-9U; Tue, 12 Oct 2021 15:40:30 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maJsp-00DMyN-T0
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 15:40:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsl-0000JF-BY; Tue, 12 Oct 2021 17:39:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsk-0004lk-Iw; Tue, 12 Oct 2021 17:39:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsd-0004Yj-Eg; Tue, 12 Oct 2021 17:39:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [PATCH v2 14/20] mtd: mchp23k256: Warn about failure to unregister
 mtd device
Date: Tue, 12 Oct 2021 17:39:39 +0200
Message-Id: <20211012153945.2651412-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
References: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=oQ0rhox5HEbwbc0e75w1kKEc23U+uF8p5JmZ7F33OK0=;
 m=aWXlVn4zGl3/VNxE8xQ1auTXzJiWk3xyQCYCHspYcNI=;
 p=qd3VQORiTd+2PycmNSRq+P7NPYQTqLjcNuVof7YmoX0=;
 g=e977070b7429d85799af28daa3a1f14654179392
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFlrCMACgkQwfwUeK3K7AkE9wgAjcV
 V25oLZh1d0i5sng1FwvkK7nUZrkAggWQIZnkEIvV87joBYdT9N3wcykRaiPSqPqlfvDLpSdPbAYJV
 YQDkg6CmVGTDbhevroZRbc2I2mA+Nt534QSMFfI8HQbpvKDnQ5ofK5cRwSWyIUqP3iMAmYbqajPJO
 2am5RkRd0bMcfqleNz3EkRZJh0VRa8+QV9RoorgZcVD9Te0P/Pc4DAIdQoYUq30/Ds+KHlygdZ8K/
 Lsrvg58v220dWxA11N6s6LUgs+dxW+evdpSCf9CBWJWSF2wS26AjH7mNvbfSfUc1quNeI1y7sAmgH
 4Z+KdkTnr0/E6PMEl7/F0wC+EvzJrnA==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_084003_976266_891BC07C 
X-CRM114-Status: GOOD (  14.61  )
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

V2hlbiBhbiBzcGkgZHJpdmVyJ3MgcmVtb3ZlIGZ1bmN0aW9uIHJldHVybnMgYSBub24temVybyBl
cnJvciBjb2RlCm5vdGhpbmcgaGFwcGVucyBhcGFydCBmcm9tIGVtaXR0aW5nIGEgZ2VuZXJpYyBl
cnJvciBtZXNzYWdlLiBNYWtlIHRoaXMKZXJyb3IgbWVzc2FnZSBtb3JlIGRldmljZSBzcGVjaWZp
YyBhbmQgcmV0dXJuIHplcm8gaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9tdGQvZGV2
aWNlcy9tY2hwMjNrMjU2LmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMv
bWNocDIzazI1Ni5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tY2hwMjNrMjU2LmMKaW5kZXggNzdj
ODcyZmQzZDgzLi4yMzIxMzAwOWViZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMv
bWNocDIzazI1Ni5jCisrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvbWNocDIzazI1Ni5jCkBAIC0y
MTIsOCArMjEyLDE1IEBAIHN0YXRpYyBpbnQgbWNocDIzazI1Nl9wcm9iZShzdHJ1Y3Qgc3BpX2Rl
dmljZSAqc3BpKQogc3RhdGljIGludCBtY2hwMjNrMjU2X3JlbW92ZShzdHJ1Y3Qgc3BpX2Rldmlj
ZSAqc3BpKQogewogCXN0cnVjdCBtY2hwMjNrMjU2X2ZsYXNoICpmbGFzaCA9IHNwaV9nZXRfZHJ2
ZGF0YShzcGkpOworCWludCByZXQ7CiAKLQlyZXR1cm4gbXRkX2RldmljZV91bnJlZ2lzdGVyKCZm
bGFzaC0+bXRkKTsKKwlyZXQgPSBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoJmZsYXNoLT5tdGQpOwor
CWlmIChyZXQpCisJCS8qIFRoZXJlIGlzIG5vdGhpbmcgd2UgY2FuIGRvIGFib3V0IHRoaXMgLi4u
ICovCisJCWRldl93YXJuKCZzcGktPmRldiwgIkZhaWxlZCB0byB1bnJlZ2lzdGVyIG10ZCBkZXZp
Y2UgKCVwZSlcbiIsCisJCQkgRVJSX1BUUihyZXQpKTsKKworCXJldHVybiAwOwogfQogCiBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtY2hwMjNrMjU2X29mX3RhYmxlW10gPSB7Ci0t
IAoyLjMwLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
