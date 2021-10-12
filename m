Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F22C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 15:41:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA8D601FF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 15:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFA8D601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uebfITYbESR2gVl43stwKvzOu6suv6XEN3RWjW5lNYo=; b=jMZHTLofwsLbxS
	ZOePiTLifvXcftbmgERuu03UPyW5hJSr8bzUQ7Bft67SVPYoogaVg++O5u0i0s8Xc6vJQ7Oke6Yza
	b/ZFNwdN0hyyCVx5VFuEMt6UkeyCa8KoiFBSxydhKoMzxubqxpd9qdH2eTszzab4iymHUVMVNGCqe
	IJm1uwfYWoamv3i4zk7KM4a9QpDmk/3cUZ9cHPJIO06fI5evN7ygGkUQnpA7llX1w0CnLMHKz8Vu/
	gYdiOXnI/mVOkBFQpOcCPt8gPmyRLPLxRA4d8qZ+P+rb6kVQZGpvdECUCmbJQa5fmHCDTK7q8gie7
	H/y32ZFOXFsdGPh4oVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maJt2-00DN2j-KF; Tue, 12 Oct 2021 15:40:16 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maJsp-00DMwK-4f
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 15:40:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJse-0008NW-M2; Tue, 12 Oct 2021 17:39:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsd-0004in-Ps; Tue, 12 Oct 2021 17:39:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsd-0004Yp-Om; Tue, 12 Oct 2021 17:39:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [PATCH v2 16/20] mtd: sst25l: Warn about failure to unregister mtd
 device
Date: Tue, 12 Oct 2021 17:39:41 +0200
Message-Id: <20211012153945.2651412-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
References: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=chTrsNwtyvGFDidu8JfqkR8D1NeBCtiv8G0Xdn/Msdg=;
 m=aWXlVn4zGl3/VNxE8xQ1auTXzJiWk3xyQCYCHspYcNI=;
 p=TyuS/iMN/2qfQLKMz56PvUq4wtcc0B7f+zs42TknICw=;
 g=c6b8458784ebb8ccbecde25a4af573d5e8fd863b
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFlrCkACgkQwfwUeK3K7AnDkQf+Nb3
 3j5Jgm1majYjJ+sScbZ2HOkWGFVOQWeTvYfeytVvtxml2BbCSUhRa60oI3pnRl8KZpf1LSPtBx0Lv
 gw0p6PqXhs0kpkFsu1zukS4yPR4O6U+11E+3KrCQvgpXZtpIEuMYwdqirjME5jbPloH2LftzFCXeT
 C85UknBWop/d3AD0ivfVGL7M8x7iMrhPacg6H8/x6CoOp9UyiWor0X9qahA3FpnSQBd1SmA8HhPoO
 2jnNcag0IBYeCs08IYABkj1kdMk3CFurya0dEyMO774G3TwA+fP+nWl2cZRZKf6iKGPzY98B9xCVZ
 sh77HoYmLIWw5+szDsL7QgTVpm7ueDA==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_084003_206400_46DFE41A 
X-CRM114-Status: GOOD (  13.70  )
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
aWNlcy9zc3QyNWwuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3NzdDI1
bC5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9zc3QyNWwuYwppbmRleCBiODFjM2YwYjg1ZjkuLjA0
MDYyYTFmNTRjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9zc3QyNWwuYworKysg
Yi9kcml2ZXJzL210ZC9kZXZpY2VzL3NzdDI1bC5jCkBAIC00MDEsOCArNDAxLDE0IEBAIHN0YXRp
YyBpbnQgc3N0MjVsX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCiBzdGF0aWMgaW50IHNz
dDI1bF9yZW1vdmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKIHsKIAlzdHJ1Y3Qgc3N0MjVsX2Zs
YXNoICpmbGFzaCA9IHNwaV9nZXRfZHJ2ZGF0YShzcGkpOworCWludCByZXQ7CisKKwlyZXQgPSBt
dGRfZGV2aWNlX3VucmVnaXN0ZXIoJmZsYXNoLT5tdGQpOworCWlmIChyZXQpCisJCWRldl93YXJu
KCZzcGktPmRldiwgIkZhaWxlZCB0byB1bnJlZ2lzdGVyIG10ZCBkZXZpY2UgKCVwZSlcbiIsCisJ
CQkgRVJSX1BUUihyZXQpKTsKIAotCXJldHVybiBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoJmZsYXNo
LT5tdGQpOworCXJldHVybiAwOwogfQogCiBzdGF0aWMgc3RydWN0IHNwaV9kcml2ZXIgc3N0MjVs
X2RyaXZlciA9IHsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
