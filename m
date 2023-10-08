Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3D2E95A9C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyzABIvktEpt2uLJ9oNlImXBzRZoE3QqpNrpwRr0wC8=; b=gtqhApa2hZ0wrI
	p294l0lXYKBd7Af/uTQ9CwhEEIh/DDSwWrm0PwlhO79yDNrLjtOXMTPzCSiizVnJn5fiN7FdLPxAj
	YPyWfFXPjBeQuYMcnmRU67SDUdjuHuomk4Ald3CLGILL8cMOPaljmEcp9t7nkR+IFWiCpnIICXQNs
	0CO2MyKsjhiwOPop0udwhT7QrZUmHEWujzMa7MtbEVjx8Qo4J19+RtTxtcg45lU6a0x8ImMaJLbZK
	z8qGV3a+qPDTFBfSwdeltSLltUlEo4uVXY9RN7ErZaIlHOxQQ/SPwH7UNs26hAxgc4wemacriXrMR
	4Rtomj3uyGDp1k8dS5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyo-009E6S-0D;
	Sun, 08 Oct 2023 20:02:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyf-009Dxk-0G
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyS-0001Vm-8f; Sun, 08 Oct 2023 22:02:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyN-000EzX-DD; Sun, 08 Oct 2023 22:01:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyN-00Bf0N-3r; Sun, 08 Oct 2023 22:01:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	Rob Herring <robh@kernel.org>,
	Li Zetao <lizetao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 07/20] mtd: spear_smi: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:30 +0200
Message-Id: <20231008200143.196369-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=sveKBkh01zR5KS97XnbSKPbBTsl/YD+UUG7a3fG4VZU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqF1bDojy9D+tsMwch1v0IT0itH1TNLhkKIe TI1IMoYyx6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKhQAKCRCPgPtYfRL+ Tk1cCACY2uIaqRhvQdL84VCayD/lUDkMOvnNyj+Ua883bHxB8AN0LKaqs4fZwYtjPPC+dfV/YKY HX5CxMX6/XDputU1d9RUT1E52vCt/3PZ2/xPi3zEGxMwJK+nFi4FJZFW9TeS8WsVhz5XbuagbGH fMn3ZjP631QPiklHvjyUFDCDM5xDLnrfo/wfhF1DKCmi/uKu6MXlKLjMJV8ekUe6fEWvgY4AvJx 2I/I0raEGMGzYc1sTMtOPYbEJS9BRZdJoBrjJf9Q3mBDj+qx7ESj8oIoVJV3dvpu5wBCT25xKub Z0FV9+erZkV6G7Mz+Oo7orGF0zitlOJhJM65oojeRdU8Lyrd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130213_118483_987DFB70 
X-CRM114-Status: GOOD (  15.77  )
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL210ZC9kZXZpY2VzL3NwZWFyX3NtaS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
ZGV2aWNlcy9zcGVhcl9zbWkuYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvc3BlYXJfc21pLmMKaW5k
ZXggMGEzNWU1MjM2YWU1Li4xNTc0Mjk2ZDQ3ZTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2Rl
dmljZXMvc3BlYXJfc21pLmMKKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9zcGVhcl9zbWkuYwpA
QCAtMTAzMSw3ICsxMDMxLDcgQEAgc3RhdGljIGludCBzcGVhcl9zbWlfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKICAqCiAgKiBmcmVlIGFsbCBhbGxvY2F0aW9ucyBhbmQgZGVs
ZXRlIHRoZSBwYXJ0aXRpb25zLgogICovCi1zdGF0aWMgaW50IHNwZWFyX3NtaV9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHNwZWFyX3NtaV9yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3BlYXJfc21pICpkZXY7
CiAJc3RydWN0IHNwZWFyX3Nub3JfZmxhc2ggKmZsYXNoOwpAQCAtMTA0OCw4ICsxMDQ4LDYgQEAg
c3RhdGljIGludCBzcGVhcl9zbWlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJCS8qIGNsZWFuIHVwIG10ZCBzdHVmZiAqLwogCQlXQVJOX09OKG10ZF9kZXZpY2VfdW5yZWdp
c3RlcigmZmxhc2gtPm10ZCkpOwogCX0KLQotCXJldHVybiAwOwogfQogCiAjaWZkZWYgQ09ORklH
X1BNX1NMRUVQCkBAIC0xMDk1LDcgKzEwOTMsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBzcGVhcl9zbWlfZHJpdmVyID0gewogCQkucG0gPSAmc3BlYXJfc21pX3BtX29wcywKIAl9
LAogCS5wcm9iZSA9IHNwZWFyX3NtaV9wcm9iZSwKLQkucmVtb3ZlID0gc3BlYXJfc21pX3JlbW92
ZSwKKwkucmVtb3ZlX25ldyA9IHNwZWFyX3NtaV9yZW1vdmUsCiB9OwogbW9kdWxlX3BsYXRmb3Jt
X2RyaXZlcihzcGVhcl9zbWlfZHJpdmVyKTsKIAotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
