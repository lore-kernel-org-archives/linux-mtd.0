Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB05EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PuuxxsOyfNuNtu8bTOyYlty8CbCY9jQkyJ/DYVLuPZU=; b=UNDmbzheKRjSg9
	Thf9rhOSSBfdJUjunYx/95RGB6BsiStv31XapUQWWmnCsp8aXTpU+R34d7YS/iVCvvAGtjtZmIQBz
	xX5bGnIU68J0re9onvHXkiTc3PR8DdjqHSXEZ7oB8jbuei3BwyicWeWLt/xJ7MfQU2OS1OgJkbHxu
	re4ATxhYJOWVaIlknQ2NVUU+dY7VhzI1/Frbul56i+ktde9nRRRuXZDzs5Jr1p4bLbD8rv8FmYO0S
	NlT2VE0aH0Fv1hkw0zxBCIS6JdtSaO3zLv5OFri9qG1YzhJaUuMRUBCafo3a2qbrU+GZTvNe1ir07
	C7r29bFAEHb5QiZ/fyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvjW-003HaP-2F;
	Thu, 13 Jul 2023 12:47:46 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvjT-003HYV-0z
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 12:47:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31434226a2eso863169f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2023 05:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689252459; x=1691844459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+Z95kHJar6LgJuF8EaQ4xrWI5fsRo898PQkWtblwYA=;
        b=ZWtafz1E6fk6SAsYpf4lGZD1+nSgipZ/1yHk8BiiBeCPmDYFNw/BHXw8sle+l2vVmS
         HiRfDaiEutO8CKyd/tWcIbzDH68IKAq0P+wq6L3O+yCRnGWEZXF20jAOZurQ/poTKzrb
         g2OnlU1tMldBasNoMoKBcVuVSBCTsyKGMaByUKioVd4KMVuWxyelDtQjMhVnKsq5Iagw
         6P15f+uhPUS8d9HS9De43ANQUipGV+9v29ZgjBforFnnWFgsbssKQyogmv4hd+73mvAv
         lE4BynPqwqichj7yZRCL2JXaPbqySmT8UZO4u9PrfLAkj4WOjTJ+83c7+Pw5b6vArAq9
         /iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689252459; x=1691844459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+Z95kHJar6LgJuF8EaQ4xrWI5fsRo898PQkWtblwYA=;
        b=bIRUGN9dqRXuQjQOg/ymNwBbvcChj2WfpfH9JpdHL4xf4Oo1xj7oU4n0TFTUAkZNm2
         /IeBpzxoXPEAEmlTKZZYl2PHJq+65VXMjG7DQFSQSIdfOylaDVRfru6EvgB+qb2vunij
         V1R1l1IvOjeBnjA9LSbO9kNPwIfGAS7kTuRPlEEvO3jsarlMgUE8JN3kY7Jex+0ZuTD4
         CRxPrBWPApLM5SgX0mLpa0TzGd1OmW8k93jaKkktYO4sV4a+A6MQF6ljROuuIv6PANfV
         riIHPGXKmV7pItJYphk6aZYpeT68U/+bXF0WuvEmiWwb7EgSNBMpRXH3XX854QvVTPRU
         Ys8Q==
X-Gm-Message-State: ABy/qLZTfqLXAzCGFYYwnXtUecvKgfLOKGhA2GEnzXGMP8PJZS/mXHZo
	1VGZctB3MpvIPbSUIhZ3Y2qYrw==
X-Google-Smtp-Source: APBJJlFbNLe7S8IsK2vPmgsjbKmKD9UvXXP3v3+dBxQYsKg50wEXZp6DtXoc8BrOfzOVUcWK2M8cHA==
X-Received: by 2002:a05:6000:18f:b0:315:a1d5:a3d5 with SMTP id p15-20020a056000018f00b00315a1d5a3d5mr1544161wrx.22.1689252459616;
        Thu, 13 Jul 2023 05:47:39 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id m15-20020adfdc4f000000b003142ea7a661sm7905018wrj.21.2023.07.13.05.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 05:47:39 -0700 (PDT)
Message-ID: <cb852190-2128-ee92-ff64-a47bd262154a@linaro.org>
Date: Thu, 13 Jul 2023 14:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 04/15] dt-bindings: timer: oxsemi,rps-timer: remove
 obsolete bindings
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-oxnas@groups.io,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-4-fb6ab3dea87c@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-4-fb6ab3dea87c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_054743_345660_11103F46 
X-CRM114-Status: GOOD (  10.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMzAvMDYvMjAyMyAxODo1OCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gRHVlIHRvIGxhY2sg
b2YgbWFpbnRlbmFuY2UgYW5kIHN0YWxsIG9mIGRldmVsb3BtZW50IGZvciBhIGZldyB5ZWFycyBu
b3csCj4gYW5kIHNpbmNlIG5vIG5ldyBmZWF0dXJlcyB3aWxsIGV2ZXIgYmUgYWRkZWQgdXBzdHJl
YW0sIHJlbW92ZSB0aGUKPiBPWDgxMCBhbmQgT1g4MjAgdGltZXIgYmluZGluZ3MuCj4gCj4gQWNr
ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9y
Zz4KPiBBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+
IEFja2VkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IEFja2VkLWJ5OiBEYW5p
ZWwgR29sbGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFy
bXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiAtLS0KCkFwcGxpZWQsIHRoYW5r
cwoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFj
ZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMh
L2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cv
PiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
