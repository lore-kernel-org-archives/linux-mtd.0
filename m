Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFED3C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPXMQq7RRJo8NnqT6IMckOCvFY18z4xV1GBfN/CWu5U=; b=HRqNBqa4m1zjU8
	qPNVOZzCTcvzSe7hNuo+bv0DEt+rw8CNl83twKq3a+wq73fM+A0MeUZ1zcgufakwHislSRSLdpORf
	B58RhEmkytLymJgZntQmAPnjNB3jC5xjrZgZrFTXLnN7gVIaOrdKeyRQRAZsBpgcz2ExskpxI4rwY
	2NiQSSEjXBYkk4UcmvcB4xNIQCwZpPRs+kmJB1YBK57jADe1Ea0Iqz8UVgWptGR6ugElFTGWLNXy8
	nhcd64vJw07TOmAM5U+AU5YHeTr0icFyxylooxpsg3CpFd8DA3vN37bCfBCoHevRppcJ9xrzVwt0K
	RuSWDeD/jXQTpj9KE+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEXU-008hT6-Ny; Fri, 03 Jun 2022 21:09:00 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWn-008gyh-6b
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWe-0003rQ-M1; Fri, 03 Jun 2022 23:08:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWd-006HqT-NF; Fri, 03 Jun 2022 23:08:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-00E1Hi-D0; Fri, 03 Jun 2022 23:08:05 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: kernel@pengutronix.de,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 11/14] mtd: rawnand: meson: Don't skip cleanup after mtd_device_unregister() failed
Date: Fri,  3 Jun 2022 23:07:55 +0200
Message-Id: <20220603210758.148493-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2079; i=uwe@kleine-koenig.org; h=from:subject; bh=RARxTiaUJYu4OZ6zHphWegS1/d3oBvCOapegjJ7Xz2w=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfok3XZnM8xPmeh6eqHGnVxhDUlHH6mjDHSnMtj XzhjYlWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp36AAKCRDB/BR4rcrsCR0fB/ 0XtpF397Uz0TI5bccMu6LPI+SY3xLErkAzy0oq/qVB0J5MexcIdYbctHySiybN1IFKvlbgrQ5cupk6 /iaHpfoOmhZNe4gKrjbocltz+mXgT3dn9PpT6NpXq9cuu/BgQ1ie0+ePFymUHBOKmEevSFLL681zvk cMvB5sdiQwojrFzUNQPK2rU/Paveuencs0tKWbOUSX74Gw+QcDtMJQUT67ZQCVuFCZ9+RWrYcWdcl7 J0cg9UgAZ/S/DWHHzIjABKtzbEZ0dp6906yCsINCp+wRhPu0EPRWBZQRpJIuSWw+qR7RVpml+lVjKh gor07c5W15prWMTew+AfkLn/qAwXj7
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140817_307463_1C88B16C 
X-CRM114-Status: GOOD (  14.41  )
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
IHRoZSByZXR1cm4gdmFsdWUgc2ltaWxhciB0byBob3cgb3RoZXIgZHJpdmVycyBkbwppdC4gVGhl
biBtZXNvbl9uZmNfbmFuZF9jaGlwX2NsZWFudXAoKSByZXR1cm5zIDAgdW5jb25kaXRpb25hbGx5
IGFuZCBjYW4KYmUgY2hhbmdlZCB0byByZXR1cm4gdm9pZCB3aGljaCBhbGxvd3MgZnVydGhlciBz
aW1wbGlmaWNhdGlvbiBpbiB0aGUKcmVtb3ZlIGNhbGxiYWNrLgoKVGhpcyBpcyBhIHByZXBhcmF0
aW9uIGZvciBtYWtpbmcgcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrcyByZXR1cm4gdm9pZC4KClNp
Z25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+Ci0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgMTQgKysrLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwppbmRleCBhYzNiZTkyODcyZDAuLjc0OGUxMTVi
MGJiNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCisrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwpAQCAtMTI5MywyNiArMTI5MywyMSBA
QCBtZXNvbl9uZmNfbmFuZF9jaGlwX2luaXQoc3RydWN0IGRldmljZSAqZGV2LAogCXJldHVybiAw
OwogfQogCi1zdGF0aWMgaW50IG1lc29uX25mY19uYW5kX2NoaXBfY2xlYW51cChzdHJ1Y3QgbWVz
b25fbmZjICpuZmMpCitzdGF0aWMgdm9pZCBtZXNvbl9uZmNfbmFuZF9jaGlwX2NsZWFudXAoc3Ry
dWN0IG1lc29uX25mYyAqbmZjKQogewogCXN0cnVjdCBtZXNvbl9uZmNfbmFuZF9jaGlwICptZXNv
bl9jaGlwOwogCXN0cnVjdCBtdGRfaW5mbyAqbXRkOwotCWludCByZXQ7CiAKIAl3aGlsZSAoIWxp
c3RfZW1wdHkoJm5mYy0+Y2hpcHMpKSB7CiAJCW1lc29uX2NoaXAgPSBsaXN0X2ZpcnN0X2VudHJ5
KCZuZmMtPmNoaXBzLAogCQkJCQkgICAgICBzdHJ1Y3QgbWVzb25fbmZjX25hbmRfY2hpcCwgbm9k
ZSk7CiAJCW10ZCA9IG5hbmRfdG9fbXRkKCZtZXNvbl9jaGlwLT5uYW5kKTsKLQkJcmV0ID0gbXRk
X2RldmljZV91bnJlZ2lzdGVyKG10ZCk7Ci0JCWlmIChyZXQpCi0JCQlyZXR1cm4gcmV0OworCQlX
QVJOX09OKG10ZF9kZXZpY2VfdW5yZWdpc3RlcihtdGQpKTsKIAogCQltZXNvbl9uZmNfZnJlZV9i
dWZmZXIoJm1lc29uX2NoaXAtPm5hbmQpOwogCQluYW5kX2NsZWFudXAoJm1lc29uX2NoaXAtPm5h
bmQpOwogCQlsaXN0X2RlbCgmbWVzb25fY2hpcC0+bm9kZSk7CiAJfQotCi0JcmV0dXJuIDA7CiB9
CiAKIHN0YXRpYyBpbnQgbWVzb25fbmZjX25hbmRfY2hpcHNfaW5pdChzdHJ1Y3QgZGV2aWNlICpk
ZXYsCkBAIC0xNDQ1LDExICsxNDQwLDggQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBtZXNvbl9uZmMgKm5mYyA9
IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwotCWludCByZXQ7CiAKLQlyZXQgPSBtZXNvbl9u
ZmNfbmFuZF9jaGlwX2NsZWFudXAobmZjKTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OworCW1l
c29uX25mY19uYW5kX2NoaXBfY2xlYW51cChuZmMpOwogCiAJbWVzb25fbmZjX2Rpc2FibGVfY2xr
KG5mYyk7CiAKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
