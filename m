Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD5CC76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8W6/DZlyOxTccZ2KnfFQW+4Vu15PcfZe8bAZRJ3G+zM=; b=yYpBGwsw+5/bkI
	7mp5XCakEILdr46YPyMP+8JLoF/4XHypRAuasKJmYqYRn0mtGDRuarzr7Y93R8Ee+EjDVX8rd/fGE
	0Mw3YkvnwmgyQBIB/bTzgG/hlsKQRNvJeoudJZm2AxOGvtzCG6cfL+lwIGrCceXOnXpWQ3xfEhNQo
	N1Efq5gOMaQZr3h09ODho2zDg49dUusKhRllzRfLyUNABdnR8TiJkWdtYFiSSVclTJNuR2RCK/8/J
	qbeufwFJcSn/0CSbBdkUqe8GlC9bqCEjp/SuasRVMn1fXjgDXS9YF9yLohB6zYDUO05VT2VtaNe5n
	m6uQxufkSeTVYucWS6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEP-00AwXh-0r;
	Sat, 01 Apr 2023 16:37:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEI-00AwRk-2D
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=301kFvtK4RtbC0nZ+yzzxf3wyF/k/mU8UZOl0iG7Pt8=; b=Oq/MYdHBBhToiBhv1/UrGxvu+v
	mggtr2hurbLTkTLpFxAqmKUMZPrIeA/l4bkRhDujDnQ5U/VmqUrmvobq26EOwWabNKJ1qftiGGGs/
	xCxl3NX6jHUM0aRfpLwviOjYWjndnfN6bUhhj9fFBDgMm5VQdWh87uhZBcPjj3vikbWYk04bAgZGH
	9UbbjeLj4dT6Ty0hVYINi8LSPTjhdUFni9Hi2RlpidyMJughOp2VtWTdWRde6RZuA3+TPCyZGUHZm
	iihWlhpUDbtekxKx7TuMipa3eHm0pc1QJsch39U8iozZBCwbKFayQ5TMzU4dUuwVoS8iif7AW/5On
	PuoTSCpQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxW-00CYSf-4g
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxP-0000ME-Hx; Sat, 01 Apr 2023 18:19:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxN-008GTN-Gb; Sat, 01 Apr 2023 18:19:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxM-009ki5-4s; Sat, 01 Apr 2023 18:19:56 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Agner <stefan@agner.ch>,
	Lucas Stach <dev@lynxeye.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 47/49] mtd: rawnand: tegra: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:36 +0200
Message-Id: <20230401161938.2503204-48-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ZiZFcm2VIBzpJkDbD8DIuKg1PQYv1Ul6eBh2oA6JjdA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlTMtlZDjKeoygTPmrf6hZi+i2/pICmViBsi CEyn2O89+WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZUwAKCRCPgPtYfRL+ TkNsB/9QNZahdyLisGkG6jy26g0n4gYeXOUuhi1ekybIlVCO75qsiXWDUGQW4WmM5mx7lcyXmTi zoODOr5CJP8UuKYOqC2T2jSOGFvN2dKtLdh4mhyHaZNdyksoGw0rUCIfI1JlmtSXNo5HaAsp3hx PXoO18Q6yocN0esmIkwUnIOZ0PPelpNRn5cGrZ8zfQtvHPdwjdXGenW4tXgwEedXsr7erMiVqfQ VmPufDSQ4DtguTF2kXXQkReGR3+tjsotqqaYPkZtbkQg6Ak3c6cKKSQeP4x9pKozNhW1VPvTLKL d2fiVOEnWXUb+Fk2HNrSzLjffkCV8HB7RDN7zkf/V9leigQm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172006_239123_5AEBEA74 
X-CRM114-Status: GOOD (  12.85  )
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
dmVycy9tdGQvbmFuZC9yYXcvdGVncmFfbmFuZC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvdGVncmFfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdGVncmFfbmFu
ZC5jCmluZGV4IGE5YjkwMzFjZTYxNi4uZWIwYjlkMTZlOGRhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdGVn
cmFfbmFuZC5jCkBAIC0xMjIwLDcgKzEyMjAsNyBAQCBzdGF0aWMgaW50IHRlZ3JhX25hbmRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gZXJyOwogfQogCi1zdGF0
aWMgaW50IHRlZ3JhX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitz
dGF0aWMgdm9pZCB0ZWdyYV9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogewogCXN0cnVjdCB0ZWdyYV9uYW5kX2NvbnRyb2xsZXIgKmN0cmwgPSBwbGF0Zm9ybV9nZXRf
ZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gY3RybC0+Y2hpcDsKQEAg
LTEyMzIsOCArMTIzMiw2IEBAIHN0YXRpYyBpbnQgdGVncmFfbmFuZF9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAogCXBtX3J1bnRpbWVfcHV0X3N5bmNfc3VzcGVuZChjdHJs
LT5kZXYpOwogCXBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZChjdHJsLT5kZXYpOwotCi0JcmV0dXJu
IDA7CiB9CiAKIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgdGVncmFfbmFuZF9ydW50aW1lX3Jl
c3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCkBAIC0xMjc3LDcgKzEyNzUsNyBAQCBzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciB0ZWdyYV9uYW5kX2RyaXZlciA9IHsKIAkJLnBtID0gJnRlZ3Jh
X25hbmRfcG0sCiAJfSwKIAkucHJvYmUgPSB0ZWdyYV9uYW5kX3Byb2JlLAotCS5yZW1vdmUgPSB0
ZWdyYV9uYW5kX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IHRlZ3JhX25hbmRfcmVtb3ZlLAogfTsK
IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIodGVncmFfbmFuZF9kcml2ZXIpOwogCi0tIAoyLjM5LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
