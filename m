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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DCBC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 16:57:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE7C1606A5
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 16:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE7C1606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3ezVTGHTKKMHohFwkVkE8GfifbrMQ6ZB568VrYgctQg=; b=YF4qmSOKFURwA8jZsCZG0pOFca
	BaoSmzAfYutpp/yOPsBS+z++/ZJmH5KZEXurruAh7dil7ntyiaxUqrabRdkQ5/86M+fiUFHEUnPj3
	xF6CE8hLhf6rUZes4PMPSfwzLpW0eQPhkAgIesVHt7Th3XGLZdNlJM644DkNwR15gpmrJH8qAOHUv
	iQulpYq8msHk9+fhckFl2s0u/pLOZD6uWRGG1oljphVYLBKzeD92oOGLi+2PEwtQRT0nHLg4TZa5U
	HHCWcoHWSzLjh++VwM99csVPvTyvMFQr0BT8a90wP3wQLZtJZZVaYZUi5WK8tqhbnWKXs/VY2tk7H
	wQPc4nDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGOsK-006EjH-O1; Wed, 18 Aug 2021 16:57:12 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGOsF-006Eho-K9
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 16:57:11 +0000
Received: by mail-lf1-x136.google.com with SMTP id p38so6111534lfa.0
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 09:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9afXLHEiBRvQw+FqKQqGWY2brD9XGx9hPAmFRANM6E0=;
 b=SkFjeie1BejmJMUfsJJa7cdKxHWnbIqV6yEx50leCh45/lOA2mtYHIhF2YuT+/qxMT
 Kz4yDrQ39Ns52bpJRJ1nvYNdeOrbzSvGNVDSFXOIEZy/5g8lF1kLMJksTgXPJ8QmjHcg
 iB+julVaTc7z/7axFMQXOnE7a569YrihqMFwkdkfwrYA1Olh6EVmg/hGR1JfF7Bo+IzT
 5pn2hximEzVhmBcizH/3kj9vKvVTct62o0rKSGlLwd0/7BGb0XQ+by7ZLMa2P8L4PJg+
 efMjguZzhJdMSLcJQv1Pv0yiP3TQGVx4otwdNVArVuo1hHYq6zxbh/irwSRReTHHDhIg
 HoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9afXLHEiBRvQw+FqKQqGWY2brD9XGx9hPAmFRANM6E0=;
 b=ljPBeiKrXWjBpJ6WJ632eelY9MBr8sjUdT7lpUps6UKbFb8yK3IHvA4ZWWYMQ45KH4
 j4i5MN17hmPF3CJizNlgwKpCMGGXkbzfqa1KAX8VhZKBTWLqsZpCwIZc+VMCB17qge65
 GHAK8F1o86U1uv0oD0KIEtg1aPuXTVKRsxmihneCVTzgxMs9ceIixaW+ez/ZZeiDU96k
 AZRkql1q8T20+D8eAdgT455X4V7cp0fY6vRb/QWKxwYjR5T4DFgP9x3/MUdzBNhObJcl
 we78oIOvU0P3ksm2NelNCYISHJxJfDCCk2JpTEjLMpQfPGqp1183Y3qn5157AIB0fzSw
 Tpng==
X-Gm-Message-State: AOAM532GI95riEmJRkxkaRO/wWxL++9HRwy46O+ZZG9+EpikRgaqvW75
 jvK9i+T3/INRweYM1EghBt4=
X-Google-Smtp-Source: ABdhPJwoN3TrpzatYdR/vf/doNTOb6j8sY8QLs5kbR7gHEbbr6h18EW7bx2EM9tVNh0BF01dlvfX6g==
X-Received: by 2002:a19:701a:: with SMTP id h26mr6902287lfc.443.1629305825693; 
 Wed, 18 Aug 2021 09:57:05 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id f19sm24809lfu.100.2021.08.18.09.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 09:57:05 -0700 (PDT)
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a5b942cb-1611-9ae1-6e89-4b68fdaf03e3@gmail.com>
Date: Wed, 18 Aug 2021 19:57:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR033zuYWWLCeYpM@orome.fritz.box>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_095707_715261_EDED6E85 
X-CRM114-Status: GOOD (  25.02  )
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

MTguMDguMjAyMSAxOTozOSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4gV2UgZG9uJ3Qg
aGF2ZSBhIHBsYXRmb3JtIGRldmljZSBmb3IgQ2FSLiBJIGRvbid0IHNlZSBob3cgaXQncyBnb2lu
ZyB0bwo+PiB3b3JrLiBXZSBuZWVkIHRvIGNyZWF0ZSBhIHBsYXRmb3JtIGRldmljZSBmb3IgZWFj
aCBSUE0tY2FwYWJsZSBjbG9jawo+PiBiZWNhdXNlIHRoYXQncyBob3cgUlBNIHdvcmtzLiBUaGUg
Y29tcGF0aWJsZSBzdHJpbmcgaXMgcmVxdWlyZWQgZm9yCj4+IGluc3RhbnRpYXRpbmcgT0YtZGV2
aWNlcyBmcm9tIGEgbm9kZSwgb3RoZXJ3aXNlIHdlIHdpbGwgaGF2ZSB0bwo+PiByZS1pbnZlbnQg
dGhlIE9GIGNvcmUuCj4gSSB0aGluayB3ZSBkbyBoYXZlIGEgcGxhdGZvcm0gZGV2aWNlIGZvciBD
QVIuIEl0J3MganVzdCBub3QgYm91bmQKPiBhZ2FpbnN0IGJ5IHRoZSBkcml2ZXIgYmVjYXVzZSB0
aGVzZSBjbG9jayBkcml2ZXJzIGFyZSAic3BlY2lhbCIuIEJ1dAo+IGZyb20gb3RoZXIgcGFydHMg
b2YgdGhlIHNlcmllcyB5b3UncmUgYWxyZWFkeSB0cnlpbmcgdG8gZml4IHRoYXQsIGF0Cj4gbGVh
c3QgcGFydGlhbGx5Lgo+IAo+IEJ1dCBpdCBkb2Vzbid0IHNlZW0gcmlnaHQgdG8gY3JlYXRlIGEg
cGxhdGZvcm0gZGV2aWNlIGZvciBlYWNoIFJQTS0KPiBjYXBhYmxlIGNsb2NrLiBXaHkgZG8gdGhl
eSBuZWVkIHRvIGJlIGRldmljZXM/IFRoZXkgYXJlbid0LCBzbyB3aHkKPiBwcmV0ZW5kPyBJcyBp
dCB0aGF0IHNvbWUgQVBJIHRoYXQgd2Ugd2FudCB0byB1c2UgaGVyZSByZXF1aXJlcyB0aGUKPiBz
dHJ1Y3QgZGV2aWNlPwoKVGhlICJkZXZpY2UiIHJlcHJlc2VudGF0aW9uIGlzIGludGVybmFsIHRv
IHRoZSBrZXJuZWwuIEl0J3Mgb2theSB0byBtZQp0byBoYXZlIFBMTHMgcmVwcmVzZW50ZWQgYnkg
YSBkZXZpY2UsIGl0J3MgYSBkaXN0aW5jdCBoL3cgYnkgaXRzZWxmLgoKQ0NGIHN1cHBvcnRzIG1h
bmFnaW5nIG9mIGNsb2NrJ3MgUlBNIGFuZCBpdCByZXF1aXJlcyB0byBoYXZlIGNsb2NrIHRvIGJl
CmJhY2tlZCBieSBhIGRldmljZS4gVGhhdCdzIHdoYXQgd2UgYXJlIHVzaW5nIGhlcmUuCgpQbGVh
c2Ugc2VlCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE0LXJjNi9zb3VyY2Uv
ZHJpdmVycy9jbGsvY2xrLmMjTDEwOQoKPj4+IEFsc28sIEkgZG9uJ3QgdGhpbmsgdGhlIHRlZ3Jh
LSBwcmVmaXggaXMgbmVjZXNzYXJ5IGhlcmUuIFRoZSBwYXJlbnQgbm9kZQo+Pj4gaXMgYWxyZWFk
eSBpZGVudGlmaWVkIGFzIFRlZ3JhIHZpYSB0aGUgY29tcGF0aWJsZSBzdHJpbmcuCj4+Pgo+Pj4g
SW4gdGhlIGNhc2Ugb2YgQ0FSLCBJJ2QgaW1hZ2luZSBzb21ldGhpbmcgbGlrZToKPj4+Cj4+PiAJ
Y2xvY2tzIHsKPj4+IAkJc2NsayB7Cj4+PiAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZvcHBf
dGFibGU+Owo+Pj4gCQkJcG93ZXItZG9tYWlucyA9IDwmZG9tYWluPjsKPj4+IAkJfTsKPj4+IAl9
Owo+Pj4KPj4+IE5vdyB5b3UndmUgb25seSBnb3QgdGhlIGJhcmUgbWluaW11bSBpbiBoZXJlIHRo
YXQgeW91IGFjdHVhbGx5IGFkZC4gQWxsCj4+PiB0aGUgb3RoZXIgZGF0YSB0aGF0IHlvdSB1c2Vk
IHRvIGhhdmUgaXMgc2ltcGx5IGRlcml2ZWQgZnJvbSB0aGUgcGFyZW50Lgo+PiAnY2xvY2tzJyBp
cyBhbHJlYWR5IGEgZ2VuZXJpYyBrZXl3b3JkIGluIERULiBJdCdzIHByb2JhYmx5IG5vdCBva2F5
IHRvCj4+IHJlZGVmaW5lIGl0Lgo+ICJjbG9ja3MiIGlzIG5vdCBhIGdlbmVyaWMga2V5d29yZC4g
SXQncyB0aGUgbmFtZSBvZiBhIHByb3BlcnR5IGFuZCBnaXZlbgo+IHRoYXQgd2UncmUgdGFsa2lu
ZyBhYm91dCB0aGUgY2xvY2sgcHJvdmlkZXIgaGVyZSwgaXQgZG9lc24ndCBuZWVkIGEKPiBjbG9j
a3MgcHJvcGVydHkgb2YgaXRzIG93biwgc28gaXQgc2hvdWxkIGJlIGZpbmUgdG8gdXNlIHRoYXQg
Zm9yIHRoZQo+IG5vZGUuCgpJJ20gY3VyaW91cyB3aGF0IFJvYiB0aGlua3MgYWJvdXQgaXQuIFJv
YiwgZG9lcyB0aGlzIHNvdW5kIG9rYXkgdG8geW91PwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
