Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2FEFA373E
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Oct 2022 18:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRYb7NlPsWDRqgchWPCznlA6TzmD6WClUTVj5AOQEvw=; b=2U5JOSRsqqbUgr
	tjLPwvekpxbNXC2RSRsiKGwXJoKIkdhYu0OXuujgQELFHT00pGBX+I1WtLaz161PnFm9fSnB/lYPL
	iOLTgniRqYDvHpbNzUuhrSLSTa4DU1GloBNAuYdbm4huXWEfDpDSP7s+x+8+611HHMt3Ttxo4jHiW
	3vuQZeMPO54yUBMNYZq7e5FmEpx3E0ugV9SB9cAPcqsgJ8jYxcfrdqWq3ZGciz87Ke+qesZVbx9/g
	mzdZ25kxpODgNTECE61pW+AwpN/oLfIPFrWfQeR8Xtbs25kZcZ6cGlEwMH6OIYPZhkY71Mlq32BE6
	EOHDIN+pNSgB9TIZPQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omfPI-00FtU2-OO; Sun, 23 Oct 2022 18:09:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omfPG-00FtRU-6k
	for linux-mtd@lists.infradead.org; Sun, 23 Oct 2022 18:09:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id l14-20020a05600c1d0e00b003c6ecc94285so5877516wms.1
        for <linux-mtd@lists.infradead.org>; Sun, 23 Oct 2022 11:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SqFi2wmLGXsQfu/MZ0ShWytXRLk9pwr7X9yOqzu3XMM=;
        b=xr1jMXVmN57HPedWjHBHw1rrR1I978R/fF6s6AJxl5r6la7lQvhSNZVE8+g2y0CLiO
         sDalDXJWkgYjhjEW/tk2thpgvWl6aN/4cUoHucR/vgyQGfBHk/P8fVym9OLTYL9CaDNc
         gW1/wghLPtZzxuOCGhEE5dyrYtYTJsZ7jphSDYrKqG+oJwnjxwiZMzhfPhUVrkSGT+zu
         5VweFASmBJDlLQN+flFQth9QRLtbPOQNBbETZ75/uwAkj0tW+hrOnW5GnQhWc/dIW6xR
         vnkUaLQLdc5GSXiDVFlRPo8TgQp1RGMp1/59R56exH01qg/nbJrdKRA5l0wPE4Qmy1c+
         JkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqFi2wmLGXsQfu/MZ0ShWytXRLk9pwr7X9yOqzu3XMM=;
        b=gaxHNLUzrx1xh2xiDsYqkI/HJhJfhWgPfY5totr4Qm+BUdKhb/KqAmZMcIsm6Hdilg
         o8iAfFjon1SnaG8Ue655guaI8IS28j8KVTBEL9eW/S4C3XOh9vkYKRXdfJ3KooMrHBuR
         7fMcQgMUA9619ywJqi0UiYAVazdFCPlQ8HGKsaDbZGPKUO9rlPx0hc6QbsZMig1u2d9e
         RwctZGdgi5cedDRlFlOwQvwHQN6PNR6IxcPaReos3pi4AA3YRjtZR0xjdVHyFn7OdgPk
         D1+MDPM5HM/WFgcQVN2Fv7BBNKOW2WxVjPVznFK2kZ+6nwnHP+hs7pHOlbwjOWSnslNn
         dDmg==
X-Gm-Message-State: ACrzQf2QHvothHcW86zLwiT4nBkouCkr19mCG6C9GpTtLFrjOZD/6INz
	vATy6ZpYd6Dkcy5urldg27H+7Q==
X-Google-Smtp-Source: AMsMyM72SUpT+H3YAHck0Mm/xenvuseMLAPPp2oOExNAh4/7iab4VjcAEYTBVCFws4DOL079RWUZ7Q==
X-Received: by 2002:a05:600c:5104:b0:3c6:d8e0:bc2e with SMTP id o4-20020a05600c510400b003c6d8e0bc2emr19762303wms.156.1666548538775;
        Sun, 23 Oct 2022 11:08:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:14a0:fbb0:c618:c972? ([2a05:6e02:1041:c10:14a0:fbb0:c618:c972])
        by smtp.googlemail.com with ESMTPSA id g10-20020a5d554a000000b002364c77bcacsm8318216wrw.38.2022.10.23.11.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 11:08:58 -0700 (PDT)
Message-ID: <b085d1ee-2924-47f5-a952-27040ae3eb1c@linaro.org>
Date: Sun, 23 Oct 2022 20:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/21] ARM: s3c: remove s3c24xx specific hacks
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
 Simtec Linux Team <linux@simtec.co.uk>, Arnd Bergmann <arnd@arndb.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, Thomas Gleixner <tglx@linutronix.de>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-2-arnd@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221021203329.4143397-2-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_110906_318980_85C11E4D 
X-CRM114-Status: GOOD (  13.31  )
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

T24gMjEvMTAvMjAyMiAyMjoyNywgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBGcm9tOiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IEEgbnVtYmVyIG9mIGRldmljZSBkcml2ZXJzIHJl
ZmVyZW5jZSBDT05GSUdfQVJNX1MzQzI0WFhfQ1BVRlJFUSBvcgo+IHNpbWlsYXIgc3ltYm9scyB0
aGF0IGFyZSBubyBsb25nZXIgYXZhaWxhYmxlIHdpdGggdGhlIHBsYXRmb3JtIGdvbmUsCj4gdGhv
dWdoIHRoZSBkcml2ZXJzIHRoZW1zZWx2ZXMgYXJlIHN0aWxsIHVzZWQgb24gbmV3ZXIgcGxhdGZv
cm1zLAo+IHNvIHJlbW92ZSB0aGVzZSBoYWNrcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKQWNrZWQtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwu
bGV6Y2Fub0BsaW5hcm8ub3JnPgoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJv
OiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0
cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFy
by5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
