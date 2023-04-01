Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F947C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXiRMNcXI7QvhSsZLJ8tZPFVTFrH5U7o8WsrHlPrbKs=; b=lwddyxf1EHJ7qm
	DzUvkzupUNfOY2xsC/XIuz+RtHE3j8/gSPZrDoN+DnwjeBzcMt6P3Y+5nrQfRSfUZpLG8SxY5iSDN
	UDmt+YJ0U6knENcGl0amjlC5VYqHqi8h6Eep0Tcr47Va2aMRv/XdeBXL1INLIxkZsO6WUJ7XVBUZd
	VYOJpOuLtl9n2/2gKUYl4ufPybwRxqSKfKYnteWaZ0lKKsWJfMuH4BY2KtEttq0GjqUg1fi15rpkO
	kOppZRjrDQEZO55tl+yuBjpS4QGj1tpr01halFeW2xLnzQE/XuDrML4kuBHP/xRa2iwGHW7WQO5kE
	+fona8gUVJZDf91pUHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieFG-00AxDo-2S;
	Sat, 01 Apr 2023 16:38:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEP-00AwRk-22
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=do9F7LZxhIo98Aj2uu/fm40T4OcRv2K3VmBX/SguUB0=; b=ipJXGOcPCG5MyQ0Mzf9SREdjOY
	qnuTes/aAA/iWBtSa38UhIuByw78DBdVcWHcCcpJO7ySbmXQYGJtSgec1oBb6CqSAOB2IqD9Nm8NB
	u2HDkVcx0OGYcaJ4fLM3z58M+gqHJQteOITMW2+wUe7oYafDSkz7dzzA4pnjIVrXGJP9We3INSPoQ
	fd8e1ztOZuFs21kUiSSSyVTTb9Zdbo1JAh8IqAqR9pGsjZh32X6cQu/BS3K2uktSahd7Z62xG5N6H
	NmXWCnekJy8jaDV19lTim0qVtmcMX+tYKgtmTFmriCFzSS8cTtwel/AkvvbXr/uA5cEvypgmVyPrw
	0A91yp6w==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxS-00CYO2-PH
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-0008Ph-Sk; Sat, 01 Apr 2023 18:19:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxJ-008GS0-VS; Sat, 01 Apr 2023 18:19:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-009kgz-JY; Sat, 01 Apr 2023 18:19:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 30/49] mtd: rawnand: ndfc: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:19 +0200
Message-Id: <20230401161938.2503204-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ERgQG7Gi0NdKB61npZUy+7RZjzs3JxDpVBIvkTKvp98=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFk1U0YOeUztywFXXJ0xmbfnY4WKmH+EGlaCh rvxNcDtD2SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZNQAKCRCPgPtYfRL+ TsbiCAC6bl1e+g7hViAoqNZT3itW0MwTcrHJ+3sfHTxdKpBbTr3LS5bcybzvWyOIjeWH1PnWEsn KfLN8CM8NURIa6SDhU/3HM5WOTL9RgbQVDKhHWhOoqYhv5bOZl1rDnz9l9UXzc1o9skbv5MJfy1 pVZH31t4u3l/Hkhm6OQsejRcdTAgriB0a5ie6r1AKND7p+/HCilITbhLxv68plVjJ5n7tgYmkue Jud1sUYfTkMyPkLmvN8cl0lFx8v3yIVPpKS7Jic+frI92bXvjnb8o50fz0aZMUfAEwHgo/h8WPr WyF86WKrQbWB1cAv0NMV0tU0U6sjELxfphQ+Wc0WUawyHT/M
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172002_908211_072FAF33 
X-CRM114-Status: GOOD (  12.74  )
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
dmVycy9tdGQvbmFuZC9yYXcvbmRmYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbmRmYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmRmYy5jCmluZGV4IDMzOGQ2YjFh
MTg5ZS4uNTdmM2RiMzIxMjJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uZGZj
LmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmRmYy5jCkBAIC0yNDAsNyArMjQwLDcgQEAg
c3RhdGljIGludCBuZGZjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9mZGV2KQogCXJl
dHVybiAwOwogfQogCi1zdGF0aWMgaW50IG5kZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKm9mZGV2KQorc3RhdGljIHZvaWQgbmRmY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqb2ZkZXYpCiB7CiAJc3RydWN0IG5kZmNfY29udHJvbGxlciAqbmRmYyA9IGRldl9nZXRfZHJ2
ZGF0YSgmb2ZkZXYtPmRldik7CiAJc3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9ICZuZGZjLT5jaGlw
OwpAQCAtMjUxLDggKzI1MSw2IEBAIHN0YXRpYyBpbnQgbmRmY19yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqb2ZkZXYpCiAJV0FSTl9PTihyZXQpOwogCW5hbmRfY2xlYW51cChjaGlwKTsK
IAlrZnJlZShtdGQtPm5hbWUpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIG5kZmNfbWF0Y2hbXSA9IHsKQEAgLTI2Nyw3ICsyNjUsNyBAQCBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBuZGZjX2RyaXZlciA9IHsKIAkJLm9mX21hdGNoX3Rh
YmxlID0gbmRmY19tYXRjaCwKIAl9LAogCS5wcm9iZSA9IG5kZmNfcHJvYmUsCi0JLnJlbW92ZSA9
IG5kZmNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gbmRmY19yZW1vdmUsCiB9OwogCiBtb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKG5kZmNfZHJpdmVyKTsKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
