Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D79CCA47C
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 15:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEItepRyFqHHEUVqFljCIm7qCCfWztZJ7iK7S1Jsa0k=; b=eH/ENORRc9Mrk0
	PrmI6hZ1sY59wmSvD3KKMwHr80Cit7fV5mhsk20aIEfBdNLoTWghSNxCxvWPEoX4EQemEHkJpa+Bc
	8UTCeLR8WnrB0On/wShH1XlSEf4BiF6LnpQZJivCSEqwaN2zMK2OLPjVGkvDp0EXx23zJ84Pym7OJ
	6SgJKotaYRLZDxAZBylNVP2jT5PZ8/IR40UyjM2+ddb3e3ft0vp4xQfx09/RJEm4Lzi3QEw4YEDu/
	O/PMhOj5FvOJG3YlwRRfgW9so6D6zg5JtGvY+iHqttio67t3Fla0O0qSl3yfQc8x/genyNW95s8ML
	QJUlnCfLSHJ7Pi8CLqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyb5K-008Gat-9Q; Tue, 07 Jun 2022 15:25:34 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyb5B-008GXL-DA
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 15:25:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4y-0003Pn-Kd; Tue, 07 Jun 2022 17:25:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4w-0071Ai-2p; Tue, 07 Jun 2022 17:25:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4u-00En7Y-2r; Tue, 07 Jun 2022 17:25:08 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arvind Yadav <arvind.yadav.cs@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 3/4] mtd: st_spi_fsm: Disable clock only after device was unregistered
Date: Tue,  7 Jun 2022 17:24:57 +0200
Message-Id: <20220607152458.232847-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607152458.232847-1-u.kleine-koenig@pengutronix.de>
References: <20220607152458.232847-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; h=from:subject; bh=logs5lz6EfDATRyWnzG5hsyI/yHecieo6BMzCnZSpDQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBin23DferXq/cyizZ7mVM5V+00cLkg0UeL3w0ytjOC jaZsmqqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYp9twwAKCRDB/BR4rcrsCcJaB/ 9ZsEo20PUBD/HoRZ5kXyun71GNM4hqZW350u9RIrQhaWZkTClvM1QrQ0zg4gLnNTO8EQ3mrq0HC7xE 96i/BEa7nq4kMrCyXGyAWB+tAWRtBsRnw1ejtuPfdTalHfTHA31KgZhPVt6yOvE+RQ9PcvzghVZ7nu nAeKMinMMTpb5RspL3k4MusB6HcTq4P7vnn9NX9tw/RlT2XS57dLoAp/Cbkcc3dvjgBRBWTDxgePTE 8dyOCbjtDcIVKa9b70WIo4pGz4SVwkaJkI62hgnVoVyCRI9CziIkyq+fEu4reYzx2sA8m7v/QvFk03 uINDjGLARzQmTtgp/bM9coQUS5AnjW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_082525_567953_69B02491 
X-CRM114-Status: GOOD (  14.29  )
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

VW50aWwgbXRkX2RldmljZV91bnJlZ2lzdGVyKCkgcmV0dXJucyB0aGUgZGV2aWNlIGlzIGV4cGVj
dGVkIHRvIGJlCm9wZXJhdGlvbmFsLiBTbyBvbmx5IGRpc2FibGUgdGhlIGNsb2NrIGFmdGVyIHRo
ZSBtdGQgaXMgdW5yZWdpc3RlcmVkLgoKRml4ZXM6IDFmZWZjOGVjYjgzNCAoIm10ZDogc3Rfc3Bp
X2ZzbTogYWRkIG1pc3NpbmcgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgaW4gc3Rmc21fcmVtb3Zl
KCkiKQpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jIGIvZHJpdmVycy9tdGQv
ZGV2aWNlcy9zdF9zcGlfZnNtLmMKaW5kZXggYTVhNGI2MTI0ODBjLi45ZjZkNGRkOGJhZGUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCisrKyBiL2RyaXZlcnMv
bXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCkBAIC0yMTI4LDEwICsyMTI4LDEwIEBAIHN0YXRpYyBp
bnQgc3Rmc21fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0
IHN0ZnNtICpmc20gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAotCWNsa19kaXNhYmxl
X3VucHJlcGFyZShmc20tPmNsayk7Ci0KIAlXQVJOX09OKG10ZF9kZXZpY2VfdW5yZWdpc3Rlcigm
ZnNtLT5tdGQpKTsKIAorCWNsa19kaXNhYmxlX3VucHJlcGFyZShmc20tPmNsayk7CisKIAlyZXR1
cm4gMDsKIH0KIAotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
