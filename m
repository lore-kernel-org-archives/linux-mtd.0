Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE8BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtRJOL7VjKl1Vqf1E3J8E1se2d8gBnKmmbM6drTOtp0=; b=KmcKSc6YV2B7te
	VrkGqUV77VBC35yUM+qRDtMC4BBNosz8nDklIEaU3/K0qwT8d/bdZunD4M5F2G/laxLrJZvBqdLWO
	ZL7ETfSalf2itOjQeecYJ0XUTqRzp+jTi60C3ZmKQ5zNMPb0VTERpWOTILJJjJyM2O5WQJvCCOV/q
	sKQRxZDLsFZcTL2ysHs+VXLBmjpTeSxt1ToAnxL+zOZtY9O0kHn4Q4/hwRxys+V3TlwHzepR8GLmp
	pDNO4CU77fbs8dtc5UkIZwmhjG0LEbzkOgJYAUrRk/vqoMdD8XGQelgMhyRvV8LpCLn0aPecr3BHr
	tldwCz5p6bgYExWsZeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyb5L-008GbT-Ux; Tue, 07 Jun 2022 15:25:35 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyb5B-008GXG-DC
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 15:25:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4y-0003Pj-Kg; Tue, 07 Jun 2022 17:25:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4v-0071Af-RT; Tue, 07 Jun 2022 17:25:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4t-00En7V-Sn; Tue, 07 Jun 2022 17:25:07 +0200
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
Subject: [PATCH 2/4] mtd: st_spi_fsm: Warn about failure to unregister mtd device
Date: Tue,  7 Jun 2022 17:24:56 +0200
Message-Id: <20220607152458.232847-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607152458.232847-1-u.kleine-koenig@pengutronix.de>
References: <20220607152458.232847-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; h=from:subject; bh=qwfZKIhKt9e/4PnDQraudxepOBL8WgC8rvs1jgkVggI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBin22+BgrkCZCUVx1MmEEbECzXK+gM3ZjtzayGW57V 3b9OyveJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYp9tvgAKCRDB/BR4rcrsCeQWB/ 423u9iQcSpb9xWkAEafKPktxRtnr2AXFcmDLkArOix6FM0djo4jicKkUgIPnHJWeHUqjky6TEWwZfa 6nqdHqg9ews5GEoixR/FfTxJXg1nNWGkgaR39uWdoNAPc3cuZbs0tkzOCwhbH9Ux24OLR/BzcgU/m/ TKsPoNAkIKs3xSZaR4Sog7lb4A0YU62cWq5wjSEpL5k0P1RT3BkziZEdhiazGnb7T2Aoi1jQd3n/qg wCg/jfIX93gIWDUTelBuaWyhLBq0ykBgB/Zd8RMwQYSI84caQS33dUOnie2+73n1wmv7bFbY9RduAp 5Y8bMoxl8yiULQTuvaYiNCEZJ2mQ0e
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_082525_566498_EA0FD378 
X-CRM114-Status: GOOD (  14.89  )
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

bXRkX2RldmljZV91bnJlZ2lzdGVyKCkgc2hvdWxkbid0IGZhaWwuIFdhaWwgbG91ZGx5IGlmIGl0
IGRvZXMgYW55aG93LgoKVGhpcyBtYXRjaGVzIGhvdyBvdGhlciBkcml2ZXJzIChlLmcuIG5hbmQv
cmF3L25hbmRzaW0uYykgdXNlCm10ZF9kZXZpY2VfdW5yZWdpc3RlcigpLgoKQnkgcmV0dXJuaW5n
IDAgaW4gdGhlIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayBhIGdlbmVyaWMgZXJyb3IgbWVzc2Fn
ZQpieSB0aGUgZGV2aWNlIGNvcmUgaXMgc3VwcHJlc3NlZCwgbm90aGluZyBlbHNlIGNoYW5nZXMu
CgpUaGlzIGlzIGEgcHJlcGFyYXRpb24gZm9yIG1ha2luZyBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2tzIHJldHVybiB2b2lkLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL210ZC9kZXZpY2VzL3N0X3Nw
aV9mc20uYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jIGIv
ZHJpdmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMKaW5kZXggNTJhNzk5Y2FlNDAyLi5hNWE0
YjYxMjQ4MGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCisr
KyBiL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCkBAIC0yMTMwLDcgKzIxMzAsOSBA
QCBzdGF0aWMgaW50IHN0ZnNtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGZzbS0+Y2xrKTsKIAotCXJldHVybiBtdGRfZGV2aWNl
X3VucmVnaXN0ZXIoJmZzbS0+bXRkKTsKKwlXQVJOX09OKG10ZF9kZXZpY2VfdW5yZWdpc3Rlcigm
ZnNtLT5tdGQpKTsKKworCXJldHVybiAwOwogfQogCiAjaWZkZWYgQ09ORklHX1BNX1NMRUVQCi0t
IAoyLjM2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
