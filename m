Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F60C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Nov 2023 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvdkdEdTDbekROhaZNltKF0tiJB/Q1ENaEltlFatwKA=; b=EWsxmZTaUIV4Tv
	pRg4m2Yf2V1r8E4FNuCDKXdD8nSXQuMf2o1dpm3c3SKPIGEUvNWlY3y8C1N2DfxxGfves95okv/PC
	HCUkmE2Cyrs6zE1hgbDMQCR8pZ9TNBAhFX2LI2QNd1TOepIlf4UuydCeL8btT3MKDB9Y1uejiWZ18
	nhvohRtSj4yX4TquFs48lixCPwtdsMIDEdNSLkm9yGSDqbNx7xcEbDYhYr+6bRS8dd6qRRxeR8q9A
	9xtxODa4rzNjB86FEizw3UQ0S3aJrzTT0hPqS+MUng1eJFQhL54plo5chqhnR8nhaUPN+JrH5hbYV
	NEF1/NtP7cT2k0ugcEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r00X8-00GptZ-0b;
	Mon, 06 Nov 2023 14:24:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r00X4-00GprH-24
	for linux-mtd@lists.infradead.org;
	Mon, 06 Nov 2023 14:24:52 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507adc3381cso5752520e87.3
        for <linux-mtd@lists.infradead.org>; Mon, 06 Nov 2023 06:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699280688; x=1699885488; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XMfV5ZH5v47jASvNKicQBjzGmkFDGtIIPxcN0ommMg=;
        b=D95uUAbklY4Qh6EyjGVMqtqAgJyupNCyJwPavoN4G79ODAhtBkKNujzCwWwe3u1xbl
         I/w9ynb1/AyG1r6D+1CHgbTir5pGMJGIFeaI9U0FyR9ceNCai6Whvziizd9UZ2xAjfpU
         SCCtgCg49CPvW+iCKKRpikU/9W1eXqxM39T+EJLOvu6ZdTqqIFJMcof1k9NhXc98VfGp
         93vPPjtArw73XFknKSVDHQsTWpHWwT8EIJheEp7x7WK8p5uFwSVLPAB81rQtjionYPEP
         x4kO6lifIvrDZaRXWq81kHT9tE39ynF2nUCXRcBR8cuPVQNvsFDJMxk2hITH1v8hAWIS
         85iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699280688; x=1699885488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XMfV5ZH5v47jASvNKicQBjzGmkFDGtIIPxcN0ommMg=;
        b=Itw1jkqQNFCg1ZIN99645Q1ZfvZFmCXs5l5d9Ds9OCIM1y7sJ1w1O13EoomD9KOE2k
         5NLnp7tvsiCWcJUaXMQSP+dlDQcM/oNoS5nBKpEbS0nA5O79QngUqt5kW/T9pAfuZakF
         yoD8Z2kUtilymnX/cRBopLEl+UuioUuoovMFWq0XzGPrj4IIcoXQPD+3s0LB6vTC45JK
         E6wRW8YZBZLJKsTJbvE0L7qh6ANW8/S6XO6QVnGjpXmQM379YN+Sdu99/x107Zz7H6I/
         qHcmFnj9pJFOa3ny3SdFxsatnY9CuOmfFNk6mH+znID93fQ59YdBdoDuWEAUlJX7SP2Z
         p3eA==
X-Gm-Message-State: AOJu0YzcWkWImDcqeosDmjJtbeflLP7PkhccZ0B/7Hq+42EybmY1VuPe
	LSU8Y2Yt8YIGxxsH9y7sD1MkPA==
X-Google-Smtp-Source: AGHT+IHjxUoq7ANIGv+8Yi2mcHCp6lc2wXT/4bzXLG/w4y1jOzHYQxoozkekpz70ly081734L1MCyg==
X-Received: by 2002:a05:6512:2309:b0:509:497c:9623 with SMTP id o9-20020a056512230900b00509497c9623mr12784962lfu.37.1699280688157;
        Mon, 06 Nov 2023 06:24:48 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.12])
        by smtp.gmail.com with ESMTPSA id i16-20020a5d6310000000b0032f983f7306sm9682094wru.78.2023.11.06.06.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 06:24:47 -0800 (PST)
Message-ID: <696368fe-f14f-48d4-ae06-f06a3268c136@linaro.org>
Date: Mon, 6 Nov 2023 14:24:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, michael@walle.cc,
 pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
 <cf0e4284f2e3193ddd57b715196ca202@denx.de>
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
 <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
 <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
 <e665266fc1565f9d346c95215df39f12@denx.de>
 <085ba0f9780b1f8b34bc9e1037fec5e7@denx.de>
 <b5c1d4d7-1583-4469-a604-dcf5bb3f96a4@linaro.org>
 <9004acceea77d2f06aaff0ca5f916cd7@denx.de>
 <a3ccb98e-b8bd-4ea3-98c4-df429602a7ef@linaro.org>
 <c533a2af60f27d21c9c703b6cb34ff77@denx.de>
 <5b3b8de5-b2fc-4c8f-a2d7-662748ce9213@linaro.org>
 <f00d72ca1480a9ac6479bbbd149021bd@denx.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <f00d72ca1480a9ac6479bbbd149021bd@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_062450_681086_9A6AD778 
X-CRM114-Status: GOOD (  14.89  )
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

CgpPbiAxMS8zLzIzIDE0OjU4LCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IE9uIDAzLzExLzIwMjMg
MTE6MzcsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gCj4+IEkgY29uZmlybSBJIHNlZSB0aGUgc2Ft
ZSBiZWhhdmlvciBvbiBuMjVxMDAgZmxhc2guCj4+IEVyYXNlZCAxMzQyMTc3MjggYnl0ZXMgZnJv
bSBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2gKPj4KPj4gcmVhbMKgwqDCoCAzbTQ5LjA4MnMK
Pj4gdXNlcsKgwqDCoCAwbTAuMDAwcwo+PiBzeXPCoMKgwqAgM200OC40ODVzCj4+Cj4+IEknbGwg
Y29udGludWUgdG8gaW52ZXN0aWdhdGUgdGhpcyBhdCBhIGJlc3QgZWZmb3J0IHJhdGUsIGV4cGVj
dCBmb3Igc29tZQo+PiBkZWxheXMsIEknbSBoYW5kbGluZyBTUEkgTk9SIG1vc3RseSBpbiBteSBz
cGFyZSB0aW1lLiBIYXBweSB0byBndWlkZSB5b3UKPj4gdGhvdWdoLiBZb3UgbWF5IGpvaW4gI210
ZCBpcmMgY2hhbm5lbCBmb3Igc2hvcnQgcXVlc3Rpb25zLCBzZWUgd2hlcmUgaXQKPj4gaXMgaW4g
dGhlIE1BSU5UQUlORVJTIGZpbGUuCj4gCj4gVGhhbmtzLCBUdWRvci4KPiAKPiBSZWFkaW5nIHRo
ZSBkYXRhc2hlZXQgYXQ6Cj4gaHR0cHM6Ly93d3cubWljcm9uLmNvbS8tL21lZGlhL2NsaWVudC9n
bG9iYWwvZG9jdW1lbnRzL3Byb2R1Y3RzL2RhdGEtc2hlZXQvbm9yLWZsYXNoL3NlcmlhbC1ub3Iv
bXQyNXEvZGllLXJldi1iL210MjVxX3Fsa3RfdV8wMWdfYmJiXzAucGRmCj4gCj4gVGhlIGxhc3Qg
ZW50cnkgb2YgVGFibGUgNDkgc2hvd3M6Cj4gCj4gNTEyTWIgYnVsayBlcmFzZSB0aW1lOiBUeXA6
IDE1MyBzIE1heDogNDYwIHMKPiAKPiA1MTJNYiBjb3JyZXNwb25kcyB0byB0aGUgc2l6ZSBvZiBv
bmUgZGllLgo+IAo+IG10MjVxdTAxZyBoYXMgdHdvIGRpZXMgc28gdGhlIGJ1bGsgZXJhc2UgdGlt
ZSB3b3VsZCBiZSBmcm9tIDMwNiB0byA5MjAgcwo+ICg1IHRvIDE1IG1pbnV0ZXMhKQo+IAo+IEl0
IHNlZW1zIHRoYXQgdGhlcmUgaXMgbm90IG11Y2ggd2UgY2FuIGRvIGFib3V0IHRoaXMgbG9uZyBl
cmFzZSB0aW1lLgo+IAo+IElzIG15IHVuZGVyc3RhbmRpbmcgY29ycmVjdD8KClllcywgSSBmaW5k
IHlvdXIgdW5kZXJzdGFuZGluZyBjb3JyZWN0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
