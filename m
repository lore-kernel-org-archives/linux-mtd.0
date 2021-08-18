Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C6EC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 02:05:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC11761042
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 02:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC11761042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k7B0PDTXO9Xfy7LFbOxmy6uKhc2BZYnoHBCw0jFlQtw=; b=xPitc+PebEFdCdOmJnJw9mUZ3X
	w53COhnfW94GOReDM/yYxZS+B+bCCRXi/g0sd4kQJl6eGpbSPTGSL7jmxerHVrJSz5y+pPxZkrYsD
	nHrguugZCa30BPNy7PkSzgr2AnoSClTJzuQxh5Wrvjoto4GoVHIeQL+DH9x16iTi7+c64+BVVcieA
	/FKJJuVsiZ3JAEeNvKAntgSLXoxmEL7cX5WzHiDIcM5IJB+WMgJKY5FVYmVKRh06C6124b3d9cyn5
	aG3MgCFePgqyDm+hOdo/cFvR77zMVHJkJGqetSmotoy6WwoBzMQA4Y6iPKyyj0O7GwR46dABw93Dy
	uF3yiFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGAx0-003va1-If; Wed, 18 Aug 2021 02:05:06 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGAwx-003vZA-Lg
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 02:05:04 +0000
Received: by mail-lf1-x12b.google.com with SMTP id z2so1237781lft.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 19:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X8+ZsfkkdhFJ3lNlK7e7T4FVUdx6tvIJ9KJHYwNXX0E=;
 b=psE/+Zb/PlhPOXdD9k7AaCLwlvP8OKK2CxCpqtTva5uF/wv+Xtz6ZZdtrMlAsRQDtg
 7rJ1+OFJG70Mh6foE8c/wWZu0py55FepYDWxIbDuoVTxTgBuzT8ZcFjpgV0uw7z0bwOq
 i9HHUiAj3Xqbast6UUZ8gmBgbXw0U4LpmOyNFm67RejtBHQP2jypUFUUKW0xIcMgMKcL
 ChJSL/bQlQM0gRznLB21YUo8/DgwCsLyw/I/zDvt4ajeJqQnSAPqYHVtMBJYBP0KBvdo
 65wfts0XEWuHOf4x7WBr50M1S1Ive7NyVGoWeMXJtbq5mjMMdP45+6N1n0CRVKczG1XI
 jxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X8+ZsfkkdhFJ3lNlK7e7T4FVUdx6tvIJ9KJHYwNXX0E=;
 b=LLYpLKDEqfs+inC4z/TTOAkSzKWZNTFc6cFwJ1X6tXFTsAXs7ELIknTI4qlKTa0Rv4
 5YOvBGE3C3ESqGFzHjxFgIyjtfm5xPdYt8yDUfUCqu6fri938lpMxVtxbZlrwovutzYs
 zdRVsYgdR+Qt8+S7wCyPLmsQBboqh+ENQ91/Vvr/SXFgJNz7H1joubLgO6fE15NIySZJ
 cXxMO4haUEAbesowIw8XG9eacpRl6ZwCvRp0B8LEChOsXBUCLuzjxBwUYYegnznAVZmO
 UeoGxTrkQKIUmxxVDkdmsTzkBl5IwRxkHACkipDLdrwHzc9t3nm0Ij8O8axQXY0/UtYz
 GYGg==
X-Gm-Message-State: AOAM530HhjI5hfwGuQSgh/MNc+84uvtrXT9BOGK/qwX27XVZnx+Cp3Be
 CgLaum3cY+9T6ZcNO3/erHM=
X-Google-Smtp-Source: ABdhPJwwMJ2c/iB7oqJvPztbQr932HvMGogZlivLLNy//t0lEE4kjZGF01UFpJ8GCXlQsFh175I2Fw==
X-Received: by 2002:a05:6512:3771:: with SMTP id
 z17mr4806675lft.46.1629252301306; 
 Tue, 17 Aug 2021 19:05:01 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id z7sm350800lft.302.2021.08.17.19.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 19:05:00 -0700 (PDT)
Subject: Re: [PATCH v8 09/34] dt-bindings: host1x: Document Memory Client
 resets of Host1x, GR2D and GR3D
From: Dmitry Osipenko <digetx@gmail.com>
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
 <fa9a1fb7-8a87-de1a-e40a-fdc4f4d05d57@gmail.com>
Message-ID: <9deced25-b184-7b5b-cebf-0ad82bd959db@gmail.com>
Date: Wed, 18 Aug 2021 05:04:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fa9a1fb7-8a87-de1a-e40a-fdc4f4d05d57@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_190503_739515_CC1000A2 
X-CRM114-Status: GOOD (  18.39  )
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

MTguMDguMjAyMSAwNDozNywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTguMDguMjAy
MSAwNDoxNiwgUm9iIEhlcnJpbmcg0L/QuNGI0LXRgjoKPj4gT24gVHVlLCBBdWcgMTcsIDIwMjEg
YXQgMDQ6Mjc6MjlBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gTWVtb3J5IENs
aWVudCBzaG91bGQgYmUgYmxvY2tlZCBiZWZvcmUgaGFyZHdhcmUgcmVzZXQgaXMgYXNzZXJ0ZWQg
aW4gb3JkZXIKPj4+IHRvIHByZXZlbnQgbWVtb3J5IGNvcnJ1cHRpb24gYW5kIGhhbmdpbmcgb2Yg
bWVtb3J5IGNvbnRyb2xsZXIuCj4+Pgo+Pj4gRG9jdW1lbnQgTWVtb3J5IENsaWVudCByZXNldHMg
b2YgSG9zdDF4LCBHUjJEIGFuZCBHUjNEIGhhcmR3YXJlIHVuaXRzLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gIC4u
Li9iaW5kaW5ncy9kaXNwbGF5L3RlZ3JhL252aWRpYSx0ZWdyYTIwLWhvc3QxeC50eHQgICAgICAg
ICAgfCA0ICsrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Rl
Z3JhL252aWRpYSx0ZWdyYTIwLWhvc3QxeC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS90ZWdyYS9udmlkaWEsdGVncmEyMC1ob3N0MXgudHh0Cj4+PiBpbmRl
eCA2Mjg2MWE4ZmI1YzYuLjA3YTA4NjUzNzk4YiAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RlZ3JhL252aWRpYSx0ZWdyYTIwLWhvc3Qx
eC50eHQKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3RlZ3JhL252aWRpYSx0ZWdyYTIwLWhvc3QxeC50eHQKPj4+IEBAIC0xOCw2ICsxOCw3IEBAIFJl
cXVpcmVkIHByb3BlcnRpZXM6Cj4+PiAgLSByZXNldHM6IE11c3QgY29udGFpbiBhbiBlbnRyeSBm
b3IgZWFjaCBlbnRyeSBpbiByZXNldC1uYW1lcy4KPj4+ICAgIFNlZSAuLi9yZXNldC9yZXNldC50
eHQgZm9yIGRldGFpbHMuCj4+PiAgLSByZXNldC1uYW1lczogTXVzdCBpbmNsdWRlIHRoZSBmb2xs
b3dpbmcgZW50cmllczoKPj4+ICsgIC0gbWMKPj4+ICAgIC0gaG9zdDF4Cj4+Cj4+IE5ldyBlbnRy
aWVzIHNob3VsZCBiZSBhdCB0aGUgZW5kLiBPcmRlciBtYXR0ZXJzLgo+IAo+IEluZGVlZCwgb3Jk
ZXIgbWF0dGVycy4gSW4gdGhpcyBjYXNlIGl0IG1hdHRlcnMgYnkgdGhlIGhhcmR3YXJlIGJlY2F1
c2UKPiBtZW1vcnkgcmVzZXQgbXVzdCBiZSBhc3NlcnRlZCBiZWZvcmUgdGhlIGNvbnRyb2xsZXIn
cyByZXNldC4gV2UgcmVseSBvbgo+IGl0IGluIHRoZSBjb2RlIG9mIHRoZSBHRU5QRCBkcml2ZXIu
IEhlbmNlIGl0J3MgdGhlIGludGVuZGVkIG9yZGVyIGluCj4gdGhpcyBwYXRjaC4KPiAKCkFsdGhv
dWdoLCBteSBiYWQuIEl0IHNob3VsZCBiZSB0byByZW9yZGVyIGl0ZW1zIGhlcmUsIGl0J3Mgbm90
IGEgR0VOUEQKYmluZGluZy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
