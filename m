Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D5BC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXYiBWjJLLOKp42RauBRLeMTOqYvNF+66P2md/jW0ws=; b=tcX9631sQqOcsm
	V46F5g+eed+7sk2dwQYsm9lIU+MqVKy3WhX3YEfq1+Bn6TnTjxlE6ijnBv+lsyEh+rH+RG/DWIOBz
	pZgQ0GHKzJw3hCbJDYiPgLzvtwk6AmBGHJ5CneGXy15bsTBrpd0cEoJhH3ryksfpMHI0Amsfxzar4
	IleQKnsjx9lJIR9DmcMhn2OaNlR4xcqSNYuEsJpT2VFpPv5qvHbQcR2XupRRUwy9VjxxksBuO7mzr
	/3g0WAFYDCVaIgG3wwXKUY7WnQpM4Xni9pJ/ay2yYg0BJe1LkoDtQ5Lz/xJF3Z3+gTPGor/Iap645
	muaWvbYG2A+wk2fldaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEY0-008hsy-Iy; Fri, 03 Jun 2022 21:09:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWr-008h1k-QD
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWf-0003qn-EN; Fri, 03 Jun 2022 23:08:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-006Hps-RF; Fri, 03 Jun 2022 23:08:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWZ-00E1HB-In; Fri, 03 Jun 2022 23:08:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Joel Stanley <joel@jms.id.au>
Cc: kernel@pengutronix.de,
	Michael Walle <michael@walle.cc>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH 02/14] mtd: spi-nor: aspeed-smc: Make aspeed_smc_unregister() return void
Date: Fri,  3 Jun 2022 23:07:46 +0200
Message-Id: <20220603210758.148493-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1403; i=uwe@kleine-koenig.org; h=from:subject; bh=eWtWx/epQpLlsoTlHHCWvKtyg2OjpSVS7ZvDdS6QM84=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfLxu7k0eweeB8bzbAH+71WvKfW1QPZQ8Z1ONZ2 fKNE8veJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp3ywAKCRDB/BR4rcrsCRl5CA CR6wsaStLWrD1HN5wBjAgJ4orKtfVKq/JMqleHRmO5CwekrODLEi7LLqyUuDLTXqc/pfwOu6mp4a0H 2z4hW0+UDSiJsQFrasKIBTfS6ObBt4Pm6vcUnwyMsTJJ0qDmBazUzsO1k2eSEpoDv1L7Qpp7TbCKqx kNL97YVzqcoJyDJcSzUH72DEPcL6huEQyLW8tepFf0AzAc/VgFrvwj9oKczL9QeCvN84LCkQYO/PjF Pk4UZJKlttaHaCgjUPTC286I7DTmyFNrT/E08O/Z77L9t8orRkRkOEZ13veOxp9Uwcz77Wnj0y5aWQ UcZ9qUZT8TIsYoxgyOUeVWolF5F1Y9
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140821_888574_A545626E 
X-CRM114-Status: GOOD (  13.72  )
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

VGhlIGZ1bmN0aW9uIHJldHVybnMgemVybyB1bmNvbmRpdGlvbmFsbHksIHNvIHNpbXBsaWZ5IHRv
IG1ha2UgaXQKb2J2aW91cyB0aGVyZSBpcyBubyBlcnJvciB0byBoYW5kbGUgaW4gdGhlIGNhbGxl
cnMuCgpUaGlzIGlzIGEgcHJlcGFyYXRpb24gZm9yIG1ha2luZyBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2tzIHJldHVybiB2b2lkLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL210ZC9zcGktbm9yL2Nv
bnRyb2xsZXJzL2FzcGVlZC1zbWMuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3Bp
LW5vci9jb250cm9sbGVycy9hc3BlZWQtc21jLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRy
b2xsZXJzL2FzcGVlZC1zbWMuYwppbmRleCBhY2ZlMDEwZjlkZDcuLmJkMTQ5MTA0NTMzYSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9hc3BlZWQtc21jLmMKKysr
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9hc3BlZWQtc21jLmMKQEAgLTM5OSw3
ICszOTksNyBAQCBzdGF0aWMgc3NpemVfdCBhc3BlZWRfc21jX3dyaXRlX3VzZXIoc3RydWN0IHNw
aV9ub3IgKm5vciwgbG9mZl90IHRvLAogCXJldHVybiBsZW47CiB9CiAKLXN0YXRpYyBpbnQgYXNw
ZWVkX3NtY191bnJlZ2lzdGVyKHN0cnVjdCBhc3BlZWRfc21jX2NvbnRyb2xsZXIgKmNvbnRyb2xs
ZXIpCitzdGF0aWMgdm9pZCBhc3BlZWRfc21jX3VucmVnaXN0ZXIoc3RydWN0IGFzcGVlZF9zbWNf
Y29udHJvbGxlciAqY29udHJvbGxlcikKIHsKIAlzdHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlw
OwogCWludCBuOwpAQCAtNDA5LDEzICs0MDksMTMgQEAgc3RhdGljIGludCBhc3BlZWRfc21jX3Vu
cmVnaXN0ZXIoc3RydWN0IGFzcGVlZF9zbWNfY29udHJvbGxlciAqY29udHJvbGxlcikKIAkJaWYg
KGNoaXApCiAJCQltdGRfZGV2aWNlX3VucmVnaXN0ZXIoJmNoaXAtPm5vci5tdGQpOwogCX0KLQot
CXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IGFzcGVlZF9zbWNfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKmRldikKIHsKLQlyZXR1cm4gYXNwZWVkX3NtY191bnJlZ2lzdGVyKHBsYXRm
b3JtX2dldF9kcnZkYXRhKGRldikpOworCWFzcGVlZF9zbWNfdW5yZWdpc3RlcihwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YShkZXYpKTsKKworCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBhc3BlZWRfc21jX21hdGNoZXNbXSA9IHsKLS0gCjIuMzYuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
