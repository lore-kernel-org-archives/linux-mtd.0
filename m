Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81678C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V55PUlqUqFDcTBWkxAlkXNLDUtAp9X1ZpgUXlp/jhbM=; b=Vs6uUqy26WGVYy
	9nYT3GL7/iG8Awacuwn6LWSlsEsOFhmkCB4z3PiRVURzeXofH6eCINVy0KSQLjiXUZ2YRjSxGaAQw
	ZynmG86kaG/gF9X4EsPxW6A7eV8Wefjodx9RCPkJ3c+mDbiv+qO1uFFnfvlagy1clOiEBhQ+IGRS/
	wszyq5+GyHWGAbd0bbIajDCiLDKQMoP2NhUdSqY6Ixbw+czRQcwjVJzSN5+kyr0/JnRAahSHEopSb
	hR6rUvgVdaX4xhUsCwh2btf37eC6jEEo6nM89L2t2nxF18NH/Tpgrda2axWhSB/P81GyWuplmOo7l
	UwTqOQaMcGVWAIcr9Rig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWp-008h0s-BC; Fri, 03 Jun 2022 21:08:19 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWl-008gwC-DR
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWe-0003sM-0O; Fri, 03 Jun 2022 23:08:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWe-006Hqr-2a; Fri, 03 Jun 2022 23:08:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-00E1Ho-QK; Fri, 03 Jun 2022 23:08:05 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH 13/14] mtd: physmap: Don't skip cleanup after mtd_device_unregister() failed
Date: Fri,  3 Jun 2022 23:07:57 +0200
Message-Id: <20220603210758.148493-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630; i=uwe@kleine-koenig.org; h=from:subject; bh=8xLPeD/4VeNYVxtLUpQmd6aQLRajpnvzCbkr0Ce1q/Y=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfv/ID0Y2h4/Ri3Px01J5GzZmWfyv1D0OsttT3x k1jHpJKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp37wAKCRDB/BR4rcrsCWr3B/ 9OFJJJf84ac7yBLeDcAW6wi1LjTuklO5tFSF6b09EEdiHfN4KjKBtLLUCyyOFXrbhhcnsEh0Jf/0j4 ejsB1K1izIn/3TOOjWayyt8C2vnYBFbkYstNH2GkSmL9h4DAXPUZsXveRScYk/c9LqScnpQ9GTdmPm 4C/ldE+oR6zGAcsNG0GtaZMuI+0JIq+ORvsIj3toFRQZRhNedihbe/p5J5zmt/A0L8iTQJZdwbQ32S phpoFdLlnlCGXZl80Lk/VTM1GVvZgUT8CgNFzeboL+ZY+5Mf8RUm9yKBwWaPG8T4JZD65MEiHd7ADz abbUHTExc0eKG9tg9XFbhyDILLXG0v
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140815_488958_C95FD61F 
X-CRM114-Status: GOOD (  15.36  )
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

SWYgbXRkX2RldmljZV91bnJlZ2lzdGVyKCkgZmFpbHMgKHdoaWNoIGl0IGRvZXNuJ3Qgd2hlbiB1
c2VkIGNvcnJlY3RseSksCnRoZSByZXNvdXJjZXMgYm91bmQgYnkgdGhlIG5hbmQgY2hpcCBzaG91
bGQgYmUgZnJlZWQgYW55aG93IGFzIHJldHVybmluZwphbiBlcnJvciB2YWx1ZSBkb2Vzbid0IHBy
ZXZlbnQgdGhlIGRldmljZSBnZXR0aW5nIHVuYm91bmQuCgpJbnN0ZWFkIHVzZSBXQVJOX09OIG9u
IHRoZSByZXR1cm4gdmFsdWUgc2ltaWxhciB0byBob3cgb3RoZXIgZHJpdmVycyBkbwppdC4KClRo
aXMgaXMgYSBwcmVwYXJhdGlvbiBmb3IgbWFraW5nIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFja3Mg
cmV0dXJuIHZvaWQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbXRkL21hcHMvcGh5c21hcC1jb3Jl
LmMgfCA5ICsrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtY29yZS5jIGIv
ZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWNvcmUuYwppbmRleCA0ZjYzYjg0MzBjNzEuLmQ0MzNk
Zjg0YTM5NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWNvcmUuYworKysg
Yi9kcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtY29yZS5jCkBAIC02Niw3ICs2Niw3IEBAIHN0YXRp
YyBpbnQgcGh5c21hcF9mbGFzaF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQog
ewogCXN0cnVjdCBwaHlzbWFwX2ZsYXNoX2luZm8gKmluZm87CiAJc3RydWN0IHBoeXNtYXBfZmxh
c2hfZGF0YSAqcGh5c21hcF9kYXRhOwotCWludCBpLCBlcnIgPSAwOworCWludCBpOwogCiAJaW5m
byA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKGRldik7CiAJaWYgKCFpbmZvKSB7CkBAIC03NSw5ICs3
NSw3IEBAIHN0YXRpYyBpbnQgcGh5c21hcF9mbGFzaF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqZGV2KQogCX0KIAogCWlmIChpbmZvLT5jbXRkKSB7Ci0JCWVyciA9IG10ZF9kZXZpY2Vf
dW5yZWdpc3RlcihpbmZvLT5jbXRkKTsKLQkJaWYgKGVycikKLQkJCWdvdG8gb3V0OworCQlXQVJO
X09OKG10ZF9kZXZpY2VfdW5yZWdpc3RlcihpbmZvLT5jbXRkKSk7CiAKIAkJaWYgKGluZm8tPmNt
dGQgIT0gaW5mby0+bXRkc1swXSkKIAkJCW10ZF9jb25jYXRfZGVzdHJveShpbmZvLT5jbXRkKTsK
QEAgLTkyLDEwICs5MCw5IEBAIHN0YXRpYyBpbnQgcGh5c21hcF9mbGFzaF9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqZGV2KQogCWlmIChwaHlzbWFwX2RhdGEgJiYgcGh5c21hcF9kYXRh
LT5leGl0KQogCQlwaHlzbWFwX2RhdGEtPmV4aXQoZGV2KTsKIAotb3V0OgogCXBtX3J1bnRpbWVf
cHV0KCZkZXYtPmRldik7CiAJcG1fcnVudGltZV9kaXNhYmxlKCZkZXYtPmRldik7Ci0JcmV0dXJu
IGVycjsKKwlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHZvaWQgcGh5c21hcF9zZXRfdnBwKHN0cnVj
dCBtYXBfaW5mbyAqbWFwLCBpbnQgc3RhdGUpCi0tIAoyLjM2LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
