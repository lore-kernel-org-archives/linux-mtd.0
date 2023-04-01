Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9F2C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bzUaQiEwSc8NXx0Q8VSuyuzYvCX8BTcWWsfqGEujGs=; b=0Tpn6xmGndgjAy
	dKTP3oP9/LSIcS3ZU4RoqDTJv6zc/ele9Dugww2a4q5NHVeU6wlw/APINfeb5wRi+VD4nfR+GRrMQ
	Hmq68htM0VJAUM+uYqSU5NkPJ/ECaqEjBNx/rmfHem2CKxd6AeMPN24maAY7RbIbPsSfLDkz3j3iA
	bnYgi16lFRWREoWCtkjxcOQb/3Ev7d7dK5bMdgcfNZMLfjmBuGExyHy9ZaBCmYh99z4AGRWgTsFXm
	jzsAPNde5wB88+O1DT1lJVZ7y7BsiKvbnquzOBoxEpcfdw4EDqions2I4YO1EeGpKNsklsq8yt/C7
	TmnO+233krQ/DIW/ltNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pif4k-00B2Pr-21;
	Sat, 01 Apr 2023 17:31:38 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxc-00AsHA-2f
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9g2XiRb2pnd7KmX0ldCm1r7c3ccrsCXtiEohe3dK6Ys=; b=YRAPq4/xQWzYu9S4W1GKMt17mJ
	mdMXX9V9gjyope9rYVlPnPTqKyR2RJJy0klRW4qhSIB9OWz1j+VEiq+M6JjSf7obCW1OO12jIwOym
	MTrk0Oa6DTTaUNOAd/x6zykCCMkG/AfOiClnpEbexx5ULfygKeQvPUuxw9h2rqKLxBRH8pqqR2FBD
	vcJ8BqxILJUei6Zqd4DMLccqgPc9YPgRTZ59g06bTVfyggpUF4E2PnQqRMkOcMSA9tLtUu5Fe66iB
	7qFMdN97nG6pkJTfP4PqXyK9PI7gWZIEEEE6eoewZ5kkLhKN7foCM7MumAUSUguUw4XfVECLnAo0E
	DFLG1AEw==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxW-008DKr-1e
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-0008NT-6E; Sat, 01 Apr 2023 18:19:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-008GRk-SJ; Sat, 01 Apr 2023 18:19:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-009kgr-5q; Sat, 01 Apr 2023 18:19:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 28/49] mtd: rawnand: mxc: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:17 +0200
Message-Id: <20230401161938.2503204-29-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1739; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=e4xzjXYDfJ+j8bymws7/MFBHTs5gYDu3T17rMOhPFqo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkuo7wKq/dC8HZ2p2Nnddl0rATHBKXP80foQ IxkORnbMzOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZLgAKCRCPgPtYfRL+ TvzgB/9yQjk4eMNBRoW9TxCvZOT09JOOHUCBaduZhz09ey/Lp+U068wjqWj1DqbIvk+QXniEJr6 V16jBFRutztO5vbYwAjCQMVF91uvGc7Ebp0sYqb8n++vAaQo6MBfLzNwpwzv175FJTI7d/O4+2f KCFEy8TaCv6U2FU2DqIeJvZMQmwGJoIuxAixXLMr7mvWDfHUIF4JxrxgL2UfjfMycjWaAEGJpQN 8gI4bwVs0mKYice+YrPzZ2gVLoyu7DATKqIWnUND20NnC9JZUMXI5cdj0djdsO+x8Kn0F+SqQnD OtNUlP8bw4To7G62sXyPF4t7vaTmEE3NudujJQ3H1C8XBLTL
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172006_933086_109288D5 
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9tdGQvbmFuZC9yYXcvbXhjX25hbmQuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L214Y19uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9teGNfbmFuZC5jCmlu
ZGV4IGY2Yzk2MzQxYjg5Ni4uNTZjMTA0NmNjMDczIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9teGNfbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L214Y19uYW5kLmMK
QEAgLTE4MzEsNyArMTgzMSw3IEBAIHN0YXRpYyBpbnQgbXhjbmRfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gZXJyOwogfQogCi1zdGF0aWMgaW50IG14Y25kX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgbXhjbmRfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IG14Y19uYW5kX2hv
c3QgKmhvc3QgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwID0gJmhvc3QtPm5hbmQ7CkBAIC0xODQyLDggKzE4NDIsNiBAQCBzdGF0aWMgaW50IG14
Y25kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCW5hbmRfY2xlYW51cChj
aGlwKTsKIAlpZiAoaG9zdC0+Y2xrX2FjdCkKIAkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhvc3Qt
PmNsayk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
bXhjbmRfZHJpdmVyID0gewpAQCAtMTg1Miw3ICsxODUwLDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgbXhjbmRfZHJpdmVyID0gewogCQkgICAub2ZfbWF0Y2hfdGFibGUgPSBteGNu
ZF9kdF9pZHMsCiAJfSwKIAkucHJvYmUgPSBteGNuZF9wcm9iZSwKLQkucmVtb3ZlID0gbXhjbmRf
cmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gbXhjbmRfcmVtb3ZlLAogfTsKIG1vZHVsZV9wbGF0Zm9y
bV9kcml2ZXIobXhjbmRfZHJpdmVyKTsKIAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
