Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66027C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:38:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03A1761051
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03A1761051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6etmyhvsBwPUcUL6UR/hcGR6MVVOWzkAP49/hG/Y9MA=; b=low1AIO8ymFmKHXQ8CbB68bUxu
	i0D6mpb8skD2DbxcGU+Wxxscqyy7rtu/gTcNvzCcUasxq/jDJdelrXDMdu1d5nK/iRn6GeVKD6UPq
	6AaSry/hBwIMob0unbn0Pv38xC1sYB7+2CA/nJTn2UXNbmQb/ls8lV493RvqY78jvjh87i9+YS4l8
	+NPdeEOu3XfTv3fJ5YpAKn3x0F2Uk4+K8NOgRpPHnE9Mvp9rZlbIZz8PFCNYHk3k/ftA85hmg6EOh
	PX3vJT/K8PoPfRcjBgXDdxPhWHnYtO/ShBsvSLAxFQIxbC64JMu9nQWNPt3pvDx0v7pZ3xe1d5cxD
	g7WOyTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGAWI-003ttU-NS; Wed, 18 Aug 2021 01:37:30 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGAWF-003tsA-PG
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 01:37:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id z2so1115541lft.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 18:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oqxDNn5HuSgDYxtU1DC9Dd6JFHUoPgcSzl8BngM0suw=;
 b=tH07Ag8eiBTNGPOIyiICGem/XAlGbrx9wzA1AYXo5k0KS9zDRDkRtCVqSG5jFzW2VO
 GjAu9tNgXKNtwAzjnF/jHaAKn3t9S2/BI/ubLCao4tYBfnPsNCQfKpg5NbRkjXPFfl89
 o2AFA8APp2Hb5BZhl84unBgpnMCH8jZKxkejm1GjOdyNjXG4drZ4cuhx3rMCgcFD6NUP
 PbFOcLMGACtfUZ2JeTEXxuvnXov1sCN/Toqiy/qwb8+yrYekuN1OEWngV0f+9HB2mVTI
 IJdr97jZuur2MRVfVSk2iXaYSGLsNIixSiM5hkfvafyYXNZKmo6LxpEEX8DqogXnEx3D
 VoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oqxDNn5HuSgDYxtU1DC9Dd6JFHUoPgcSzl8BngM0suw=;
 b=RM6/vgjQxpt/Whm6EQ/HyIjX03AO18XYHMgC/rO0AgT0g8w4Ej3x6tDx+joVLQZFfo
 Xa4g8jhV3OOaFKDXTT5wygvB8OcorF/EEVl2Gb/9dy+khTYYG+vEygfMFCk24Wo6ksmT
 N1pz1jM+8ZLXKGUNuOfs1mOqUhAFfjK62MtTneO6Z7cTV+TP90taX1212LbhVJX21/1+
 rekWgjTniFvIcQZE/LltGcLf+LTR5gJ76Kw9ScuLRmvYQFNf+WlftVo55umHtTbP6vH2
 6kKp9RKPckYz5wIdnqqjkhE+BFhuq04HsFN/QQsA+0duZ+UFFIT32Ykp1aOzKcRuEvhA
 LH2w==
X-Gm-Message-State: AOAM5317WM03Bs4ZuGfPWUoihz7eENI3ZUQPJ8kWm88RJyH+2R7bVLA/
 RTPncpCQIV5BRCY/GQj7Gbw=
X-Google-Smtp-Source: ABdhPJzO8yX4UrQj2zwLBNG/ezqRBlNp4JuMFF5+U48En2dYUq2KE3FpodsT/MFV5XUcHXk+BK/l0g==
X-Received: by 2002:a05:6512:3441:: with SMTP id
 j1mr4537443lfr.388.1629250645475; 
 Tue, 17 Aug 2021 18:37:25 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id d25sm409518lja.31.2021.08.17.18.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 18:37:24 -0700 (PDT)
Subject: Re: [PATCH v8 09/34] dt-bindings: host1x: Document Memory Client
 resets of Host1x, GR2D and GR3D
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-10-digetx@gmail.com>
 <YRxfWJJ6+1GgVs33@robh.at.kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fa9a1fb7-8a87-de1a-e40a-fdc4f4d05d57@gmail.com>
Date: Wed, 18 Aug 2021 04:37:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRxfWJJ6+1GgVs33@robh.at.kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_183727_867383_4AFECBFB 
X-CRM114-Status: GOOD (  18.67  )
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

MTguMDguMjAyMSAwNDoxNiwgUm9iIEhlcnJpbmcg0L/QuNGI0LXRgjoKPiBPbiBUdWUsIEF1ZyAx
NywgMjAyMSBhdCAwNDoyNzoyOUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IE1l
bW9yeSBDbGllbnQgc2hvdWxkIGJlIGJsb2NrZWQgYmVmb3JlIGhhcmR3YXJlIHJlc2V0IGlzIGFz
c2VydGVkIGluIG9yZGVyCj4+IHRvIHByZXZlbnQgbWVtb3J5IGNvcnJ1cHRpb24gYW5kIGhhbmdp
bmcgb2YgbWVtb3J5IGNvbnRyb2xsZXIuCj4+Cj4+IERvY3VtZW50IE1lbW9yeSBDbGllbnQgcmVz
ZXRzIG9mIEhvc3QxeCwgR1IyRCBhbmQgR1IzRCBoYXJkd2FyZSB1bml0cy4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4gIC4u
Li9iaW5kaW5ncy9kaXNwbGF5L3RlZ3JhL252aWRpYSx0ZWdyYTIwLWhvc3QxeC50eHQgICAgICAg
ICAgfCA0ICsrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RlZ3Jh
L252aWRpYSx0ZWdyYTIwLWhvc3QxeC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS90ZWdyYS9udmlkaWEsdGVncmEyMC1ob3N0MXgudHh0Cj4+IGluZGV4IDYy
ODYxYThmYjVjNi4uMDdhMDg2NTM3OThiIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90ZWdyYS9udmlkaWEsdGVncmEyMC1ob3N0MXgudHh0
Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RlZ3Jh
L252aWRpYSx0ZWdyYTIwLWhvc3QxeC50eHQKPj4gQEAgLTE4LDYgKzE4LDcgQEAgUmVxdWlyZWQg
cHJvcGVydGllczoKPj4gIC0gcmVzZXRzOiBNdXN0IGNvbnRhaW4gYW4gZW50cnkgZm9yIGVhY2gg
ZW50cnkgaW4gcmVzZXQtbmFtZXMuCj4+ICAgIFNlZSAuLi9yZXNldC9yZXNldC50eHQgZm9yIGRl
dGFpbHMuCj4+ICAtIHJlc2V0LW5hbWVzOiBNdXN0IGluY2x1ZGUgdGhlIGZvbGxvd2luZyBlbnRy
aWVzOgo+PiArICAtIG1jCj4+ICAgIC0gaG9zdDF4Cj4gCj4gTmV3IGVudHJpZXMgc2hvdWxkIGJl
IGF0IHRoZSBlbmQuIE9yZGVyIG1hdHRlcnMuCgpJbmRlZWQsIG9yZGVyIG1hdHRlcnMuIEluIHRo
aXMgY2FzZSBpdCBtYXR0ZXJzIGJ5IHRoZSBoYXJkd2FyZSBiZWNhdXNlCm1lbW9yeSByZXNldCBt
dXN0IGJlIGFzc2VydGVkIGJlZm9yZSB0aGUgY29udHJvbGxlcidzIHJlc2V0LiBXZSByZWx5IG9u
Cml0IGluIHRoZSBjb2RlIG9mIHRoZSBHRU5QRCBkcml2ZXIuIEhlbmNlIGl0J3MgdGhlIGludGVu
ZGVkIG9yZGVyIGluCnRoaXMgcGF0Y2guCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
