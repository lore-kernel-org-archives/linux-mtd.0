Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5BCC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 07:43:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B265760FE3
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 07:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B265760FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtbNzQaboan10VDSmb7FVv5A+B7i0j/59hFLvcrBxDo=; b=oKmxsrX5CQvyfC
	7BvRNBssc0WXrcYrTCvpmlA+1IosKUUIaSnUt+JJGaEMruor5g599WsU7zi89H8CJPtI06Algeh+V
	XyOCu8L44i10OfwQE3O4BSD6z9Ly8V2nVX6NPFkavCkTNTfnqhVw0hj1z+waJDDtOBjy2GYXgh3P/
	++vvJNsl+fJl4gSYgLMJeYJIa7gBbDVxdrOphe8eGOVYVpyKbyU+KFmvV4HVfui68W//GNkzw8G3x
	6GkQ4uJ9xfLRwLoE+PxovOSNFYfkS/+vydX/AblxQWYY3BdSz+dBfGk383G6WTSeC8lAswYYoXbza
	zTrUqOQBSnzh5GPAel4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlRCx-009cJJ-Oq; Fri, 12 Nov 2021 07:42:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlRCt-009cHP-DC
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 07:42:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so6133350wmz.2
 for <linux-mtd@lists.infradead.org>; Thu, 11 Nov 2021 23:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d4YpBbYWP9wG3LFBKWknnju7IW21BdQrAXLAFoUfJjk=;
 b=L0G7vqzIu4OmVtWPcfcfA5NzLtPk2i0H7s2BzObNlHQTFEkm03sqk/2QHQ4kjpk9BH
 XMXouE5QpmwrxFfo6B5ZLvuccwWWhT/w9Ko9Yi7L+7BfDDnicqyRLnT+TM8ck5H5bQEY
 cyD6P6qfh9iWldNqTQR7o5UJ+sXkSMXyDzLNU6kkBq7ka/+ZuUqEk/qcSbQ3GxXC7kiU
 cm9dyledHK9n0gr3crraQGaAfhd3vfTQwfXVu/kwmwojjE1dRCSgNEVgeiJJB70r7ke9
 OYePQHHEPa/usZJXytv516/nCeAGVXFsmZBOHnIcNaOTOhsULeXowN7ikvsxKqOo/gxw
 3O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d4YpBbYWP9wG3LFBKWknnju7IW21BdQrAXLAFoUfJjk=;
 b=gj9kmXnWmZgWeya4xmuAoJP0GO5cNxiyW+lmIQlxdMnl0+u8SOe+4U729Mb+6i+3YA
 6EAmrbfHR5PNT3sqCv/4AAZCoXjUE5s2JCuGMb6tD41EXqAfuLo/OkthyHR8w70xG0it
 8nv5c3jU2qvZ8GO1YUN4lI4D2/jYYMhu9rgtSb22O9rdKsB6jBjDxka86IwoTBIgDxQs
 Ph9zujvv8ShpimTW48aCF0fwPF8g5kuq3ycAQAxQVnKuYtKL50KAxrf31kA+4D63fkYj
 tbth/MNHeoTR056lsklD9AjZqnpOpVMb34gObJ8tuZdNU9KBo6LgGjqTUyz6y5+D7l25
 AEmw==
X-Gm-Message-State: AOAM533nVxDWbN8UjIvkWItFWsiJZlQiaowu6vh7bHycLMleRmMdpx39
 937ELyjzAsfGMdluueZL6R4sWA==
X-Google-Smtp-Source: ABdhPJyYtg+MHn61GMl0MRFqSO/sm1wnHgrm7yORmq7WT7ihtvN7d0mp317CBhRDaom5mAlXGDszmg==
X-Received: by 2002:a05:600c:2107:: with SMTP id
 u7mr32377342wml.82.1636702961238; 
 Thu, 11 Nov 2021 23:42:41 -0800 (PST)
Received: from google.com ([95.148.6.174])
 by smtp.gmail.com with ESMTPSA id q8sm4978469wrx.71.2021.11.11.23.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 23:42:40 -0800 (PST)
Date: Fri, 12 Nov 2021 07:42:37 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: patrice.chotard@foss.st.com, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 jonathan cameron <jic23@kernel.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 olivier moysan <olivier.moysan@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 Matt Mackall <mpm@selenic.com>, vinod koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 baolin wang <baolin.wang7@gmail.com>, linux-spi@vger.kernel.org,
 david airlie <airlied@linux.ie>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, netdev@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 ohad ben-cohen <ohad@wizery.com>, linux-gpio@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Le Ray <erwan.leray@foss.st.com>,
 herbert xu <herbert@gondor.apana.org.au>,
 michael turquette <mturquette@baylibre.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-serial@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Ludovic Barre <ludovic.barre@foss.st.com>,
 "david s . miller" <davem@davemloft.net>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 linux-i2c@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>,
 thierry reding <thierry.reding@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Sebastian Reichel <sre@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 philippe cornu <philippe.cornu@foss.st.com>, linux-rtc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 alsa-devel@alsa-project.org, Zhang Rui <rui.zhang@intel.com>,
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-iio@vger.kernel.org, pascal Paillet <p.paillet@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 linux-pm@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 stephen boyd <sboyd@kernel.org>,
 dillon min <dillon.minfei@gmail.com>, devicetree@vger.kernel.org,
 yannick fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-phy@lists.infradead.org,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 sam ravnborg <sam@ravnborg.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, daniel vetter <daniel@ffwll.ch>,
 Marc Zyngier <maz@kernel.org>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 lars-peter clausen <lars@metafoo.de>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: timers: Update maintainers for
 st,stm32-timers
Message-ID: <YY4a7ZxzhNq6Or+t@google.com>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-3-patrice.chotard@foss.st.com>
 <YYwjPAoCtuM6iycz@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYwjPAoCtuM6iycz@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_234243_609491_B8360570 
X-CRM114-Status: GOOD (  15.24  )
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

T24gV2VkLCAxMCBOb3YgMjAyMSwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IE9uIFdlZCwgMTAgTm92
IDIwMjEgMTY6MDE6NDEgKzAxMDAsIHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbSB3cm90ZToK
PiA+IEZyb206IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+
ID4gCj4gPiBCZW5qYW1pbiBoYXMgbGVmdCB0aGUgY29tcGFueSwgcmVtb3ZlIGhpcyBuYW1lIGZy
b20gbWFpbnRhaW5lcnMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8
cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0zMi10aW1lcnMueWFtbCB8IDEgLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiAKPiBMZWUgaW5kaWNhdGVkIGhlIHdh
cyBnb2luZyB0byBwaWNrIHRoaXMgb25lIHVwLCBzbzoKPiAKPiBBY2tlZC1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KClNpbmNlIHlvdSBhbHJlYWR5IG1lcmdlZCB0aGUgdHJlZXdp
ZGUgcGF0Y2gsIHlvdSBtYXkgYXMgd2VsbCB0YWtlCnRoaXMgdG9vLiAgV2UnbGwgd29yayB0aHJv
dWdoIGFueSBjb25mbGljdHMgdGhhdCBtYXkgb2NjdXIgYXMgYQpyZXN1bHQuCgpBY2tlZC1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNl
Ym9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
