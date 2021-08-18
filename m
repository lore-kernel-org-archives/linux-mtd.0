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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65ADC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7379361051
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7379361051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Te9pWdnbATzouj3PTDmVG3egivKXhrIcTqdNgYCnQa4=; b=Pz0GmPNUt2pGmdENibqNyNwYiD
	gZzuuF2N275hfM3zyDZKgsGslltBSQJgt3ZBLApfbTcB/Ow8H+Tp81vVoryEw6C4F50rwOZUxYDbG
	7ZQuQL+6i/yATV1FiFtxnV6gCEhx+X44LW2dR8ZAeoXDGhegp+wbZw+Hh85iamSgQ4DGafy3GILCm
	6rR5wZBc9BlvpMFD/JRVzB/cstJmuveeLQZr3LVlf9tZZAG+gvBeictbkME5VZ/v+pDTgFUZ/60Q7
	YgB4zzm2DROjH+kQ2lnJnttfDyBRva/yD1018pTm+iT1rkC5cgsB3N5tSf6yinYPyzqtzZ9xl68CV
	hW65CC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGCw1-0046J1-Ny; Wed, 18 Aug 2021 04:12:13 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGCvv-0046Ga-Bb
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 04:12:11 +0000
Received: by mail-lj1-x22f.google.com with SMTP id d16so2572560ljq.4
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 21:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dMTTYDqSJMZu388pZDsE0iPTn5UycM6CSLQvWN7EXiM=;
 b=oQvzSg1jZXl+3O5uWNXSIj0EIiigE3D8tdhxfqAYJH6UqgsCzmL3hP6cSREL6xokAp
 5KKoBF6NlIdSV51xYA8rOXF7SiPPUFEsJnNMVx/Mj1G+zfMpWhRPLIe9M8DhtO6iPc1S
 p2IPm0+QPqq1JCeEdyb3YV8sJWla7reBX08TZVdwmZTeasDkEcg8u8nsshUvr36URZPn
 TsiBBjquSJBmTUeTPM4bWFxBpZ+SJu/UDOougRzNQhHeIs1d4mB022t1K5UV5mIhOyHv
 D9ODeTS1/BkXQUvCftgq3yLT1B2G++QLewhjit+yDz2z/g1qknqoAwH4qRPZOYrgDn/j
 MmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dMTTYDqSJMZu388pZDsE0iPTn5UycM6CSLQvWN7EXiM=;
 b=GOYP5XOWEm/dpDHb52vhiYjDdA7QOox+8mZI+I4rIBU2jDr0kyQUhC1QcpDwUlRHER
 yIT/1BGF2Ib0opVwteK8mulaN3HJmVPV++94T0sSGOxlhd/bpODsEX8QTu4DlMdwxv/y
 klAgDKJnyeHoHIrKPTNkoq8FviJqgu7G3Qqm8NjFwFsuXOE9VoCBXLSGOlGNJ+k/5mbI
 wQbpVhyhytzcA41DC5972xYA9k6lr95qinhE1kA66BLLEZaWnXlna38fqD/EgIrz1Z5+
 y4+JiDqOmFfx4aPcqeIZGdNIujD4z/zdhCYhftKRpwXTY5Zj6nJKwD0vEJDOn4nQYhkj
 3iNA==
X-Gm-Message-State: AOAM532y4/qYd4CQkEI9ZhQis4T5RfsjMJ/Qa/sKI1ILzccuycSklqsU
 ylbUd1Xf0TeTUD81ZPwXaOY=
X-Google-Smtp-Source: ABdhPJygrWrrk6YBOzsJmDVVKkQ3PCLKwObyA1oxnH+eZ3W64yk1hEef6yD4M/Yl5d3DG6PdHy9Hjg==
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr5999025ljk.468.1629259925795; 
 Tue, 17 Aug 2021 21:12:05 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id m16sm373567lfh.243.2021.08.17.21.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 21:12:05 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>
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
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
Date: Wed, 18 Aug 2021 07:12:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_211207_453745_FEFE71BC 
X-CRM114-Status: GOOD (  16.33  )
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

MTguMDguMjAyMSAwNjo1NSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTctMDgtMjEs
IDE4OjQ5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDE3LjA4LjIwMjEgMTA6NTUsIFZpcmVz
aCBLdW1hciDQv9C40YjQtdGCOgo+PiAuLi4KPj4+PiAraW50IGRldl9wbV9vcHBfc3luYyhzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4+Pj4gK3sKPj4+PiArCXN0cnVjdCBvcHBfdGFibGUgKm9wcF90YWJs
ZTsKPj4+PiArCXN0cnVjdCBkZXZfcG1fb3BwICpvcHA7Cj4+Pj4gKwlpbnQgcmV0ID0gMDsKPj4+
PiArCj4+Pj4gKwkvKiBEZXZpY2UgbWF5IG5vdCBoYXZlIE9QUCB0YWJsZSAqLwo+Pj4+ICsJb3Bw
X3RhYmxlID0gX2ZpbmRfb3BwX3RhYmxlKGRldik7Cj4+Pj4gKwlpZiAoSVNfRVJSKG9wcF90YWJs
ZSkpCj4+Pj4gKwkJcmV0dXJuIDA7Cj4+Pj4gKwo+Pj4+ICsJaWYgKCFfZ2V0X29wcF9jb3VudChv
cHBfdGFibGUpKQo+Pj4+ICsJCWdvdG8gcHV0X3RhYmxlOwo+Pj4+ICsKPj4+PiArCW9wcCA9IF9m
aW5kX2N1cnJlbnRfb3BwKGRldiwgb3BwX3RhYmxlKTsKPj4+PiArCXJldCA9IF9zZXRfb3BwKGRl
diwgb3BwX3RhYmxlLCBvcHAsIG9wcC0+cmF0ZSk7Cj4+Pgo+Pj4gQW5kIEkgYW0gbm90IHN1cmUg
aG93IHRoaXMgd2lsbCBlbmQgdXAgd29ya2luZywgc2luY2UgbmV3IE9QUCB3aWxsIGJlCj4+PiBl
cXVhbCB0byBvbGQgb25lLiBTaW5jZSBJIHNlZSB5b3UgY2FsbCB0aGlzIGZyb20gcmVzdW1lKCkg
YXQgbWFueQo+Pj4gcGxhY2VzLgo+Pgo+PiBJbml0aWFsbHkgT1BQIHRhYmxlIGlzICJ1bmluaXRp
YWxpemVkIiBhbmQgb3BwX3RhYmxlLT5lbmFibGVkPWZhbHNlLAo+PiBoZW5jZSB0aGUgZmlyc3Qg
c3luYyBhbHdheXMgd29ya3MgZXZlbiBpZiBPUFAgaXMgZXF1YWwgdG8gb2xkIG9uZS4gT25jZQo+
PiBPUFAgaGFzIGJlZW4gc3luY2VkLCBhbGwgZnVydGhlciBzeW5jcyBhcmUgTk8tT1BzLCBoZW5j
ZSBpdCBkb2Vzbid0Cj4+IG1hdHRlciBob3cgbWFueSB0aW1lcyBzeW5jaW5nIGlzIGNhbGxlZC4K
Pj4KPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTQtcmM2L3NvdXJjZS9k
cml2ZXJzL29wcC9jb3JlLmMjTDEwMTIKPiAKPiBSaWdodCwgYnV0IGhvdyB3aWxsIHRoaXMgd29y
ayBmcm9tIFJlc3VtZSA/IFdvbid0IHRoYXQgYmUgYSBuby1vcCA/CgpUaGUgZmlyc3QgcmVzdW1l
IGluaXRpYWxpemVzIHRoZSBPUFAgc3RhdGUgb24gc3luYywgYWxsIGZ1cnRoZXIgc3luY3Mgb24K
cmVzdW1lIGFyZSBuby1vcHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
