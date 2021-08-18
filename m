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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11142C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:30:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7D8660524
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7D8660524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jrLzsCRHx/IjKOwtSNirzJwnWnnyHxjZiUeSXMvEV+Y=; b=4lXrO7yCw0kGEk1nxK1+ZlCGY4
	QyMMIDooS8oQQ4t2bVWfTUtD5nRJQuYtbGXtCi9pCpIYvLY2hLBTVXsEL8jSQ3cNMOTCRolm2xSx8
	WsYwI/Y4GHAWiCi1llv0z2ti5JQ+IoKvN4DYD9ooBp5fOzL7RtiP8XrV+d6jqlc52vs864kecx5OM
	CaaYy6d119rURW5/XLpF8ltmAe3H+47n6oEn1exP9DrNXqyFvM9ClGLiRV3Hf6rQGVDFCevG1rjzO
	NbXhaUp2OpG7BBuygGaPQaZrJnU9kqelMCB2MtDADl6ACi17ZoIIQHtYzx3qAAU5pdy542rjB+C4E
	Q8jE7Now==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGDD1-0047OV-Qm; Wed, 18 Aug 2021 04:29:47 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGDCv-0047My-TI
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 04:29:45 +0000
Received: by mail-lj1-x22b.google.com with SMTP id i28so2606120ljm.7
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 21:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1oGPCZKuN7//6YRIhZx0/l4kulZ4IgOOJnUbYEMOH6I=;
 b=V5kVQiJtWOCCp57EmiLvG7lU7Eb4Pzk32zmECjGfUZe6WpjBhCOxyJxa3BJEPwWMQL
 YODIIG0AfBa0AUaKsgX9TTGS98k2By1GeZoFn38hvGsENacTswgcd9UWoRbXdcopoBne
 sb3uVBZSitgvH5I2PuygucyxoSig5hBa9YfcBzRQREAP0Q0aEozhok3Fzl9Jnhf7BYKe
 8Szm/avAy2CyuGWJgmVVdv21+M3huLPr7UTBxs1Esv1JV71R127gQOsjyI3lC+8wggh2
 1bdKBcLFz2RhSs2A6jFav8nPUJAxIitDUeBO7TFOJsdfbDPbbNOZfFUBrMVBZLlNqfnp
 ov8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1oGPCZKuN7//6YRIhZx0/l4kulZ4IgOOJnUbYEMOH6I=;
 b=OEhWsAUH+E/60+FNuusfbYTter0VAhtMsGYtF/cWf7q137xQDRgTbEJ95+dSetWd6N
 ITVfQE7N50uClmcUIXdahKozhZ8a+/c0nsVxqTXPFzc28+ssCb0vw0q81wXrtbRbh59t
 gChN2gLxPSJlIUXM6/LDOtp7Y5uUlfLLyYCUhJdGMjAHKC6Tdg5aMAn3ZTLZGmGPsVa6
 V3459EmzkrHoBvDQTxTk9LRXUHqrtUG8xcyTdIRt2Tm3BHdARi0m8fKRd4ocS/vqeBcx
 dhLwcnvQEYVEn1qffuDhFNt4hci1DS3EQPSUTbDctCMKPoA6p1/B6haec/i/ozw95b3v
 AafQ==
X-Gm-Message-State: AOAM531+UdklSoeCgbwakZjRiSwjobREhuyvd0zsgZPjuXuPHkM4E2M6
 DUuXR6FThNnGZhobaX32stg=
X-Google-Smtp-Source: ABdhPJxjWHu+1mhjN7xsUMJQm6f2OEtCQsnZGvTaLckFV9kcxoy2/qKkU641V0QwrRxZ9lvcjAC7rA==
X-Received: by 2002:a05:651c:390:: with SMTP id
 e16mr6391418ljp.344.1629260979533; 
 Tue, 17 Aug 2021 21:29:39 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id f1sm381628lfs.44.2021.08.17.21.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 21:29:39 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
From: Dmitry Osipenko <digetx@gmail.com>
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
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
Message-ID: <6df0ed60-e497-0af2-09b6-a9d82f502f17@gmail.com>
Date: Wed, 18 Aug 2021 07:29:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_212941_977392_01F48BF1 
X-CRM114-Status: GOOD (  17.29  )
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

MTguMDguMjAyMSAwNzoxMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTguMDguMjAy
MSAwNjo1NSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4+IE9uIDE3LTA4LTIxLCAxODo0OSwg
RG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gMTcuMDguMjAyMSAxMDo1NSwgVmlyZXNoIEt1bWFy
INC/0LjRiNC10YI6Cj4+PiAuLi4KPj4+Pj4gK2ludCBkZXZfcG1fb3BwX3N5bmMoc3RydWN0IGRl
dmljZSAqZGV2KQo+Pj4+PiArewo+Pj4+PiArCXN0cnVjdCBvcHBfdGFibGUgKm9wcF90YWJsZTsK
Pj4+Pj4gKwlzdHJ1Y3QgZGV2X3BtX29wcCAqb3BwOwo+Pj4+PiArCWludCByZXQgPSAwOwo+Pj4+
PiArCj4+Pj4+ICsJLyogRGV2aWNlIG1heSBub3QgaGF2ZSBPUFAgdGFibGUgKi8KPj4+Pj4gKwlv
cHBfdGFibGUgPSBfZmluZF9vcHBfdGFibGUoZGV2KTsKPj4+Pj4gKwlpZiAoSVNfRVJSKG9wcF90
YWJsZSkpCj4+Pj4+ICsJCXJldHVybiAwOwo+Pj4+PiArCj4+Pj4+ICsJaWYgKCFfZ2V0X29wcF9j
b3VudChvcHBfdGFibGUpKQo+Pj4+PiArCQlnb3RvIHB1dF90YWJsZTsKPj4+Pj4gKwo+Pj4+PiAr
CW9wcCA9IF9maW5kX2N1cnJlbnRfb3BwKGRldiwgb3BwX3RhYmxlKTsKPj4+Pj4gKwlyZXQgPSBf
c2V0X29wcChkZXYsIG9wcF90YWJsZSwgb3BwLCBvcHAtPnJhdGUpOwo+Pj4+Cj4+Pj4gQW5kIEkg
YW0gbm90IHN1cmUgaG93IHRoaXMgd2lsbCBlbmQgdXAgd29ya2luZywgc2luY2UgbmV3IE9QUCB3
aWxsIGJlCj4+Pj4gZXF1YWwgdG8gb2xkIG9uZS4gU2luY2UgSSBzZWUgeW91IGNhbGwgdGhpcyBm
cm9tIHJlc3VtZSgpIGF0IG1hbnkKPj4+PiBwbGFjZXMuCj4+Pgo+Pj4gSW5pdGlhbGx5IE9QUCB0
YWJsZSBpcyAidW5pbml0aWFsaXplZCIgYW5kIG9wcF90YWJsZS0+ZW5hYmxlZD1mYWxzZSwKPj4+
IGhlbmNlIHRoZSBmaXJzdCBzeW5jIGFsd2F5cyB3b3JrcyBldmVuIGlmIE9QUCBpcyBlcXVhbCB0
byBvbGQgb25lLiBPbmNlCj4+PiBPUFAgaGFzIGJlZW4gc3luY2VkLCBhbGwgZnVydGhlciBzeW5j
cyBhcmUgTk8tT1BzLCBoZW5jZSBpdCBkb2Vzbid0Cj4+PiBtYXR0ZXIgaG93IG1hbnkgdGltZXMg
c3luY2luZyBpcyBjYWxsZWQuCj4+Pgo+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjUuMTQtcmM2L3NvdXJjZS9kcml2ZXJzL29wcC9jb3JlLmMjTDEwMTIKPj4KPj4gUmlnaHQs
IGJ1dCBob3cgd2lsbCB0aGlzIHdvcmsgZnJvbSBSZXN1bWUgPyBXb24ndCB0aGF0IGJlIGEgbm8t
b3AgPwo+IAo+IFRoZSBmaXJzdCByZXN1bWUgaW5pdGlhbGl6ZXMgdGhlIE9QUCBzdGF0ZSBvbiBz
eW5jLCBhbGwgZnVydGhlciBzeW5jcyBvbgo+IHJlc3VtZSBhcmUgbm8tb3BzLgo+IAoKTm90aWNl
IHRoYXQgd2UgdXNlIEdFTlBEIGhlcmUuIEdFTlBEIGNvcmUgdGFrZXMgY2FyZSBvZiBzdG9yaW5n
IFBEJ3MKcGVyZm9ybWFuY2Ugc3RhdGUgKHZvbHRhZ2UgaW4gY2FzZSBvZiBUZWdyYSkgYW5kIGRy
b3BwaW5nIGl0IHRvIDAgYWZ0ZXIKcnBtLXN1c3BlbmQsIEdFTlBEIGNvcmUgYWxzbyByZXN0b3Jl
cyB0aGUgc3RhdGUgYmVmb3JlIHJwbS1yZXN1bWUuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
