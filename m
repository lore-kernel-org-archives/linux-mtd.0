Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EF2C00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaJpYfTLu0GzbDZCjSEVBCvWWNzRyXVZv2AFNsKHQbg=; b=uaeCLKtcxtHCzk
	LqYpA/hESu4WfjXKizqX/lLsBLUzbKQBCrjxP2kuyDJkc78WL4Mk+sS5Q8GBE+6U9dyP3RswHjeO8
	jkOiag6mG+be/ZbSPVn2BP/YEEDWLyMN/hSlfixiIFJ4XeAAQIK95wxw9Iclls7AWolPUthwt1H90
	mMwqVy9nNLj+yNjdopR58TOlm09gTaiJmBm29Nj2yfhXLpFellhvQpFPEHBXYN7LXQzCuqMNCXDpk
	zQigxPkW7eNZrRO0Kpn1htUJ2zExSSV5cgBtxgXKTNotyjcaqSCp9yOHVeAt1ick7TN8/OIITOEtT
	ZUo5eVswGOjsU8Q14qKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJj2-00AOQt-0k;
	Tue, 24 Oct 2023 15:53:48 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJiy-00AONk-1V
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 15:53:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9c75ceea588so660835766b.3
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698162820; x=1698767620; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1aIpcE8EftqBoYtpVC2x5dFGutP/yLTL0D2x8TWXys=;
        b=lnOGLt5u66Uelgbi8wmghANhbegVB+cwn80EiCM8F+Cqp/WcnmsGOSYR3R+loD+sJ/
         ZxaKmMsEwTKayJEAO4XjEhj7MpYCDhqA01/Le77lsB0SnhndoYZgnfa37IgUewhSwE2j
         Lrj4ldDhOx5Of5TVpv7rSw920osWqPRrHmGpnz8hZuoBjxlC8V9gNIjVpA/GVilsIgBS
         RRKqpm20aRCnrSA/b4jI6LC6o3jfP0oyTFQrgEet13rESUZJmm7Tht/kCn/YAPpGaJcV
         vqmsieSDQygQ2lpaZ+HnjwC0j6IW/2Xis+BKGEBP0C/bttq2iNN3/LdRGISXnXAtlLtQ
         kvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698162820; x=1698767620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1aIpcE8EftqBoYtpVC2x5dFGutP/yLTL0D2x8TWXys=;
        b=BT9eXeIDByuScsCXrjDS2l57LtQP0YyanuMa8lyIjjrZPEelXvLULMuTkkVWA2Qh3w
         13NUNDjHooKG3+GQsAF5LFSYRPzi4N++vXRKikJ23NGlmwvpAN3Og9YPmvwNEgm+b5c4
         PmrwxlAtTSxO4f5Oyoq3P3keT9+Q/ous8s6RUSDmjEnYgxoGdPOTjprjDim0xVB9KG9U
         LGfnYBrCM4xcKZLjM3xN9wkAocm6GeCO9U03ajACGPuPVgVgxkQkFvFxVzFnFCtJFvIA
         nfo5GOdIKcTDdQKP6rCKCk1SVPS4pckLkwDR8wBcWVcIQj6ScznIeOIF8dEtxRqInFMI
         rAjQ==
X-Gm-Message-State: AOJu0Yxf5icBcag+o3z0IvyB5PHYmWcVRndFq8oQcZPsrB3pK+T86rKd
	EYEe15UCZoTRxovylXATmK6tMCudg8Ka1JBmEOk=
X-Google-Smtp-Source: AGHT+IFZs3orZxYpRm1VNzhWec5GjUMF4oaecRGA4a8o8YR9kFJnEQRBR3nR9/FrLoWaYrHsZLZHeQ==
X-Received: by 2002:a17:906:fe46:b0:9b2:b7f2:bc7b with SMTP id wz6-20020a170906fe4600b009b2b7f2bc7bmr9098646ejb.37.1698162819791;
        Tue, 24 Oct 2023 08:53:39 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906088d00b0098ec690e6d7sm8453030eje.73.2023.10.24.08.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 08:53:39 -0700 (PDT)
Message-ID: <4faa5d37-ddf8-4edd-bb0e-a192d16df488@linaro.org>
Date: Tue, 24 Oct 2023 16:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, Michael Walle <michael@walle.cc>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@denx.de>, tkuw584924@gmail.com
References: <20231023213800.2599704-1-festevam@gmail.com>
 <6183891066787b6c24df11e0d601ed26@walle.cc>
 <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com>
 <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc>
 <CAOMZO5BfEsB2vv__F7kkMo9Q-oHD5PiCmaK-ruU-ds9XabUc4Q@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAOMZO5BfEsB2vv__F7kkMo9Q-oHD5PiCmaK-ruU-ds9XabUc4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_085344_507739_D6BFB592 
X-CRM114-Status: GOOD (  12.03  )
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

CgpPbiAxMC8yNC8yMyAxNjo0NywgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiBIaSBNaWNoYWVsLAo+
IAo+IE9uIFR1ZSwgT2N0IDI0LCAyMDIzIGF0IDEwOjU54oCvQU0gTWljaGFlbCBXYWxsZSA8bWlj
aGFlbEB3YWxsZS5jYz4gd3JvdGU6Cj4gCj4+IFlvdSdkIG5lZWQgdG8gY2hhbmdlIHRoZSBjb3Jl
IHRvIGFzc3VtZSB0aGVyZSBpcyBubyBjaGlwCj4+IGVyYXNlIHN1cHBvcnQgaWYgIm5fZGljZSA+
IDEiLiBTbyBmaXJzdCBzdGVwIHdvdWxkIGJlIHRoYXQKPj4geW91ciBTUEkgZmxhc2ggd2lsbCBz
dWNjZXNzZnVsbHkgcGFyc2UgdGhlIFNGRFAgYW5kIHNldCBuX2RpY2UKPj4gY29ycmVjdGx5LiBU
aGVuIGFkYXB0IHRoZSBjb3JlIHRvIHNldCBTTk9SX0ZfTk9fT1BfQ0hJUF9FUkFTRQo+PiBpZiAi
bl9kaWNlID4gMSIuCj4+IFRoZSBnb2FsIGhlcmUgaXMgdG8gYXZvaWQgYW55IGVudHJ5IGluIG91
ciBkYXRhYmFzZSBhdCBhbGwgYW5kCj4+IHN1cHBvcnQgdGhpcyBmbGFzaCBvdXQgb2YgdGhlIGJv
eCBieSBqdXN0IHBhcnNpbmcgU0ZEUCBjb3JyZWN0bHkuCj4gCj4gV2hlcmUgaW4gU0ZEUCBpcyBs
b2NhdGVkIHRoZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgbnVtYmVyIG9mIGRpZXM/Cgpkcml2ZXJz
L210ZC9zcGktbm9yL3NmZHAuYywgc2VhcmNoIGZvciBuX2RpY2UuIHNwaV9ub3JfcGFyc2Vfc2Nj
cl9tYygpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
