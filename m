Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B404C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seXNMmH3WPfGOPzca0K8KhPoYfHPvk959C8S5paCbhQ=; b=ZSFYa/b55lwqBp
	hws4LCDNSh2NuVgiAjRhSJR1sciZzgG+NjF2n6C1llZ6HiPD7BFBatU7QSQ/3wsblSpAdRoR9pizC
	6kw4KLRQZ1gU8QbUW7VhV0bkpRFeY5rDL2tISvo2MtsnBbrheNRLuG4dkciAQA3+GLiY/TJh0Kw+c
	4gQAfyWTca/Ao8PDfePM36IubmdWeOZItlXefAkomM+X3mUIGWudeYiI3j60U6NYQ+yh8zRgx3xN5
	+D2bpxpBJFyGTzfME+xagfa/eHFUX1L5jYYi6UNAT284eSFjzn51bf8UeG9UEneOy/8VT6P/7Y/G0
	WsoS3ADPMat3oYSk7yLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidyC-00AsXY-0S;
	Sat, 01 Apr 2023 16:20:48 +0000
Received: from metis.ext.pengutronix.de ([85.220.165.71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As9n-0T
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxJ-0008My-PK; Sat, 01 Apr 2023 18:19:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-008GRV-H6; Sat, 01 Apr 2023 18:19:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-009kgk-N2; Sat, 01 Apr 2023 18:19:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Phil Edworthy <phil.edworthy@renesas.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 26/49] mtd: rawnand: mpc5121_nfc: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:15 +0200
Message-Id: <20230401161938.2503204-27-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HHKBs+ztWbaNRbFQg/27JaTmEYNnysEvMJ9/PAQExiQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkmFXTn26zDrLiPe+3+6NktgHh9H2lKUtR+B roDK/oGw9SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZJgAKCRCPgPtYfRL+ TrA+CAC5dAbqyTuQccLXX2vjaKYRQWFG3gDV79iIGx8gGKPW/AnhRxA3dAlHX3l6JCrUttMB5E7 qxbwE/lN03yQlHswDTic2gtrztelwxhxVBQhi24XNhNi/Dj+B6YEduEA2938ulWIBzdOveIiFH4 /K17o2u6doGzio6YdY5OULlwW1yT6tFdrUfVMhQpw+mWIzyVLn34nWpCPIYjkZoA23sG/KHowBB TKnr0k0/qRmoyZ+xCiDKuWUZRVxzhDmWprHVo9Uv0URLVUWfCsinIrHBNefTl2Bv5Lx9dD0fBid WgziUmjj0hgIElkBu2xs6+yU470as+kNvEYethb99UybJcrT
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_226465_9896044D 
X-CRM114-Status: GOOD (  16.73  )
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
dmVycy9tdGQvbmFuZC9yYXcvbXBjNTEyMV9uZmMuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L21wYzUxMjFfbmZjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tcGM1MTIx
X25mYy5jCmluZGV4IGY2ODM0OWNiNzgyNC4uYWIwNWVlNjU3MDJjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tcGM1MTIxX25mYy5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L21wYzUxMjFfbmZjLmMKQEAgLTgyMiw3ICs4MjIsNyBAQCBzdGF0aWMgaW50IG1wYzUxMjFfbmZj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9wKQogCXJldHVybiByZXR2YWw7CiB9CiAK
LXN0YXRpYyBpbnQgbXBjNTEyMV9uZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9w
KQorc3RhdGljIHZvaWQgbXBjNTEyMV9uZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
Km9wKQogewogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZvcC0+ZGV2OwogCXN0cnVjdCBtdGRfaW5m
byAqbXRkID0gZGV2X2dldF9kcnZkYXRhKGRldik7CkBAIC04MzIsOCArODMyLDYgQEAgc3RhdGlj
IGludCBtcGM1MTIxX25mY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3ApCiAJV0FS
Tl9PTihyZXQpOwogCW5hbmRfY2xlYW51cChtdGRfdG9fbmFuZChtdGQpKTsKIAltcGM1MTIxX25m
Y19mcmVlKGRldiwgbXRkKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBtcGM1MTIxX25mY19tYXRjaFtdID0gewpAQCAtODQ0LDcgKzg0Miw3IEBA
IE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1wYzUxMjFfbmZjX21hdGNoKTsKIAogc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXBjNTEyMV9uZmNfZHJpdmVyID0gewogCS5wcm9iZQkJPSBt
cGM1MTIxX25mY19wcm9iZSwKLQkucmVtb3ZlCQk9IG1wYzUxMjFfbmZjX3JlbW92ZSwKKwkucmVt
b3ZlX25ldwk9IG1wYzUxMjFfbmZjX3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUgPSBE
UlZfTkFNRSwKIAkJLm9mX21hdGNoX3RhYmxlID0gbXBjNTEyMV9uZmNfbWF0Y2gsCi0tIAoyLjM5
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
