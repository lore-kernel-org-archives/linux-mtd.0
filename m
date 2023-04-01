Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC23C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpKk98NeKS5NDv54OwaUo/wqlqXK2GxrrHAckq4/kuU=; b=QiP21l6lTMRAWd
	bEtxsY1tr5838w5tNkriRsaws/YZlk0mK8QM9s3YV75MGlyXBqhOBYDDy41iXvViS4OfuX+1uFh4l
	m4m+lti6aIjrb2LcAHOw6cAfkBXNCr6lViHcXkux8E6n1dnWirme8w0gCcg1+IqkPAGIwJ5MxuF4j
	kmM/4cQrVBuZpoNXWbpVPnSGnZ3MFkHwCzjFrU9qSytAnbLBAurJXuzJdf+oEXyafRLmeVGtqUR8J
	55Jgwww5QuqrU/TOQoFnDtPC+TmEzHnbFnFH/s7ZG3WAdHEvxl6S3xd791GOVa++FHJdnXqDnoTZz
	LBLSNjSeDE7qP/6GIdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEJ-00AwTg-0m;
	Sat, 01 Apr 2023 16:37:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEG-00AwRk-35
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5hpxSLTSThuxjxj27ulW6Ade2fFJNEPt2IBjMu6lKqo=; b=CV50YF7BtyHYcjkX1aERagnXsq
	xvFt+m5cELxvTiFegrXFj9D9X7MzI5399nDztQVeWlHKz5cZ8HU1u60WXbWSjcpoMQcDtzIdvGzXV
	6y7HIihg3ga8Ya2AZlVQhnchA7GmE3cov+lYRZIKmlYOMN+EZGnTEzGuv7MktLLRvfzcZFpnQQb5V
	mtchcazNLRZZQbwKDBSgae9tzSWyQ1hY6vYXD3B1DvgqtiVX5f6fnpVZURChFlgU4Z/ePzxRZwFxq
	VDVq8r4rw38zi45p7YRBHirtP0/34ogV92YnX5EFnX/4Kf/XRC9scXe0Qi4eHNInqQFZsbkMeXj+O
	7iHHcLPQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxX-00CYO9-Nm
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-0008A9-Gw; Sat, 01 Apr 2023 18:19:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxF-008GQE-3O; Sat, 01 Apr 2023 18:19:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-009kfh-Bb; Sat, 01 Apr 2023 18:19:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Valentin Korenblit <vkorenblit@sequans.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 10/49] mtd: rawnand: cadence: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:18:59 +0200
Message-Id: <20230401161938.2503204-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=AfpjgW7LVj0UxqzoFH2l4MZgjRpe9UZwos7pFGy2fVs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFj7eSJKUCMH6vVKAM+ccqOrA5XEBtJlYGKAi oFeJQ4LE/SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY+wAKCRCPgPtYfRL+ TuQaB/9vaszWHiMJTokM824uj/VcOwyphvdGcrWRxleQXL1DDJR9Uk0Kj52h8rH1dgK/0fXArZi pXruLlrDwG3v3wwaX8/Mv3LcSiBPeyB7t0W2I9Nw1eXsRy2InIL3eKX0ZcSJ8qHDQnrqRCrz+uL luXg42go0UrFiPq+YYgbR663/8y3iX01SFPvnZm/fEOFduXwtdLqUyOZ1FdM6BBSArFaAw3tVaD Cq87I0dJq2zGzMnTrxVMH1K1pTtcZJ+DZrGysnklgIbGjRe2Vbxd/RUA6YOCmbHLK4ANOI1JgZ+ MbuVZ56n4nxg6qRkEpLbK+JNyWOlNrie2Mu+5ulp/C8GIbZK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172007_836571_E61B9CBA 
X-CRM114-Status: GOOD (  12.56  )
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
dmVycy9tdGQvbmFuZC9yYXcvY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIuYyB8IDYgKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9jYWRlbmNlLW5hbmQtY29udHJvbGxlci5jCmluZGV4IDc2NjFhNWNm
MTg4My4uMDM0ZWM1NjRjMmVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWRl
bmNlLW5hbmQtY29udHJvbGxlci5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2Ut
bmFuZC1jb250cm9sbGVyLmMKQEAgLTMwNTUsMTggKzMwNTUsMTYgQEAgc3RhdGljIGludCBjYWRl
bmNlX25hbmRfZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb2ZkZXYpCiAJcmV0dXJu
IDA7CiB9CiAKLXN0YXRpYyBpbnQgY2FkZW5jZV9uYW5kX2R0X3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpvZmRldikKK3N0YXRpYyB2b2lkIGNhZGVuY2VfbmFuZF9kdF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqb2ZkZXYpCiB7CiAJc3RydWN0IGNhZGVuY2VfbmFuZF9kdCAq
ZHQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShvZmRldik7CiAKIAljYWRlbmNlX25hbmRfcmVtb3Zl
KCZkdC0+Y2Ruc19jdHJsKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBjYWRlbmNlX25hbmRfZHRfZHJpdmVyID0gewogCS5wcm9iZQkJPSBjYWRlbmNl
X25hbmRfZHRfcHJvYmUsCi0JLnJlbW92ZQkJPSBjYWRlbmNlX25hbmRfZHRfcmVtb3ZlLAorCS5y
ZW1vdmVfbmV3CT0gY2FkZW5jZV9uYW5kX2R0X3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5h
bWUJPSAiY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBjYWRl
bmNlX25hbmRfZHRfaWRzLAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
