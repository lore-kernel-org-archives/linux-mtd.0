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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BF1C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:05:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D82604D7
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10D82604D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=w+O2bU9t5vVOPh2obMdSVr+AM9OwIzJsw5ORPOeVOIw=; b=BoUQH9NLEJc1OiLXhe9g5/sRoP
	OpBsWXXzDLkRzVP7cTztizn2Zb52cVDZIhLyFDrPbRwqpHZMcGsv27ENMHtIl+Pm6zLGkA86uD6YD
	xWXBbBEFxv6A0pjPbdhFKOf4TYWPKOnnaN2RZCsES8cKcZ4Ta+pKU1sYUuTyHkbcNelkFoqPcQcTh
	x2fkHpdNKLyv92PFv4rDvbyqa6+eszaRuJ3KYbY1ACdJUrWnqstvFqzEpL3wfD5og0k/rK+DuqaRp
	dMRTxpWp62BWTSKtpKoiiF+2PQUNpRqJZx6iW1VvJruE6EfzL5YPsxd/qcPFI1UT1fvOT51usghRp
	ekaYVpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGN7D-005yiN-Mj; Wed, 18 Aug 2021 15:04:27 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGN79-005ygH-WC
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 15:04:26 +0000
Received: by mail-lj1-x234.google.com with SMTP id c12so5685440ljr.5
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 08:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xr9jfom6cWdr34E1fd8HPE7h7ktRyhvZRNFf4lj4jAQ=;
 b=d7vWQtfYNwjvKTlX+D7cGmxzglW4/UcbCP3k883yPwOnxzLjUO0MPLUtr+mkpWt1Oi
 P6esNY3xCKInvn9sKG4XBfONscW0AIoeu5bJLV5ZTKWBGLAhdZ64HG8UcVIz6r2nfQQl
 Yrxf+zPusVZGvFkC4QytKocyFHnvXnTinlNufGur7yB83siMoPE+NlIFcdErvMFOvaRm
 djF5sqCwTodRZH48kqlk0WysuoONIiF9oO3KYSPg+WVHw6iqzbFtFUS7q02t5k20ekd+
 45EsBKWTuCNLNfcORCVLawHr8Q3kMXd1Bq4Pg8JARvc5KVV1TVghp79Rl7Nr3fufWiW5
 iqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xr9jfom6cWdr34E1fd8HPE7h7ktRyhvZRNFf4lj4jAQ=;
 b=glWlQ1PyBxKDdXhQV5LoN3BPN4FQvxwpNBw5R9Q3yMBh4Jt4UpYK24XCEx9McnAuZI
 1rEvo4ux4frq3D1/oD8YZwj7lmZe8wQi9bF33LNZWPZ2nqXa+NuBO3/6euAB2nwuBTrJ
 dmht8I5XuzxYZ2Au93LeRGLY10ck4K9nuOog6t5y4Kh/2EU5OMC+dv8KYaaGfN4yKRhG
 gtPIDlcwh8xupUvGVXcmqPaStDBr6hmsCnYbKdsX9wqlx2QnnyocLaWskQfyxysg4QGz
 9YmS06+4DlObbF1D6wA6jwJYe8r6hscxKBybwRPYCCgB/RD+kcj4U7/7KziYLz2L/+R+
 hOEA==
X-Gm-Message-State: AOAM532z7/G43J9lvObOkFkDvP2rbJIoGzO13yMYr1mvN88ZMpv+fu9F
 x1Qd0tsxeIhe4qu9Sr4N/NY=
X-Google-Smtp-Source: ABdhPJyyQVKytu447MFJPeps/ZgloBzDSSZ92Nm3+pCI6+S9Y81A/uwqWMGjetCbs6/mNtqN/r95BQ==
X-Received: by 2002:a2e:99da:: with SMTP id l26mr8197284ljj.339.1629299059349; 
 Wed, 18 Aug 2021 08:04:19 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id q5sm517822lfb.78.2021.08.18.08.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:04:18 -0700 (PDT)
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
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
 <20210817012754.8710-7-digetx@gmail.com>
 <YRxfGtWPXeSQXuHo@robh.at.kernel.org>
 <06128217-92e1-9b66-64ea-91855d041121@gmail.com>
 <YR0QrFGZs6iQv1N3@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <659df86d-4fa1-b541-3d0d-8a1622fe7068@gmail.com>
Date: Wed, 18 Aug 2021 18:04:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR0QrFGZs6iQv1N3@orome.fritz.box>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_080424_065026_B50A2BA2 
X-CRM114-Status: GOOD (  20.22  )
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

MTguMDguMjAyMSAxNjo1MiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBXZWQsIEF1
ZyAxOCwgMjAyMSBhdCAwNDo0NDozMEFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDE4LjA4LjIwMjEgMDQ6MTUsIFJvYiBIZXJyaW5nINC/0LjRiNC10YI6Cj4+Pj4gKyAgdGVncmEt
Y2xvY2tzOgo+Pj4+ICsgICAgZGVzY3JpcHRpb246IGNoaWxkIG5vZGVzIGFyZSB0aGUgb3V0cHV0
IGNsb2NrcyBmcm9tIHRoZSBDQVIKPj4+PiArICAgIHR5cGU6IG9iamVjdAo+Pj4+ICsKPj4+PiAr
ICAgIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+Pj4+ICsgICAgICAiXlthLXpdK1swLTldKyQiOgo+Pj4+
ICsgICAgICAgIHR5cGU6IG9iamVjdAo+Pj4+ICsgICAgICAgIHByb3BlcnRpZXM6Cj4+Pj4gKyAg
ICAgICAgICBjb21wYXRpYmxlOgo+Pj4+ICsgICAgICAgICAgICBhbGxPZjoKPj4+PiArICAgICAg
ICAgICAgICAtIGl0ZW1zOgo+Pj4+ICsgICAgICAgICAgICAgICAgICAtIGVudW06Cj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAtIG52aWRpYSx0ZWdyYTIwLXNjbGsKPj4+PiArICAgICAgICAg
ICAgICAgICAgICAgIC0gbnZpZGlhLHRlZ3JhMzAtc2Nsawo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgLSBudmlkaWEsdGVncmEzMC1wbGxjCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAt
IG52aWRpYSx0ZWdyYTMwLXBsbGUKPj4+PiArICAgICAgICAgICAgICAgICAgICAgIC0gbnZpZGlh
LHRlZ3JhMzAtcGxsbQo+Pj4+ICsgICAgICAgICAgICAgIC0gY29uc3Q6IG52aWRpYSx0ZWdyYS1j
bG9jawo+Pj4gWW91IGFyZSBzYXlpbmcgdGhlIGZpcnN0IHN0cmluZyBtdXN0IGJlIGJvdGggb25l
IG9mIHRoZSBlbnVtcyBhbmQgCj4+PiAnbnZpZGlhLHRlZ3JhLWNsb2NrJy4gWW91IGRvbid0IGdl
dCBhbiBlcnJvciBiZWNhdXNlIHlvdXIgcGF0dGVybiAKPj4+IGRvZXNuJ3QgbWF0Y2ggJ3NjbGsn
Lgo+Pj4KPj4KPj4gQ291bGQgeW91IHBsZWFzZSByZXBocmFzZSBvciBjbGFyaWZ5PyBJZiBwYXR0
ZXJuIGRvZXNuJ3QgbWF0Y2ggJ3NjbGsnLAo+PiB0aGVuIGl0IG11c3QgbWF0Y2ggYW55IG90aGVy
IGVudW0uIEknbSBub3Qgc3VyZSB3aGF0IHlvdSdyZSBtZWFuaW5nLgo+IAo+ICJzY2xrIiBkb2Vz
bid0IG1hdGNoICJeW2Etel0rWzAtOV0rJCIgYmVjYXVzZSBpdCdzIG1pc3NpbmcgYXQgbGVhc3Qg
b25lCj4gZGlnaXQgYXQgdGhlIGVuZC4gUGVyaGFwcyB0aGF0IGxhc3QgKyB3YXMgc3VwcG9zZWQg
dG8gYmUgKj8KCkFoLCB0aGUgcmVnZXggcGF0dGVybi4gWWVzLCBJIGZvcmdvdCB0byB1cGRhdGUg
aXQuCgo+PiBUaGUgJ252aWRpYSx0ZWdyYS1jbG9jaycgYWN0dWFsbHkgY291bGQgYmUgcmVtb3Zl
ZCBzaW5jZSBpdCdzCj4+IHN1cGVyZmx1b3VzIG5vdy4gSSdsbCBjb25zaWRlciB0aGUgcmVtb3Zh
bCBpbiB2OS4KPiAKPiBJdCBhbHNvIGxvb2tzIGxpa2UgeW91ciBzY2hlbWEgd2FzIG1lYW50IHRv
IGJlIHNvbWV0aGluZyBsaWtlOgo+IAo+IAljb21wYXRpYmxlOgo+IAkgIC0gaXRlbXM6Cj4gCSAg
ICAgIC0gZW51bToKPiAJICAgICAgICAgIC0gbnZpZGlhLHRlZ3JhMjAtc2Nsawo+IAkgICAgICAg
ICAgLSBudmlkaWEsdGVncmEzMC1zY2xrCj4gCSAgICAgICAgICAtIG52aWRpYSx0ZWdyYTMwLXBs
bGMKPiAJICAgICAgICAgIC0gbnZpZGlhLHRlZ3JhMzAtcGxsZQo+IAkgICAgICAgICAgLSBudmlk
aWEsdGVncmEzMC1wbGxtCj4gCSAgICAgIC0gY29uc3Q6IG52aWRpYSx0ZWdyYS1jbG9jawo+IAo+
IE5vdGUgaG93IHRoZSBjb25zdDogZWxlbWVudCBpcyBpbmRlbnRlZCBvbmUgbW9yZSBsZXZlbC4g
Tm93IHRoaXMgbWVhbnM6Cj4gb25lIG9mIHRoZSBlbnVtZXJhdGlvbiB2YWx1ZXMsIGZvbGxvd2Vk
IGJ5IHRoZSBjb25zdGFudCB2YWx1ZS4gVGhhdAo+IG1hdGNoZXMgd2hhdCB0aGUgZXhhbXBsZSBo
YXMuCj4gCj4gVGhhdCBzYWlkLCBJIGFncmVlIHRoYXQgbnZpZGlhLHRlZ3JhLWNsb2NrIHNlZW1z
IGEgYml0IHVzZWxlc3MuIFRoZXJlJ3MKPiByZWFsbHkgbm8gc3VjaCB0aGluZyBhcyBhIGdlbmVy
aWMgY2xvY2ssIHRoZXkncmUgYWxsIGRpZmZlcmVudCBpbiBzb21lCj4gd2F5LgoKSXQncyBhIGxl
ZnRvdmVyIGZyb20gb2xkZXIgdmVyc2lvbnMgb2YgdGhpcyBwYXRjaHNldCwgSSdsbCByZW1vdmUg
aXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
