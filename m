Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD08FCCA473
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35M1ZL2xQflZo6oHGvEKISFaesKq8YjNF4htWoxPhFs=; b=g3Lkw4ZM9nlRJM
	Tot128szN7Q0beEC5KjUFdFuqylbzTa8v8N1VTvNX/VXjR/jmDBVlKRvo+C/N2TQq+2YJbL00F1f2
	6MH33JRi7nRXeOZvGLQebzLAr1XJZhv42V12qPXBAVEYZ8rfZFOZbSUPfQJzUKV4v6RckWHVtt2VS
	QI2MPKgKdxoO5SYnIjDPBrzsNTc6MvE1dkXJev810TwRFsMzU35a3hcUp5epDvFVaj9hbIa7hiGBI
	5l85F2lPH6rtUKd9sCe0vwNIjlFfrvBJhPxnUNe8aeefa8iyOMt62hnphi8LVBey26tdj1FGwWYUE
	XOSWBPKRrJTSjguab5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWt-008h2r-6W; Fri, 03 Jun 2022 21:08:23 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWl-008gw1-FZ
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-0003qp-VY; Fri, 03 Jun 2022 23:08:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWc-006Hq2-I3; Fri, 03 Jun 2022 23:08:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWa-00E1HO-DC; Fri, 03 Jun 2022 23:08:04 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH 06/14] mtd: spear_smi: Don't skip cleanup after mtd_device_unregister() failed
Date: Fri,  3 Jun 2022 23:07:50 +0200
Message-Id: <20220603210758.148493-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302; i=uwe@kleine-koenig.org; h=from:subject; bh=4JVP0q+7/EY+5GFmUKnnYSwfZI2lV7EGcJuV7m6VK28=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfYJG6ZjNbv+5TIsVpjgDRIboTPNCPyHT9MJPum lOB8mvOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp32AAKCRDB/BR4rcrsCfc3B/ 9TLNkpAx9Q4s0COJo0ZCabJa7ocO5ZZStcG+/fWDY2TN6/X32SsgU7A6huc9JwQZBysi+PdFU2BjwC ywOP0daXSXq4tC0rN/kviE3+P/qg6gMuHFc81tA1OrDOOjyNP8XsobDAGN9kedeIR29ISpFMR6wU9s UnFyT1zLTLliAQm8Oxm5y6kOVelV1BxkHMjZVeKj379GQUpOOXCkZArErz0WSyafhTSss86VsioZGW lgbKwiW7dNmiRZMqpanGkyYOgd/hMDE4ppKCAGDgiOQv2UHKD+kW5dxZPoCyhcFZJzlE9eGE8ZwHzQ JpXtqzyHSm/+uZ42KIcwP0pr4pQ++u
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140815_614973_4DDF2B6A 
X-CRM114-Status: GOOD (  13.92  )
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

SWYgbXRkX2RldmljZV91bnJlZ2lzdGVyKCkgZmFpbHMgKHdoaWNoIGl0IGRvZXNuJ3Qgd2hlbiB1
c2VkIGNvcnJlY3RseSksCnRoZSByZXNvdXJjZXMgYm91bmQgYnkgdGhlIG5hbmQgY2hpcCBzaG91
bGQgYmUgZnJlZWQgYW55aG93IGFzIHJldHVybmluZwphbiBlcnJvciB2YWx1ZSBkb2Vzbid0IHBy
ZXZlbnQgdGhlIGRldmljZSBnZXR0aW5nIHVuYm91bmQuCgpJbnN0ZWFkIHVzZSBXQVJOX09OIG9u
IHRoZSByZXR1cm4gdmFsdWUgc2ltaWxhciB0byBob3cgb3RoZXIgZHJpdmVycyBkbwppdC4KClRo
aXMgaXMgYSBwcmVwYXJhdGlvbiBmb3IgbWFraW5nIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFja3Mg
cmV0dXJuIHZvaWQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbXRkL2RldmljZXMvc3BlYXJfc21p
LmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3NwZWFyX3NtaS5jIGIvZHJp
dmVycy9tdGQvZGV2aWNlcy9zcGVhcl9zbWkuYwppbmRleCAyNDA3MzUxODU4N2YuLmY2ZmViZTY2
NjJkYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9zcGVhcl9zbWkuYworKysgYi9k
cml2ZXJzL210ZC9kZXZpY2VzL3NwZWFyX3NtaS5jCkBAIC0xMDQ1LDcgKzEwNDUsNyBAQCBzdGF0
aWMgaW50IHNwZWFyX3NtaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsK
IAlzdHJ1Y3Qgc3BlYXJfc21pICpkZXY7CiAJc3RydWN0IHNwZWFyX3Nub3JfZmxhc2ggKmZsYXNo
OwotCWludCByZXQsIGk7CisJaW50IGk7CiAKIAlkZXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShw
ZGV2KTsKIAlpZiAoIWRldikgewpAQCAtMTA2MCw5ICsxMDYwLDcgQEAgc3RhdGljIGludCBzcGVh
cl9zbWlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCQljb250aW51ZTsK
IAogCQkvKiBjbGVhbiB1cCBtdGQgc3R1ZmYgKi8KLQkJcmV0ID0gbXRkX2RldmljZV91bnJlZ2lz
dGVyKCZmbGFzaC0+bXRkKTsKLQkJaWYgKHJldCkKLQkJCWRldl9lcnIoJnBkZXYtPmRldiwgImVy
cm9yIHJlbW92aW5nIG10ZFxuIik7CisJCVdBUk5fT04obXRkX2RldmljZV91bnJlZ2lzdGVyKCZm
bGFzaC0+bXRkKSk7CiAJfQogCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRldi0+Y2xrKTsKLS0g
CjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
