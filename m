Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1835C77B61
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Apr 2023 05:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44jaTMcO2wjW5IzulculgdAFrIV/GPFtOZjxUgk/1vU=; b=MahyVqVGZvc+sV
	P02C+lWs06hYlxmR0/5WfKcfVjnNCQYe8KuJPm3i9+NNHJvmrmOLJcQleffbzgFjVFcT43DjkO5lN
	9MBAZCTDbHd9hpjapqAht6OdJ5cCGhXY7f/5ulxJ633iYu3ODE3oGA1ZHlhENHS0Is1IJi/hozEVX
	YkKfxZ1oA9BKe89PtZzWGa+vJsxvRzKgw6yf2o5f/hXPt+AoJUTm8nNV2n2xtHdGlQQeXQTTCyOFz
	/xrStq5/jHkkFhG9qN1kIRwQofAggtdq9GCVPpqpJJGRfM1RGbu6QUVc7HVqnpHMnQxKv5dQl7I5o
	EaLUSkCd6Z8+Xcv7NMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plkDW-00EboW-15;
	Mon, 10 Apr 2023 05:37:26 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plkDP-00EbmI-16
	for linux-mtd@lists.infradead.org;
	Mon, 10 Apr 2023 05:37:22 +0000
Received: by mail-ej1-x634.google.com with SMTP id j17so494196ejs.5
        for <linux-mtd@lists.infradead.org>; Sun, 09 Apr 2023 22:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681105036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/k4nezMOkcM+h2CDII7+REb1p1LqwOaOkMYQqqQJrs=;
        b=whrLD5VxYI35os9KEqHHxKa9Pszo5bo/r3L1orZhvpTq+fxiO2jOFNxbUlcI0Vs3GI
         p3RauP4xFlUGVo8P+SU0FAjx22bxvxCcnObAMYYRyICpZgnhTXjhA5DCU6ygFH4gKuyO
         eXbdDoA7p3M07jbTtohEJ2v/Tz9VjHr6a0oJvdDrr7ejrHUVk++XAtzWb+z2In6SL2Gl
         t5tXQY/ajlwSp4Lah8lGP7hewVhzXVhK5MgiJIM1jDOC3z+GFlsAzATc7ylW+X+YH8So
         id2qKF0m1S0qz2zyvyjFzxEpK2HPsFYVayvCP8RJW7o40S1Tl79GVKw4kmsvRGVPv8gK
         DGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681105036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/k4nezMOkcM+h2CDII7+REb1p1LqwOaOkMYQqqQJrs=;
        b=QYsD6sx1N9sCm27lcHHF3E5fpdfg+a2kCmm+wZMx2fYmQlXFM5/f8LdCCrtlitZ2M2
         N/0W57JHm4rto+oC1wSD8FQ4vEr5eSGySwpOn2g7/m+9umwEltnPGRpnlD8NRmyv/KwQ
         p+jaFLMA7/KXRfGwpcEfAri8Mb9MpiMG9Q6lMt2rfXY51G1d6iGcChRbcvtaprsc8EdK
         y0EvHcxvJn5hHm0IzbFmxK+nL5SgnHGUuTL4yqXG/WBNR5r9SPCDc9IVeys2se9w+t7z
         +F44dugLPHlTFGqpWIXuPCjjiLQJvPxB9oihWon791chwDbPXS7N9b/Ddhfs5iWUQMVK
         MSeQ==
X-Gm-Message-State: AAQBX9d4Gtn/9wbIbPULC0gu+8GGJSf3OgLAegAz+yNm2XmgdK9HdUcK
	jSFHO6VpMPgf+o2nIOTvq4Ipag==
X-Google-Smtp-Source: AKy350YTLowzB2oBTshKq4rUG1CwxaDQBrenUjB20X2/2en11DizxiRt7NJuVWdjlDxpJZAqRXbXzA==
X-Received: by 2002:a17:906:a043:b0:94b:5921:69f9 with SMTP id bg3-20020a170906a04300b0094b592169f9mr200904ejb.64.1681105036100;
        Sun, 09 Apr 2023 22:37:16 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id r13-20020a170906350d00b0094b0f3886b0sm104670eja.76.2023.04.09.22.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 22:37:15 -0700 (PDT)
Message-ID: <5d091ef6-0f4c-dbf6-fb73-f9f9d13af3d8@linaro.org>
Date: Mon, 10 Apr 2023 06:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] mtd: nand: Convert to platform remove callback returning
 void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lucas Stach <dev@lynxeye.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Miaoqian Lin <linmq006@gmail.com>,
 Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Liang Yang <liang.yang@amlogic.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-amlogic@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Yang Yingliang <yangyingliang@huawei.com>, Jack Wang <jinpu.wang@ionos.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, kernel@pengutronix.de,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Vladimir Zapolskiy <vz@mleia.com>,
 Roger Quadros <rogerq@kernel.org>, Wang Weiyang <wangweiyang2@huawei.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Stephen Boyd <sboyd@kernel.org>, Valentin Korenblit
 <vkorenblit@sequans.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park
 <kyungmin.park@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-oxnas@groups.io, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230407101043.299f5e22@xps-13>
 <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230409_223719_432223_A07D20E2 
X-CRM114-Status: GOOD (  16.51  )
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

CgpPbiA0LzgvMjMgMTk6NTMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IFRoZSAucmVtb3Zl
KCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1h
a2VzCj4gbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRv
IGRvIGVycm9yIGhhbmRsaW5nIGJ5Cj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIg
dGhlIHZhbHVlIHJldHVybmVkIGlzIChtb3N0bHkpIGlnbm9yZWQKPiBhbmQgdGhpcyB0eXBpY2Fs
bHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFrcy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlzIGEK
PiBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBm
aXJzdCBzdGVwIG9mIHRoaXMKPiBxdWVzdCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvIC5y
ZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5zCj4gdm9pZC4KPiAKPiBUcml2aWFsbHkg
Y29udmVydCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVt
b3ZlCj4gY2FsbGJhY2sgdG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4gCj4gQWNrZWQt
Ynk6IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4KPiBSZXZpZXdl
ZC1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gUmV2aWV3ZWQtYnk6
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KPiBBY2tlZC1ieTog
TWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4K
PiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBn
b29nbGVtYWlsLmNvbT4KPiBBY2tlZC1ieTogUm9nZXIgUXVhZHJvcyA8cm9nZXJxQGtlcm5lbC5v
cmc+Cj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlk
ZXIuYmU+Cj4gUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4g
QWNrZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+Cj4gQWNr
ZWQtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KCmI0
IHNlZW1zIGRpZG4ndCB0YWtlIG15IHRhZyBvbiAwMC80OSwgaGVyZSBpdCBpcyBhZ2FpbjoKQWNr
ZWQtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
