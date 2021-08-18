Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4B1C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:45:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2544960F38
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2544960F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ac61ylEZgPkLQz03CmMlUG21nC2XhPI1/EPCCL+2bPw=; b=tvH3BarF9hZBskEDksapUrLJsR
	5h+mfNaLW+h+WwOtIYy9Lsc9Dfw1OS6bCkrlnKNGxGTALHy6Oclut8VJ3wDQ/dQqZCIkz6XjbW+R9
	hQf1z7J0w9VTwm71jhuvp5ILGuuO2dOdvpBASMaBUpF4ut9tlPGfnyR+p1voBTETGxz32Q1wCJc1r
	tGp47M/+OPWd4E/XnQS6Oal/6Zi/Ag0yi3lleDff12W/iaAWnGb8oAab6GU77VACDxE12Pur6claW
	pnXJ8YNmrqr9ul5/gHwCnOA+JCdCZ76uJXjsqdnTR/Rq9B9eWkUkhemY0RlKL9ZL8NHhacA/RR0ML
	r0G66GMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGAdA-003uQT-IT; Wed, 18 Aug 2021 01:44:36 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGAd7-003uPl-RA
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 01:44:35 +0000
Received: by mail-lj1-x22c.google.com with SMTP id h9so2038629ljq.8
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 18:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XoDVcVB/VE1dBlO9x4lpVsT9geXPOq4o0WU/0sRPebc=;
 b=Gmnqy4jfwBqsDu9LBGxLpx1nvtIhZFSGaBcJVbAwo50K4s+mgQjS0okbtwsUutyxB8
 crURnbnyrk/mMjC5uyqR+Vc4wyXpn+d+boHXA+Xp1BhvXFshKYhg804UtoJM30j71C4u
 J2Oi65VGe0ZWSvpPAE+ZMPCxHmZODECsKuoOcPsZnVV2NTW6mY508lzEbTu7b+WV31F0
 mOmEp6hyujXqYoE04beg1akt/TvZfGMnEmyffvJhfR2jN5IueeSUVfQm+Kv43WgZBbPE
 A1/FPF7q3EFR+MQEP/OCrx/s1N0zxIrfUMfTscncRBAeQA/ySJ/MFa/6tQu2m5wzNNQY
 1kEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XoDVcVB/VE1dBlO9x4lpVsT9geXPOq4o0WU/0sRPebc=;
 b=X3xWlF7IplrgYUIKhkNsvVrYfyt/FNXtB394QEUVJ2hjfXQBimpNtlCHPsqiy/evt9
 FoxcGniVoQBvaQjXuaVM7WebIOWxvKAv9aTwzXOgknM9lq1Mow0tInzsDZq2EtEYEBkV
 FBTOB2fmTFNbR7DNYnETr/3u6L+T5ElQGSr1wNfNoNyyLeBsySP/kfuZUtlcf7DEBHOi
 vbDsHmigyA0gjIXTQkLvMXfd4pXdFxv+NBylKMBJ1drawDJU88B1wonnPvMIqTTiN9PA
 GR5bdYJ/928IGMjj1Lq0t9JQpZPEf+aqBQ/sGJyjUjHOGGm+jdac4GzYADPODT2rAZBR
 UdEA==
X-Gm-Message-State: AOAM533jzLcvcytpYE29vZIJx97zGY0lPjWxKVfQfu+Vzc9U7v1vFE1O
 ubZcy8oaVqswbF48ovPjC6c=
X-Google-Smtp-Source: ABdhPJzBCF6cJbZHRHPrIUVUUUZ+kASYBl6l8+zSZcW0/IKHSG28sW6dmnWvQHlNaXqEE5KMF+anLw==
X-Received: by 2002:a2e:5307:: with SMTP id h7mr5878272ljb.154.1629251072136; 
 Tue, 17 Aug 2021 18:44:32 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id y14sm288752ljm.39.2021.08.17.18.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 18:44:31 -0700 (PDT)
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
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
 <20210817012754.8710-7-digetx@gmail.com>
 <YRxfGtWPXeSQXuHo@robh.at.kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <06128217-92e1-9b66-64ea-91855d041121@gmail.com>
Date: Wed, 18 Aug 2021 04:44:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRxfGtWPXeSQXuHo@robh.at.kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_184433_938237_ED81B214 
X-CRM114-Status: GOOD (  13.89  )
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

MTguMDguMjAyMSAwNDoxNSwgUm9iIEhlcnJpbmcg0L/QuNGI0LXRgjoKPj4gKyAgdGVncmEtY2xv
Y2tzOgo+PiArICAgIGRlc2NyaXB0aW9uOiBjaGlsZCBub2RlcyBhcmUgdGhlIG91dHB1dCBjbG9j
a3MgZnJvbSB0aGUgQ0FSCj4+ICsgICAgdHlwZTogb2JqZWN0Cj4+ICsKPj4gKyAgICBwYXR0ZXJu
UHJvcGVydGllczoKPj4gKyAgICAgICJeW2Etel0rWzAtOV0rJCI6Cj4+ICsgICAgICAgIHR5cGU6
IG9iamVjdAo+PiArICAgICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgICAgIGNvbXBhdGlibGU6
Cj4+ICsgICAgICAgICAgICBhbGxPZjoKPj4gKyAgICAgICAgICAgICAgLSBpdGVtczoKPj4gKyAg
ICAgICAgICAgICAgICAgIC0gZW51bToKPj4gKyAgICAgICAgICAgICAgICAgICAgICAtIG52aWRp
YSx0ZWdyYTIwLXNjbGsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAtIG52aWRpYSx0ZWdyYTMw
LXNjbGsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAtIG52aWRpYSx0ZWdyYTMwLXBsbGMKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAtIG52aWRpYSx0ZWdyYTMwLXBsbGUKPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAtIG52aWRpYSx0ZWdyYTMwLXBsbG0KPj4gKyAgICAgICAgICAgICAgLSBj
b25zdDogbnZpZGlhLHRlZ3JhLWNsb2NrCj4gWW91IGFyZSBzYXlpbmcgdGhlIGZpcnN0IHN0cmlu
ZyBtdXN0IGJlIGJvdGggb25lIG9mIHRoZSBlbnVtcyBhbmQgCj4gJ252aWRpYSx0ZWdyYS1jbG9j
aycuIFlvdSBkb24ndCBnZXQgYW4gZXJyb3IgYmVjYXVzZSB5b3VyIHBhdHRlcm4gCj4gZG9lc24n
dCBtYXRjaCAnc2NsaycuCj4gCgpDb3VsZCB5b3UgcGxlYXNlIHJlcGhyYXNlIG9yIGNsYXJpZnk/
IElmIHBhdHRlcm4gZG9lc24ndCBtYXRjaCAnc2NsaycsCnRoZW4gaXQgbXVzdCBtYXRjaCBhbnkg
b3RoZXIgZW51bS4gSSdtIG5vdCBzdXJlIHdoYXQgeW91J3JlIG1lYW5pbmcuCgpUaGUgJ252aWRp
YSx0ZWdyYS1jbG9jaycgYWN0dWFsbHkgY291bGQgYmUgcmVtb3ZlZCBzaW5jZSBpdCdzCnN1cGVy
Zmx1b3VzIG5vdy4gSSdsbCBjb25zaWRlciB0aGUgcmVtb3ZhbCBpbiB2OS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
