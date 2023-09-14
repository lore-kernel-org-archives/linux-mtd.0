Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988CCEDE98F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWHiuHSwOSCa2lyrXEpE/gJAVo2RdHhFaupvj/gHL2s=; b=4AAtTziYZjjTCD
	v/GbmuXSdZ4UvovQWEHWKjKQMMVjY8ynZyaXLDWN7SX7A4a1KUzUR4d167u/GIKX6apd4RrkCqzbK
	AQ+623em5niAIIZROaMnUNu5n2adigBm0entlq+hmvp4/bc6ZltdhzWimIBgmedSjGT4G1Q5aeWZN
	T0rpNfLfYOixquMBDtrdvQU3LX/pjMBp28y/Rf9vVAAkQhT02CoHFDVVcFLiSecW6ZNdsgj7uq5kt
	ZFjsFKoaDqQU8ruk3mZdaO/Sju1XnBMeNndBnmsbzzTiYNFuiskX1G326nCzcZTh9S5NG9Hu3ulKU
	woEglZHIJFrjjl3Dh4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghP7-007ezi-25;
	Thu, 14 Sep 2023 08:08:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghP4-007exQ-0g
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 08:08:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-401ec23be82so6948015e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694678921; x=1695283721; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aFIpHL9VYrVju1srIEb7KTEErlMH5PD4UTJ9ZjItCnE=;
        b=kL9iJoGsgZ8KlS89tR+z4s3n5ulbMEPfC4hVA0DEL5TEmxqBdEUd2u2J/bbz5/aEDK
         EmG8Xz6tY6JnoEEm7BJk9kDl8SxebcJ063kcs71j+q7zKcRw4Ah679bhmYzEr0t/glDc
         d+XV1+q7Y5JJMV7JRVZO1Z1/He0e/o7IrXB4PYzptMPD7x3a5Ztj4chykvmPisp//z62
         xUaa5gWZLQkiGO4Cb6gztPEKuOEuPQ5c8THljhD9NBF07IfJqJYfW0UhpLoqACmODPtj
         MV9x8NIU8G6ZO9Gyh2xZZ7phg8Do2IAmkWsecWfCHiOgxHfgBO8asbTceIre2oEnyu80
         NjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694678921; x=1695283721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFIpHL9VYrVju1srIEb7KTEErlMH5PD4UTJ9ZjItCnE=;
        b=Ry6FQriCcpgXVhMA++Vkqia16BT1ViLzmvTHQEEA6xnuNtikDg5m3C8vIfJ8C/R0Oc
         D641N6cMIlgl/2HSj2RJaOtx2JGatHiu5xrb3nLck7x2edtQ7wRrCZ5ivCdqgdCm5ffZ
         t3cBhCUFAAtMJ4KaPM4mE1kNybcMQSkfcMvRU0INwvyYrcyIQisxlrDegeg1oyTaSRoJ
         mEaaUGC6tIsfQAnuHKPruFK78xr0QZmHnVV68ve6vYqxIIK3E6npBH9glF9qJCdnFFuV
         0YQ58/A74K5oFjBpbztmOTJCgMLZ0sRc7kCaaswt19Ok1WdyV0l9iHksSLZxUSC635bM
         1ILg==
X-Gm-Message-State: AOJu0YxiLdx/7jdK48IbkSCx16a9B26xLFW63s+fP7nKhqLhqIFyAQp0
	cGURYV7dH0ztvurwrUzwAvNTww==
X-Google-Smtp-Source: AGHT+IHdSSW7cqigrJz17mNPzAMmgLW3bAzPGgKG7KPeyKWDC6CMaXrSzXIfxWpY/Jyu3wDtBpMs9g==
X-Received: by 2002:a5d:4a09:0:b0:317:70da:abdd with SMTP id m9-20020a5d4a09000000b0031770daabddmr3889005wrq.59.1694678921435;
        Thu, 14 Sep 2023 01:08:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id z8-20020a056000110800b0031f3ad17b2csm1045535wrw.52.2023.09.14.01.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 01:08:40 -0700 (PDT)
Message-ID: <502336e9-2455-f3f6-57d1-807bc4b71f7f@linaro.org>
Date: Thu, 14 Sep 2023 10:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash type
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
References: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
 <TYCPR01MB5933571F06789BFF27A8FCC786E6A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYCPR01MB5933571F06789BFF27A8FCC786E6A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_010846_254865_B63361DA 
X-CRM114-Status: GOOD (  10.48  )
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

T24gMzAvMDgvMjAyMyAxNzoxOCwgQmlqdSBEYXMgd3JvdGU6Cj4+PiAgICAgICAgICAgICAgICAg
cmVnbWFwX3VwZGF0ZV9iaXRzKHJwYy0+cmVnbWFwLCBSUENJRl9DTU5DUiwgQEAgLTc3NCw2Cj4+
PiArNzc2LDEyIEBAIHN0YXRpYyBpbnQgcnBjaWZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPj4+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4gICAgICAgICB9Cj4+
Pgo+Pj4gKyAgICAgICBpZiAocnBjLT5pbmZvLT50eXBlID09IFJQQ0lGX1JaX0cyTCAmJgo+Pgo+
PiBXb3VsZG4ndCB0aGlzIGFwcGx5IHRvIG5vbi1SWi9HMkwgc3lzdGVtcywgdG9vPwo+IAo+IEl0
IGFwcGxpZXMsIGlmIHRoZSBkZXZpY2UgdXNlcyB0aGUgZmxhc2hbMV0gb3IgWzJdIGFuZCBpdCBu
ZWVkcwo+IDQtYml0IHR4IHN1cHBvcnQuCj4gCj4gWzFdIEZpZ3VyZSAyMDogUVVBRCBJTlBVVC9P
VVRQVVQgRkFTVCBSRUFEIOKAkyBFQmgvRUNoCj4gaHR0cHM6Ly9tZWRpYS13d3cubWljcm9uLmNv
bS8tL21lZGlhL2NsaWVudC9nbG9iYWwvZG9jdW1lbnRzL3Byb2R1Y3RzL2RhdGEtc2hlZXQvbm9y
LWZsYXNoL3NlcmlhbC1ub3IvbXQyNXEvZGllLXJldi1hL210MjVxX3Fsa3NfdV81MTJfYWJhXzAu
cGRmP3Jldj0zZTViMmE1NzRmN2I0NzkwYjZlNThkYWNmNGM4ODliMgo+IAo+IFsyXSBzZWN0aW9u
IDguMTQKPiAKPiBodHRwczovL3d3dy5yZW5lc2FzLmNvbS9ldS9lbi9kb2N1bWVudC9kc3QvYXQy
NXFsMTI4YS1kYXRhc2hlZXQ/cj0xNjA4NTg2Cj4gCgpHZWVydCwKCkRvZXMgaXQgYW5zd2VyIHlv
dXIgY29tbWVudCBvciBkbyB5b3UgZXhwZWN0IGhlcmUgc29tZSBjaGFuZ2VzPwoKQmVzdCByZWdh
cmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
