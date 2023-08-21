Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C691AEE4996
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 07:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ST0dCJkniHAro05wDfugNSfbmJyekLH/7bKeFlzy5B4=; b=EV1CQxVQXVrLli
	aTeV3AU6fgB+GcDpT1roEw+u5DLYAdcNWKOppFoKgqyrSLNjCzdGwkOtEdTiDVWkse8LdICkoCr92
	pzYnhGRuzWkTua/8jhInKEJdWiWgFTP0U0IDdV2ZC9NNKKWZXIrCZ0WlY3QWn8jliuQKyaaJcM3ID
	wPHRoj/QviwIJhiOhktbmEeZz+jSRw2Tn/TaFsoKNRzpH6OIDZp7bqEX/kxj65/r5ihjPW5rvc7Ee
	Jspo5MVDc+slD3koOS64vsEvdJ4/zYb/uy4hCDFEP+y7MWYfAsXfAYq8KAWSju5CvkTuZksvvKko6
	qT+FyQOhWNOmQKAZmImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzk7-00DPCS-35;
	Mon, 21 Aug 2023 07:54:31 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzk4-00DPB9-10;
	Mon, 21 Aug 2023 07:54:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7635840005;
	Mon, 21 Aug 2023 07:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692604463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+g2kGOBzDKIkQEMz+5a35V4YETSzQ5TABcO8d37tkY=;
	b=e6TJ8JFxedqGlPsXUusWjKkr3z72B+pv1khOZOKYpRv1ROEOVD3qqAc+rJt/vHqikAAa4U
	TkcBiBN5tg9aQtzGapIkSvUjOA2s0Q5rdj/vUIOKVnzm+k7RPK0UNDjtDxV14NhbW1triP
	a7l0o6bGyOGT65J9F9/kJz/rZbJbAkSTrO1XUeXm/ioQ9fbbiwfnR24fmqEJxdK4kxHW+X
	wqMbFeEViqDukrDtclTwjLKrRFwQKMG5jNMrERk6wHkaIY66YDu8fZ/j6Wkj60uIgo9ShA
	cy7K3K5aaXJEpZc+7VtCmaQrXjGCu56nkVVZJ+7DpFww7QmRAO9rBx6Za4L6SA==
Date: Mon, 21 Aug 2023 09:54:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <alexandre.torgue@foss.st.com>,
 <angelogioacchino.delregno@collabora.com>,
 <christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
 <dmitry.torokhov@gmail.com>, <frank.li@vivo.com>,
 <geert+renesas@glider.be>, <heiko@sntech.de>, <jernej.skrabec@gmail.com>,
 <jinpu.wang@ionos.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
 <mcoquelin.stm32@gmail.com>, <michael@walle.cc>, <michal.simek@amd.com>,
 <paul@crapouillou.net>, <philmd@linaro.org>, <pratyush@kernel.org>,
 <richard@nod.at>, <robh@kernel.org>, <rogerq@kernel.org>,
 <samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
 <u.kleine-koenig@pengutronix.de>, <vigneshr@ti.com>, <vz@mleia.com>,
 <wens@csie.org>, <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v3 11/12] mtd: spi-nor: nxp-spifi: Use helper
 function devm_clk_get_enabled()
Message-ID: <20230821095417.121990be@xps-13>
In-Reply-To: <20230821093825.22280e33@xps-13>
References: <20230818101004.4f2cd343@xps-13>
	<20230821031737.1973183-1-lizetao1@huawei.com>
	<20230821031737.1973183-12-lizetao1@huawei.com>
	<20230821093825.22280e33@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_005428_496373_23D57A8A 
X-CRM114-Status: GOOD (  10.64  )
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

SGkgYWdhaW4sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIE1vbiwgMjEgQXVn
IDIwMjMgMDk6Mzg6MjUgKzAyMDA6Cgo+IEhpIFR1ZG9yLAo+IAo+IGxpemV0YW8xQGh1YXdlaS5j
b20gd3JvdGUgb24gTW9uLCAyMSBBdWcgMjAyMyAxMToxNzozNiArMDgwMDoKPiAKPiA+IFNpbmNl
IGNvbW1pdCA3ZWY5NjUxZTk3OTIgKCJjbGs6IFByb3ZpZGUgbmV3IGRldm1fY2xrIGhlbHBlcnMg
Zm9yIHByZXBhcmVkCj4gPiBhbmQgZW5hYmxlZCBjbG9ja3MiKSwgZGV2bV9jbGtfZ2V0KCkgYW5k
IGNsa19wcmVwYXJlX2VuYWJsZSgpIGNhbiBub3cgYmUKPiA+IHJlcGxhY2VkIGJ5IGRldm1fY2xr
X2dldF9lbmFibGVkKCkgd2hlbiBkcml2ZXIgZW5hYmxlcyAoYW5kIHBvc3NpYmx5Cj4gPiBwcmVw
YXJlcykgdGhlIGNsb2NrcyBmb3IgdGhlIHdob2xlIGxpZmV0aW1lIG9mIHRoZSBkZXZpY2UuIE1v
cmVvdmVyLCBpdCBpcwo+ID4gbm8gbG9uZ2VyIG5lY2Vzc2FyeSB0byB1bnByZXBhcmUgYW5kIGRp
c2FibGUgdGhlIGNsb2NrcyBleHBsaWNpdGx5LCBzbyBkcm9wCj4gPiB0aGUgbGFiZWwgImRpc19j
bGtzIiBhbmQgImRpc19jbGtfcmVnIi4gIAo+IAo+IFRoaXMgcGF0Y2ggc2VlbXMgdmVyeSBzaW1w
bGUsIGRvIHlvdSBtaW5kIGlmIEkgYXBwbHkgaXQgZGlyZWN0bHkgaW50bwo+IG10ZC9uZXh0IGZv
ciB0aGUgbmV4dCBQUj8KCkkgc2VlIHlvdSBhbHJlYWR5IHRvb2sgdGhhdCBvbmUsIHBlcmZlY3Qg
Oy0pIFNvcnJ5IGZvciB0aGUgbm9pc2UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
