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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154BEC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 17:17:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9F12610CD
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 17:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9F12610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K1L/jSl13CRkbfPM5nvTEiCqhXkIisNmsAe27NvhKZ0=; b=j2CME5u//IXCXxXZkQawk0vxiw
	CKXp+jlN1FxVdLH5ybZyn6zCSNCvPGJ8nqHdafKiQwNRHsNyPwhxdeoIF/SOBSoLim1YUrJbMXQOU
	bVHLGbQQmTvGZufa2HwaZme7Xco2XqCcnbriKSWfX+vg9mXH+1jrMFnhNgnMnY+eQzKBTEiaxCU9v
	rTF61edupAlNSeprr41+EUX/P9GuTDooWjvYfH97PAYSpJk4wDpAjHaAl1wwu4QbO+5VNKJsRaKWL
	5v/yTlBYKzeTaFmI5GNfLqhNTjbMyfsnraQUz2eOVVSr3f6YfOeFOF2B/yF/FY8XudLCdh5cxxjTM
	q9f7vO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGPBQ-006HCu-Vk; Wed, 18 Aug 2021 17:16:57 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGPBN-006HAX-Od
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 17:16:55 +0000
Received: by mail-lf1-x129.google.com with SMTP id i28so6180067lfl.2
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 10:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vgNL/YukxMg7bm55oBtvyONH8Uy1dCmXD+rKl0KJZ+4=;
 b=aWNGgcB8z2InDXr6LAdvdaoW2x8CYeUuWHd3AgCWJbOwgyDZbX1SSdtkZCd9LRZU1v
 IfB7jsJ5WNoNiPAd71m4tqa31eFIV1XWJVkfosfkA2c8iOpOAgHnxOP+Umk6tnLPaeuD
 zFTYiqQcf3UIWIFj2bsQWT3aHs/7ok0x1oWwrXbsCuJZ6+Dey8Y6WST/bdI/u6vAMVWp
 htf6YIaZFo8BnuwLljU/vOB2BDRZawuqyS/nEBvAZbttcyYj5o5xKI9Dqb+FfMPcy4Q4
 olMMp0EmD83m0Qh7UjqjOn1UF1IMJlXK3kbyDPrL8jwSvvrERW8PV9J+29gQn2e5QIgO
 hO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vgNL/YukxMg7bm55oBtvyONH8Uy1dCmXD+rKl0KJZ+4=;
 b=iP5HF/750pT7SFYKvMnn/nt9A+tzNdvMlv2bP2ZaZaxrrJn7B/F41/AynQTMco8RMG
 W+6jqiUYndxHIb2YBW+otFkkY6SOOhoYz+br/HfQe6Bu/jCPht9ohOm06gVeZqh1vlBE
 3Q3nGM7HNKAYEPaCHgHkMPawRPRiqUClku0e6KmO4UHpzmwG54j2OVNoyoaBn6YaGnjL
 b+H2smTyzCDwbV06g60UNlDaDIRBoVUZhp80yHTS63eNPLv3vnLiE4/8LgBLlhRYIVoD
 j1KpKCCYTCN45M/h8Keb0LCbkhdXxuPYg6S1ZN//a+JdqO9hMQUzqL2xOLFPofx5d5++
 43XQ==
X-Gm-Message-State: AOAM5315vOwamR23lHOpjYAZko0pN9n7ItL6OpgcCY5Z4zQb77E7kISU
 BT+i/U1QSgeNieOfP5WIH0Q=
X-Google-Smtp-Source: ABdhPJwSW+uafqBwt0YKcEZ0LBXy3yeuH6y6xXlHWB8hnmrEnK92Pi4r+On9LLiAT6Vq9yxNJiR3Yg==
X-Received: by 2002:ac2:5105:: with SMTP id q5mr305235lfb.102.1629307010475;
 Wed, 18 Aug 2021 10:16:50 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id d7sm46016ljq.112.2021.08.18.10.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 10:16:49 -0700 (PDT)
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
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
 <20210817012754.8710-7-digetx@gmail.com> <YR0SSz7KMh7TwaFW@orome.fritz.box>
 <eff5ef47-e6e0-3e03-cf1a-d931b0f2dc2a@gmail.com>
 <YR033zuYWWLCeYpM@orome.fritz.box>
 <a5b942cb-1611-9ae1-6e89-4b68fdaf03e3@gmail.com>
Message-ID: <a0222ddc-e83f-98d9-c9f1-8edb0ee47c03@gmail.com>
Date: Wed, 18 Aug 2021 20:16:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a5b942cb-1611-9ae1-6e89-4b68fdaf03e3@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_101653_831199_9BB0BBDD 
X-CRM114-Status: GOOD (  15.60  )
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

MTguMDguMjAyMSAxOTo1NywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+Pj4gQWxzbywg
SSBkb24ndCB0aGluayB0aGUgdGVncmEtIHByZWZpeCBpcyBuZWNlc3NhcnkgaGVyZS4gVGhlIHBh
cmVudCBub2RlCj4+Pj4gaXMgYWxyZWFkeSBpZGVudGlmaWVkIGFzIFRlZ3JhIHZpYSB0aGUgY29t
cGF0aWJsZSBzdHJpbmcuCj4+Pj4KPj4+PiBJbiB0aGUgY2FzZSBvZiBDQVIsIEknZCBpbWFnaW5l
IHNvbWV0aGluZyBsaWtlOgo+Pj4+Cj4+Pj4gCWNsb2NrcyB7Cj4+Pj4gCQlzY2xrIHsKPj4+PiAJ
CQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZvcHBfdGFibGU+Owo+Pj4+IAkJCXBvd2VyLWRvbWFp
bnMgPSA8JmRvbWFpbj47Cj4+Pj4gCQl9Owo+Pj4+IAl9Owo+Pj4+Cj4+Pj4gTm93IHlvdSd2ZSBv
bmx5IGdvdCB0aGUgYmFyZSBtaW5pbXVtIGluIGhlcmUgdGhhdCB5b3UgYWN0dWFsbHkgYWRkLiBB
bGwKPj4+PiB0aGUgb3RoZXIgZGF0YSB0aGF0IHlvdSB1c2VkIHRvIGhhdmUgaXMgc2ltcGx5IGRl
cml2ZWQgZnJvbSB0aGUgcGFyZW50Lgo+Pj4gJ2Nsb2NrcycgaXMgYWxyZWFkeSBhIGdlbmVyaWMg
a2V5d29yZCBpbiBEVC4gSXQncyBwcm9iYWJseSBub3Qgb2theSB0bwo+Pj4gcmVkZWZpbmUgaXQu
Cj4+ICJjbG9ja3MiIGlzIG5vdCBhIGdlbmVyaWMga2V5d29yZC4gSXQncyB0aGUgbmFtZSBvZiBh
IHByb3BlcnR5IGFuZCBnaXZlbgo+PiB0aGF0IHdlJ3JlIHRhbGtpbmcgYWJvdXQgdGhlIGNsb2Nr
IHByb3ZpZGVyIGhlcmUsIGl0IGRvZXNuJ3QgbmVlZCBhCj4+IGNsb2NrcyBwcm9wZXJ0eSBvZiBp
dHMgb3duLCBzbyBpdCBzaG91bGQgYmUgZmluZSB0byB1c2UgdGhhdCBmb3IgdGhlCj4+IG5vZGUu
Cj4gSSdtIGN1cmlvdXMgd2hhdCBSb2IgdGhpbmtzIGFib3V0IGl0LiBSb2IsIGRvZXMgdGhpcyBz
b3VuZCBva2F5IHRvIHlvdT8KCkkgYXNzdW1lIGR0LXNjaGVtYSB3b24ndCBiZSBoYXBweSB3aXRo
IGEgZGlmZmVyZW50IG1lYW5pbmcgZm9yIHRoZSAnY2xvY2tzJy4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
