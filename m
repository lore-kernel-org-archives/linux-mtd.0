Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163C9EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTmssWjjmYizPBdjWhrkuGQpt9IbAp/us3YIeegNM2c=; b=x3C+3aOkUPxgiR
	OfnjlR4kh1Cib0rv/gc5+OpPsIgxr3JS+RwRk6XCVtNIK0dV5NpcI5m4jFH8IHHo6V5vleuPTf+r4
	UotzN3t/0HZ5416NWbhuAp8/8cM141iddPBYF9on3H32HIKY4bvXe3cWiUgVhU1xLHOcoaoVIkmKT
	Cser+J/R4gFNWtxXcA0ITP7JeYcJQPEYjsx/EUwX4+9Atv0JN7MXscfHlY5D+W4yJ5WY4VsUEo+Of
	TtgcUbLXZmXXBQMAHfS7HKVwZKfVRKdsCQThP2oeqExTrGBEi7gL03z3jeZH4Cq1r3238g0+Y1NUV
	r2NLiOOgbcKcm5C1g92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM07a-005Rk0-1h;
	Wed, 19 Jul 2023 05:53:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM07Z-005RjR-0X;
	Wed, 19 Jul 2023 05:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Y1QDj1E+S2bjPPGCPFdmDsT3gCqQuKHXgAf2a6PrB3E=; b=dH7iKLdHxa3TJXLvWEUU+CCtHG
	NU0kQOSIRYjL/DifW5bh3HMx/zzE3PaOEyE7lh/SwKtHHv7SRjJUm4oF1TGX8iZCiJi/Qww5YH/9e
	kyk2+EgCh2aI2t/VO7VIfaZ7OgBFnzQ6hXk5otVRGqGc7/Xk4wdKfeY3sOKWiAcNABfcqMXlkvp9V
	4pMMdIscLYDaAG89VOuFwLhQU9lOAqXonlQJQGrgb2Lv2qIzD/JTJy7iqXqaCgMBnSfjWjuXOpn2V
	nOg6XjHnP9lMjYxnpDEPhqiH65A7+7v87CZ/UfsNGpXjPxGmiq2g/ofMrPK6riJ1sqipDBMLIAIer
	/oBnkTEQ==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLf1K-00BFu5-37;
	Tue, 18 Jul 2023 07:21:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb5bcb9a28so8462817e87.3;
        Tue, 18 Jul 2023 00:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689664809; x=1692256809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1QDj1E+S2bjPPGCPFdmDsT3gCqQuKHXgAf2a6PrB3E=;
        b=XLpqkx/8N+f9aL66iAO4XAc89p9osxV7uu0ZqsyeRuMT4WOEnOlfUxj8GbFX4gEcY7
         cmQ5fYgkyqNDpwovIzaJAE3TYH7aSiAY5VG0meewNNzbaAUu5EaM8jadqiG9ZIxt8WkH
         Dz5Wa+qEBe6jQD09zPibdBeoGRnE/sTNzbn42rGQJ9PVOh1x5LzTEO4yedoXofgo5eFQ
         KuGIkdKxeINxScrJFBi22nrBsED9IknOsqSFxrCgMqZxiUdu7WgZs1LJuL63IoOJJuPq
         aH9XK5MpDV2L2h3Zd29U/vHUUcmr0Nb7ZNRI8TEZ+HH+Eak4QSPvsUrRq9Bx6pIjVCtR
         di/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689664809; x=1692256809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1QDj1E+S2bjPPGCPFdmDsT3gCqQuKHXgAf2a6PrB3E=;
        b=VDeS9l7MKjJXZr4gdlZR0xZipac4Jvfir4O6EUkQrM3x2zRsuPN0DnL2V9Wmjnxwe5
         Kc85u+pqxWMNzxevGSI1brfRVG28hqTkd4Cx7isC/dAPlHzSV+HAqqFLXOgFDwv1QJRY
         sI0ZgLfFnuJIzbgrpt9W/cACXUYldPt01A8gNCEXOmtVRYAOcuRp/C1eJVCRZ1MTc8An
         WxeKnCGm4io+WD0X734blSlfIVu/BnaqkAZPGqMQ2Li6F5sM9VlLjDzWNvwmT9LJntv6
         Mn/wlN1Bf3sCXw2++kKDeP1cPZ6v1Z9oX/rH8g7Z8ELCIfiUeDo2dwkH2r+uV23XJ9S3
         QIEw==
X-Gm-Message-State: ABy/qLYUvBL0KkWMTE2gd//buNNigB9PXE5bad228WiLVwTtUINdEPww
	qwFUKzSWT/xbE0V8nFm84r8=
X-Google-Smtp-Source: APBJJlH+TWJF5L0ovMggt0/CS2enPlkz+KJw4saqvvcdbjYHJU4i8zA1AJzt6j7rP+36JcEKeZhfYg==
X-Received: by 2002:a05:6512:3a88:b0:4fb:925f:8be1 with SMTP id q8-20020a0565123a8800b004fb925f8be1mr11403669lfu.45.1689664808795;
        Tue, 18 Jul 2023 00:20:08 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id 22-20020ac24856000000b004fbb3e91a3fsm299048lfy.114.2023.07.18.00.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 00:20:08 -0700 (PDT)
Message-ID: <b5124f4a-6a7a-3fd9-32d6-e0690a45c7e8@gmail.com>
Date: Tue, 18 Jul 2023 09:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V4] nvmem: add explicit config option to read old syntax
 fixed OF cells
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, Michael Walle <michael@walle.cc>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230403225540.1931-1-zajec5@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230403225540.1931-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_082119_130455_1C3D8A4C 
X-CRM114-Status: GOOD (  17.01  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiA0LjA0LjIwMjMgMDA6NTUsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPiBCaW5kaW5n
IGZvciBmaXhlZCBOVk1FTSBjZWxscyBkZWZpbmVkIGRpcmVjdGx5IGFzIE5WTUVNIGRldmljZSBz
dWJub2Rlcwo+IGhhcyBiZWVuIGRlcHJlY2F0ZWQuIEl0IGhhcyBiZWVuIHJlcGxhY2VkIGJ5IHRo
ZSAiZml4ZWQtbGF5b3V0IiBOVk1FTQo+IGxheW91dCBiaW5kaW5nLgo+IAo+IE5ldyBzeW50YXgg
aXMgbWVhbnQgdG8gYmUgY2xlYXJlciBhbmQgc2hvdWxkIGhlbHAgYXZvaWRpbmcgaW1wcmVjaXNl
Cj4gYmluZGluZ3MuCj4gCj4gTlZNRU0gc3Vic3lzdGVtIGFscmVhZHkgc3VwcG9ydHMgdGhlIG5l
dyBiaW5kaW5nLiBJdCBzaG91bGQgYmUgYSBnb29kCj4gaWRlYSB0byBsaW1pdCBzdXBwb3J0IGZv
ciBvbGQgc3ludGF4IHRvIGV4aXN0aW5nIGRyaXZlcnMgdGhhdCBhY3R1YWxseQo+IHN1cHBvcnQg
JiB1c2UgaXQgKHdlIGNhbid0IGJyZWFrIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkhKS4gVGhhdCB3
YXkgd2UKPiBhZGRpdGlvbmFsbHkgZW5jb3VyYWdlIG5ldyBiaW5kaW5ncyAmIGRyaXZlcnMgdG8g
aWdub3JlIGRlcHJlY2F0ZWQKPiBiaW5kaW5nLgo+IAo+IEl0IHdhc24ndCBjbGVhciAodG8gbWUp
IGlmIHJ0YyBhbmQgdzEgY29kZSBhY3R1YWxseSB1c2VzIG9sZCBzeW50YXgKPiBmaXhlZCBjZWxs
cy4gSSBlbmFibGVkIHRoZW0gdG8gZG9uJ3QgcmlzayBhbnkgYnJlYWthZ2UuCgppcyB0aGVyZSBh
bnkgY2hhbmNlIEkgY2FuIGhhdmUgdGhpcyBhY2NlcHRlZCAvIHB1c2hlZCwgcGxlYXNlPwoKSXQn
cyBhIHRpbnkgb3B0aW1pemF0aW9uIGFuZCBpdCBtYWtlcyBzdXJlIHBlb3BsZSBkb24ndCB1c2Ug
ZGVwcmVjYXRlZApzeW50YXggd2l0aCBuZXcgZHJpdmVycy4KCkkgYWxzbyBub3RpY2VkIHRoaXMg
d2lsbCBwcm9iYWJseSBsZXQgbWUgZHJvcCBhbiB1bmNsZWFyIGFuZApub24taW50dWl0aXZlIG5v
X29mX25vZGUgY29uZmlnIG9wdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
