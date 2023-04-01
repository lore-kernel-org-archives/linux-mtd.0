Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150A7C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzHKsXZUnY8WG5EOKjQUq6I6JJB8GQ3D4wa2DdE2Kbg=; b=xiyVVTuru08jQx
	XNux8dd7n/sEAt7a94GzzgqnT0GOwq4s82xHvWtZD5uggl2I/6CYtIa56zSOc+ek7X2fd0ygNvjno
	J0Vaz07VBZMcrpiuhlb3gQxhpBus+UToNrOZsfhIEA/uUL3UoiwWimmciEQm9FGPlsUCU2LzPrptZ
	VtLiQT7Wmhxva1IhaxcBYLfSTYtyl3kcBD2VsCVM9gsjbSM+ObPkFwBxmmreh02+66pCixmBw25fh
	Z32PaULX3hMYlS9tmU0pmrMal35y0qXI9LdkifTQRYAycowWepmnEd7j8ELrnz/B5ALW7aLk8ECD8
	v2FS26ko4PojDr3EdLfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pif4m-00B2Q9-0y;
	Sat, 01 Apr 2023 17:31:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As99-0W
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxF-00089K-1A; Sat, 01 Apr 2023 18:19:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-008GPy-9P; Sat, 01 Apr 2023 18:19:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxD-009kfR-F2; Sat, 01 Apr 2023 18:19:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 06/49] mtd: rawnand: arasan: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:18:55 +0200
Message-Id: <20230401161938.2503204-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=oFuwbdTVb4BgAJh+EvdenrEifG3QnzKeYSjGpFh33Oc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFj2nSgc8VmElB9f3Mfe+ZvrlhTGu8E/qSXiP sqIBt9S1ZmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY9gAKCRCPgPtYfRL+ ThE0B/9yV19FMlLoe/0T1ggBeIJqX8G6u2PZZUhS+JRVrSEsiZtNWqSz5aXrDXkqn1vdTa3VDX5 9nezj0uv27gL9feXPTnWSEq3iSeo700a2R1VwIb0mDumWBHf0JREwBCXblSsBoNUzGHC3b4CfqR 1nXyajF5+FkCnjJy8wAnknHEwiRgSGrAYjjd1Cdfa8JWcg9IgHXFb5C7jpguNR5Gr7v/5s850kj e7Go6nk8xhKLt1eXC08ffKVrXuC3JZJaIeIgSDDUbgdr0B3m9GDjeMEO8KW22LzvSVoa8+rgobz +h07WbwH6ikFpS5SYhfKUqWdXiT8mDEJMuCGQXO/88UgBrWs
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_413287_1593686E 
X-CRM114-Status: GOOD (  15.81  )
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
dmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIHwgNiArKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jCmluZGV4IGVjN2U2ZWVhYzU1
Zi4uZDUxM2QyZGIzNTQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4t
bmFuZC1jb250cm9sbGVyLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQt
Y29udHJvbGxlci5jCkBAIC0xNDk2LDcgKzE0OTYsNyBAQCBzdGF0aWMgaW50IGFuZmNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMg
aW50IGFuZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9p
ZCBhbmZjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBh
cmFzYW5fbmZjICpuZmMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIApAQCAtMTUwNCw4
ICsxNTA0LDYgQEAgc3RhdGljIGludCBhbmZjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG5mYy0+YnVzX2Nsayk7CiAJY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKG5mYy0+Y29udHJvbGxlcl9jbGspOwotCi0JcmV0dXJuIDA7CiB9CiAK
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFuZmNfaWRzW10gPSB7CkBAIC0xNTI1
LDcgKzE1MjMsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhbmZjX2RyaXZlciA9
IHsKIAkJLm9mX21hdGNoX3RhYmxlID0gYW5mY19pZHMsCiAJfSwKIAkucHJvYmUgPSBhbmZjX3By
b2JlLAotCS5yZW1vdmUgPSBhbmZjX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IGFuZmNfcmVtb3Zl
LAogfTsKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoYW5mY19kcml2ZXIpOwogCi0tIAoyLjM5LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
