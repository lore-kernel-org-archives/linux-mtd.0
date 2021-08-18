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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37E5C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 17:11:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F3D3610CB
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 17:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F3D3610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bubyvGShmm9y3B6PJZObLXc+mGoovvTqNsf/YaEKOp8=; b=tREe2dhJ3d1WY66KosnbM2GwdG
	z8krPz8nK3pYZmVv3Er9G4Sx76q9xxZOkW2KuBJVp7Nc6l8PawSuRGHn5nOamtpCYMSWoNI3nCIvh
	fbz0ZKjhfdJD6viTUut6NUt6KGlw0BB0zhjFWhm9/x7rFVf+1NgWdggU6vXtLMpqFfNwQHYjyUOL3
	L5NTIXZT6zFpSkg+/5mW3jWFL/5ENWWQIrCX+v2+d7CA0/3vknotVTlgPU2R4ZVdwu22xVnWN8Cdz
	ORZ6gyaEvgfqK9lU3D7tqQCleU2ckjWOpRjssOFbWzgIgXYDsKbLJvXT05sjDstX4L7b1QB+LGMnT
	d1AsPYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGP5r-006GR1-IK; Wed, 18 Aug 2021 17:11:11 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGP5n-006GPH-Db
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 17:11:09 +0000
Received: by mail-lf1-x135.google.com with SMTP id x27so6120244lfu.5
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 10:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jqE9ClhGb0c32X3v7BncGGF0woKsX2XgQIGx9qgWIH0=;
 b=pzxMEO2UMuT/mHPfPLSjCbX3ZOkDKV6nZIXJP5/zPjCNpAmYvVuFYDC5xhuzIXGAng
 k06Q5T/VtECFuIzWKjrForzIl4lzYGT5926+k7EPC9XdDRz2131oKSvSnQpNDCIjUZeV
 vAmDMRNzl3coOfWSZz4CU+fD10VCYBpA5I6tzFaCdMPL/E4hBdGPJ8T64iETHNj36g5/
 4Zr7nRwBnt0A/FIqmj1kKX08k9xT8d+vmEYX1QK+8VovTTlsqt2R6xS22Go2zElhhlPR
 euQHMQkRAQQ2VSVWBb0NpqmpPCycMssSiywU+Zr1oEUGDcugw9A5VFVSxFxuj21XbpAw
 m+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jqE9ClhGb0c32X3v7BncGGF0woKsX2XgQIGx9qgWIH0=;
 b=Ueyp6UhIblmZZa0a6LLIDnvIzoxOq72Qw/D7K/DRtXMLUtsKLUYGafgV1irdHUw4Ao
 Hhh6fxsMXgSVFad3EOSVcY68Qo5J7IBABK2FX5FPNw0n4ZgycMy071YTLL4deXrqusTu
 3JH8r0qNH7IcZ4JUCJKYEDinleQOm/7F7HR176DksMMvgaIqXIg2IUrd6g9hnuLvOK3t
 tC2+EMcXtaf4qdPfb2Hi6QgCRp4HNMF1PBuHliyPUgFc34X31sEAzcZO8L0zv5g8E1ra
 x0cezLWeM2UjoWK/AYbPGbMiPDE9PGfLottLg5XfYO7eJj8AAMlEa25mViFfgD2FRuTQ
 YFhA==
X-Gm-Message-State: AOAM533hu7vPzKiafLwTRHDCuZB4JL9uE0+a6Zbak7yunlqnlW/+Snna
 /xu88uGS9yOTsoGar6MzW/o=
X-Google-Smtp-Source: ABdhPJx8mXn6y5y5nU5HWp3Gqd9IJG4zaBOIqyrwTbYskADisL9LhAfipeaTsyrerunkulv/neb4gw==
X-Received: by 2002:a05:6512:2149:: with SMTP id
 s9mr6957434lfr.365.1629306664851; 
 Wed, 18 Aug 2021 10:11:04 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id x191sm25857lff.29.2021.08.18.10.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 10:11:04 -0700 (PDT)
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
To: Thierry Reding <thierry.reding@gmail.com>
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
 <20210817012754.8710-8-digetx@gmail.com> <YR0UBi/ejy+oF4Hm@orome.fritz.box>
 <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
 <YR04YHGEluqLIZeo@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ad99db08-4696-1636-5829-5260f93dc681@gmail.com>
Date: Wed, 18 Aug 2021 20:11:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR04YHGEluqLIZeo@orome.fritz.box>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_101107_488609_31772428 
X-CRM114-Status: GOOD (  23.34  )
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

MTguMDguMjAyMSAxOTo0MiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBXZWQsIEF1
ZyAxOCwgMjAyMSBhdCAwNjowNToyMVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDE4LjA4LjIwMjEgMTc6MDcsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+PiBPbiBUdWUs
IEF1ZyAxNywgMjAyMSBhdCAwNDoyNzoyN0FNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+PiBbLi4uXQo+Pj4+ICtzdHJ1Y3QgY2xrICp0ZWdyYV9jbGtfcmVnaXN0ZXIoc3RydWN0IGNs
a19odyAqaHcpCj4+Pj4gK3sKPj4+PiArCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7Cj4+
Pj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBOVUxMOwo+Pj4+ICsJc3RydWN0IGRldmljZV9ub2Rl
ICpucDsKPj4+PiArCWNvbnN0IGNoYXIgKmRldl9uYW1lOwo+Pj4+ICsKPj4+PiArCW5wID0gdGVn
cmFfY2xrX2dldF9vZl9ub2RlKGh3KTsKPj4+PiArCj4+Pj4gKwlpZiAoIW9mX2RldmljZV9pc19h
dmFpbGFibGUobnApKQo+Pj4+ICsJCWdvdG8gcHV0X25vZGU7Cj4+Pj4gKwo+Pj4+ICsJZGV2X25h
bWUgPSBrYXNwcmludGYoR0ZQX0tFUk5FTCwgInRlZ3JhX2Nsa18lcyIsIGh3LT5pbml0LT5uYW1l
KTsKPj4+PiArCWlmICghZGV2X25hbWUpCj4+Pj4gKwkJZ290byBwdXRfbm9kZTsKPj4+PiArCj4+
Pj4gKwlwZGV2ID0gb2ZfcGxhdGZvcm1fZGV2aWNlX2NyZWF0ZShucCwgZGV2X25hbWUsIE5VTEwp
Owo+Pj4+ICsJaWYgKCFwZGV2KSB7Cj4+Pj4gKwkJcHJfZXJyKCIlczogZmFpbGVkIHRvIGNyZWF0
ZSBkZXZpY2UgZm9yICVwT0ZcbiIsIF9fZnVuY19fLCBucCk7Cj4+Pj4gKwkJa2ZyZWUoZGV2X25h
bWUpOwo+Pj4+ICsJCWdvdG8gcHV0X25vZGU7Cj4+Pj4gKwl9Cj4+Pj4gKwo+Pj4+ICsJZGV2ID0g
JnBkZXYtPmRldjsKPj4+PiArCXBtX3J1bnRpbWVfZW5hYmxlKGRldik7Cj4+Pj4gK3B1dF9ub2Rl
Ogo+Pj4+ICsJb2Zfbm9kZV9wdXQobnApOwo+Pj4+ICsKPj4+PiArCXJldHVybiBjbGtfcmVnaXN0
ZXIoZGV2LCBodyk7Cj4+Pj4gK30KPj4+Cj4+PiBUaGlzIGxvb2tzIHdyb25nLiBXaHkgZG8gd2Ug
bmVlZCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIG9iamVjdHMgZm9yIGVhY2gKPj4+IG9mIHRoZXNl
IGNsb2Nrcz8gVGhhdCdzIGdvaW5nIHRvIGJlIGEgbWFzc2l2ZSBhbW91bnQgb2YgcGxhdGZvcm0g
ZGV2aWNlcwo+Pj4gYW5kIHRoZXkgd2lsbCBjb21wbGV0ZWx5IG1lc3MgdXAgc3lzZnMuCj4+Cj4+
IFJQTSB3b3JrcyB3aXRoIGEgZGV2aWNlLiBJdCdzIG5vdCBhIG1hc3NpdmUgYW1vdW50IG9mIGRl
dmljZXMsIGl0J3Mgb25lCj4+IGRldmljZSBmb3IgVDIwIGFuZCBmb3VyIGRldmljZXMgZm9yIFQz
MC4KPiAKPiBJJ20gc3RpbGwgbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoeSB3ZSBuZWVkIHRvIGNh
bGwgUlBNIGZ1bmN0aW9ucyBvbiBhCj4gY2xvY2suIEFuZCBldmVuIGlmIHRoZXkgYXJlIGZldywg
aXQgc2VlbXMgd3JvbmcgdG8gbWFrZSB0aGVzZSBwbGF0Zm9ybQo+IGRldmljZXMuCgpCZWZvcmUg
Y2xvY2sgaXMgZW5hYmxlZCwgd2UgbmVlZCB0byByYWlzZSBjb3JlIHZvbHRhZ2UuIEFmdGVyIGNs
b2NrIGlzCmRpc2FibGVkLCB0aGUgdm9sdGFnZSBzaG91bGQgYmUgZHJvcHBlZC4gQ0NGK1JQTSB0
YWtlcyBjYXJlIG9mIGhhbmRsaW5nCnRoaXMgZm9yIHVzLgoKPiBQZXJoYXBzIHRoZXkgY2FuIGJl
IHNpbXBsZSBzdHJ1Y3QgZGV2aWNlOnMgaW5zdGVhZD8gSWRlYWxseSB0aGV5IHdvdWxkCj4gYWxz
byBiZSBwYXJlbnRlZCB0byB0aGUgQ0FSIHNvIHRoYXQgdGhleSBhcHBlYXIgaW4gdGhlIHJpZ2h0
IHBsYWNlIGluCj4gdGhlIHN5c2ZzIGhpZXJhcmNoeS4KCkNvdWxkIHlvdSBwbGVhc2UgY2xhcmlm
eSB3aGF0IGRvIHlvdSBtZWFuIGJ5ICdzaW1wbGUgc3RydWN0IGRldmljZTpzJz8KVGhlc2UgY2xv
Y2sgZGV2aWNlcyBzaG91bGQgYmUgT0YgZGV2aWNlcyB3aXRoIGEgb2Zfbm9kZSBhbmQgZXRjLApv
dGhlcndpc2Ugd2UgY2FuJ3QgdXNlIE9QUCBmcmFtZXdvcmsuCgpXZSBkb24ndCBoYXZlIGRyaXZl
ciBmb3IgQ0FSIHRvIGJpbmQuIEkgZ3Vlc3Mgd2UgY291bGQgdHJ5IHRvIGFkZCBhCidkdW1teScg
Q0FSIGRyaXZlciB0aGF0IHdpbGwgY3JlYXRlIHN1Yi1kZXZpY2VzIGZvciB0aGUgcnBtLWNsb2Nr
cywgaXMKdGhpcyB3aGF0IHlvdSdyZSB3YW50aW5nPwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
