Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAEBC6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1EzuhW6RCrWnOcNZNQqmdRF8skvF10zs7GFVParlDk=; b=bVw9TWdXjGvave
	CxncmoTAbEZPpWsOPnpu1hEVFeC1KPd8yKEMURZtaOWPkDt8jhZHeywjzH57/e5VNoC7zdkliF9qz
	L3Ny5wBUTJ1spn14b8rntnP0rQdWqEiRoDT0l++KKQQyBrGXPCiJCNoEfj6mIAK4C/8eFtFG6Jfnk
	BJaTxJvIzlNKEv7qvDQlX8XXn7wMKxsing6GFG3qD59rfeGj8xWfoFMOFyuyqpByh6EGM8FXg6Eax
	vSrOF27/WOOCIYC1w4tkkO4MC+zIers+xRLs41ksSX6LSTARB21TM5pCQ/zvGqd+1E8xSGhgRaFW+
	tWV82KXzVkxbJuZNubFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidyO-00Asiv-0j;
	Sat, 01 Apr 2023 16:21:00 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As9K-1R
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-0008H8-AL; Sat, 01 Apr 2023 18:19:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-008GQr-6p; Sat, 01 Apr 2023 18:19:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-009kfp-Ot; Sat, 01 Apr 2023 18:19:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 12/49] mtd: rawnand: denali_dt: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:01 +0200
Message-Id: <20230401161938.2503204-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qu53JEhv/Z4bJEqq9yVu8BBGocu88PSDD4T3tHfhkJ8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFj97/26wkgPxEpKLL179mj7Up6terazQIygM /MdpKim+Y2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY/QAKCRCPgPtYfRL+ Th8qCACOt4YCxyM8hsDXuBmwLUYnH9eVIqVRi+zZcYaUUSdfrFHVb81kgsqvuIuADi7pbl2ZfzH 0CbGYLY/IfkDCPBaVdvhg9lgq57GUocn/eWCfWCs6wQsdwDCAwO0F9qavLICION6ybSYVyGRXI+ l7Hv708BYGMtUQNBLzhbjZVmNY0N9oPn32jf7UwHY849IosGWvQ+BIfjar1OwNFodAHHl/N0Lnh J0jtnPQgk4R3vZtm3baVKzGtkxSqtoGM1S1gLHkNZAF4NbJSPb1ISfcSHzZL0SbcwlnxiqGq0W5 leqJFGmcFUj3Bh0uI+M5CBSzSmNe3IPOq/YM3ViRpNpbu2oQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_481829_6A58120D 
X-CRM114-Status: GOOD (  16.02  )
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
dmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpX2R0LmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9kZW5hbGlfZHQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaV9kdC5j
CmluZGV4IDg1MTNiYjlmY2ZjYy4uOTE1MDQ3ZTNmYmMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9kZW5hbGlfZHQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGlf
ZHQuYwpAQCAtMjMzLDcgKzIzMyw3IEBAIHN0YXRpYyBpbnQgZGVuYWxpX2R0X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBk
ZW5hbGlfZHRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9p
ZCBkZW5hbGlfZHRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3Ry
dWN0IGRlbmFsaV9kdCAqZHQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIApAQCAtMjQz
LDEzICsyNDMsMTEgQEAgc3RhdGljIGludCBkZW5hbGlfZHRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGR0LT5jbGtfZWNjKTsKIAlj
bGtfZGlzYWJsZV91bnByZXBhcmUoZHQtPmNsa194KTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUo
ZHQtPmNsayk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2
ZXIgZGVuYWxpX2R0X2RyaXZlciA9IHsKIAkucHJvYmUJCT0gZGVuYWxpX2R0X3Byb2JlLAotCS5y
ZW1vdmUJCT0gZGVuYWxpX2R0X3JlbW92ZSwKKwkucmVtb3ZlX25ldwk9IGRlbmFsaV9kdF9yZW1v
dmUsCiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1lCT0gImRlbmFsaS1uYW5kLWR0IiwKIAkJLm9mX21h
dGNoX3RhYmxlCT0gZGVuYWxpX25hbmRfZHRfaWRzLAotLSAKMi4zOS4yCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
