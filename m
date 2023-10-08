Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9388E95A67
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXsdmQtx3gJ6U8FW6C1LVd79g+rRrAWgN9birLZpqzw=; b=Rbl6yktk6wimgT
	yQJNB+IY0NLC6MCmnzvvaqofzkQyRX7Ot3F4BzTONWvjk1uxoHunr6vvOyrZlSA3g5JzA1/uTa8Uj
	4EMfwdRHBsjZjj/SHpjs8inv9L7G4LTrjJKy7geGb7C1hbJfx9X2HMRTCqUs5GSkuiF2L40HwikWN
	66Jv5n6O1DGHPZysan8seEhz/GZQIfJ59M5C/siN93/dZLfJOHUwD7xVxsGYbKL3rOqTcii+CBtlm
	ra424WO2Gqw3cj30oEnaxbn7taSwehnUhBKSasO4EImdyE7kM+CJ+q0WTrYE3RjOWQevTjjUfkH7Z
	2b6/SP3646ExgteGLrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpa0i-009FKW-0K;
	Sun, 08 Oct 2023 20:04:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpa0f-009FIL-3D
	for linux-mtd@bombadil.infradead.org;
	Sun, 08 Oct 2023 20:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tInNTwkmCNZzTXyG2xXUMew114Q6PUbFCMj23xKjqV8=; b=oOM5Ygs+Y0iwGMLpuiMcj8APu4
	2QM7aojlQ4cQ8f4vxmfpj+htcqtSU3bOu5HL3XKtoBtVyKP2Dk+AZvypipnyt1QZuYAv7Lo/Dm25u
	kVLSC9qosWkKXEj3JWOqiePJeTVUz5nhuhGZFlXiq7RR2zAwgXgVKwEUTU4rfHBh4egsUBtKPsqlb
	eSwKop30pyg7LkkbKOO4aJCBUyZbYhi1JMGB34yNdGjBqWj5Lsvm0aXpcK6kk4MvjH3KTIVxQnOLv
	lTTC/8RFutitnbyCEdHKAwvsCfLIkX+AHkrSLrMrrk2NOYKlXWPLU1vebdN7lvJPh3dkL/qypC9tu
	4CIMcU0Q==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyc-00ExWG-1f
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:04:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyN-0001S4-Rx; Sun, 08 Oct 2023 22:01:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyL-000EzB-BW; Sun, 08 Oct 2023 22:01:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyL-00Bezz-2C; Sun, 08 Oct 2023 22:01:53 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with __refdata to prevent section mismatch warning
Date: Sun,  8 Oct 2023 22:01:24 +0200
Message-Id: <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1681; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HCTLmKUM6J3s+U8+meq2ryRrLbcxRn94rcRCl9GrZF4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwp5T8JGhAN448mWVi6r0ql9MAkFkY7cHU62g Y+eHndKpviJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKeQAKCRCPgPtYfRL+ ToeyB/9QNdWwPK2QFim3ThZYyJ4M+3DAU9OP7Wn96T5Rc68p/BsG0o6Co8IQG8J3PHulnFVrmv1 2lfvDiAQFjGX8tsDUGywbAvL7iKLvCVGhtjNEVYHNp5fchQ2rvdzOemgn9BQmmLaiWysMsYKRjs cKKy5h4fPWElhre0NZ64Wsl1O3ybsZTMJPqVru4OJHbJmaSbkinIoHdMb1Neefph/PHSP3myx3o woq3GoTMA4NpqprTsJEQfYrZDAPJGCSKrhMvPlUZx253H95gKjsF+IrVFauhspwb/sIS19wgYei NiMoeV06pKGco1cAmOg3+tw+R+IZ2bAsSGnE8L7E3VvaATrb
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_210214_634883_529AEF5A 
X-CRM114-Status: GOOD (  14.77  )
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

QXMgZGVzY3JpYmVkIGluIHRoZSBhZGRlZCBjb2RlIGNvbW1lbnQsIGEgcmVmZXJlbmNlIHRvIC5l
eGl0LnRleHQgaXMgb2sKZm9yIGRyaXZlcnMgcmVnaXN0ZXJlZCB2aWEgbW9kdWxlX3BsYXRmb3Jt
X2RyaXZlcl9wcm9iZSgpLiBNYWtlIHRoaXMKZXhwbGljaXQgdG8gcHJldmVudCBhIHNlY3Rpb24g
bWlzbWF0Y2ggd2FybmluZyB3aXRoCkNPTkZJR19NVERfTkFORF9UWFg5TkRGTUM9bToKCglXQVJO
SU5HOiBtb2Rwb3N0OiBkcml2ZXJzL210ZC9uYW5kL3Jhdy90eHg5bmRmbWM6IHNlY3Rpb24gbWlz
bWF0Y2ggaW4gcmVmZXJlbmNlOiB0eHg5bmRmbWNfZHJpdmVyKzB4NCAoc2VjdGlvbjogLmRhdGEp
IC0+IHR4eDluZGZtY19yZW1vdmUgKHNlY3Rpb246IC5leGl0LnRleHQpCgpGaXhlczogNjRmYjY1
YmFmZmE1ICgiW01URF0gVFh4OSBTb0MgTkFORCBGbGFzaCBNZW1vcnkgQ29udHJvbGxlciBkcml2
ZXIiKQpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgotLS0KSGVsbG8sCgpub3RlIHRoaXMgd2FybmluZyBvbmx5IHRyaWdnZXJz
IHdpdGggZjE3N2NkMGMxNWZjICgibW9kcG9zdDogRG9uJ3QgbGV0CiJkcml2ZXIicyByZWZlcmVu
Y2UgLmV4aXQuKiIpIHRoYXQgY3VycmVudGx5IHdhaXRzIGluIG5leHQgZm9yIHRoZSBuZXh0Cm1l
cmdlIHdpbmRvdyArIGJ1aWxkaW5nIHdpdGggVz0xLgoKQmVzdCByZWdhcmRzClV3ZQoKIGRyaXZl
cnMvbXRkL25hbmQvcmF3L3R4eDluZGZtYy5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3R4eDluZGZtYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5kZm1jLmMK
aW5kZXggZWRkY2MwNzI4YTY3Li5hZmY5ZDZmMTY4NTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3R4eDluZGZtYy5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3R4eDluZGZt
Yy5jCkBAIC00MDYsNyArNDA2LDEzIEBAIHN0YXRpYyBpbnQgdHh4OW5kZm1jX3Jlc3VtZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCiAjZGVmaW5lIHR4eDluZGZtY19yZXN1bWUgTlVMTAog
I2VuZGlmCiAKLXN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHR4eDluZGZtY19kcml2ZXIg
PSB7CisvKgorICogdHh4OW5kZm1jX3JlbW92ZSgpIGxpdmVzIGluIC5leGl0LnRleHQuIEZvciBk
cml2ZXJzIHJlZ2lzdGVyZWQgdmlhCisgKiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyX3Byb2JlKCkg
dGhpcyBpcyBvayBiZWNhdXNlIHRoZXkgY2Fubm90IGdldCB1bmJvdW5kIGF0CisgKiBydW50aW1l
LiBTbyBtYXJrIHRoZSBkcml2ZXIgc3RydWN0IHdpdGggX19yZWZkYXRhIHRvIHByZXZlbnQgbW9k
cG9zdAorICogdHJpZ2dlcmluZyBhIHNlY3Rpb24gbWlzbWF0Y2ggd2FybmluZy4KKyAqLworc3Rh
dGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgdHh4OW5kZm1jX2RyaXZlciBfX3JlZmRhdGEgPSB7
CiAJLnJlbW92ZQkJPSBfX2V4aXRfcCh0eHg5bmRmbWNfcmVtb3ZlKSwKIAkucmVzdW1lCQk9IHR4
eDluZGZtY19yZXN1bWUsCiAJLmRyaXZlcgkJPSB7Ci0tIAoyLjQwLjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
