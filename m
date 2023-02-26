Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31699C7EE2D
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Feb 2023 22:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rdSipvYxJe7yj7czayzWMzRLy7w9d3IChNq2a/H1Xxg=; b=nBdNpKM8gWD3Qk
	rA2EgUADDVLNz29nTM/Q3kpyZX33SAizYq8brILIcognS+H3cRUudDI9sWowA4SvpAmWjhNGfUZW4
	XPNt6qX0jM2YY+8N/e89SxU/LQRu7HuU5b9UO+rvqJJpPoXnTRWvl453FPVQNdKWHbiBskz4a0ftk
	7CdVJzXPbxWUoeeGb8beCteI0KCUWF1tLSkN8b0BJ1G9FYf3vcFXsTMQa0O0+fqkGeokUpZT2wSLP
	KuHR7LT1FpX+qA8pFA9wtzqEBAK1y3R7Qr6KQJ07twtjk5PK/lLzZQ7rcvAmawIGspTze2Yfjis2s
	CdtxN1C7jgI3ZHcTZFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWPUM-007vAC-OR; Sun, 26 Feb 2023 22:27:26 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWPUI-007v7s-EV
	for linux-mtd@lists.infradead.org; Sun, 26 Feb 2023 22:27:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pWPU0-0000v4-Cx; Sun, 26 Feb 2023 23:27:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pWPTv-000UbL-A7; Sun, 26 Feb 2023 23:26:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pWPTu-000YPc-Ii; Sun, 26 Feb 2023 23:26:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-mtd@lists.infradead.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	Evgeniy Polyakov <zbr@ioremap.net>,
	Crt Mori <cmo@melexis.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jean Delvare <jdelvare@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Peter Rosin <peda@axentia.se>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 0/9] i2c: Switch .probe() to not take an id parameter
Date: Sun, 26 Feb 2023 23:26:45 +0100
Message-Id: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EenKKdT6RETFmVGwF2CrYShLqN5ZYnH65OR4Oth2DhU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+9yIsuD2BffFtVmTLqMLW9+LGg9CrL1S9JEyp A8isju5DgGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/vciAAKCRDB/BR4rcrs CVArCACf5Exs+Q2fpw9bhFprBhf8Jn0zdE1HAJWqKw9geHnrqn2c77H0nb4l6za7xknleFOdFjl vT1oJ/Hil7ZZHfjj0Q02CEsZqvCUoh/T4UAse77L1aYyUPrZ0RZsOyTquharTxDIKLoriggp8O7 oibgm8zSD2bY1eFXyPkExlGm+6FBBRW8p3Smjl0DhgJHra46+W71KaqBmYkG1IBl5lrINIPfwRv 3ktxNmDCAgv/OMRMRji9mRAtfbTNBB8fvk22YGZXKc7/Ja9bBtoyWYo0UPM2LwcfDAfOnqJXu0d 8S7iE11b92EW7g3eeBkHU339ye95YJ2KDZ7wmHd7p+WkiVWd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_142722_502425_80B82C39 
X-CRM114-Status: GOOD (  12.23  )
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

SGVsbG8sCgp0aGlzIGlzIHYyIG9mIHRoZSBzZXJpZXMuIEkgc2VuZCBpdCBhIGJpdCBlYXJsaWVy
IHRoYW4gSSBwbGFubmVkIHRvIGRvIHRoYXQKaW5pdGlhbGx5IGJlY2F1c2UgSSBmYWlsZWQgdG8g
c2VuZCB2MSBjb21wbGV0ZWx5IHRvIHRoZSBsaW51eC1pMmMgbGlzdC4KCkNoYW5nZXMgc2luY2Ug
KGltcGxpY2l0KSB2MToKIC0gQWRkZWQgQWNrcyBmb3IgcGF0Y2hlcyAjNSwgIzYgYW5kICM4CiAt
IEZpeGVkIGtlcm5lbCBkb2MgYXMgcG9pbnRlZCBvdXQgYnkgTHVjYSBDZXJlc29saSAocGF0Y2gg
IzcpCiAtIFNlbmQgYWxsIHBhdGNoZXMgdG8gbGludXgtaTJjIG1haWxpbmcgbGlzdAogLSBSZWJh
c2VkIHRvIGN1cnJlbnQgTGludXMnIHRyZWUuCiAgIFRoaXMgcmVkdWNlcyB0aGUgbGlzdCBvZiBw
cmVyZXF1aXNpdGUgcGF0Y2hlcyB0byB0d28uCgpJIHVwZGF0ZWQKCglodHRwczovL2dpdC5wZW5n
dXRyb25peC5kZS9naXQvdWtsL2xpbnV4IGkyYy1wcm9iZS1uZXcKCmFjY29yZGluZ2x5LgoKQmVz
dCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDkpOgogIG1pc2M6IGFkNTI1eF9kcG90
LWkyYzogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICBtdGQ6IG1hcHM6IHBpc21vOiBD
b252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogIHNlcmlhbDogc2MxNmlzN3h4OiBDb252ZXJ0
IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogIHcxOiBkczI0ODI6IENvbnZlcnQgdG8gaTJjJ3MgLnBy
b2JlX25ldygpCiAgbWVkaWE6IGkyYzogb3Y1Njk1OiBjb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9u
ZXcoKQogIG1lZGlhOiBpMmM6IG92MjY4NTogY29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkK
ICBpMmM6IFN3aXRjaCAucHJvYmUoKSB0byBub3QgdGFrZSBhbiBpZCBwYXJhbWV0ZXIKICBpMmM6
IG11eDogQ29udmVydCBhbGwgZHJpdmVycyB0byBuZXcgLnByb2JlKCkgY2FsbGJhY2sKICBpMmM6
IENvbnZlcnQgZHJpdmVycyB0byBuZXcgLnByb2JlKCkgY2FsbGJhY2sKCiBkcml2ZXJzL2kyYy9p
MmMtY29yZS1iYXNlLmMgICAgICAgICB8IDEzICsrKy0tLS0tLS0tLS0KIGRyaXZlcnMvaTJjL2ky
Yy1zbGF2ZS1lZXByb20uYyAgICAgIHwgIDIgKy0KIGRyaXZlcnMvaTJjL2kyYy1zbGF2ZS10ZXN0
dW5pdC5jICAgIHwgIDIgKy0KIGRyaXZlcnMvaTJjL2kyYy1zbWJ1cy5jICAgICAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtbHRjNDMwNi5jIHwgIDIgKy0KIGRyaXZl
cnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0MS5jIHwgIDIgKy0KIGRyaXZlcnMvaTJjL211eGVz
L2kyYy1tdXgtcGNhOTU0eC5jIHwgIDIgKy0KIGRyaXZlcnMvbWVkaWEvaTJjL292MjY4NS5jICAg
ICAgICAgIHwgIDUgKystLS0KIGRyaXZlcnMvbWVkaWEvaTJjL292NTY5NS5jICAgICAgICAgIHwg
IDUgKystLS0KIGRyaXZlcnMvbWlzYy9hZDUyNXhfZHBvdC1pMmMuYyAgICAgIHwgIDYgKysrLS0t
CiBkcml2ZXJzL210ZC9tYXBzL3Bpc21vLmMgICAgICAgICAgICB8ICA1ICsrLS0tCiBkcml2ZXJz
L3R0eS9zZXJpYWwvc2MxNmlzN3h4LmMgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy93MS9tYXN0
ZXJzL2RzMjQ4Mi5jICAgICAgICAgfCAgNSArKy0tLQogaW5jbHVkZS9saW51eC9pMmMuaCAgICAg
ICAgICAgICAgICAgfCAxOCArKysrKysrKysrKy0tLS0tLS0KIDE0IGZpbGVzIGNoYW5nZWQsIDM0
IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiBmM2EyNDM5ZjIw
ZDkxODkzMGNjNGFlOGY3NmZlMWMxYWZkMjY5NThmCnByZXJlcXVpc2l0ZS1wYXRjaC1pZDogMjU2
ODU3YjRlZWU3OTU0MGIyNzFiOGQ0ODk5YjliYTBhYTNjNGMyNwpwcmVyZXF1aXNpdGUtcGF0Y2gt
aWQ6IGJiNDljOWM3MTMxMWFjMWYxMDU2YzU2MmYyMGYyNmFhMzU2Yzk1YTYKLS0gCjIuMzkuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
