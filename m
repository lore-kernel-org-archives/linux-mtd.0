Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35E8C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 22:21:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B400F61028
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 22:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B400F61028
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tayEoFDvZanXdZDAj6/53ilDoHoKclbJwCruEVM7TX8=; b=LtxBypi4jg6dyRSBksHb1XTe7X
	2J3bP2gJEci/SKhha/tYYncRmwj18YJhpOGdPSAv4wU8XQWl3HFMyyAgtoOp22dhGIxpB3yBwASof
	fiutkbR59hYlvu2+/4FTFXf2K0jTLylS4ChhJxBj6zmYwINyeL+whkytyxMFE89cGtf/+YehT7Seh
	pYmroCTBgA2uumCn++VUY3+08mCKDjdYPZ0WlWXfFJcIXj1wRALe+rfrxX36Uco8PEcHaHYyvpdFW
	N4XhuumeI+6oCyH9AOrO2bjRCCBA3nXNnqUgPyRjR0FxzEV51OYFC4o/9qPSy003nV8796ypoGRCL
	oADBOwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGqOt-009dKa-HB; Thu, 19 Aug 2021 22:20:39 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGqOq-009dJB-Rm
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 22:20:38 +0000
Received: by mail-lf1-x12e.google.com with SMTP id r9so16160187lfn.3
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 15:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cSioMNug0d6kxUexh1FC9hTGrtcP9xpdjQR0XQQ6CYo=;
 b=J3VpzNeE7GqDLaNcadrCTNd6cyZfYXW7ces/SuDyrw1d/28XcNn6N+DzEWmGnDD/tQ
 SoLjonmdEv+K67l7YB0f4xQ305y80qihUAThFt01+KBxrDINvGkhPcmCvtlU5sHPBDbx
 M71O17tNhqPr+OmAN9VOz+4Q7pIBIEyoj6SH0ySrJLRtzsTWwdbnVhskZKjVbRPHRaWm
 +GaOVUAE0cvv6+nA+ln7XoB+9psFnKu9U3jrYuDGEC/pYeGQBmT2Xm3y538F/wiQgagE
 srBA+yPJ+iPcl2RL23Y4diEfalcBHPDOPAb4qZl7q12ixhhyPtL63uHAQVl2E6t4EK21
 t4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cSioMNug0d6kxUexh1FC9hTGrtcP9xpdjQR0XQQ6CYo=;
 b=uel8me/Vy6kD/QNGklLJLs8J4fDynNJhQe8UUgjB8ZArE8Ais6PfVIuk/g8NioQ1oW
 WQ6IcHsTixYMdQXJ3DwbLNzUf7DtVqohsVaxiT+KgnZplZkhpcYgrMG0/wlBTAtAKb4v
 3AjtKZhDDjamvBlhmf7zkKdfC0INH0p1fN5OgRrF8xDo7ms4XO1s05NplptO36Lr2KuQ
 d8Mpf5LmioYnfvD4J5iXtsSASkHxDKgeTndacynUOwbcDONoWTCCisek4/zeFi0eGlxo
 oKo9Piqwe6ZuJR6rMNwm+KODqI0/vIg+9nJ0StCM6Los+jzobvHrfB10IE0hRh8pjMIb
 KSqQ==
X-Gm-Message-State: AOAM533Gh+5vlHkSrTMTyCmgi5LVelOmOeYzRAJsdzV72naPARt+qRqD
 dfHbQzxKipXC7nLtVy0zNWo=
X-Google-Smtp-Source: ABdhPJxJWs7Kxo/s8N+hb+4RWNHipznlH5BHUAb+HUpiZwCTMet2wXRVLZZrxtwaXHrGmtOIkJjuVA==
X-Received: by 2002:a05:6512:38a1:: with SMTP id
 o1mr11689501lft.606.1629411634907; 
 Thu, 19 Aug 2021 15:20:34 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru.
 [46.138.120.72])
 by smtp.googlemail.com with ESMTPSA id w14sm433095lfk.161.2021.08.19.15.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 15:20:34 -0700 (PDT)
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
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
 <a5b942cb-1611-9ae1-6e89-4b68fdaf03e3@gmail.com>
 <YR6HWMuYcF6NIepi@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <43f0c69a-c62d-5d36-ac59-8ce7513e9496@gmail.com>
Date: Fri, 20 Aug 2021 01:20:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR6HWMuYcF6NIepi@orome.fritz.box>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_152036_949796_863AEB94 
X-CRM114-Status: GOOD (  15.64  )
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

MTkuMDguMjAyMSAxOTozMSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4+Pj4gQWxzbywg
SSBkb24ndCB0aGluayB0aGUgdGVncmEtIHByZWZpeCBpcyBuZWNlc3NhcnkgaGVyZS4gVGhlIHBh
cmVudCBub2RlCj4+Pj4+IGlzIGFscmVhZHkgaWRlbnRpZmllZCBhcyBUZWdyYSB2aWEgdGhlIGNv
bXBhdGlibGUgc3RyaW5nLgo+Pj4+Pgo+Pj4+PiBJbiB0aGUgY2FzZSBvZiBDQVIsIEknZCBpbWFn
aW5lIHNvbWV0aGluZyBsaWtlOgo+Pj4+Pgo+Pj4+PiAJY2xvY2tzIHsKPj4+Pj4gCQlzY2xrIHsK
Pj4+Pj4gCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmb3BwX3RhYmxlPjsKPj4+Pj4gCQkJcG93
ZXItZG9tYWlucyA9IDwmZG9tYWluPjsKPj4+Pj4gCQl9Owo+Pj4+PiAJfTsKPj4+Pj4KPj4+Pj4g
Tm93IHlvdSd2ZSBvbmx5IGdvdCB0aGUgYmFyZSBtaW5pbXVtIGluIGhlcmUgdGhhdCB5b3UgYWN0
dWFsbHkgYWRkLiBBbGwKPj4+Pj4gdGhlIG90aGVyIGRhdGEgdGhhdCB5b3UgdXNlZCB0byBoYXZl
IGlzIHNpbXBseSBkZXJpdmVkIGZyb20gdGhlIHBhcmVudC4KPj4+PiAnY2xvY2tzJyBpcyBhbHJl
YWR5IGEgZ2VuZXJpYyBrZXl3b3JkIGluIERULiBJdCdzIHByb2JhYmx5IG5vdCBva2F5IHRvCj4+
Pj4gcmVkZWZpbmUgaXQuCj4+PiAiY2xvY2tzIiBpcyBub3QgYSBnZW5lcmljIGtleXdvcmQuIEl0
J3MgdGhlIG5hbWUgb2YgYSBwcm9wZXJ0eSBhbmQgZ2l2ZW4KPj4+IHRoYXQgd2UncmUgdGFsa2lu
ZyBhYm91dCB0aGUgY2xvY2sgcHJvdmlkZXIgaGVyZSwgaXQgZG9lc24ndCBuZWVkIGEKPj4+IGNs
b2NrcyBwcm9wZXJ0eSBvZiBpdHMgb3duLCBzbyBpdCBzaG91bGQgYmUgZmluZSB0byB1c2UgdGhh
dCBmb3IgdGhlCj4+PiBub2RlLgo+PiBJJ20gY3VyaW91cyB3aGF0IFJvYiB0aGlua3MgYWJvdXQg
aXQuIFJvYiwgZG9lcyB0aGlzIHNvdW5kIG9rYXkgdG8geW91Pwo+IEFub3RoZXIgYWx0ZXJuYXRp
dmUgd291bGQgYmUgdG8gb21pdCB0aGF0IGxldmVsIGFsdG9nZXRoZXIgYW5kIGp1c3QgbWFrZQo+
IHNjbGsgYW5kIHNpYmxpbmdzIGRpcmVjdCBjaGlsZHJlbiBvZiB0aGUgQ0FSIG5vZGUuCgpUaGF0
IGNhbiBiZSBkb25lLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
