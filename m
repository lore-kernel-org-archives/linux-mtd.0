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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4808EC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 17:24:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B79610CE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 17:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1B79610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=INpH2+KRplnaZhvRd6CQUiKLpfVMNg3ttb2EKAq2UYw=; b=Xo/pEmzXGW1tZ423Z57C1YhUEK
	91dEOAK3jYKZLfSbfR4pAVj65xmcv8S2ADlvLEck2g1XxCV5WkRFqfvPRHH36UZWF+fgWo0h3lVwv
	zRDThYFSQDQKae1Sxu/FA5W6HDc2AZWT8r7S43MSeo4vMrgbui9b985NY+7MnNwSvw6iKMrUj386T
	3EAxT25Jk3vlpa3ishUx8ll+VLGg5sWosoXQQH5rn5u2cY3P3yMtQfCapYBqpXoH9/YjfYU2y9v5N
	2WHDCfTgEpJuZCu3Q9M5VcXqda+iSU1BasfI7D1akKM8WctcAXqzjINk3GBnaqxlUaAEvzJ/KBjPJ
	8JmzmFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGPIN-006IFv-HY; Wed, 18 Aug 2021 17:24:07 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGPIL-006IF4-AV
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 17:24:06 +0000
Received: by mail-lf1-x12b.google.com with SMTP id i28so6223036lfl.2
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GAv6SuF4eSj8Jq3W6VuB4wY+Y7DhAYK2C8cvnt48BwA=;
 b=OfKnmZ3T9Qb8HI5W7GPWXDlieZS0O8KzL+vFnG3wV003wkNIM7zLIcbMPaZV9yYF1Y
 cMOjm0MheLL2CRrIs8DC2K9N1eVCWCaDsVSSikNKN2DkxTSyD7OhYYBAImKT9/HMCkap
 Gr9Y+wK7NSOmC8NjxIznaaozosxtoumPvLwtjwYFV2WhONfGechAcboi0jMsRkdmWexs
 dJkGtU3UNsZlMMt0vkVQBATO80wkY01UPa7V13WGnrzYHtoeNT3GK6eR7oqd5xSSYvpt
 UbvMRFNwmdAjvxcYwYj5Bn415TPmyl/Gw0zEoqGhTt7a1uBUd5w/QJWfR+p+qExVRY3y
 fwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GAv6SuF4eSj8Jq3W6VuB4wY+Y7DhAYK2C8cvnt48BwA=;
 b=qE9FihHKEQxX0Smuuvu5FFFB7Qbo3+2sTArJn/+9w3eHJCTruzp0Odo6FligqeMQbc
 KS0ya3W9PBNE8qoS+EPXr8jBS3Rg6j5kHU2pU1CJjVRyxiLmDA7DBZ+jTacHp+PpNals
 O/h7dXzNpHhs9XOfsKoTMbG43KLm+HpwSHZPpR7D3DOlmq0XePu/+MY6giTPV7i/t30F
 Cp9U/FcPyauNccxPvOYsEy3/mv8D6Qi34XhctVk/CxEEtWiSlpQPpUDncgequNB8uPE4
 QxQKzgNsev0y+IexLHPXWBlEQf7L83lVmMQUOyQOuaUaGkgeLUTrq57j1IsBK1qWQHMT
 303w==
X-Gm-Message-State: AOAM533cZ7b2JbyIEt1Bs3i56VsB+2rbc/PL6RAyZixur2SOJqlMJN0G
 FcXfGlJNvdcQqTdcEIByce0=
X-Google-Smtp-Source: ABdhPJz2totLY2glZaQrN56jcVR6UJ865rvHiBaSqRD7LPq8+CU52UR+LaQb1/rmqGyWq/hbRnECbg==
X-Received: by 2002:a05:6512:21d1:: with SMTP id
 d17mr7501000lft.588.1629307443410; 
 Wed, 18 Aug 2021 10:24:03 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id 3sm47300ljq.136.2021.08.18.10.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 10:24:03 -0700 (PDT)
Subject: Re: [PATCH v8 11/34] gpu: host1x: Add runtime PM and OPP support
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-12-digetx@gmail.com>
 <CAPDyKFrax-EYtO03W5QWM2tcWLWeMM8hHZCRYFcsenuiP2zObQ@mail.gmail.com>
 <YRvBkyfFCqthBIBV@orome.fritz.box>
 <CAPDyKFp+9Bv3EVSnV683ixNXzukJtmG_QrS5C1ZQqLxv9QJ-bQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e2ab73d3-c543-5c5d-5b51-6ff42446907c@gmail.com>
Date: Wed, 18 Aug 2021 20:24:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFp+9Bv3EVSnV683ixNXzukJtmG_QrS5C1ZQqLxv9QJ-bQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_102405_410391_55BD6D3D 
X-CRM114-Status: GOOD (  15.01  )
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

MTguMDguMjAyMSAxMTozNSwgVWxmIEhhbnNzb24g0L/QuNGI0LXRgjoKPiBUaGFua3MgZm9yIGNs
YXJpZnlpbmchIEFzIEkgc2FpZCwgZmVlbCBmcmVlIHRvIGlnbm9yZSBteSBjb21tZW50cyB0aGVu
Lgo+IAo+IEZvciB0aGlzIGFuZCB0aGUgb3RoZXIgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzLCBJIGFz
c3VtZSB5b3Ugb25seSBuZWVkCj4gdG8gY2FyZSBhYm91dCB3aGV0aGVyIHRoZSBkcml2ZXIgaXMg
YSBjcm9zcyBTb0MgZHJpdmVyIGFuZCB1c2VkIG9uCj4gb3RoZXIgcGxhdGZvcm1zIHRoYW4gVGVn
cmEgdGhlbi4KClllcywgYW5kIGFsbCBkcml2ZXJzIHRvdWNoZWQgYnkgdGhpcyBzZXJpZXMgYXJl
IFRlZ3JhLW9ubHkgZHJpdmVycy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
