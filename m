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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6ACC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 02:08:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49C9D60F22
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 02:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49C9D60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1HGNgUpmNB//wEmayQLwipK6yzKq2SVWFp0TrtjmiJU=; b=v0c4dVAfyneB6ijc/ZnOZn8G+A
	H1qSEaWTCgAWaip0yb+Ym8j6fzoHFbvcLnhQ6jGs/TEKWXTQ7acAeKez2EuMkw0TTtYkm7RTDA6N0
	xv1MT68oBJTQJsCb6cOKm6/EFWcZA2Zc+lskjx3YOilcODDiB4z/Q3yrjFbbC1KLroD5p3eJFH3qG
	tWjQhXzX6immrkpCvPBU9Yc3Xfmbn9dMIT9QHt5waX/DpmjGvfyVXBbO00pVtsLYA4PZ1MK73TUVc
	vaZYVm1IieVhT1ES6btaIy525PepP8CCOZRSZTyVJUfJKTHEaEBjN1KAHgN8fNPyTtkDeJJEzaUBN
	xuZCWrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGAzF-003vom-Gc; Wed, 18 Aug 2021 02:07:25 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGAzC-003vnr-Qu
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 02:07:24 +0000
Received: by mail-lj1-x22d.google.com with SMTP id q21so2137704ljj.6
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 19:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZdWGOBRulL4VUr2nkxtGmp68zHpJN18S3Cy3ExunZB8=;
 b=ZbJ4H3eCNv1Bvw3hVzD9YPDeNyOTQ/GmXBdTT71urRvt/nxoTwLH1fzA/K6qn+n13V
 EMyJFOcQBAXmK3unujC0pekGKV+GhAYdJyvRHdQzj7rWIPi7xVLg/WMJcPcQ5PirKj3r
 mCWcJAQa780CvmoxoDAaM90aUyQvNJACNApvjKFPAAm9WwsGGlEyD1f2fvSTTM9fYxeK
 t5Z+FLcqvZcqhqpvPAUYUBL8uyZLNwpVWq6XOlWr029EcHcHjhy6C69qNnGWOe53OGMD
 UD0ZHK+jZlCvKxlNNnLY/8mNCqP91QRuXBKGfyt7TpkAkHcvIpzE8oPTRJStoeU2i7/F
 OFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZdWGOBRulL4VUr2nkxtGmp68zHpJN18S3Cy3ExunZB8=;
 b=gPu0xctgoJNgJSDYqbg7tRB4JP0b1p59+Ks3c005ffUtKOA783TnduYyYwiaahF3v9
 Jkz7x4njiJmoG/5QIzYKYn6rU84YnfZdgSW+XrPEcq2YTJCqwlqm2ub3CJ2Cujy1zlZ8
 ZWi2BpbN7Zy2RedES4ZBFsvMivfT4qYC3HiNi2IEdpxdCrqQljyZgmaP0H9uPBK47oeA
 qtVle6AciLRdOKNTD/ytiv3m45qcvtpM2maKGzD1AehmpQXHAQqKnQ5V7Ocd0Er5CHzV
 Ja6eWNm8MIb4ehyY7x6oxg3v4bQaMyVYycty2FuKzRQ+pzVt8QBO87j14WuFwQWgPtdp
 sBIQ==
X-Gm-Message-State: AOAM531SrJi6UfL5MSaAKMmLsfJL8TQQvvsp8F3xT+pss0UzwMM3tp4Q
 iUCJ+ZytcsxTN5rUCs1bA4Q=
X-Google-Smtp-Source: ABdhPJxciZnUMzd7GVFJFA8FMA0hGtsUp4JHBzMUe6n55lLwaZhk7ErG9OStqzAcGbzrvom9TXW02A==
X-Received: by 2002:a2e:9256:: with SMTP id v22mr5752535ljg.150.1629252441273; 
 Tue, 17 Aug 2021 19:07:21 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id 27sm353157lfz.146.2021.08.17.19.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 19:07:20 -0700 (PDT)
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
 <9deced25-b184-7b5b-cebf-0ad82bd959db@gmail.com>
Message-ID: <7f35b432-d113-99fa-88ca-20601ccf7e04@gmail.com>
Date: Wed, 18 Aug 2021 05:07:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9deced25-b184-7b5b-cebf-0ad82bd959db@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_190722_918004_B503F1C9 
X-CRM114-Status: GOOD (  18.69  )
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

MTguMDguMjAyMSAwNTowNCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTguMDguMjAy
MSAwNDozNywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+IDE4LjA4LjIwMjEgMDQ6MTYs
IFJvYiBIZXJyaW5nINC/0LjRiNC10YI6Cj4+PiBPbiBUdWUsIEF1ZyAxNywgMjAyMSBhdCAwNDoy
NzoyOUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4gTWVtb3J5IENsaWVudCBz
aG91bGQgYmUgYmxvY2tlZCBiZWZvcmUgaGFyZHdhcmUgcmVzZXQgaXMgYXNzZXJ0ZWQgaW4gb3Jk
ZXIKPj4+PiB0byBwcmV2ZW50IG1lbW9yeSBjb3JydXB0aW9uIGFuZCBoYW5naW5nIG9mIG1lbW9y
eSBjb250cm9sbGVyLgo+Pj4+Cj4+Pj4gRG9jdW1lbnQgTWVtb3J5IENsaWVudCByZXNldHMgb2Yg
SG9zdDF4LCBHUjJEIGFuZCBHUjNEIGhhcmR3YXJlIHVuaXRzLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+ICAu
Li4vYmluZGluZ3MvZGlzcGxheS90ZWdyYS9udmlkaWEsdGVncmEyMC1ob3N0MXgudHh0ICAgICAg
ICAgIHwgNCArKysrCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS90ZWdyYS9udmlkaWEsdGVncmEyMC1ob3N0MXgudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGVncmEvbnZpZGlhLHRlZ3JhMjAtaG9zdDF4LnR4dAo+Pj4+
IGluZGV4IDYyODYxYThmYjVjNi4uMDdhMDg2NTM3OThiIDEwMDY0NAo+Pj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RlZ3JhL252aWRpYSx0ZWdyYTIw
LWhvc3QxeC50eHQKPj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS90ZWdyYS9udmlkaWEsdGVncmEyMC1ob3N0MXgudHh0Cj4+Pj4gQEAgLTE4LDYgKzE4
LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPj4+PiAgLSByZXNldHM6IE11c3QgY29udGFpbiBh
biBlbnRyeSBmb3IgZWFjaCBlbnRyeSBpbiByZXNldC1uYW1lcy4KPj4+PiAgICBTZWUgLi4vcmVz
ZXQvcmVzZXQudHh0IGZvciBkZXRhaWxzLgo+Pj4+ICAtIHJlc2V0LW5hbWVzOiBNdXN0IGluY2x1
ZGUgdGhlIGZvbGxvd2luZyBlbnRyaWVzOgo+Pj4+ICsgIC0gbWMKPj4+PiAgICAtIGhvc3QxeAo+
Pj4KPj4+IE5ldyBlbnRyaWVzIHNob3VsZCBiZSBhdCB0aGUgZW5kLiBPcmRlciBtYXR0ZXJzLgo+
Pgo+PiBJbmRlZWQsIG9yZGVyIG1hdHRlcnMuIEluIHRoaXMgY2FzZSBpdCBtYXR0ZXJzIGJ5IHRo
ZSBoYXJkd2FyZSBiZWNhdXNlCj4+IG1lbW9yeSByZXNldCBtdXN0IGJlIGFzc2VydGVkIGJlZm9y
ZSB0aGUgY29udHJvbGxlcidzIHJlc2V0LiBXZSByZWx5IG9uCj4+IGl0IGluIHRoZSBjb2RlIG9m
IHRoZSBHRU5QRCBkcml2ZXIuIEhlbmNlIGl0J3MgdGhlIGludGVuZGVkIG9yZGVyIGluCj4+IHRo
aXMgcGF0Y2guCj4+Cj4gCj4gQWx0aG91Z2gsIG15IGJhZC4gSXQgc2hvdWxkIGJlIHRvIHJlb3Jk
ZXIgaXRlbXMgaGVyZSwgaXQncyBub3QgYSBHRU5QRAo+IGJpbmRpbmcuCj4gCgoqIHNob3VsZCBi
ZSBmaW5lCgpJJ2xsIGNoYW5nZSBpdCBpbiB2OS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
