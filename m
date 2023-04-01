Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88087C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuyqGiIJzfYd4FPg85iBBcEPc0wL5g+aSV5EJ0Rb8bY=; b=kPkoC6P6Ne5lpa
	nA+u/PtOGMPKPLaAxr+Jj6geKg6kWK0rR4jMjnZ6eeDFWJUS/F5fR6BmkthUE2+kQ3MXUr6JXDi0g
	9fL+RnNeQu6gblBWe0zcu2lodMQ8VdyxC2uSHcGKBk+3qeS81iZrG9/BmADBXliT2n4O/IrqBWYUy
	INqmB3mI/qTki8kmTsW+JrxhFAqdKro7DGuhcDIJ3q2w7pIO6OzDybgLu+KRGm4SAFyCRkzLHzA4O
	UDcKAeo3enHT4vP6kbBbNtf2c4VfhvMfs5XIMyM7wU7nrklQI2liHQgv/0FvCnP9/vC+I/0Y0CD9F
	ylJ/12y3TdVI9N5eQU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidz5-00AtKq-02;
	Sat, 01 Apr 2023 16:21:43 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxg-00AsJV-0Z
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/O11WgaS5cBOw6Rxe6DxWIEIPKTr28R/vgUioRrfmfk=; b=mQlnOjI4hJ0FRYj/ifrFcoxbrc
	Lhs3m/gTiu1AL/uRU+/JUva3GqRlJy/hIAPrE6B7YMb5Q4sS+5y4tfD1hnOmPWBYii1ocnvRPRElV
	OP1e1mwCTO8niEy5kz9XGVuywYuEjOfA7VAsoRxcsDH0YxlGSyZsn8WFZc19Txrs6qcsCAeZnrvHp
	EfmoXzO+mvQLtjSPdASmnF+nY//Ia99JstKuX0PG2AoYkoP7q+jVCBHjqwRudJR2YC9S3+rN2PQ7N
	DfQcBrQmB42zumwmRDq3L2PJV/VOZ2z8TYKMshaYgdM0dvUxxsiVTRN1VzW+gPIKjBlpI/eU33Nzr
	ny97+xcg==;
Received: from metis.ext.pengutronix.de ([85.220.165.71])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-008DLR-1K
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxM-0008Un-4u; Sat, 01 Apr 2023 18:19:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-008GST-Tr; Sat, 01 Apr 2023 18:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-009khV-7r; Sat, 01 Apr 2023 18:19:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 38/49] mtd: rawnand: qcom: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:27 +0200
Message-Id: <20230401161938.2503204-39-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=G28o7xn3QeMDu6fYFFRYPya7v5M/PkKU71x1+qlTeuM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlIoSNlhz8SuPP1vj89aETRFZubu7irTsjfo seAd3212iyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZSAAKCRCPgPtYfRL+ TlG6B/0ToTS5PmudnWMvPXc08gvHEHveyRmqI7ZmtdZLRYRCCj8qe8KsVhsQcsJTd73Z6ggGkOx TIW4NvZh9lWSMxLI5pd+hdAkIuoROHvfnlXH5VJXAYJf8qXO8NDozk4tiwuwB+tUDdDo/FIgeX4 JMKBWLS9FOnI0boY53KWw/Acb0j/SZBqN0emeA61Bko07JE/6hTwRtF6KXSzUp9tUdf9/4nzsJG XyO3X64lRIA591mmoYy9Mh28lXwszMvqT++JT83dKptAPuSNDT2/xvToXkCrISLTyi2xw/Q3gne MbcghY8XSx32hMyRSr9OehzOlAQAkKS0GGMRmET4yKitNY3q
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172007_704628_AFBC326A 
X-CRM114-Status: GOOD (  15.94  )
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
dmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5k
Yy5jCmluZGV4IDE5OGE0NDc5NGQyZC4uMjE4YzhhODQwZTMyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jCkBAIC0zMzE1LDcgKzMzMTUsNyBAQCBzdGF0aWMgaW50IHFjb21fbmFuZGNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0
aWMgaW50IHFjb21fbmFuZGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitz
dGF0aWMgdm9pZCBxY29tX25hbmRjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogewogCXN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMgPSBwbGF0Zm9ybV9nZXRf
ZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlcyA9IHBsYXRmb3JtX2dldF9yZXNv
dXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7CkBAIC0zMzM3LDggKzMzMzcsNiBAQCBzdGF0
aWMgaW50IHFjb21fbmFuZGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAK
IAlkbWFfdW5tYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgbmFuZGMtPmJhc2VfZG1hLCByZXNvdXJj
ZV9zaXplKHJlcyksCiAJCQkgICBETUFfQklESVJFQ1RJT05BTCwgMCk7Ci0KLQlyZXR1cm4gMDsK
IH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBxY29tX25hbmRjX3Byb3BzIGlwcTgwNnhfbmFuZGNf
cHJvcHMgPSB7CkBAIC0zNDA1LDcgKzM0MDMsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBxY29tX25hbmRjX2RyaXZlciA9IHsKIAkJLm9mX21hdGNoX3RhYmxlID0gcWNvbV9uYW5k
Y19vZl9tYXRjaCwKIAl9LAogCS5wcm9iZSAgID0gcWNvbV9uYW5kY19wcm9iZSwKLQkucmVtb3Zl
ICA9IHFjb21fbmFuZGNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gcWNvbV9uYW5kY19yZW1vdmUs
CiB9OwogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihxY29tX25hbmRjX2RyaXZlcik7CiAKLS0gCjIu
MzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
