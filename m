Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CE6E95A80
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPsMQs1nELIsyuXR/QZyZ19dNPWnnbBpPkDL8BVWuuQ=; b=LgGEfoMNQjwcHN
	pkHt7we6la2n/Xb1alC/ow8/iqbAXM6zldLXuP5Sg3gP7f/8g5uxt3gZYbEWMhFD6Nj4Ct/HDgPY6
	DIF0LnA9cXjaVSYvTA2vm5QzWUkhu6FGhvXWxK2Nd/7EZrgE3S6AeY6KtRgKyF+EhUimbHyyXcIGM
	ejVYjdpa4eO4cbr7x0OEuPggneLCwXQXazm47ViNPuo5eym8uIeXwB0n10d9jJdjLy957YjQLnOQ+
	fjI6FexShwuviIxtLHqkrGKpW16bH7UiD8cS7BkVsyQx8WZC+RF0HRdzRyffJiC9FNo92QXWFdyOF
	vC9dk15rGQ5vuSc5ixBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyc-009Dx1-37;
	Sun, 08 Oct 2023 20:02:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyV-009Dqr-2D
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyM-0001S8-4w; Sun, 08 Oct 2023 22:01:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyL-000EzE-K3; Sun, 08 Oct 2023 22:01:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyL-00Bf03-B0; Sun, 08 Oct 2023 22:01:53 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 02/20] mtd: rawnand: txx9ndfmc: Drop if block with always false condition
Date: Sun,  8 Oct 2023 22:01:25 +0200
Message-Id: <20231008200143.196369-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xY4iFlBn+hA89YIz+7BM4iDNw+9PSlnUUQWNlfeNif4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwp7MlxrTM1knwjZE8C19e4mfq1I6PLEE7mAs n5q+/8IoLOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKewAKCRCPgPtYfRL+ Tv96CACQU6OjG+WM+qcRk9cQj0hMJ5L4mqHHeoTYpdZBCQgZLPuU+T9f0IepfT4UM1PaFe93RYC muswZ8OY3JM0irVwDF0CyyDCEWcfKh7K12ZF1JNuhgbsMrPK+dIi3tnqfQmZNUsYHv5ra746yVW BJgGzCruUnxsV/prPv63dCNnKP3Ca7LYQEQpTfUhQ3Y4qevT2rCtF1JUOYkWN/rl4BY15Pyf3pn GV25WG5KJqg2md2KhiVI2v6II4nWwKZNE5DeH+PN+/CgH5JXKlteLvhLvT5fJo+YbaVuZcYveTh ZZBPQm+glGExf38jmne7LhfxpRZs4qZ3q4at5hwLXnAT9sND
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130203_720411_2123B98B 
X-CRM114-Status: GOOD (  11.49  )
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

dHh4OW5kZm1jX3JlbW92ZSgpIGlzIG9ubHkgY2FsbGVkIGFmdGVyIHR4eDluZGZtY19wcm9iZSgp
IGNvbXBsZXRlZApzdWNjZXNzZnVsbHkuIEluIHRoaXMgY2FzZSBwbGF0Zm9ybV9zZXRfZHJ2ZGF0
YSgpIHdhcyBjYWxsZWQgd2l0aCBhCm5vbi1OVUxMIGFyZ3VtZW50IGFuZCBzbyBwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YSgpIHdvbid0IHJldHVybiBOVUxMLgoKU2ltcGxpZnkgYnkgcmVtb3ZpbmcgdGhl
IGlmIGJsb2NrIHdpdGggdGhlIGFsd2F5cyBmYWxzZSBjb25kaXRpb24uCgpTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0K
IGRyaXZlcnMvbXRkL25hbmQvcmF3L3R4eDluZGZtYy5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5k
Zm1jLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy90eHg5bmRmbWMuYwppbmRleCBhZmY5ZDZmMTY4
NTEuLjgzZGQwOTJkMjJlZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5k
Zm1jLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5kZm1jLmMKQEAgLTM3NCw4ICsz
NzQsNiBAQCBzdGF0aWMgaW50IF9fZXhpdCB0eHg5bmRmbWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKmRldikKIAlzdHJ1Y3QgdHh4OW5kZm1jX2RydmRhdGEgKmRydmRhdGEgPSBwbGF0
Zm9ybV9nZXRfZHJ2ZGF0YShkZXYpOwogCWludCByZXQsIGk7CiAKLQlpZiAoIWRydmRhdGEpCi0J
CXJldHVybiAwOwogCWZvciAoaSA9IDA7IGkgPCBNQVhfVFhYOU5ERk1DX0RFVjsgaSsrKSB7CiAJ
CXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gZHJ2ZGF0YS0+bXRkc1tpXTsKIAkJc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcDsKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
