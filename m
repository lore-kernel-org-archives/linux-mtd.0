Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C971CE95A8E
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 21:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jq/NxGcDi00hMoz88nb5CdqczvkEdzEhti8fT/XAzgo=; b=ttDMWCg5QHGLRM
	7XPC2q5laR1p3ZrZcBejS5/xDSTuqWBTAOHBjdgUY43fQ+ByAD4JMQjg5wd9PAiaY4vSfa84Om2du
	l6ZdQ0gubagQa6/gplDldg6HeQ6bkbF01TRJ/Scg3DX97hJH0HYMgQHU3PJWBLVYbUQ99KCgh1+pL
	fw1TX0ZzpRc3FH/ujVZqpYdMxp6/aJxRE8xQPhQc8b9FSQxQ1EUxHwJ5YlMKhKXUPCCMlCrIJmaQG
	3Jj/3X8anLTRJfDJPAxJUNC6IOotC11ZBSY+nY9R0DttLWo1rA8yehh7JObX0m64Pmq4yhsenuWBG
	9DoS0qXgLx0BaMNwLAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpb7J-009KQQ-1b;
	Sun, 08 Oct 2023 21:15:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyV-009Dr8-1j
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyQ-0001fL-NE; Sun, 08 Oct 2023 22:01:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyQ-000F04-0o; Sun, 08 Oct 2023 22:01:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyP-00Bf12-Ns; Sun, 08 Oct 2023 22:01:57 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 16/20] mtd: maps: sa1100-flash: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:39 +0200
Message-Id: <20231008200143.196369-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uf6W0XKMxuxlUAp0ZDzQGVZV6bI0xycwJxENXjOhc5w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqXuEzeII/8FQ/7kEZ+B4MZap0THNGXqk77s JWPDIDrNuOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKlwAKCRCPgPtYfRL+ TkYnCACsAiLHJ7qRYLCJ1sfjrseaqxHK42Ayon4j1qmz7t4X9G1KLB/xErjLMAYND3kPH8cNfcZ f+AP6floPEWHX1RVMspGadlZSC9Pfo0OY8WVOp1GsyxRFTamaXaSJr4SOHzzG4iNzJMPyw7U9ii A/DClf35CKr/akeJZtjaqYf40DoYraU7AQ9VIQzImdrBd+U31cOJYddUY+dcRpzsKSZ6HE0Vz8t C8Hp1NyQTEQHYY18MB6g8FWCVKWK/X7V9VMpHIrulz9PEsiJT7g6QXd1rVa+kaqSJ8AMmpmssSo Q8DzEXnExdnzyi2QchBb3LmorZzYu9sb3tWhpgC10C23uZ8A
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130203_573625_FC7F6DA0 
X-CRM114-Status: GOOD (  15.52  )
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
ZXJzL210ZC9tYXBzL3NhMTEwMC1mbGFzaC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bWFwcy9zYTExMDAtZmxhc2guYyBiL2RyaXZlcnMvbXRkL21hcHMvc2ExMTAwLWZsYXNoLmMKaW5k
ZXggZDNkNGU5ODdjMTYzLi5kNGNlMjM3NmQzM2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL21h
cHMvc2ExMTAwLWZsYXNoLmMKKysrIGIvZHJpdmVycy9tdGQvbWFwcy9zYTExMDAtZmxhc2guYwpA
QCAtMjg1LDE5ICsyODUsMTcgQEAgc3RhdGljIGludCBzYTExMDBfbXRkX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIGVycjsKIH0KIAotc3RhdGljIGludCBzYTEx
MDBfbXRkX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQg
c2ExMTAwX210ZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1
Y3Qgc2FfaW5mbyAqaW5mbyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCXN0cnVjdCBm
bGFzaF9wbGF0Zm9ybV9kYXRhICpwbGF0ID0gZGV2X2dldF9wbGF0ZGF0YSgmcGRldi0+ZGV2KTsK
IAogCXNhMTEwMF9kZXN0cm95KGluZm8sIHBsYXQpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRp
YyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHNhMTEwMF9tdGRfZHJpdmVyID0gewogCS5wcm9iZQkJ
PSBzYTExMDBfbXRkX3Byb2JlLAotCS5yZW1vdmUJCT0gc2ExMTAwX210ZF9yZW1vdmUsCisJLnJl
bW92ZV9uZXcJPSBzYTExMDBfbXRkX3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJPSAi
c2ExMTAwLW10ZCIsCiAJfSwKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
