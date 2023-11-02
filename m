Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAECC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 17:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nbpsT2kSNTt6scocAbxzonU274pwfwuRaJ44PFKOdM=; b=wNmWy4gfs8cMYN
	SavvE6Nq7CJdU18pye+Ld9EGAZJklD9oTWyA5jVNRfFVMBUYqDzQbYuZY7z1IrYs21rNoYNoNHDIo
	j228dNAkuSOMSOj5eVV3IrNBzfpG5Ndu2KpxDieqVgCvNJ1ZOypg5GfKHdELFR5U11VRqFxTr8h83
	TW6VObTEqYojGFJhrE2/3BZSm7jBgCAbBlUH0/DZs2w5lVzj7QGi+ybLav6hCEQsdRCG2WzUF8vrc
	0q8jMlufyC5D/npC3wcb5zeCB7DJ8O8PpH6SufYVxLbaBFflv5EzTK+GbX6+bceju8LvKn6wQQpLG
	In/qvwEpuHHPOGYSJELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qybmz-00A0q0-35;
	Thu, 02 Nov 2023 17:47:29 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qybmu-00A0o7-39
	for linux-mtd@lists.infradead.org;
	Thu, 02 Nov 2023 17:47:28 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53e2dc8fa02so2047614a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2023 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698947242; x=1699552042; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/cFwyYS7uOn8k2gMHqkWFp3sCnlFOi5NXTVNZgQF6bM=;
        b=VjKV46Rhhbfu7RbZnnAPbI1HrqOXzEw3SARpq5ECfzLot3GjrGyK6Hdh6l0bV/aJJ4
         D+bxDq1nLHIFrMhT8cUwB5WJ1iCnJEPx3sLoNehs8yZhElDO+uIoe28q8ePQPYTnimYu
         fnODdTR+FwICMM3eZUokPGvdn4xAPqHWdYgJnU2+sO2Zs8I09s0oDSVvNNSGLoFfPWIs
         sgoxwfOhJ90eP2w+57MpTubJyRL9FAGsj2HYnCCqChHiX4cZvqQr2JlnyboZb6yFRm8t
         hD2WzMaZCVAdRIpxinWjvennIz8//D173LYXj9rG7xwiodWM9BVn1URt1QaygHkvKj9X
         PsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698947242; x=1699552042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/cFwyYS7uOn8k2gMHqkWFp3sCnlFOi5NXTVNZgQF6bM=;
        b=Vu24hWjadD8z0igkdl85fNZvIhq+YITCOT7X38KpOGS1Lvh0/+uvk53QipLo5Z7vK7
         4HHyE0A/2lex2qz3taiXzLCrVHg9P0rgUTkaPQTUHAdITuo2MWX1YqttHxAaXm001unY
         K+xGt0tn76vU+3XwjpxBoaKqbai9IDO2X+bBHJCn780wU7nad1UXGxVNrknwGahOPMQ6
         uRwOTLT3Q8hNaLqEPNnij95YFmHy/tdWW2lNQLhaeRP6FK4QiGwXVLU0rWS67CEoEUAm
         tAdfmwzLD75aMNkpk2dDVchuLj0lLHkOFB5lEmzZTE1raykZ3wartulQL250Vvco5/gt
         PLZA==
X-Gm-Message-State: AOJu0YxWlPmUbwM27f4xXPrNTdyc/j6PzmIaH4DZ/O9hLINFtXK6apyW
	bc7TGmLqUYeq5M2m/DNcNWJTLg==
X-Google-Smtp-Source: AGHT+IFmJwx8RcxoBbjoS3q1lixMj5o2MLYFKljUAHnWGh45w265N0Q/Q8SVwkeO0VfUuE25F5KywA==
X-Received: by 2002:a50:bb66:0:b0:540:b524:5228 with SMTP id y93-20020a50bb66000000b00540b5245228mr15545675ede.33.1698947241877;
        Thu, 02 Nov 2023 10:47:21 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id 2-20020a508e02000000b0053df23511b0sm150264edw.29.2023.11.02.10.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 10:47:21 -0700 (PDT)
Message-ID: <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
Date: Thu, 2 Nov 2023 17:47:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <632457ed6b022856496537bdf8a738ba@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_104725_016115_5B4B7833 
X-CRM114-Status: GOOD (  11.18  )
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

CgpPbiAxMS8yLzIzIDE3OjQwLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IEhpIFR1ZG9yLAo+IAo+
IE9uIDAyLzExLzIwMjMgMTQ6MzYsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gCj4+PiBTUiBpcyB0
aGUgc2FtZSBiZWZvcmUgYW5kIGFmdGVyIHRoZSBjaGlwIGVyYXNlIG9wZXJhdGlvbi4KPj4KPj4g
d2hhdCB2YWx1ZSBkaWQgaXQgaGF2ZT8KPiAKPiBbwqDCoCAzNS43MjYzMDVdIHNwaS1ub3Igc3Bp
MC4wOiAqKioqKiBTUiBiZWZvcmUgZXJhc2U6IDB4Mgo+IFvCoMKgIDM1LjczMTU0M10gc3BpLW5v
ciBzcGkwLjA6ICoqKioqIFNSIGFmdGVyIGVyYXNlOiAweDIKPiAKPiBJZiB5b3UgaGF2ZSBzb21l
IGRlYnVnIHBhdGNoIHRvIGR1bXAgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGlzIGlzc3VlLAo+
IEkgd2lsbCBiZSBnbGFkIHRvIHJ1biBpdCBoZXJlLgoKSSB0aGluayBJIGZvdW5kIHdoYXQgSSBn
b3Qgd3JvbmcuIEdpdmUgbWUgZmV3IG1pbnV0ZXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
