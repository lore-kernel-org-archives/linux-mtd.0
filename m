Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E29C761AF
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Tg+uWyHTzk7ahKkJhT/dXdvF/BBk2lxEwUXq/Td33g=; b=XJ1Z6itMyn+4w8
	KsLhY5ChZVcL+Wp6AradoHlGybBg6TXjpjmgHV5x99ThMAK5aSCMfzXYQWmP0e4iCvW+BUUioblcq
	P/ruBegRGNjIZcPB/EmAWGHcTIUXI3sB3KSesr+Dy8SQsAIK//Fl4ozziz94ENwKdRyH1KJiUk1G0
	nwmTrXh6ekPFCU7HnKIFjaEohw2EEuxxERDErM4RIY9TjZTTGEjQfPcEWESzfuzXgYluQB8ikOLLQ
	WsuwzONtdHqG4fGxIhpGXlBvrjro8rtfWTYQTfglnoQeqNjOBP7u6EGUd8nsJXpc3Bwb0q9eQ7v6E
	CWUFmBejumqoTJZZ9aog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxj-00AsKv-2V;
	Sat, 01 Apr 2023 16:20:19 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As9D-0H
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-00089I-Uo; Sat, 01 Apr 2023 18:19:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxD-008GPq-Q2; Sat, 01 Apr 2023 18:19:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxD-009kfJ-1j; Sat, 01 Apr 2023 18:19:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 04/49] mtd: onenand: samsung: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:18:53 +0200
Message-Id: <20230401161938.2503204-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HZhr3wtXScHQata752iFFkBouaYyTcwz0fuk3NBW8HE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFj0EmPMBzokGJuMW9KijxhFy7ic5bPMbApHP HYFrQPbniaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY9AAKCRCPgPtYfRL+ ToE9B/0cttMH5J3owegf74UICe2Z58oOkReNWDY2QsVvFG3fKLjzZo8lgMpsokuCuONZiYlADtU 74AQ6r/NR9U18oUrJWF2ifa+6uNH/7i/NGSyTEm8FMlOG5ZlDTZk2HYPQzDpKaxK+qguYhrfbWu GhMiSJENkRJEhC7NzzpaSixoUIiVcUmJY7L++9jWz/B6mNwh+Zou+aXmQBDHe+hRAxdJy/2jkIp VSk4WhfNUYhdhbKPeOtnfQPKbDsSQiLhEZ6Kzzj0mqFSP54Glek1m0OqA9reg3TwmjEDI0e/KKu hRvxOeHsRVdsof7811dur/NBhtE5957cJMPcZFdD0sniIrLl
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_148286_D11708B7 
X-CRM114-Status: GOOD (  15.76  )
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
dmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfc2Ftc3VuZy5jIHwgNiArKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfc2Ftc3VuZy5jIGIvZHJpdmVycy9tdGQv
bmFuZC9vbmVuYW5kL29uZW5hbmRfc2Ftc3VuZy5jCmluZGV4IGI2NDg5NTU3MzUxNS4uOTIxNTFh
YTUyOTY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9zYW1z
dW5nLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfc2Ftc3VuZy5jCkBA
IC05NDMsMTMgKzk0MywxMSBAQCBzdGF0aWMgaW50IHMzY19vbmVuYW5kX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgczNjX29u
ZW5hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBz
M2Nfb25lbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1
Y3QgbXRkX2luZm8gKm10ZCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCiAJb25lbmFu
ZF9yZWxlYXNlKG10ZCk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBzM2NfcG1fb3Bz
X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQpAQCAtOTk2LDcgKzk5NCw3IEBAIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHMzY19vbmVuYW5kX2RyaXZlciA9IHsKIAl9LAogCS5pZF90
YWJsZQk9IHMzY19vbmVuYW5kX2RyaXZlcl9pZHMsCiAJLnByb2JlICAgICAgICAgID0gczNjX29u
ZW5hbmRfcHJvYmUsCi0JLnJlbW92ZSAgICAgICAgID0gczNjX29uZW5hbmRfcmVtb3ZlLAorCS5y
ZW1vdmVfbmV3ICAgICA9IHMzY19vbmVuYW5kX3JlbW92ZSwKIH07CiAKIG1vZHVsZV9wbGF0Zm9y
bV9kcml2ZXIoczNjX29uZW5hbmRfZHJpdmVyKTsKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
