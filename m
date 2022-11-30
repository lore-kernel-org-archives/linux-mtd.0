Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245CEC4321E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Nov 2022 08:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIrENSfZEFksloDfh2xbNj7GvKuQFjFkNdnVPii18TE=; b=20qUBkx4BUeAQx
	bOQsYKpYzh3Wy4yApZovaXGi1xgmZdIcrr/PU4+zNnBwHdjGeG47OzfVBh9odif+FTwdh8tgoiKn4
	dV93VorBT0h10GtyiNOD5Vamv6SDD70NWKXnlnkAybF36Ss0HoTC/Mx/BtobzR65+e3KZZrPSjaUn
	KXTB4gAu93tKBWSFEB7vA7Keshie1/7OBmlSf73NoDJObD2zvvZd4Shl3aP6XLlWpeQzjqD8Me10K
	9v5WdhssL15TQGpoctgNtjpeXtMb7JmqoYyHk7CCiieaWbstbY60lWu6yAl9kvKVhR00tLz7xJFax
	z1zcwWx9XOyxne8jYSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IXa-00EZZz-4A; Wed, 30 Nov 2022 08:34:02 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IXY-00EZWZ-14
	for linux-mtd@lists.infradead.org; Wed, 30 Nov 2022 08:34:01 +0000
Received: by mail-lf1-x132.google.com with SMTP id b3so25826801lfv.2
        for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2022 00:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bInR2egbUtB2hdBJUO3XKA2gh33pftK8BC1pboCK4Cw=;
        b=zcjMf5MiAzYT57sPm6IN9blQQbOHLzrtaEsAe7mOQqNQvADeYMPI6oVtT7tEITeYcV
         DagPXMaBFptf7ab5MlLq3GvjTGyfkxJym+RiU8PnSWHwog0c7q/EAgdXvIGj5hBB7Yuc
         CBUcKNqdu1JTahD0Eym6DaDoPS/zGPNtZqbIBLtsrQWEMz+adpWWlKy2qMfXmb9j7KWi
         amSs0oAAQRlsisUu7q0gT75bG2xBY8l5S3FMwNTVJt0GgdLHoprXxlaD6asuPtqDu0QG
         FvvxlX4k8VOxiqiOVj0w0KO5kcAt1yb1ChuyULvXbQMzPNaesCIpu9ZnuTN4cEN8dW+n
         dUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bInR2egbUtB2hdBJUO3XKA2gh33pftK8BC1pboCK4Cw=;
        b=SN8uZuYY0//Ijvu5EJKIsLdCPwqOirsr1v1A6bS1BAHxeesP9q3dVM7qruANahIE08
         TRC9rVr5MAW2Bgrjoxhi7JN1pu987YLIkaK5wFLSX07D6j8T8NMe2z9RxzFW3HUsA8+2
         wcA2fIjtHZnFoMtASidyjRytn66H9bOQ1AkZ4N0ohUmBwDSR0IGpKjgZhrhVgXZ7qr9o
         bH2SDkFEnLMhaX8xZM8ecUm/lvulmVg9OfTAGAupNrjS6wWSoBBlRBLfLau9tKPYCKF/
         0vieRX/buHnohKFtPacjTdUzhiOANDbEwIbOf+CmvfHL85jmopzkPqKEprJL93Ls33Cj
         Wybg==
X-Gm-Message-State: ANoB5plm9AWriPbZUjhjTeuUHA8X3cDjwmb7F5ZL06m6b1gJPUHshXj8
	kIsU57CMSYOy6uOrloNlXjkqGg==
X-Google-Smtp-Source: AA0mqf5ij2hVTbkErt4ghcZygMlO+KN57N0P9UqggTllmp6/9wSbhnOoztToCTHGNxgcaruT7tXxuA==
X-Received: by 2002:a05:6512:5d4:b0:4b0:8622:662f with SMTP id o20-20020a05651205d400b004b08622662fmr21180119lfo.316.1669797235649;
        Wed, 30 Nov 2022 00:33:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m2-20020a195202000000b004a47e7b91c4sm163429lfb.195.2022.11.30.00.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 00:33:55 -0800 (PST)
Message-ID: <cc2f8ded-f88b-66d0-3ec1-9e1cd74b493f@linaro.org>
Date: Wed, 30 Nov 2022 09:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/9] dt-bindings: spi: mtk-snfi: add mt7986 IC snfi
 bindings
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-6-xiangsheng.hou@mediatek.com>
 <8b8e4b23-a3bc-7e3d-199a-e8f591d05d71@linaro.org>
 <5f76482d33933c19e191ea618f8622cd0660597f.camel@mediatek.com>
 <e512b7fd-3404-3c2d-dbf6-dc66ee662a06@linaro.org>
 <36d71d033f6926dfaefed7010bced94b4cd4b339.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <36d71d033f6926dfaefed7010bced94b4cd4b339.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_003400_115502_3D29A1EC 
X-CRM114-Status: GOOD (  14.11  )
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

T24gMzAvMTEvMjAyMiAwOToxOCwgWGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCkgd3JvdGU6Cj4g
SGkgS3J6eXN6dG9mLAo+IAo+IE9uIFR1ZSwgMjAyMi0xMS0yOSBhdCAwODo0NyArMDEwMCwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMjkvMTEvMjAyMiAwMzo1MCwgWGlhbmdzaGVu
ZyBIb3UgKOS+r+elpeiDnCkgd3JvdGU6Cj4+Pgo+Pj4+PiAgICBjbG9ja3M6Cj4+Pj4+ICsgICAg
bWluSXRlbXM6IDIKPj4+Pj4gICAgICBpdGVtczoKPj4+Pj4gICAgICAgIC0gZGVzY3JpcHRpb246
IGNsb2NrIHVzZWQgZm9yIHRoZSBjb250cm9sbGVyCj4+Pj4+ICAgICAgICAtIGRlc2NyaXB0aW9u
OiBjbG9jayB1c2VkIGZvciB0aGUgU1BJIGJ1cwo+Pj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjog
Y2xvY2sgdXNlZCBmb3IgdGhlIEFIQiBidXMgZG1hIGJ1cywgdGhpcwo+Pj4+PiBkZXBlbmRzIG9u
Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBoYXJkd2FyZSBkZXNpZ24sIHNvIHRoaXMgaXMg
b3B0aW9uYWwuCj4+Pj4KPj4+PiBPcHRpb25hbCBmb3Igd2hpY2ggdmFyaWFudHM/IEZvciBhbGwg
b2YgdGhlbT8KPj4+Cj4+PiBJdGBzIG9ubHkgbmVlZGVkIGZvciB0aGUgaXRlbSAzIG5maV9oY2xr
LiBJcyBpdCBwcm9wZXIgd2l0aCB0aGlzCj4+PiBkZXNjcmlwdGlvbiBvciBhbnkgb3RoZXIgc3Vn
Z2VzdGlvbi4KPj4KPj4gSSB1bmRlcnN0YW5kIHRoaXJkIGNsb2NrIGlzIG9wdGlvbmFsLiBGb3Ig
d2hpY2ggdmFyaWFudHMvY29tcGF0aWJsZXMKPj4gaXQKPj4gaXMgb3B0aW9uYWw/IEFkZCBhbGxP
ZjppZjp0aGVuIHJlc3RyaWN0aW5nIGl0Lgo+IAo+IFRoZSBNZWRpYVRlayBTUEkgTkFORCBjb250
cm9sbGVyIElQIHVzZWQgYnkgTVQ3OTg2IGlzIHRoZSBuZXdlc3QuCj4gSW4gdGhlIGZ1dHVyZSwg
dGhlcmUgd2lsbCBoYXZlIG90aGVyIFNvQ3MuCj4gSWYgYWRkIHJlc3RyaWN0aW5nIG9uIHRoaXMs
IG1heSBub3QgZWFzeSB0byBtYWludGFpbi4KPiBEb2VzIHRoaXMgYWNjZXB0YWJsZT8KCkkgZG9u
J3QgdGhpbmsgaXQgaXMgbm90IGVhc3kgdG8gbWFpbnRhaW4uIFdlIGhhdmUgaXQgaW4gbWFueSwg
bWFueQpiaW5kaW5ncy4uLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
