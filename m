Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B15BC54FCB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 10:05:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E8182071E
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 10:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tlUoULYO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xAChQZOc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E8182071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bozYYnsc6WE+wOYvce0zGmM/xFm/zfB/GxKB9xivYPY=; b=tlUoULYO1iKxEw
	WzZoYPwLZByVWJ8i1h/4Di9ePoqskCGGvIll3NyWNGdL7aL9Xmq++cOsheE99ox+MenBonlSKII/T
	qHfmoaKV2ID/Ef4iYxJCkRWnl9dUhan7albIy9/nSGCR0s2TrsB/SnlJWwLZsZlH/BP0BVpVYRBBd
	IksNfJhAS7kU/8OXT3EMBjNDAKylro/+pStMrk/VhM8won1jPczaBWAaEm7XD4C2IP0W0TqfUNgre
	l6KyiBdp4abUVPww+a5/c3oeR4Ydex0r3+T0hJp9oQGNlEmqyAa1cNqRZAbfK1KgqO0tRgXxiEAAn
	YtEmTRiFXkjtl8axGlzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRvDK-00086P-GX; Fri, 24 Apr 2020 10:05:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRvDB-00082g-KL
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 10:05:38 +0000
Received: by mail-wm1-x344.google.com with SMTP id x25so9794360wmc.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2020 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9sjFX/xOuzJ1ma+dRdm2U+QjBqHkdZ65sP7ssS65XRA=;
 b=xAChQZOcypsVjlU+KN7lBfFG4SyTb5KqpLWyOQk/HBgA4pxxYLt4W8HT40QHNHXuND
 SswVB8FxgipX++pkVkNaR8M0DfByM4uDfkV53KNc4F5e6gJFsB9XHfb1TFm/2mDjj8Uc
 uHh8BI5lk8qcPlr5pEMiFvBX+jXNaT02cBtzNzPBJPh69OEV+jpcyTHpr4SdOghEoZIU
 v1OlHZN+G+JW/diBuCUtuB14n/P3lLlrOBJwuE9o3XWMMpSmq0ECmhNQ7aW/nWTD5grS
 DligmM3LZkudrG+F/7/ksSB/84dWjDY/jqXCwlo/6VXVr/o9HaXAqcqRhGuBlatN+3ph
 7fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9sjFX/xOuzJ1ma+dRdm2U+QjBqHkdZ65sP7ssS65XRA=;
 b=Mc2m73twY8ejSJ+KkMUe/b3BvJhFa+Y0OzUlWlfJoEkUWdyQ66wAtWzM4TYB1WxYh4
 uoCmVEEqCfNyZoIYwkWMcYuPiJA48Av/C6w45Q1oy98Tv1nGfsxL1JDYLVffdsXmrziW
 Cy9OGZjUcVDnI6oxFnxnfAYpXffQ5Vnl2lRm84C4BPiJgtSXHtgBBOsOYG2Y3OBI9gAG
 7asbfkCsEEqXU3TuCvrEb5QX7vEJbG+en0hRZzZ4cQhmVbM7zq21KgXXFnSf8EMDPRwQ
 B4T3IoKLacb70yGKMVmMCaOLz49ssbJRQg1gqvLhAFbrvuEUEF98tngwGR8OtaMDVWGS
 Gh2Q==
X-Gm-Message-State: AGi0Puahzvd4FCrEuwL42gfXC6779WhQY+YELYrhpUfYgzx4RVThgXfZ
 sjnkRd5YJFPfkso6H52VoIGWEw==
X-Google-Smtp-Source: APiQypJHsUUKYVh/i2dCkEYnnU0IrFg+4nLc/ppXSv5rQqfX7rU+7H/vSQrP81Cv7/oKIMPtXmJABQ==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr8759385wme.115.1587722730639; 
 Fri, 24 Apr 2020 03:05:30 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id o129sm2310857wme.16.2020.04.24.03.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 03:05:29 -0700 (PDT)
Date: Fri, 24 Apr 2020 11:05:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hadar Gat <hadar.gat@arm.com>
Subject: Re: [PATCH v3] of_device: removed #include that caused a recursion
 in included headers
Message-ID: <20200424100526.GA8414@dell>
References: <1587395080-15722-1-git-send-email-hadar.gat@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587395080-15722-1-git-send-email-hadar.gat@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_030534_582716_CD5FF787 
X-CRM114-Status: GOOD (  13.96  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Stefan Agner <stefan@agner.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, sparclinux@vger.kernel.org,
 netdev@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-samsung-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-rockchip@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Joerg Roedel <joro@8bytes.org>,
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-omap@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, freedreno@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Ofir Drang <ofir.drang@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 JC Kuo <jckuo@nvidia.com>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMCBBcHIgMjAyMCwgSGFkYXIgR2F0IHdyb3RlOgoKPiBCb3RoIG9mX3BsYXRmb3Jt
LmggYW5kIG9mX2RldmljZS5oIHdlcmUgaW5jbHVkZWQgZWFjaCBvdGhlci4KPiBJbiBvZl9kZXZp
Y2UuaCwgcmVtb3ZlZCB1bm5lZWRlZCAjaW5jbHVkZSB0byBvZl9wbGF0Zm9ybS5oCj4gYW5kIGFk
ZGVkIGluY2x1ZGUgdG8gb2ZfcGxhdGZvcm0uaCBpbiB0aGUgZmlsZXMgdGhhdCBuZWVkcyBpdC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBIYWRhciBHYXQgPGhhZGFyLmdhdEBhcm0uY29tPgo+IFJlcG9y
dGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBBY2tlZC1ieTogSm9u
YXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPiAjZm9yLWlpbwo+IEFj
a2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+ICMgY2xrCj4gLS0tCj4gdjM6
IGFkZCBpbmNsdWRlIHRvIG9mX3BsYXRmb3JtLmggaW4gbW9yZSBmaWxlcy4gKHJlcG9ydGVkIGR1
ZSBvdGhlciBidWlsZHMpCj4gdjI6IGFkZCBpbmNsdWRlIHRvIG9mX3BsYXRmb3JtLmggaW4gbW9y
ZSBmaWxlcy4gKHJlcG9ydGVkIGR1ZSBvdGhlciBidWlsZHMpCj4gCj4gIGFyY2gvc3BhcmMva2Vy
bmVsL3BjaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgYXJjaC9zcGFyYy9r
ZXJuZWwvcGNpX3NhYnJlLmMgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBhcmNoL3NwYXJj
L2tlcm5lbC9wY2lfc2NoaXpvLmMgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIGFyY2gvc3Bh
cmMva2VybmVsL3NidXMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgYXJjaC9z
cGFyYy9tbS9pby11bml0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBhcmNo
L3NwYXJjL21tL2lvbW11LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIGRy
aXZlcnMvYmFzZS9wbGF0Zm9ybS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAg
ZHJpdmVycy9idXMvaW14LXdlaW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+
ICBkcml2ZXJzL2J1cy92ZXhwcmVzcy1jb25maWcuYyAgICAgICAgICAgICAgICAgICAgIHwgMSAr
Cj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc2MjItYXVkLmMgICAgICAgICAgICAgfCAx
ICsKPiAgZHJpdmVycy9kbWEvYXRfaGRtYWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDEgKwo+ICBkcml2ZXJzL2RtYS9zdG0zMi1kbWFtdXguYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgMSArCj4gIGRyaXZlcnMvZG1hL3RpL2RtYS1jcm9zc2Jhci5jICAgICAgICAgICAgICAgICAg
ICAgfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyAgICAgICAg
ICAgICB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaS5jICAgICAgICAgICAg
ICAgICAgIHwgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jICAgICAgICAgICAg
ICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJv
Y2tjaGlwLmMgICB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jICAg
ICAgICAgICAgICAgIHwgMSArCj4gIGRyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jICAg
ICAgICAgICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9paW8vYWRjL3N0bTMyLWRmc2RtLWFkYy5j
ICAgICAgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL2lpby9hZGMvc3RtMzItZGZzZG0tY29y
ZS5jICAgICAgICAgICAgICAgIHwgMSArCj4gIGRyaXZlcnMvaW9tbXUvdGVncmEtc21tdS5jICAg
ICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2Rh
L2NvZGEtY29tbW9uLmMgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL21lbW9yeS9hdG1lbC1lYmku
YyAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCgo+ICBkcml2ZXJzL21mZC9wYWxtYXMuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIGRyaXZlcnMvbWZkL3NzYmkuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKCkFja2VkLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYyAg
ICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1zdW44aS5jIHwgMSArCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3RpL2Nw
c3cuYyAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9waHkvdGVncmEveHVzYi5j
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNj
YWxlL3BpbmN0cmwtaW14MS1jb3JlLmMgICAgIHwgMSArCj4gIGRyaXZlcnMvcGluY3RybC9ub21h
ZGlrL3BpbmN0cmwtbm9tYWRpay5jICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9zb2Mvc2Ftc3Vu
Zy9leHlub3MtcG11LmMgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL3NvYy9zdW54
aS9zdW54aV9zcmFtLmMgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIGluY2x1ZGUvbGludXgv
b2ZfZGV2aWNlLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAyIC0tCj4gIGxpYi9nZW5hbGxv
Yy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgMzYgZmlsZXMg
Y2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIApMZWUgSm9uZXMg
W+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9v
ayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
