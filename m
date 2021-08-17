Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98ACAC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 15:53:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F8CA60C3E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 15:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F8CA60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eIMWTIqnMj48Psgo53/t3XDs0botfOm6VbiZdI5LzhQ=; b=cKlpZ1gDtn00qMoMPldUJYxicb
	yw9NVe1K2FuTAwzyHmC0M1E1Uxi2pbwZYvvSTnD4I7QwtXP1iVwvtMVU4WY4vnOqhhl7jYp1kLgXz
	K231Gv5oDh6T4Tfznu71sY4HxhQQ0Av4KqhF4mV/sVFNqoPuAvMTnaTrcMys8RI0m4HkUFGUCiOtK
	Idn39+VNS7EduM+4T2XRk0mJ9gkfBgAgD1NFcP/q1kKIGMyAv4Y1g6Oswpc7yFxREf44vfpb+/4z3
	eKk6EONq4+wTkibdYPknfWPcqx43s60k5SbWzGN3KeJrrimIdUhOweAzP9geOWnz8XTJ858NQerdW
	kDEzyqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG1Ou-002t7a-LI; Tue, 17 Aug 2021 15:53:16 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG1Or-002t5s-Mt
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 15:53:15 +0000
Received: by mail-lf1-x132.google.com with SMTP id g13so42205650lfj.12
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i1x/HqtgkDsm/ejKQeETrdsQe6dZCILRZB7KrDkPDRw=;
 b=An4PsjL/Vf5udfyNdAKTCYWd10EU58Kpxe8zKg/t9npZAavumDMU+X9iBgUDO5Z8Zq
 qLi7UARHs5EBlnNEWrEBaiEyo4AvkdNde23Gx7Ech/+7twOysiNWaNZJNc4c1H9Unsq3
 EZ9/NC8tZYzsvHiEyEjIq8t7XNVBW4+7jhFenO5mQmYIgRBk+TxgMXr2m4yePVU5ry+F
 yIAUTR2f68Q14RQm9v+g3T6mw1go0mbvXB6UoQIJuFvpfbNq+pUgeWHg895WJQXEl29h
 zNHJ3yrbMGXltFkn0e1Yqc4GHFXDR5UTFoNhdaUppdVMQxIsBTVP10kUU2MP/Em1dvWL
 oObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i1x/HqtgkDsm/ejKQeETrdsQe6dZCILRZB7KrDkPDRw=;
 b=RyHlazvphhnnQGLvk0aVH8TvgmQK427e1QT5XnvWAJB4ulSlvS6T8NahNw+2BUrZq8
 G3sXcj/Gvm384lHkMNVHpOdJuMv9QNigMxJ7VpjHKfuXZbGzHR+5sWRHYL93krbXDi8v
 fU+vxOXfVxzsAz0WxgU0MhcehA24ZCY+zWKl6cVhasedzisA+afSCLOrZfIgMnuqbrTu
 YGUImzm9tPKCRE3KDxGm3zty8XaKhdgoiiAJt+2/B3sZ9zhKYrFpJvRQHehESOfsF6HJ
 /aVJ5P0awhApk+U7e1LwXdVuEOeB+iaSNQnhaPEJsj06EKXcF3RHVs8chNp62IVS6kqU
 jsVA==
X-Gm-Message-State: AOAM532+aEaDSxzuTEjyGzm4JVROFYX+wqNg+9CGZ8Gc6RYXNJ/iIrpV
 1xKr1KcL1oeEfsf/P52ZmfE=
X-Google-Smtp-Source: ABdhPJzKDCfx8XTSv5rLHo+odlu5xNPqb9QF4cuJdpvDud3tFDUajnizSUcMOMnHR+YPCBFb3Bv9Ew==
X-Received: by 2002:ac2:4f8f:: with SMTP id z15mr2811432lfs.361.1629215591955; 
 Tue, 17 Aug 2021 08:53:11 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id r20sm223793lff.93.2021.08.17.08.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:53:11 -0700 (PDT)
Subject: Re: [PATCH v8 22/34] spi: tegra20-slink: Add OPP support
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
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
 <20210817012754.8710-23-digetx@gmail.com>
 <20210817122244.GA4290@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a0e49d91-e812-5b55-e90f-bfba8476faa3@gmail.com>
Date: Tue, 17 Aug 2021 18:53:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817122244.GA4290@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_085313_789720_9D8D045F 
X-CRM114-Status: GOOD (  16.40  )
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

MTcuMDguMjAyMSAxNToyMiwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFR1ZSwgQXVnIDE3
LCAyMDIxIGF0IDA0OjI3OjQyQU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gVGhl
IFNQSSBvbiBUZWdyYSBiZWxvbmdzIHRvIHRoZSBjb3JlIHBvd2VyIGRvbWFpbiBhbmQgd2UncmUg
Z29pbmcgdG8KPj4gZW5hYmxlIEdFTlBEIHN1cHBvcnQgZm9yIHRoZSBjb3JlIGRvbWFpbi4gTm93
IFNQSSBkcml2ZXIgbXVzdCB1c2UgT1BQCj4+IEFQSSBmb3IgZHJpdmluZyB0aGUgY29udHJvbGxl
cidzIGNsb2NrIHJhdGUgYmVjYXVzZSBPUFAgQVBJIHRha2VzIGNhcmUKPj4gb2YgcmVjb25maWd1
cmluZyB0aGUgZG9tYWluJ3MgcGVyZm9ybWFuY2Ugc3RhdGUgaW4gYWNjb3JkYW5jZSB0byB0aGUK
Pj4gcmF0ZS4gQWRkIE9QUCBzdXBwb3J0IHRvIHRoZSBkcml2ZXIuCj4gCj4gQWNrZWQtYnk6IE1h
cmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiAKPiBJcyB0aGVyZSBhIGNvbmNyZXRlIGRl
cGVuZGVuY3kgaGVyZSBvciBjYW4gSSBtZXJnZSB0aGlzIHNlcGFyYXRlbHk/CgpUaGlzIHBhdGNo
IGRlcGVuZHMgb24gdGhlIG5ldyBPUFAgaGVscGVycyBhZGRlZCBlYXJsaWVyIGluIHRoaXMgc2Vy
aWVzLgpJbiBwYXJ0aWN1bGFyIGl0IGRlcGVuZHMgb24gdGhlc2UgcGF0Y2hlczoKCm9wcDogQWRk
IGRldl9wbV9vcHBfc3luYygpIGhlbHBlcgpzb2MvdGVncmE6IEFkZCBkZXZtX3RlZ3JhX2NvcmVf
ZGV2X2luaXRfb3BwX3RhYmxlX3NpbXBsZSgpCgpUaGFuayB5b3UgZm9yIHRoZSBhY2shCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
