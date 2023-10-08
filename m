Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFF0E95A94
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBv6C73i54TMU8A4hnG1g/ATrjOSPf2nebtOdDVI33w=; b=XAtVfU5FaKliOL
	yrYnHr5k8+XbMRugn6P+kxqmG9oXMUR768ppP7sBak3iSkmPXzTEdiwCtWG7dQVCnnwa7fjq9ZRiR
	/V31L3sAceXlmubUs4p7mJ4zZwV1AZFti2+evahZKR0OmSrCcdMI1wd/p01R2AyDvJ+RNpXNfyo3c
	+oIEsrnuxHnEd5TjUCRBiUMDykc6pMxiZ0yIIZxBui1yaSq+R07W7hfPoway4PJpM/fFExXGUqm/+
	7PoNIeB9Xp8Dwr4R1FTaezLKH1+NUbbRl2XQ1ZswZqtzfdja08TGxeAN/s/U/TBIhjYQvGwWrxtpm
	zAIe9YiB4lEylXY5LRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyh-009Dzn-1x;
	Sun, 08 Oct 2023 20:02:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyW-009DrD-1j
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyR-0001i5-Ar; Sun, 08 Oct 2023 22:01:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyQ-000F0C-KT; Sun, 08 Oct 2023 22:01:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyQ-00Bf1A-BJ; Sun, 08 Oct 2023 22:01:58 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 18/20] mtd: rawnand: txx9ndfmc: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:41 +0200
Message-Id: <20231008200143.196369-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3YydtaRiKRjnB5+u2dYxhI3rACGp6Jp3hUAaOKD2+TA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqbKrMFG1XMpWFGArZ5DC4FWM2T+w1KoiMH2 UQMMNu/zYiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKmwAKCRCPgPtYfRL+ TmleB/9GoikonMpQzsoue8bY4zkTR2DUMlhr7WgB8GKcA85K6GphUNcrIlGGGAa20Q6D5b72jHH mYzmo0MOL4QlTOGVXNkFOq+9FD0O0w/M115Lew9kxbkU6ZQotm8P1MdKdq+ryK8JUYoQtvfdH5M GX8M+OotZJCDjKn6ywUPdp344uQRGq6E6aXnbKtDh6/Ng8dYersSJC9yq26LATDQNn+JhFrW+yI opOdqMQ0rE9fP24vJ9J0uTOu6PZXyc3SkH/uIN02rz84g1Nibb2CTlFrPhEUq5nF7rM7j5bFdN+ q2ss4BUPeD6LcIhtx/Y3jnHDNsN84k5WTE+jSqo3jtNqb3K1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130204_573246_3A63A3A6 
X-CRM114-Status: GOOD (  15.82  )
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
ZXJzL210ZC9uYW5kL3Jhdy90eHg5bmRmbWMuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvdHh4OW5kZm1jLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy90eHg5bmRmbWMuYwpp
bmRleCA4M2RkMDkyZDIyZWUuLmU1YTk0ZDUxYzUzNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvdHh4OW5kZm1jLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5kZm1j
LmMKQEAgLTM2OSw3ICszNjksNyBAQCBzdGF0aWMgaW50IF9faW5pdCB0eHg5bmRmbWNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50
IF9fZXhpdCB0eHg5bmRmbWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKK3N0
YXRpYyB2b2lkIF9fZXhpdCB0eHg5bmRmbWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KmRldikKIHsKIAlzdHJ1Y3QgdHh4OW5kZm1jX2RydmRhdGEgKmRydmRhdGEgPSBwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YShkZXYpOwogCWludCByZXQsIGk7CkBAIC0zOTAsNyArMzkwLDYgQEAgc3RhdGlj
IGludCBfX2V4aXQgdHh4OW5kZm1jX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYp
CiAJCWtmcmVlKHR4eDlfcHJpdi0+bXRkbmFtZSk7CiAJCWtmcmVlKHR4eDlfcHJpdik7CiAJfQot
CXJldHVybiAwOwogfQogCiAjaWZkZWYgQ09ORklHX1BNCkBAIC00MTEsNyArNDEwLDcgQEAgc3Rh
dGljIGludCB0eHg5bmRmbWNfcmVzdW1lKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKICAq
IHRyaWdnZXJpbmcgYSBzZWN0aW9uIG1pc21hdGNoIHdhcm5pbmcuCiAgKi8KIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIHR4eDluZGZtY19kcml2ZXIgX19yZWZkYXRhID0gewotCS5yZW1v
dmUJCT0gX19leGl0X3AodHh4OW5kZm1jX3JlbW92ZSksCisJLnJlbW92ZV9uZXcJPSBfX2V4aXRf
cCh0eHg5bmRmbWNfcmVtb3ZlKSwKIAkucmVzdW1lCQk9IHR4eDluZGZtY19yZXN1bWUsCiAJLmRy
aXZlcgkJPSB7CiAJCS5uYW1lCT0gInR4eDluZGZtYyIsCi0tIAoyLjQwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
