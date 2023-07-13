Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4495C001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9OO3pWQw00hC24ySZeO0KjFsJaE0WouUgqxbHDRO4lY=; b=aNFbjONcYK7/fp
	xu+HlJQCCM/zooN3SqVehpWpnjWXpD/YufMI2LtyC/gALjOYHNjkU6TRztb8yA42HyH8OAl/AlsVk
	MRDbuEhyGKCGu/TjaS8xklS88CA2RTkbjLY+/cfQnIwF/SpMYEkgy9ru0E8uE09fMO3m5JPHna/MB
	V32/kICP994nBHxCsUnYC9wGYIoJthAHw2aHL9ZW6cKX8AThC/Ry3/msoDOZm04GIzlUyx1EXdy6o
	kZL4dpqm4vuZ53r76ga1Na+YAWXf7sHS/mbjbF7LEJIhbBpG+qEx4sD0SBS7Y5KZ53D7820/ssvzd
	qfH+6jWh8jSfQSmBlimQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvjG-003HUZ-0d;
	Thu, 13 Jul 2023 12:47:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvjC-003HRe-1J
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 12:47:27 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso5720715e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2023 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689252443; x=1691844443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQ3qFqjqaXg+xhPM/OfBCqCifetSEr6v0qh2wFRe3uY=;
        b=i92G8JKNvparwYPbnBagAXWtkyNe6OrAoGY9MTlkldD3dcYsmXZ3Bt9jlIdwM2BXw8
         y7VwQuUjzVfo2hn/Z4OmMX5D4XvCfjpmVWf0+sN7AhHmbLD1K7WWAcxUskC/EWIteL8z
         pgwUmWYhX8oZBy3/z3S3eTV3rj9qdeF+eLnSaryryK2Fn2XtSu1bcxYL6zRfHFZcWQbj
         o95SzvzKnzTUxrsIQTRwhPZDtDeOX3bI0wN+8BVAJtYu5K496kx8UGOBm5TXXoXPyfxj
         ahgWHaBBmBLhBgcffwYFyZzltxlkgbx/Ofx9KG2EfQV3SNejzzzEUu1cmN1xW095yUcD
         p+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689252443; x=1691844443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ3qFqjqaXg+xhPM/OfBCqCifetSEr6v0qh2wFRe3uY=;
        b=IKzA6FA98JC9ibmxo3THSE/SnZjsCrustzz/YBc75cgMULgDtai4x1NyHhhIp0IuVS
         hWqCmkH+9LuUWHdyrOk2uPdGAUD5W+brJmsqKdoOax6oVXP022akHYTnxvSNVmXwocLo
         TEdRt509WIALk6htRAnPThy8cOQUI0GiWyZtk5ikk5/JB7cmqqL26UuRI+mO5ZTR9KsJ
         hlkSPa0WVcPko7JRM5u7OHw/JpS4UiqSswt0mhqrwp0Nk5Zlmj5FSsd5FYWNYn55rKp5
         QdyDnTQM5pPYxfsdkWOC64dtk6RiWF2At7nF7PEZnEooA77zbfwCAEAX3TZVk2aPY+8w
         NVzw==
X-Gm-Message-State: ABy/qLZUBtNcilDhnSbLe/C2bCxmD3+b8zb98YTCgtIx1OzSTQOPtbGc
	y/yg1/tPpa9AmmtwICsvU1jMxg==
X-Google-Smtp-Source: APBJJlFv2JV2cNu6AAcxonI8NW8JRqwtxih4OqWDpmqP+QB4MCgD6qwhTqxWsmWLF+OTALNCxkZ9hQ==
X-Received: by 2002:a7b:cd95:0:b0:3f7:3699:c294 with SMTP id y21-20020a7bcd95000000b003f73699c294mr1277212wmj.29.1689252442663;
        Thu, 13 Jul 2023 05:47:22 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id fa16-20020a05600c519000b003fbb1ce274fsm5488171wmb.0.2023.07.13.05.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 05:47:22 -0700 (PDT)
Message-ID: <2ddb2042-a654-bc60-2060-b21e3acd6f31@linaro.org>
Date: Thu, 13 Jul 2023 14:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/15] clksource: timer-oxnas-rps: remove obsolete
 timer driver
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
 Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-3-fb6ab3dea87c@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-3-fb6ab3dea87c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_054726_452359_008E20B3 
X-CRM114-Status: GOOD (  10.93  )
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
YW0sIHJlbW92ZSBzdXBwb3J0Cj4gZm9yIE9YODEwIGFuZCBPWDgyMCB0aW1lci4KPiAKPiBBY2tl
ZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IEFja2VkLWJ5
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IEFja2VkLWJ5OiBEYW5pZWwgR29sbGUg
PGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8
bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiAtLS0KCkFwcGxpZWQsIHRoYW5rcwoKLS0gCjxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20v
cGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3Jn
PiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
