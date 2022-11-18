Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27197C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 22:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNjgpyPqA1eLJQe3eERIZcUDo3FUQInLr62cs2Jx68g=; b=pMy5BihbohtLFp
	qWcvK9tTumpn6dr61p0h8FzFp3oU79/r4hQNXVfAbHgPHHs0FcZnndKOe41oGXdnv355hqAv2oD1V
	GB+XiEr7nPkU479CS7Lu2z58ZXPSiZYJqYWT2r7IoJ+6PXI+cI2tFAGgQU8dJhbBSfXTNR9/NZsmD
	vM3kK6HM1b3K+ygJ4PclOW3wjKeL1qbjmEjyl0924N2Klba9/9tBQ5oyiGYokhI/AFT+8UDNA489d
	YvPZuT25YAY9/sj70OyAsUW6EydWiD63jC1FXA9VXjiH4FIZhxKsPaV38UkD8uEB1osL1zgUEry//
	3h6BKVnUcRTc4XMU7SiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owAB9-008sK9-4n; Fri, 18 Nov 2022 22:49:47 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owA9e-008rCG-Eu
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2022 22:48:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9S-0004bO-AB; Fri, 18 Nov 2022 23:48:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9O-0058lW-QS; Fri, 18 Nov 2022 23:47:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9O-0000P1-Rx; Fri, 18 Nov 2022 23:47:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Grant Likely <grant.likely@linaro.org>,
	Wolfram Sang <wsa@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Peter Rosin <peda@axentia.se>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: linux-i2c@vger.kernel.org,
	kernel@pengutronix.de,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 496/606] mtd: maps: pismo: Convert to i2c's .probe_new()
Date: Fri, 18 Nov 2022 23:43:50 +0100
Message-Id: <20221118224540.619276-497-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_144814_541868_F07B147C 
X-CRM114-Status: GOOD (  14.26  )
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

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
ClRoZSBwcm9iZSBmdW5jdGlvbiBkb2Vzbid0IG1ha2UgdXNlIG9mIHRoZSBpMmNfZGV2aWNlX2lk
ICogcGFyYW1ldGVyIHNvIGl0CmNhbiBiZSB0cml2aWFsbHkgY29udmVydGVkLgoKU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
LS0tCiBkcml2ZXJzL210ZC9tYXBzL3Bpc21vLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L21hcHMvcGlzbW8uYyBiL2RyaXZlcnMvbXRkL21hcHMvcGlzbW8uYwppbmRleCA1ZmNlZmNkMGJh
Y2EuLjNlMGZmZjNmMTI5ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbWFwcy9waXNtby5jCisr
KyBiL2RyaXZlcnMvbXRkL21hcHMvcGlzbW8uYwpAQCAtMjA2LDggKzIwNiw3IEBAIHN0YXRpYyB2
b2lkIHBpc21vX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCWtmcmVlKHBpc21v
KTsKIH0KIAotc3RhdGljIGludCBwaXNtb19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
LAotCQkgICAgICAgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQorc3RhdGljIGludCBw
aXNtb19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogewogCXN0cnVjdCBwaXNtb19w
ZGF0YSAqcGRhdGEgPSBjbGllbnQtPmRldi5wbGF0Zm9ybV9kYXRhOwogCXN0cnVjdCBwaXNtb19l
ZXByb20gZWVwcm9tOwpAQCAtMjYwLDcgKzI1OSw3IEBAIHN0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZl
ciBwaXNtb19kcml2ZXIgPSB7CiAJLmRyaXZlcgk9IHsKIAkJLm5hbWUJPSAicGlzbW8iLAogCX0s
Ci0JLnByb2JlCQk9IHBpc21vX3Byb2JlLAorCS5wcm9iZV9uZXcJPSBwaXNtb19wcm9iZSwKIAku
cmVtb3ZlCQk9IHBpc21vX3JlbW92ZSwKIAkuaWRfdGFibGUJPSBwaXNtb19pZCwKIH07Ci0tIAoy
LjM4LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
