Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C226C4828D
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Feb 2024 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7J2kaGPwqT964LgVdFeqNueEYFvLCJ0bsfTGqbrfbV0=; b=HVCt2wcOtKMNiB
	+W09jwEL1aFOrUVGhqeGw0HsxNmaZ/qWXJPaxXB2QTiemhB0nL7ai1xA51TwAn5Rw3KoWVBKD8AYL
	InQZCjK3SJW80C7nVT5CGdWemSlsxBdjP9u1wXMLQzzRXFVeyFfWwK76QKs2g7wPBGD7/1Ts4xGW+
	jRRjHOeYWeKS+ejExi6ym2WRAnRNbDCYrNu14pSuwCwYu1RU0HrO4cASlFD05MJPxMGLAoAAyKj8c
	8kbcq8lLZgwUtkkPwvtMR2IU1ehAfHUUnKFsD/dj8DUW2MrWHEk3VIROWBs1O+IlqC+sAYscvXcx4
	no5m0+DhAzjw8132I+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXmtN-0000000BVLy-361v;
	Wed, 07 Feb 2024 18:43:29 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXmtK-0000000BVJN-19XU
	for linux-mtd@lists.infradead.org;
	Wed, 07 Feb 2024 18:43:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt8-0007UO-6s; Wed, 07 Feb 2024 19:43:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt5-0054XY-3P; Wed, 07 Feb 2024 19:43:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt5-00HRsY-02;
	Wed, 07 Feb 2024 19:43:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/32] mtd: dataflash: Follow renaming of SPI "master" to "controller"
Date: Wed,  7 Feb 2024 19:40:26 +0100
Message-ID: <38bf50b391c117621e406fa8cd00c4daef78615c.1707324794.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=Nj1hfFsyjq6xs8JqMS+euEQwaY/7srUsVpEx0j3EMYE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlw86jMqw4ltSTXwLQoh9w6paW5SuiO+i/OQP4/ aOSlb/Cxo6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcPOowAKCRCPgPtYfRL+ TjrnCACykE5iNjuwUOalnLCibPbZzFNctipOmpqjUPC8qgwgD5BYLPLFNHhOX5G0Isz2+UbaG89 0AU2cfpxvSwpkFvt8Y0OkUYwClhioF+9d6lQ/qBoGXQ3VXQBlAB/L99vvk764QKk0dknR3ctVZn kNJi7XbxtiY8SWFYhs7xh/XQnKlb8spVTPs2P5XBok7m7S0FWuSVpQY8CWAvyucGjpEtSPYcxBc JE8tsv9mFFU3DGEPsy7l/9ZHo6yEjrinlOIpsESpd20SgfTKJ/8CuY28zfK58vmSCYy14oHgDGW jyuow/xCdY+iCtvbqNdMja+reRkwAfXFAxP8uaONYkVN5Ymt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_104326_426281_94D69F0D 
X-CRM114-Status: GOOD (  11.98  )
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

SW4gY29tbWl0IDhjYWFiNzVmZDJjMiAoInNwaTogR2VuZXJhbGl6ZSBTUEkgIm1hc3RlciIgdG8g
ImNvbnRyb2xsZXIiIikKc29tZSBmdW5jdGlvbnMgYW5kIHN0cnVjdCBtZW1iZXJzIHdlcmUgcmVu
YW1lZC4gVG8gbm90IGJyZWFrIGFsbCBkcml2ZXJzCmNvbXBhdGliaWxpdHkgbWFjcm9zIHdlcmUg
cHJvdmlkZWQuCgpUbyBiZSBhYmxlIHRvIHJlbW92ZSB0aGVzZSBjb21wYXRpYmlsaXR5IG1hY3Jv
cyBwdXNoIHRoZSByZW5hbWluZyBpbnRvCnRoaXMgZHJpdmVyLgoKQWNrZWQtYnk6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CkFja2VkLWJ5OiBKb25hdGhhbiBDYW1l
cm9uIDxKb25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9t
dGQvZGV2aWNlcy9tdGRfZGF0YWZsYXNoLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2Vz
L210ZF9kYXRhZmxhc2guYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvbXRkX2RhdGFmbGFzaC5jCmlu
ZGV4IDBjMWI5MzMwMzYxOC4uZWM1MjI3N2UzZGQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9k
ZXZpY2VzL210ZF9kYXRhZmxhc2guYworKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL210ZF9kYXRh
Zmxhc2guYwpAQCAtNjM4LDcgKzYzOCw3IEBAIHN0YXRpYyBpbnQgYWRkX2RhdGFmbGFzaF9vdHAo
c3RydWN0IHNwaV9kZXZpY2UgKnNwaSwgY2hhciAqbmFtZSwgaW50IG5yX3BhZ2VzLAogCiAJLyog
bmFtZSBtdXN0IGJlIHVzYWJsZSB3aXRoIGNtZGxpbmVwYXJ0ICovCiAJc3ByaW50Zihwcml2LT5u
YW1lLCAic3BpJWQuJWQtJXMiLAotCQkJc3BpLT5tYXN0ZXItPmJ1c19udW0sIHNwaV9nZXRfY2hp
cHNlbGVjdChzcGksIDApLAorCQkJc3BpLT5jb250cm9sbGVyLT5idXNfbnVtLCBzcGlfZ2V0X2No
aXBzZWxlY3Qoc3BpLCAwKSwKIAkJCW5hbWUpOwogCiAJZGV2aWNlID0gJnByaXYtPm10ZDsKLS0g
CjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
