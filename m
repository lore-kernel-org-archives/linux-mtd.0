Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB73C761AF
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKnI2NX/SxHx3ywXKcmJAqofbzu4VYbG2aGZRwx16uo=; b=ryD6x7zwIBSNwa
	bnCSb3LuH07qR0UfZjgmANmmLwrmr8KwuHKl2omRO4A0nISriNcl4UxbimnoKe1i0Yx6AMvWEDcEn
	MEQoknD+TjiVjKEKedanQbRFC/4rElf4MfCc4cJeriqvj3AGqeT5jEMAzHxub0a65jZi6cV2l14UE
	B1PhRXaxdc4MjPTyPHVADhRM3BzIIOiZMIRJu6ME/rJDl+cKrfnWvB21GhBlZcqvLureqIwGA1GAq
	QEq2avTGOG+4E30IHFJ394K+xZe2Zq5r8wwobHzsk5GyyanwsE2VHSdrz5EzgieqWnAFCl57eVpyG
	W5LTn1MMTjzoAaZus96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxi-00AsKS-0b;
	Sat, 01 Apr 2023 16:20:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As8s-01
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxF-00089h-E8; Sat, 01 Apr 2023 18:19:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-008GQ6-Q9; Sat, 01 Apr 2023 18:19:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxD-009kfZ-SJ; Sat, 01 Apr 2023 18:19:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 08/49] mtd: rawnand: au1550nd: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:18:57 +0200
Message-Id: <20230401161938.2503204-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1774; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zR4KJcDy8DkDRPFs1TFovFy1Y4Ig2wiD2/77Dyp2h2U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFj50iV5z22Ij3VWT5Jk2bjBtZQYADW+rSmBB po/dg74IwOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY+QAKCRCPgPtYfRL+ TnzyCACnrlfh5M2+y32Bxp4PUl4qUj/6G/it024Td4JAHKb/m4yuC3V0tHnQU4rfxhmGjDk/qWm YhufUjagstjKhCLhS1OErPHn0qvFKZd5m05aF2cIdfc7KI2581ulQ0O4ELAXSeuHk7QcjwzVGQX kfoGAkwxod6ZLLtZuB5QaRpWsDpQ7ao9vD4ZNG7zdJ3Y5rIVATwtIDROVnrQoAITtrnrIge98Yt OK3pt2QL0I6TzoQohv3gM0F7+NrPQgp71UWX+CRI+GL57k/L4KSpf6f/K1E8IOI/R5lQrKrE/jU FygcYIBTVqqsRfF7JmEvygfwHIJFQzPt2eiRM5w0VVXqj2xZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_062644_EBB23E09 
X-CRM114-Status: GOOD (  16.59  )
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
dmVycy9tdGQvbmFuZC9yYXcvYXUxNTUwbmQuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYXUxNTUwbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F1MTU1MG5kLmMKaW5k
ZXggNWFhM2EwNmQ3NDBjLi4wNjNhNWUwYjhkNGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2F1MTU1MG5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXUxNTUwbmQuYwpA
QCAtMzM3LDcgKzMzNyw3IEBAIHN0YXRpYyBpbnQgYXUxNTUwbmRfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IGF1MTU1MG5k
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgYXUxNTUw
bmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGF1MTU1
MG5kX2N0eCAqY3R4ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAJc3RydWN0IHJlc291
cmNlICpyID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsK
QEAgLTM1MCw3ICszNTAsNiBAQCBzdGF0aWMgaW50IGF1MTU1MG5kX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCWlvdW5tYXAoY3R4LT5iYXNlKTsKIAlyZWxlYXNlX21lbV9y
ZWdpb24oci0+c3RhcnQsIDB4MTAwMCk7CiAJa2ZyZWUoY3R4KTsKLQlyZXR1cm4gMDsKIH0KIAog
c3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgYXUxNTUwbmRfZHJpdmVyID0gewpAQCAtMzU4
LDcgKzM1Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGF1MTU1MG5kX2RyaXZl
ciA9IHsKIAkJLm5hbWUJPSAiYXUxNTUwLW5hbmQiLAogCX0sCiAJLnByb2JlCQk9IGF1MTU1MG5k
X3Byb2JlLAotCS5yZW1vdmUJCT0gYXUxNTUwbmRfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gYXUx
NTUwbmRfcmVtb3ZlLAogfTsKIAogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihhdTE1NTBuZF9kcml2
ZXIpOwotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
