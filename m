Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3100CC432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 08:42:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B3A60F39
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 08:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03B3A60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWxmLTJa1wU6oCSn0fDE2Mqq0tOEcXrSkXAtPs2YnKU=; b=MdVCv9BlnDCa+s
	3GdQt9NIPWouHQjsQE08MG+WdU8/28h5/WVVhzxdCE3dF5A5QFVrpUHxMEwWBMvlKA83cgse8qAyg
	tos2qxfiD87nuaJR1FBnGZNGpoB6HxjD5RTB5knq1oBkZPLS2dGIP3o6hqn6GwxamsraX0/sysrWv
	i/nj3WqMkhU4ZdTxPa/wJtiDuw3s7BMiN2NVOdgsdHwhbgrj/ZDGFFY8UFPhjbQnQTBaVCb9zJ9gu
	QjcpNTF3uYIT80hVa4V9Mf9FyG7OOnFYwMOEYpHrc6y5N0YNwdlx1Q3JibaK0yV9DdN83KjC0sX6W
	DPGndqcWPn8aDE6WMDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFufG-001g4G-3a; Tue, 17 Aug 2021 08:41:42 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFufB-001fzE-Kk
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 08:41:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B00621C0014;
 Tue, 17 Aug 2021 08:41:24 +0000 (UTC)
Date: Tue, 17 Aug 2021 10:41:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Peter
 Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Lucas
 Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>, Adrian Hunter
 <adrian.hunter@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 21/34] mtd: rawnand: tegra: Add runtime PM and OPP
 support
Message-ID: <20210817104123.1854cf17@xps13>
In-Reply-To: <20210817012754.8710-22-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-22-digetx@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_014137_840517_E6CFB3E4 
X-CRM114-Status: GOOD (  12.84  )
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

SGkgRG1pdHJ5LAoKRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPiB3cm90ZSBvbiBU
dWUsIDE3IEF1ZyAyMDIxIDA0OjI3OjQxCiswMzAwOgoKPiBUaGUgTkFORCBvbiBUZWdyYSBiZWxv
bmdzIHRvIHRoZSBjb3JlIHBvd2VyIGRvbWFpbiBhbmQgd2UncmUgZ29pbmcgdG8KPiBlbmFibGUg
R0VOUEQgc3VwcG9ydCBmb3IgdGhlIGNvcmUgZG9tYWluLiBOb3cgTkFORCBtdXN0IGJlIHJlc3Vt
ZWQgdXNpbmcKPiBydW50aW1lIFBNIEFQSSBpbiBvcmRlciB0byBpbml0aWFsaXplIHRoZSBOQU5E
IHBvd2VyIHN0YXRlLiBBZGQgcnVudGltZSBQTQo+IGFuZCBPUFAgc3VwcG9ydCB0byB0aGUgTkFO
RCBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21h
aWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMgfCA2MiAr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAoKQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
