Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43DCC47DAF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 18:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6HvL3tof2SkBGMp0ysEnCw0JRH7qoARf7iAH21hmEQ=; b=J530uZmZznYET8
	CJWFUdVmFRX+kgX3XW1AWs46Nf/xcM6zvVkJHhqSDGOpUwFUpZl58Nk20VWyFx5rIR+vqPfhtG6SI
	ydiEGztIY0QlrXcVIqfhsH7Vqo77+k4jtYlnMcecvKk1Oupbl73QAEmDu86D7e7QcwnPRuJuG1PhU
	zRhWhNumOG71S6EbJA3LJec/cE7v8J3YXJ6k6hAO/RPbiQVGMdY6rbCf9Ut1Qrwk98JQUr5KWNTdh
	0q2tbfByUD8+Mc/ROZT2l/XriO9NZff2ftFFl+3+dxw8QpEc3oEvaWB9KWwYDM0TU+v3f2wu3StQZ
	E5vtyrwHtrZVVpYE0d+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyiq-00DQmQ-2e;
	Mon, 22 Jan 2024 18:08:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyin-00DQj2-2N
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 18:08:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiW-0001qd-F5; Mon, 22 Jan 2024 19:08:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiV-001ePv-6S; Mon, 22 Jan 2024 19:08:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiV-005ZxV-0L;
	Mon, 22 Jan 2024 19:08:15 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [PATCH v2 12/33] mtd: dataflash: Follow renaming of SPI "master" to "controller"
Date: Mon, 22 Jan 2024 19:07:07 +0100
Message-ID: <63d7d1f1e6fe564daf034c66eb3073aa265b7969.1705944943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=NBOC25sdOvGb/9mPNsZnEncAlQwVHEMnCLFxkavQ8DQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlrq7QEfATD5xG2hpQG6DlgMRzWaTKGPWZHTQ2z pPbTlCX0dqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZa6u0AAKCRCPgPtYfRL+ TilmCACJ2388gx/UewF/Ask4RyYTH4immf27buUsBhyAWpQD91hjhGO1pzM01We+2TVb2u8Jy6A FoGHOBwlRZf2Tx2aB4t7W5q1xTEPbyWoQ9bnQwfwgfXolDRDIV5GwM3ZqCz+h+eimI5QSMe767M kdX2SuNYwXeUFWMjjRVDqQ0aoRmsC6SNFSH3uxOrbKpwEwyJcGPbF517SxNU0OkcCAbrX9fzofM HT+90MYf3Hl3BvpMsEbIEScn1PJyzXQuftXRqV2CNqd+LfG5G2bIR1ywtj+s85K3Ub620706Qm4 ApiO+eZUFjSc5n57Dns7TZNVuXXKmFjwxbfOI1fcTbszlBMJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_100833_771498_B113CE50 
X-CRM114-Status: GOOD (  12.05  )
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
cyBwdXNoIHRoZSByZW5hbWluZyBpbnRvCnRoaXMgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL210ZC9kZXZpY2VzL210ZF9kYXRhZmxhc2guYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2Rl
dmljZXMvbXRkX2RhdGFmbGFzaC5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRfZGF0YWZsYXNo
LmMKaW5kZXggMGMxYjkzMzAzNjE4Li5lYzUyMjc3ZTNkZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bXRkL2RldmljZXMvbXRkX2RhdGFmbGFzaC5jCisrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvbXRk
X2RhdGFmbGFzaC5jCkBAIC02MzgsNyArNjM4LDcgQEAgc3RhdGljIGludCBhZGRfZGF0YWZsYXNo
X290cChzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpLCBjaGFyICpuYW1lLCBpbnQgbnJfcGFnZXMsCiAK
IAkvKiBuYW1lIG11c3QgYmUgdXNhYmxlIHdpdGggY21kbGluZXBhcnQgKi8KIAlzcHJpbnRmKHBy
aXYtPm5hbWUsICJzcGklZC4lZC0lcyIsCi0JCQlzcGktPm1hc3Rlci0+YnVzX251bSwgc3BpX2dl
dF9jaGlwc2VsZWN0KHNwaSwgMCksCisJCQlzcGktPmNvbnRyb2xsZXItPmJ1c19udW0sIHNwaV9n
ZXRfY2hpcHNlbGVjdChzcGksIDApLAogCQkJbmFtZSk7CiAKIAlkZXZpY2UgPSAmcHJpdi0+bXRk
OwotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
