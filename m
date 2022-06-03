Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B221C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZFhcnsrT5eaGuwmwLsrPxxPHahB90eDba1vzZmFax+k=; b=oymRT9G0Xojb49
	4+81HmtEwCqnHpfdchr3Pn2FDgDFwqlGuSGAEGjf8IJ9Iv+qvM8frAz6AwjsXFw7D3M4caW9cvxaA
	j4PKCBdovo3RURRjAEz2RzK6a9F4Ro91PxEoMUkkSvpTV0+0SoKba8pAfo2Q3Hg28ClF5yp86l4Jh
	focs/mlr9gqKggLo5acKjdbFbnIoyCBys+3HoU6krZLDW+xmERhxvpemW4krjGXbbIWYSL1RcUrUi
	MhkxxMr+4xagTXNDt+c83GhD7Gi3SXiiHe5DF1a6Vd/wxtmp8lqpw30R8LMQLzHFvcaLL2f7DSjBz
	+Mvag8smB7eEXMC4h3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEaO-008jxP-59; Fri, 03 Jun 2022 21:12:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEXd-008hbU-CP
	for linux-mtd@bombadil.infradead.org; Fri, 03 Jun 2022 21:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KA2mIjvStadzsJuBkk9Yb3itv9n3Z1gNnjsZRCvkkY0=; b=TtktBAP3UMSoQayWiIqrY6FoM5
	OAZShC+WDxaY+ic6Kt8r048xSvawUBY0Lmv/ayWajOwtyaQvznJsg+hToD6KB+l6lMvE4QjwNGHHW
	4eFq0LTZQkF2PqvNXNErNsgVEeOouFhHlVfWlXnNqKBVCRXbcnW8ZKcq4C/MHo1WNQD/WyFSUuksX
	YGLPuSLdF0KpcRATZ4M1CSKld5YZVrT+XRvbHNPkeMY/6bJIYoyjTiDZVi/tvGscfm0WBnETyYjPJ
	l+kh1O5ERZL1LpSX1UUM0rRS9R5fWNK1pN1WRhpMBaGwF3ItdvvRY4q8y1JKGkUSiV9YJmc1/x+l2
	z7323EJQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEXV-004WTt-Op
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:09:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWg-0003ql-Rk; Fri, 03 Jun 2022 23:08:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-006Hpk-CA; Fri, 03 Jun 2022 23:08:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWZ-00E1H5-6s; Fri, 03 Jun 2022 23:08:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Joel Stanley <joel@jms.id.au>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Stefan Agner <stefan@agner.ch>,
	Lucas Stach <dev@lynxeye.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Liang Yang <liang.yang@amlogic.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org,
	Michael Walle <michael@walle.cc>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 00/14] mtd: Fix platform remove callbacks to always return 0
Date: Fri,  3 Jun 2022 23:07:44 +0200
Message-Id: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2310; i=uwe@kleine-koenig.org; h=from:subject; bh=q2ycDgelp/nO6ViqBZJgFoKvH7fVSGWxa2BGxqpYD+s=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfE5fVVOvpqL4Xqzddai1jCcQBM7b5jo5W1QZw8 iIwB8NmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp3xAAKCRDB/BR4rcrsCXt2B/ 4qWz6olnMyidYhZ7g/qZaoPMgkHVnZRaB+OnSUr+L4Jm1IodQP4MrwiltmKlSyqmdwnvxJzxtnT0zb s0TX8Y6bInlnxd/SRRBKvGKHvHFYpztNxRZkvHHz9U4M6YMqj5zZeMjx9xgdm7bQ2o3UTQTFks2VAw kS3U2+mKRRm/1zgoPawD0hqmCMMbidTgGK/2vZHrF/V1JRMy5bcK1ByBNeXwoSXt72M2W72LAdU5XA mI7wUQR/g3qkW0tGS11qyaC5ZAS76ZpOBS5GaLlS2NwqdsSmKlZ+rWdlrNH0aBd3XjiWq8HeT31nQx srBqXHcGBUJS922WV6Z9YIm/CKnDXI
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_220902_558459_5416C45B 
X-CRM114-Status: GOOD (  11.10  )
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

SGVsbG8sCgp0aGlzIHNlcmllcyBwcmVwYXJlcyB0byBtYWtlIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFja3MgcmV0dXJuIHZvaWQuClRoZXJlZm9yIGZpcnN0IHVwZGF0ZSB0aGVtIHRvIGFsd2F5cyBy
ZXR1cm4gMC4gVGhlIHJhdGlvbmFsZSBpcyB0aGF0IHRoZQpMaW51eCBkZXZpY2UgbW9kZWwgZG9l
c24ndCBoYW5kbGUgZmFpbHVyZXMgb24gcmVtb3ZlIGFuZCBpZiBhIHJlbW92ZQpjYWxsYmFjayBy
ZXR1cm5zIGFuIGVycm9yLCBpdCBqdXN0IGVtaXRzIGEgcXVpdGUgZ2VuZXJpYyBlcnJvciBtZXNz
YWdlCmFuZCBzdGlsbCByZW1vdmVzIHRoZSBkZXZpY2UuCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2Ug
S2xlaW5lLUvDtm5pZyAoMTQpOgogIG10ZDogaHlwZXJidXM6IE1ha2UgaHlwZXJidXNfdW5yZWdp
c3Rlcl9kZXZpY2UoKSByZXR1cm4gdm9pZAogIG10ZDogc3BpLW5vcjogYXNwZWVkLXNtYzogTWFr
ZSBhc3BlZWRfc21jX3VucmVnaXN0ZXIoKSByZXR1cm4gdm9pZAogIG10ZDogcG93ZXJudl9mbGFz
aDogV2FybiBhYm91dCBmYWlsdXJlIHRvIHVucmVnaXN0ZXIgbXRkIGRldmljZQogIG10ZDogc3Qt
c3BpX2ZzbTogV2FybiBhYm91dCBmYWlsdXJlIHRvIHVucmVnaXN0ZXIgbXRkIGRldmljZQogIG10
ZDogbHBkZHIyX252bTogV2FybiBhYm91dCBmYWlsdXJlIHRvIHVucmVnaXN0ZXIgbXRkIGRldmlj
ZQogIG10ZDogc3BlYXJfc21pOiBEb24ndCBza2lwIGNsZWFudXAgYWZ0ZXIgbXRkX2RldmljZV91
bnJlZ2lzdGVyKCkKICAgIGZhaWxlZAogIG10ZDogc3BlYXJfc21pOiBEcm9wIGlmIHdpdGggYW4g
YWx3YXlzIGZhbHNlIGNvbmRpdGlvbgogIG10ZDogcmF3bmFuZDogYXRtZWw6IFdhcm4gYWJvdXQg
ZmFpbHVyZSB0byB1bnJlZ2lzdGVyIG10ZCBkZXZpY2UKICBtdGQ6IHJhd25hbmQ6IG9tYXAyOiBT
dXBwcmVzcyBlcnJvciBtZXNzYWdlIGFmdGVyIFdBUk4gaW4gLnJlbW92ZSgpCiAgbXRkOiByYXdu
YW5kOiB0ZWdyYTogRG9uJ3Qgc2tpcCBjbGVhbnVwIGFmdGVyIG10ZF9kZXZpY2VfdW5yZWdpc3Rl
cigpCiAgICBmYWlsZWQKICBtdGQ6IHJhd25hbmQ6IG1lc29uOiBEb24ndCBza2lwIGNsZWFudXAg
YWZ0ZXIgbXRkX2RldmljZV91bnJlZ2lzdGVyKCkKICAgIGZhaWxlZAogIG10ZDogcmF3bmFuZDog
bWVzb246IERyb3AgY2xlYW5pbmcgcGxhdGZvcm0gZGF0YSBpbiAucmVtb3ZlKCkKICBtdGQ6IHBo
eXNtYXA6IERvbid0IHNraXAgY2xlYW51cCBhZnRlciBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoKSBm
YWlsZWQKICBtdGQ6IHBoeXNtYXA6IERyb3AgaWYgd2l0aCBhbiBhbHdheXMgZmFsc2UgY29uZGl0
aW9uCgogZHJpdmVycy9tdGQvZGV2aWNlcy9wb3dlcm52X2ZsYXNoLmMgICAgICAgICAgfCAgNCAr
KystCiBkcml2ZXJzL210ZC9kZXZpY2VzL3NwZWFyX3NtaS5jICAgICAgICAgICAgICB8IDEwICsr
LS0tLS0tLS0KIGRyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jICAgICAgICAgICAgIHwg
IDQgKysrLQogZHJpdmVycy9tdGQvaHlwZXJidXMvaGJtYy1hbTY1NC5jICAgICAgICAgICAgfCAg
NiArKystLS0KIGRyaXZlcnMvbXRkL2h5cGVyYnVzL2h5cGVyYnVzLWNvcmUuYyAgICAgICAgIHwg
IDggKystLS0tLS0KIGRyaXZlcnMvbXRkL2h5cGVyYnVzL3JwYy1pZi5jICAgICAgICAgICAgICAg
IHwgIDUgKysrLS0KIGRyaXZlcnMvbXRkL2xwZGRyL2xwZGRyMl9udm0uYyAgICAgICAgICAgICAg
IHwgIDQgKysrLQogZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWNvcmUuYyAgICAgICAgICAgICAg
fCAxMyArKystLS0tLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRy
b2xsZXIuYyB8ICA1ICsrKystCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgICAg
ICAgICAgICB8IDE2ICsrKy0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAy
LmMgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdy
YV9uYW5kLmMgICAgICAgICAgICB8ICA1ICstLS0tCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRy
b2xsZXJzL2FzcGVlZC1zbWMuYyB8ICA4ICsrKystLS0tCiBpbmNsdWRlL2xpbnV4L210ZC9oeXBl
cmJ1cy5oICAgICAgICAgICAgICAgICB8ICA0ICstLS0KIDE0IGZpbGVzIGNoYW5nZWQsIDM3IGlu
c2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6IDRiMDk4NmEzNjEzYzky
ZjRlYzFiZGM3ZjYwZWM2NmZlYTEzNTk5MWYKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
