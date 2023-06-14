Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1053FEB64DC
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jun 2023 07:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3rTCUJs6cKkTF8/vZb2bZDkn7cusiBxlpXX1nH6Tng=; b=1WwIbzT9c7VkRG
	bVbk2nur1p7b9oFzQvIi+wLDwKheRPzaMJDMMC1QSqAKoU83mY8nUVSmioXls+md0G75LmSGumqvQ
	2ZIEL3ggfC6z0m+EJj13sabx0JC79mE+u1i2OXlaHealQ2jC6Mamyu25nau/OwL9+2thQVMorjPJr
	00YlwCUlAdDMkNuSGUQT+1lkQUC6wzi9NsFY5ITprAyAy9TrJbEc6gTyqtS5beacoE2tBuqrg3RFg
	5ywE3vuAuzZ7dJe5P39nEzPaqyM0bJSxcPk0JGYRh4GAXWUIwr2l6CYil1VrkM8o6607kt6Y2MzoR
	oRJYggJ3Tamdqd1AXcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Kh0-00Ac2n-26;
	Wed, 14 Jun 2023 07:13:22 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Kgy-00Ac0D-0P
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jun 2023 07:13:21 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-974638ed5c5so65781566b.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2023 00:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686726795; x=1689318795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39FQc7XYz/GtGHXe+c3n88fRTHbsyrn3HNjXZWiAcAs=;
        b=NwVA56Fn+jQb1rR1S0jXHfbdeJOS5uYQXaBNnwZ2Ru+/OCs2DNOzXaofntk0anDkcS
         D4KmWncBmOTo5JD8RXGlYFsn72VJB4KbsffjlMyqnlM2g1U70QiSKUwBSuYJiFeGncnH
         R7HFWigYPqeBJEeFk2ID/dUN9S3qt0uqNkwFDZaFMGzNDbI9pSyJQl32teGlhZHeFXkh
         sXsRtddWTiI2dqQ7XJXqjnwnSH25kZfrsdnND8WOQikhRhNZxNRRKpOtUhc0fUJIwmG5
         s7ZRUURWzN5NspMRe2XTnGv+igkMgRxkct9JIa3TJxxhK64gorNt9nYYEEr+gv+QwN+4
         UQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686726795; x=1689318795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39FQc7XYz/GtGHXe+c3n88fRTHbsyrn3HNjXZWiAcAs=;
        b=Y8Fsx9Jm91s9dL4ICYj8wok5jHG5DSfhpRyJzjTAgCASZ+CFMT6Rrkck61IQ7MqJPI
         NbI5I+CvhddFm7xs4hyhw5MYLAmCGE3bA78BovEp/3rzIGEimHaDWx6d92xsCmvs0x7T
         xTQLySMr/vskSUSGJMYq232Lrf/Y/ZCOS9dhbs8UUkll7VYhx/hO+AoDvDCmatZq60QJ
         sRoV6/FavNZ4Gb5v6MfWO2bp/eQDw0ygCNnQfT3fW7G+aLpUVObrC4f6tu+aOF8oNRsN
         BmRY25riA3rIQZiHWApK7F0ob8Cb3SKyLTdp+HEpbbUEDzMj7qgIu29aJCsE+NXAumOH
         HrGw==
X-Gm-Message-State: AC+VfDxlc+g+StlcbEYxZpc/rlQQ4onFz7wwRwZtZPMtw48pqBdk/Hyi
	NmbO3SkkpQWBv4bxg+THx7/JwtulbxkYSst7J2IK8g==
X-Google-Smtp-Source: ACHHUZ6NMpWJyhKT0TuIq4YDgw0CugUjDQ4M9lL7KBJ22jlm/El63ZALGxIQOdbp42ZnqhxO4D9y3g==
X-Received: by 2002:a17:907:3ea4:b0:978:8979:c66c with SMTP id hs36-20020a1709073ea400b009788979c66cmr794971ejc.18.1686726795696;
        Wed, 14 Jun 2023 00:13:15 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id o26-20020a17090637da00b009745e1b6226sm7513520ejc.125.2023.06.14.00.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 00:13:14 -0700 (PDT)
Message-ID: <5a3b770b-45af-5d66-2596-c7d2ef8d70b1@linaro.org>
Date: Wed, 14 Jun 2023 08:13:12 +0100
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
 <9cc52c0a-c765-2cb1-93f2-6f406e676604@linaro.org>
 <6bc68bc829f171dee260d1646ba58c50@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <6bc68bc829f171dee260d1646ba58c50@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_001320_162766_CED93A2F 
X-CRM114-Status: GOOD (  11.62  )
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

CgpPbiA2LzE0LzIzIDA4OjA0LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjMtMDYtMTQg
MDg6NTYsIHNjaHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4gSGksIE1pY2hhZWwsCj4+Cj4+IE9uIDYv
MTMvMjMgMTQ6MzQsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+Pj4gK8KgwqDCoCB7ICJzc3QyNnZm
MDMyYiIsIElORk8oMHhiZjI2NDIsIDAsIDY0ICogMTAyNCwgNjQpCj4+Pgo+Pj4gUGxlYXNlIHRy
eSB3aXRoIElORk8oMHhiZjI2NDIsIDAsIDAsIDApLiBZb3UgY2FuIGFsc28gaGF2ZSBhIGxvb2sK
Pj4KPj4gT2gsIHllcywgSSBmb3Jnb3QgYWJvdXQgdGhpcy4gV2lsbCB5b3Ugc2VuZCBhIG5ldyB2
ZXJzaW9uIG9mCj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1t
dGQvcGF0Y2gvMjAyMjA1MTAxNDAyMzIuMzUxOTE4NC0yLW1pY2hhZWxAd2FsbGUuY2MvCj4+IG9y
IHlvdSdkIGxpa2Ugc29tZW9uZSBlbHNlIHRvIHRha2Ugb3Zlcj8KPiAKPiBOb3cgdGhhdCBJJ20g
YmFjayBmcm9tIHZhY2F0aW9uLCBJJ2xsIGdldCBiYWNrIHRvIGl0IHNvb24gOikKPiAKCldlbGNv
bWUgYmFjayEgT2ssIHRoYW5rcywgd2Ugd2lsbCBhbGwgYmVuZWZpdCBvZiBpdC4gU3BlY2lmeWlu
ZyB6ZXJvZXMKaXMgYSBub24tc2Vuc2UsIGJ1dCBpdCBoZWxwcyB1cyB3aGVuIHdlIHRyYW5zaXRp
b24gdG8gU0ZEUF9JRCBtYWNybwoob3Igd2hhdGV2ZXIgaXQgd2lsbCBiZSBjYWxsZWQpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
