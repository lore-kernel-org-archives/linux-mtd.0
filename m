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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D26EC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:06:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EED260462
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EED260462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J69+XlzZd5Seq/GQkf7WJk1cOMJL1zF4kQmtPS6UXHc=; b=xWeYYHGJV7Ltp6uWq1o9OeWzHE
	NISqd/b2o9OL+rLZYgUba777uj24RAZTMWUd4fbZqZMkFuI0xL8Eu210ERrHiqC4KEx+cRSgYfCST
	1mSbA1mkupcy9sErOHqVuDkK1XZsEZYuOPTVU3s5jv5+RMV8sx/MSG0qd+U0VDOpKPMzz2UhfBL7c
	aOqethIrzqGKUPHJ+eoYaG+TnnhYr3iZ/6Z+NPPtY2ASCKwMqvdV2GiVqL1pKr+61dnCpm0zhX0V4
	BPqyIS+zym2L9gWDffAzsGVCFiph1HMk0d77L5tnyLtfyOZfGId3SGMmiNSt8YaUyEqEplgUyzypG
	hYwLK7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGN8I-005yw1-Vw; Wed, 18 Aug 2021 15:05:35 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGN89-005ysi-Fx
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 15:05:26 +0000
Received: by mail-lj1-x22b.google.com with SMTP id d16so5696720ljq.4
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aGlCEyRQuTJeUoFwcMyBmvkG6HpGwGhkMF7tidyqkMk=;
 b=M87kjRAMcB8Ej6Q47lM0GYR3alWgY77tCbHd5VPt6/26s7KfdIel+RPo8tLBJ6OQC2
 kr0n4etJEbLpDf9MoZDAFN0QTsHd+9gPEMCmWM5ksKOEgb0AKvQNx3IO3PGUQ/dcG7JN
 O4q2B857vNsGgJAGFJfaf6qa2P3p02g7vMkro/0jkPEf80W+ZLE1qQc8dd9G7bfj3v+G
 QFGCPxYHx/jnAv8b2MO3kLO+ZhZTQeVsJrlw097wwbOioFBgVb4eF6Y3P5jrwoLdljs1
 UUf2sDSOV8KkpdFpAiT6PQOqUxxHhBCgd+5wUmfl+PSKIJaF6Ar2cNQGwh8AeZy87Vkj
 1qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aGlCEyRQuTJeUoFwcMyBmvkG6HpGwGhkMF7tidyqkMk=;
 b=LyORqNqzbQntTnK6pHUAAe/2TviE8c/GTlzMVJdGF4PYKwIrOdOFx522EpkQcCIyli
 x9RTeQ0VNK7QWXujPz2PBmlnXjC57UsQfOf2zJMmf5hGGqNJwk8wwDAmPqU5astbUIe1
 icUSPa86QsitmeVk40wz2EI2TVPsnXp0cO7t1we4UwJqTS3/4m6HWu8ILJL2KQG8LRZT
 IpEFomc2y3WfRKmUQzN0Z0/X8QFErXXr9Gcl3TkrHinFxTg2BGUGjeZpoq5gCAHzIMn+
 +bSftJgSGkONUUBh1aSACXjigZ3EHAMgoQZI9eX4ebr528aYgYLYgbBN2MNvoeKvV4LU
 tOZA==
X-Gm-Message-State: AOAM530hGhPG11GIr9f/BLvH7k8WJC0R5Cb4SEeBhuYpf78I0lz3QBlU
 zHS6o/aJhUZzgo3HizBobUI=
X-Google-Smtp-Source: ABdhPJzgPx8keOi8/DQzO3f7iOHun/vyL+e/2XSDlGREgL/XxAZF1WVrIsIMO5qrsaQBfPOBnrljWQ==
X-Received: by 2002:a2e:87d0:: with SMTP id v16mr8420209ljj.30.1629299123582; 
 Wed, 18 Aug 2021 08:05:23 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id h22sm11140ljk.133.2021.08.18.08.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:05:23 -0700 (PDT)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
Date: Wed, 18 Aug 2021 18:05:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR0UBi/ejy+oF4Hm@orome.fritz.box>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_080525_580835_9177ED01 
X-CRM114-Status: GOOD (  17.22  )
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

MTguMDguMjAyMSAxNzowNywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBUdWUsIEF1
ZyAxNywgMjAyMSBhdCAwNDoyNzoyN0FNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4g
Wy4uLl0KPj4gK3N0cnVjdCBjbGsgKnRlZ3JhX2Nsa19yZWdpc3RlcihzdHJ1Y3QgY2xrX2h3ICpo
dykKPj4gK3sKPj4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2Owo+PiArCXN0cnVjdCBk
ZXZpY2UgKmRldiA9IE5VTEw7Cj4+ICsJc3RydWN0IGRldmljZV9ub2RlICpucDsKPj4gKwljb25z
dCBjaGFyICpkZXZfbmFtZTsKPj4gKwo+PiArCW5wID0gdGVncmFfY2xrX2dldF9vZl9ub2RlKGh3
KTsKPj4gKwo+PiArCWlmICghb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShucCkpCj4+ICsJCWdvdG8g
cHV0X25vZGU7Cj4+ICsKPj4gKwlkZXZfbmFtZSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAidGVn
cmFfY2xrXyVzIiwgaHctPmluaXQtPm5hbWUpOwo+PiArCWlmICghZGV2X25hbWUpCj4+ICsJCWdv
dG8gcHV0X25vZGU7Cj4+ICsKPj4gKwlwZGV2ID0gb2ZfcGxhdGZvcm1fZGV2aWNlX2NyZWF0ZShu
cCwgZGV2X25hbWUsIE5VTEwpOwo+PiArCWlmICghcGRldikgewo+PiArCQlwcl9lcnIoIiVzOiBm
YWlsZWQgdG8gY3JlYXRlIGRldmljZSBmb3IgJXBPRlxuIiwgX19mdW5jX18sIG5wKTsKPj4gKwkJ
a2ZyZWUoZGV2X25hbWUpOwo+PiArCQlnb3RvIHB1dF9ub2RlOwo+PiArCX0KPj4gKwo+PiArCWRl
diA9ICZwZGV2LT5kZXY7Cj4+ICsJcG1fcnVudGltZV9lbmFibGUoZGV2KTsKPj4gK3B1dF9ub2Rl
Ogo+PiArCW9mX25vZGVfcHV0KG5wKTsKPj4gKwo+PiArCXJldHVybiBjbGtfcmVnaXN0ZXIoZGV2
LCBodyk7Cj4+ICt9Cj4gCj4gVGhpcyBsb29rcyB3cm9uZy4gV2h5IGRvIHdlIG5lZWQgc3RydWN0
IHBsYXRmb3JtX2RldmljZSBvYmplY3RzIGZvciBlYWNoCj4gb2YgdGhlc2UgY2xvY2tzPyBUaGF0
J3MgZ29pbmcgdG8gYmUgYSBtYXNzaXZlIGFtb3VudCBvZiBwbGF0Zm9ybSBkZXZpY2VzCj4gYW5k
IHRoZXkgd2lsbCBjb21wbGV0ZWx5IG1lc3MgdXAgc3lzZnMuCgpSUE0gd29ya3Mgd2l0aCBhIGRl
dmljZS4gSXQncyBub3QgYSBtYXNzaXZlIGFtb3VudCBvZiBkZXZpY2VzLCBpdCdzIG9uZQpkZXZp
Y2UgZm9yIFQyMCBhbmQgZm91ciBkZXZpY2VzIGZvciBUMzAuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
