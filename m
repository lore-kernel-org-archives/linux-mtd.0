Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28169EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jun 2023 06:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfniwz3jhSHQA1JzANOH//74WG6FKCn+avcSEbawP5k=; b=LoQ2nqrU6a/o+g
	qM9Mw1Hx4WWqyY3JDQLksEQ4MRH8iKTtlsPNM2riXYvm5UVShbGEhXDli+oVA/FhDjjTpPwV/gqZM
	fStBDvClOiYjp92dx5MhRq60YSsYq/h1UvCVn9rOm5A5dYoH5BGo+qLxs3a2OJFo8rV0lF+BmAe23
	/NnsDq8AvojdjHWGDT1D57NvBXphXfru5gC3zEuE4prY119eL/E9db/2EnSxGwDiLYsgaU5gDkLTj
	od/RyO+KTJ1qeuw+PgZBJf9E70VAP4VR0xMdH1Z32K2PcZpJ8qu+UvXhNegYQRIywCIxTnxKvkumD
	P4LS/1OaigEWmGVQ0M+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9KR2-00AY17-0B;
	Wed, 14 Jun 2023 06:56:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9KQy-00AXzp-1y
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jun 2023 06:56:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f8d61cb36cso3686665e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2023 23:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686725806; x=1689317806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBs0aKrevwA5h9mUjvypGLr2oK+FBON5p++FJyHLERE=;
        b=iUBr2LImuFWXGRHui0hCrqz0CwaX2akMHzL0WnhCg9Pa8vQKA85tdu/e/2b+WjJWaP
         oZXiBm1VH1Jc0a78GcbQKer000Rr947wU04bu85rvqvyEH9PpOCMYW90TWSqdJMwIXuy
         /pOBiZTZdJSoexS4BtzF7uDQpGwmhWRy34oSHZuByorAfAo7RqpBG9vjItCpecU0sdc0
         3g5iNj0L6XopuEpeA/bXpqnEN0xuNZJWSZyJFnvbc78WraKjoKIR8/F55CackeExjh2V
         JpP3575IwOUm+HYJw/iQ8JVjQTq+LPlQYMwpK9rDudgapGzl4puFSVhuoeuYFtCQqw2r
         hf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686725806; x=1689317806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBs0aKrevwA5h9mUjvypGLr2oK+FBON5p++FJyHLERE=;
        b=A/PS9YelQqnmOHUrS3GQrTHo/M8fVwSk3JmBzJNoDJ51hylN4iGapNLhWb9AyqofN9
         A0w9OzLnR1r11CTYt6mbsOyqWZfcIrkruFCLds4i7ElDLca7tjRi/NsEUipusEWSIQ3X
         sXcTohIfUqc2d5+gQHu4OBauLBWqEw30Zqd4YFw7OycVSpyV9L1DbpAvHTI6rJCL897c
         7Gla8FtOYRQ/lU6JASovg8wemvqMw0jZ4o1xw400HzIW2YarnCBM5VwhxwD4Wb/xVrIB
         mKPDNbUlDD8gHDQkTjjO6u4eBewfISbr1YGwKhNU/dY9bTTrA8eEB/A4RStQMO7Fg0TI
         g98w==
X-Gm-Message-State: AC+VfDwdYh02D8swdFIdCMRJBhzFiXlWexrArcKsXpJ5KiVt6XRaOCEW
	/AmeEw+apbgH9h3X5U3nsX6u1w==
X-Google-Smtp-Source: ACHHUZ7GMp7Gu8C1RFa/6qFkGrVL8Ox6cxV5P8GEs/sXMcunjs+qhb5qh6wz5Ulx06qWFECBEk2R9w==
X-Received: by 2002:a1c:f718:0:b0:3f6:9634:c8d6 with SMTP id v24-20020a1cf718000000b003f69634c8d6mr10632824wmh.18.1686725805910;
        Tue, 13 Jun 2023 23:56:45 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c020200b003f739a8bcc8sm16332525wmi.19.2023.06.13.23.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 23:56:45 -0700 (PDT)
Message-ID: <9cc52c0a-c765-2cb1-93f2-6f406e676604@linaro.org>
Date: Wed, 14 Jun 2023 07:56:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add support for sst26vf032b flash
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20230609144324.850617-1-miquel.raynal@bootlin.com>
 <20230609144324.850617-3-miquel.raynal@bootlin.com>
 <b3267c392523277bf15fe8d24679add3@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b3267c392523277bf15fe8d24679add3@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_235648_664710_226E72CA 
X-CRM114-Status: GOOD (  10.24  )
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

SGksIE1pY2hhZWwsCgpPbiA2LzEzLzIzIDE0OjM0LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiAr
wqDCoMKgIHsgInNzdDI2dmYwMzJiIiwgSU5GTygweGJmMjY0MiwgMCwgNjQgKiAxMDI0LCA2NCkK
PiAKPiBQbGVhc2UgdHJ5IHdpdGggSU5GTygweGJmMjY0MiwgMCwgMCwgMCkuIFlvdSBjYW4gYWxz
byBoYXZlIGEgbG9vawoKT2gsIHllcywgSSBmb3Jnb3QgYWJvdXQgdGhpcy4gV2lsbCB5b3Ugc2Vu
ZCBhIG5ldyB2ZXJzaW9uIG9mCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9s
aW51eC1tdGQvcGF0Y2gvMjAyMjA1MTAxNDAyMzIuMzUxOTE4NC0yLW1pY2hhZWxAd2FsbGUuY2Mv
Cm9yIHlvdSdkIGxpa2Ugc29tZW9uZSBlbHNlIHRvIHRha2Ugb3Zlcj8KCkNoZWVycywKdGEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
