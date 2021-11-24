Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A80C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Nov 2021 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HzDQ4Mekk6YCUFMsfBzYk5Z+Uxrln4FOBi5Sv2BrDSM=; b=XGcuN4vQGo+M7YVbBBaYCYgFrY
	ndVEEalz9Gef8FeaieZQsACXn1lQxdVksbFrw24fOH9bkCLWtIvKZeYMuxW8jTGadsLo3DjQ5K8BW
	8NIa/iNmQckHxxeO+ouDEweYRWN61jIR4RzHiCuDQUPfvB+jWOrYZ+eArwnV7wGF5tzo/5ifJNazm
	UUlSELa2tEaJlO44jWAOi/9axiancl6gxG63SIGOF76iru9zKEeaEuPcmpbJ/wOPaNxchYb3JU26S
	4t6+4il+abZOtJcM8cjBDT1sojqtSDu8E+7SUqQp3DghlrsAv9IWMCqpdEt0Mh0t6jTnwUQPKREda
	RDT2P5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpwFF-005Q1v-HZ; Wed, 24 Nov 2021 17:39:45 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpwFC-005Q0S-68; Wed, 24 Nov 2021 17:39:43 +0000
Received: by mail-lf1-x129.google.com with SMTP id n12so9329090lfe.1;
 Wed, 24 Nov 2021 09:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6KwYnqzzoTeuVNxhHsajzRe6liKfZ7vCZOdko2MKcYY=;
 b=lvNbpNKcqOAj74UHrS6XpdHcUjOf2sCIzeJURasqmwDotEWhqg+OtI1hIqfxXw53rO
 z4tIfWJ15SJPCQPQEYpaz/zmC2AtWtLFdcPfiSvbidZ8Exl9V8VhaqU9R2npHpy4tYc0
 yoAFhsyR/tm1sxMO7gFsD63QuHkm+jfTl/BAb0mYaTiKTxDGqN4kFZjH9jZeyYnQTnDY
 +iO2QczJQHUVcBKOsIBMpcFVHI8R1BvISIqundwfmbO8Omwr++T3KiO2VqAHQJyXOIWo
 3aZgsvReXTiUAJF/ECnq/pwPQIvxcyAQtmtfpSjrZuVeY4POAqNgnpvX5T/RJZH9Gntm
 5JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6KwYnqzzoTeuVNxhHsajzRe6liKfZ7vCZOdko2MKcYY=;
 b=aOXUEN0MDRwROldXhaonNxp76+wWm0nvHDO8qkgFwPR/7D+xB5QJmLoCldD2u2TkM9
 Y7dvKqTRcPqWykp6SZmrpznGT34Inj0ioSKJr8k911vJeuqBKlxpmeVdslP2D2CvAma7
 VBLhQM6TIHvjWxPdX0W5jM+VMI1on1S0p8rSrTm0ku5l0ZiIkEprzfSgJEKQFlXFki6w
 hhCbBpHVtYXDvM6UTp4OWNNfZq7+PAbBHXIpgweoarGOVpiUJIZD56ovIfWZHDVtWC6f
 wrwfqw508he1GfpTjpIcP7yy+u1ps+R/cr600A5ZY0/qw+M0PNk4OUMl6N/oyaBkom9p
 6hGQ==
X-Gm-Message-State: AOAM5331JxmOQjJUsICcmLp+OLInZwvl+faZJ0PTPkbz+Q+kyNpKZHUi
 aQmO/garjtfL8lCK8fEPPQA=
X-Google-Smtp-Source: ABdhPJzMAN6+EU9Pjecu2Hl3ZC50CFEhc3UzlNKlYPHJ5/rwKJi/3grC00PRL2kx8I9BrVZVbuLcvw==
X-Received: by 2002:a19:c350:: with SMTP id t77mr16616753lff.152.1637775579976; 
 Wed, 24 Nov 2021 09:39:39 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id q5sm44228lfu.18.2021.11.24.09.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 09:39:39 -0800 (PST)
Subject: Re: [PATCH v2 01/11] ASoC: tegra20-spdif: stop setting slave_id
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>,
 Jon Hunter <jonathanh@nvidia.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Orson Zhai
 <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, alsa-devel@alsa-project.org,
 bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-tegra@vger.kernel.org
References: <20211122222203.4103644-1-arnd@kernel.org>
 <20211122222203.4103644-2-arnd@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b5c9ece3-c702-26b8-347a-f6d9bed2c5db@gmail.com>
Date: Wed, 24 Nov 2021 20:39:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122222203.4103644-2-arnd@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_093942_254141_54028DA3 
X-CRM114-Status: GOOD (  23.94  )
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

MjMuMTEuMjAyMSAwMToyMSwgQXJuZCBCZXJnbWFubiDQv9C40YjQtdGCOgo+IEZyb206IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gVGhlIERNQSByZXNvdXJjZSBpcyBuZXZlciBz
ZXQgdXAgYW55d2hlcmUsIGFuZCBwYXNzaW5nIHRoaXMgYXMgc2xhdmVfaWQKPiBoYXMgbm90IGJl
ZW4gdGhlIHByb3BlciBwcm9jZWR1cmUgaW4gYSBsb25nIHRpbWUuCj4gCj4gQXMgYSBwcmVwYXJh
dGlvbiBmb3IgcmVtb3ZpbmcgYWxsIHNsYXZlX2lkIHJlZmVyZW5jZXMgZnJvbSB0aGUgQUxTQSBj
b2RlLAo+IHJlbW92ZSB0aGlzIG9uZS4KPiAKPiBBY2NvcmRpbmcgdG8gRG1pdHJ5IE9zaXBlbmtv
LCB0aGlzIGRyaXZlciBoYXMgbmV2ZXIgYmVlbiB1c2VkIGFuZAo+IHRoZSBtZWNoYW5pc20gZm9y
IGNvbmZpZ3VyaW5nIERNQSB3b3VsZCBub3Qgd29yayBhcyBpdCBpcyBpbXBsZW1lbnRlZCwKPiBz
byB0aGlzIHBhcnQgd2lsbCBnZXQgcmV3cml0dGVuIHdoZW4gdGhlIGRyaXZlciBnZXRzIHB1dCBp
bnRvIHVzZQo+IGFnYWluIGluIHRoZSBmdXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgc291bmQvc29jL3RlZ3JhL3RlZ3JhMjBf
c3BkaWYuYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvdGVncmEvdGVncmEyMF9zcGRpZi5jIGIvc291bmQvc29jL3RlZ3Jh
L3RlZ3JhMjBfc3BkaWYuYwo+IGluZGV4IDlmZGM4MmQ1OGRiMy4uMWMzMzg1ZGE2ZjgyIDEwMDY0
NAo+IC0tLSBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTIwX3NwZGlmLmMKPiArKysgYi9zb3VuZC9z
b2MvdGVncmEvdGVncmEyMF9zcGRpZi5jCj4gQEAgLTI4NCw3ICsyODQsNiBAQCBzdGF0aWMgaW50
IHRlZ3JhMjBfc3BkaWZfcGxhdGZvcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgCXNwZGlmLT5wbGF5YmFja19kbWFfZGF0YS5hZGRyID0gbWVtLT5zdGFydCArIFRFR1JB
MjBfU1BESUZfREFUQV9PVVQ7Cj4gIAlzcGRpZi0+cGxheWJhY2tfZG1hX2RhdGEuYWRkcl93aWR0
aCA9IERNQV9TTEFWRV9CVVNXSURUSF80X0JZVEVTOwo+ICAJc3BkaWYtPnBsYXliYWNrX2RtYV9k
YXRhLm1heGJ1cnN0ID0gNDsKPiAtCXNwZGlmLT5wbGF5YmFja19kbWFfZGF0YS5zbGF2ZV9pZCA9
IGRtYXJlcS0+c3RhcnQ7Cj4gIAo+ICAJcG1fcnVudGltZV9lbmFibGUoJnBkZXYtPmRldik7Cj4g
IAo+IAoKUmV2aWV3ZWQtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
