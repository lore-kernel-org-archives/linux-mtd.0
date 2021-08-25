Return-Path: <SRS0=OVP+=NQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE52C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Aug 2021 09:45:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D2561153
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Aug 2021 09:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49D2561153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LqnpkQ7xqBEAzAi/wj935t0O0QSaMYnG9Q7FIq5hrP4=; b=lVt1IqtW8LC7RbLvY1VZwo0mAz
	uT7PlToKwPgL1+KnP9nSsc8Ud17abvMC9gZ/hNVQ4Kvg5qs4B9i7g8mWazPjMGfcGTNXmv+dqtaZ9
	YUijnuXQ3vGNYx3896ju5Llp5H2pPfudVlqnYS4SRU7cTlagoj+4mIDoacs4ThdYtE9HeAt1Wgl/z
	qmPC5JrZYPcsZin9H/n38g6idqCn9M2QSEP7UVD7Hoy6CW1xX269Zib4HraC2zngi6u1fLlJd5fzF
	1ss6iU9VF7mpmyRosW6lgmHYIy7ddUOhd42YDeNjK093FAN/u0Njcc7n7PCUgkqkJt75o9Qc6MF54
	mB5b4dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIpT4-006DLu-TT; Wed, 25 Aug 2021 09:45:11 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpT0-006DIB-E1
 for linux-mtd@lists.infradead.org; Wed, 25 Aug 2021 09:45:08 +0000
Received: by mail-lf1-x131.google.com with SMTP id bq28so3210506lfb.7
 for <linux-mtd@lists.infradead.org>; Wed, 25 Aug 2021 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E7cNoLLVAVafjNCc4brMRUN01zZAHm0abXpnMpPuTt4=;
 b=XcByKSJRdga/HRYU9DdYIrJkJ5aCKCn6sFPQhJpp+zqLBFptssdthmbwTTqrJU2O1y
 Fh9T4cOSANuA0NBWqKrxyE6rpE3VUg9YurSVTT9N3ewKp/QELYAgj+C6HkBCJMlVTiOb
 M7DocgSIXf8gWx7DP6hz+XSoX32UueKJZitZdD1fhIKA/N5U6YwHLEpd41Qt4bCHL0G4
 ZtJc+vpaJ07T3DdXx/qHSdSN5QI3+K4IqS5ki+/rdR5v1sPFOYpfj0rw4qkKgMj2ioo3
 hQKDnoVXbW3M/+9DGxJ8r4dLnR6TG4RgZNyl3L7PnWj5GlgkD82og3xcltkjAKoMzhav
 ZUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E7cNoLLVAVafjNCc4brMRUN01zZAHm0abXpnMpPuTt4=;
 b=oq7/ojPWgBxk0yDiY1iqIsg8wTlhHk0dUOsFXKeUsgW0vF9E2jWA7C/ZCquYyPY1pe
 2ewv6lgUJMoKBoGXb3d8W9iWr27yzLSvnfhPjz60lPDsA63rBoPPQKolrx1woc8dqw7r
 9ebbBpUcE6+ckkghUp8o5+W9JEFvQuo8JDVA71NuuQn4vsKDkLrtI6r+BIp0Sl9ZCsg9
 ji3khDRMf3ZZAzYeBIhLMOIS3nmZx9P4WXqx1U/CGyFtDVSkZe0E0IvwFIGSmQEeTB+V
 W0pPCVZH/BSXEOQ/sq14zA6d2rPC5ZIm01oYPGM/ZdYhFY9PKYdxQGUO8NDCXaZkGT87
 Jq4A==
X-Gm-Message-State: AOAM530c471jTyDJt37X7F18ML0j6PL/Q0uzvd1YicjNaM5UdFiXhaXU
 gOR7A54bvNyKd/FnW7rroGQ=
X-Google-Smtp-Source: ABdhPJxxgQwWKc4KlfaiaB2F9L+jo3PpEaZtT5gXKDmMvuZmO5i5+f3TfZJ4xZuLO6DnWagwNOSZkQ==
X-Received: by 2002:a05:6512:3190:: with SMTP id
 i16mr32170681lfe.340.1629884702691; 
 Wed, 25 Aug 2021 02:45:02 -0700 (PDT)
Received: from [192.168.2.145] (94-29-17-251.dynamic.spd-mgts.ru.
 [94.29.17.251])
 by smtp.googlemail.com with ESMTPSA id z13sm2103349ljj.43.2021.08.25.02.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 02:45:02 -0700 (PDT)
Subject: Re: [PATCH v8 20/34] mmc: sdhci-tegra: Add runtime PM and OPP support
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
 <20210817012754.8710-21-digetx@gmail.com> <YR6O9Om+HzMMG8AR@orome.fritz.box>
 <05b7ff28-4c01-fb56-deeb-595a5797394b@gmail.com>
 <YR+TgfCHKOPS3Ng8@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5a15647c-bc6a-294d-61c8-91efa33c681e@gmail.com>
Date: Wed, 25 Aug 2021 12:45:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR+TgfCHKOPS3Ng8@orome.fritz.box>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_024506_566850_CA46E402 
X-CRM114-Status: GOOD (  23.28  )
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

MjAuMDguMjAyMSAxNDozNSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBGcmksIEF1
ZyAyMCwgMjAyMSBhdCAwMTozNzoxM0FNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDE5LjA4LjIwMjEgMjA6MDMsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+PiBPbiBUdWUs
IEF1ZyAxNywgMjAyMSBhdCAwNDoyNzo0MEFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+Pj4gVGhlIFNESENJIG9uIFRlZ3JhIGJlbG9uZ3MgdG8gdGhlIGNvcmUgcG93ZXIgZG9tYWlu
IGFuZCB3ZSdyZSBnb2luZyB0bwo+Pj4+IGVuYWJsZSBHRU5QRCBzdXBwb3J0IGZvciB0aGUgY29y
ZSBkb21haW4uIE5vdyBTREhDSSBtdXN0IGJlIHJlc3VtZWQgdXNpbmcKPj4+PiBydW50aW1lIFBN
IEFQSSBpbiBvcmRlciB0byBpbml0aWFsaXplIHRoZSBTREhDSSBwb3dlciBzdGF0ZS4gVGhlIFNE
SENJCj4+Pj4gY2xvY2sgcmF0ZSBtdXN0IGJlIGNoYW5nZWQgdXNpbmcgT1BQIEFQSSB0aGF0IHdp
bGwgcmVjb25maWd1cmUgdGhlIHBvd2VyCj4+Pj4gZG9tYWluIHBlcmZvcm1hbmNlIHN0YXRlIGlu
IGFjY29yZGFuY2UgdG8gdGhlIHJhdGUuIEFkZCBydW50aW1lIFBNIGFuZCBPUFAKPj4+PiBzdXBw
b3J0IHRvIHRoZSBTREhDSSBkcml2ZXIuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkg
T3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGRyaXZlcnMvbW1jL2hv
c3Qvc2RoY2ktdGVncmEuYyB8IDE0NiArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0K
Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLXRlZ3JhLmMgYi9k
cml2ZXJzL21tYy9ob3N0L3NkaGNpLXRlZ3JhLmMKPj4+PiBpbmRleCAzODdjZTljZGJkN2MuLmEz
NTgzMzU5Yzk3MiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLXRlZ3Jh
LmMKPj4+PiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLXRlZ3JhLmMKPj4+PiBAQCAtMTUs
NiArMTUsOCBAQAo+Pj4+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4KPj4+PiAgI2luY2x1ZGUgPGxp
bnV4L29mX2RldmljZS5oPgo+Pj4+ICAjaW5jbHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5o
Pgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvcG1fb3BwLmg+Cj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9w
bV9ydW50aW1lLmg+Cj4+Pj4gICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4K
Pj4+PiAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+Cj4+Pj4gICNpbmNsdWRlIDxsaW51eC9tbWMv
Y2FyZC5oPgo+Pj4+IEBAIC0yNCw2ICsyNiw4IEBACj4+Pj4gICNpbmNsdWRlIDxsaW51eC9ncGlv
L2NvbnN1bWVyLmg+Cj4+Pj4gICNpbmNsdWRlIDxsaW51eC9rdGltZS5oPgo+Pj4+ICAKPj4+PiAr
I2luY2x1ZGUgPHNvYy90ZWdyYS9jb21tb24uaD4KPj4+PiArCj4+Pj4gICNpbmNsdWRlICJzZGhj
aS1wbHRmbS5oIgo+Pj4+ICAjaW5jbHVkZSAiY3FoY2kuaCIKPj4+PiAgCj4+Pj4gQEAgLTEyMyw2
ICsxMjcsMTIgQEAKPj4+PiAgCQkJCQkgU0RIQ0lfVFJOU19CTEtfQ05UX0VOIHwgXAo+Pj4+ICAJ
CQkJCSBTREhDSV9UUk5TX0RNQSkKPj4+PiAgCj4+Pj4gK2VudW0gewo+Pj4+ICsJVEVHUkFfQ0xL
X0JVTEtfU0RIQ0ksCj4+Pj4gKwlURUdSQV9DTEtfQlVMS19UTUNMSywKPj4+PiArCVRFR1JBX0NM
S19CVUxLX05VTSwKPj4+PiArfTsKPj4+PiArCj4+Pj4gIHN0cnVjdCBzZGhjaV90ZWdyYV9zb2Nf
ZGF0YSB7Cj4+Pj4gIAljb25zdCBzdHJ1Y3Qgc2RoY2lfcGx0Zm1fZGF0YSAqcGRhdGE7Cj4+Pj4g
IAl1NjQgZG1hX21hc2s7Cj4+Pj4gQEAgLTE3MSw2ICsxODEsOCBAQCBzdHJ1Y3Qgc2RoY2lfdGVn
cmEgewo+Pj4+ICAJYm9vbCBlbmFibGVfaHdjcTsKPj4+PiAgCXVuc2lnbmVkIGxvbmcgY3Vycl9j
bGtfcmF0ZTsKPj4+PiAgCXU4IHR1bmVkX3RhcF9kZWxheTsKPj4+PiArCj4+Pj4gKwlzdHJ1Y3Qg
Y2xrX2J1bGtfZGF0YSBjbG9ja3NbVEVHUkFfQ0xLX0JVTEtfTlVNXTsKPj4+Cj4+PiBUaGlzIGRv
ZXNuJ3Qgc2VlbSB3b3J0aCBpdCB0byBtZS4gVGhlcmUncyBhIGxvdCBvZiBjaHVybiBpbiB0aGlz
IGRyaXZlcgo+Pj4gdGhhdCdzIG9ubHkgbmVlZGVkIHRvIGNvbnZlcnQgdGhpcyB0byB0aGUgY2xr
X2J1bGsgQVBJIGFuZCBpdCBtYWtlcyB0aGUKPj4+IGNvZGUgYSBsb3QgbW9yZSBkaWZmaWN1bHQg
dG8gcmVhZCwgaW4gbXkgb3Bpbmlvbi4KPj4+Cj4+PiBJdCBsb29rcyBsaWtlIHRoZSBvbmx5IGJl
bmVmaXQgdGhhdCB0aGlzIGdpdmVzIHVzIGlzIHRoYXQgcnVudGltZQo+Pj4gc3VzcGVuZCBhbmQg
cmVzdW1lIGJlY29tZSBhIGZldyBsaW5lcyBzaG9ydGVyLgo+Pgo+PiBUaGUgZHJpdmVyIHByb2Jl
IGNvZGUgbG9va3MgY2xlYW5lciB3aXRoIHRoYXQuIFlvdSBzaG91bGQgYmUgbG9va2luZyBhdAo+
PiB0aGUgZmluYWwgcmVzdWx0IGFuZCBub3QgYXQgdGhlIHBhdGNoIHRvIHNlZSBpdC4KPiAKPiBJ
IGRpZCBsb29rIGF0IHRoZSBmaW5hbCByZXN1bHQgYW5kIGRpZG4ndCBmaW5kIGl0IGNsZWFuZXIg
YXQgYWxsLiA9KQoKVGhlcmUgaXMgVUFGIGJ1ZyBpbiB0aGlzIHBhdGNoIHRoYXQgd2FzIHNwb3R0
ZWQgYnkga2FzYW4uIFRoZQpzZGhjaV90ZWdyYV9zb2NfZGF0YSBpc24ndCByZXNvdXJjZS1tYW5h
Z2VkLCBidXQgY2xrX2J1bGtfZGF0YSBpcy4gSSdtCm5vdyB0aGlua2luZyB0aGF0IGl0IHNob3Vs
ZCBiZSBva2F5IHRvIGtlZXAgdG1jbGsgYWx3YXlzLW9uLCBzbyBJJ2xsCnJlcGxhY2UgdGhlIGJ1
bGsgY2xrcyBiYWNrIHdpdGggdGhlIHNkaGNpIGNsayBpbiB2OS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
