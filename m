Return-Path: <SRS0=Oqae=H2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C767C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 03:47:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76860601FF
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 03:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76860601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQSeRzee031PHZIHvdEJJLib1pkpth1ZnY/0QvlbtOs=; b=W9uKtv2VNlZUt0QWzoNb+Wg7Uv
	pU7Y90slZvjOVjh+zE5fWuf3zRjyigHqz1xRiUUFzA1Fyv/2HK7npxeWfq7s0uVMMfO7uK8mpT1Jd
	O2B/8EydE9KyHHHwPoVffs8d8MaGslLvLp9kEC2hNx7fgaLUV/F24A9ivKpqIyEPCT6zxLWNn7EK/
	BAGNsIN7Tg22YI/JtDdWMSOS1qMTqN9sMD8FwjYRlrGYqqxGxpkMbEDu32eWJyZprA29c4CQjUgIn
	0109QVAIZieoJidfDCSdkTnRyfUzARxD8cHHUHQgsGbjkJUpZapvieEHkWFg3/AxDoDFT5vZOsVHF
	GtABEGfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEl82-0002iS-Hv; Wed, 24 Feb 2021 03:46:22 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEl7z-0002hf-LZ
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2021 03:46:20 +0000
Received: by mail-pg1-x531.google.com with SMTP id l2so619386pgb.1
 for <linux-mtd@lists.infradead.org>; Tue, 23 Feb 2021 19:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=peRxfJ9C3IZO0c7bG0x9AxPdKACtkCjqiet+LT3yHzY=;
 b=fsjdZIxgdTwB8oTvogm8JDtMaJ+0FAvKcs9Qln6KoXmttxii/7muAZkfRWOA3jI6XN
 m/BMvpT45eMtCEQ3SEGoqc+pMeaXPePeclDsHH5+Zx8kKB3GTRwoiZDmT0cEYkWt4y3F
 CpSHhqRsU0W70PWUhsqnLlpzc2YcWQ4RhoChiMWB5hV5u11EeQD1pBqInjIHA7bG6H9d
 HpFqmaJ5vnkQpfORKxNf9jhH8g50mFmmIHvMDHTumOKTyhWajAsAQc3LuQy9seuOrThm
 Oe7puHUYj99h4Y4mOXTbkfa8FdtJ94EWqg8vvkEK2a2diwIomAH/xXwS4UJzr96gUKA3
 U/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=peRxfJ9C3IZO0c7bG0x9AxPdKACtkCjqiet+LT3yHzY=;
 b=RaLNTd+/ZbKrxf1xbghh6MgwitDE+OByBFqLBL48ZSSWt/7nW8s415/9zGTK16W7Q4
 G09ot1Y/X5Ae413S6UWV6jTFjLM0awNVtWo/dkNT/7me4MyV36p6KEnSVchgDvKWOzOi
 KYuMw0HFEEbiPMw7VwsTjqaMj3/5A3spixaZSVQnxGrZkbZ/W8Dc/ympOdIn4X0NbwdA
 Wgc6nHy5fSH5QMeTbVJhw3HbHOHg23878CrW+ickmg4Vsq3jEa7+TMIZJmWK2sMtmEB3
 v7hylC/9lU1tYi5h+uaRs9IXUxLFxk4mNRVv7tBJls4bm0qfcyp2jNEubitgeHoCFKdR
 EPqQ==
X-Gm-Message-State: AOAM532uoQXr8OvbOfDjmHqzeEZaDJGqQj0pObZ0o+gRhkZuIitp//dS
 ohNCc0wcV4og2yKLSZDJumM=
X-Google-Smtp-Source: ABdhPJz2EjcrvKemDGHKbz79qyhOLNvUh+tpZ1tGaf0gLinfyCQP8O4tsrcO294s2iUQJght7Ml2Ww==
X-Received: by 2002:a63:5fd7:: with SMTP id t206mr4860193pgb.54.1614138377627; 
 Tue, 23 Feb 2021 19:46:17 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id l11sm648463pfd.194.2021.02.23.19.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 19:46:16 -0800 (PST)
Subject: Re: [PATCH] nand: brcmnand: fix OOB R/W with Hamming ECC
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org
References: <20210222201655.32361-1-noltari@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <32837cb2-f7ba-d59e-de66-051019b21e89@gmail.com>
Date: Tue, 23 Feb 2021 19:46:14 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222201655.32361-1-noltari@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_224619_859092_7990D823 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

CgpPbiAyLzIyLzIwMjEgMTI6MTYgUE0sIMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyB3cm90ZToK
PiBIYW1taW5nIEVDQyBkb2Vzbid0IGNvdmVyIHRoZSBPT0IgZGF0YSwgc28gcmVhZGluZyBvciB3
cml0aW5nIE9PQiBzaGFsbAo+IGFsd2F5cyBiZSBkb25lIHdpdGhvdXQgRUNDIGVuYWJsZWQuCj4g
VGhpcyBpcyBhIHByb2JsZW0gd2hlbiBhZGRpbmcgSkZGUzIgY2xlYW5tYXJrZXJzIHRvIGVyYXNl
ZCBibG9ja3MuIElmIEpGRlMyCj4gY2xlbm1hcmtlcnMgYXJlIGFkZGVkIHRvIHRoZSBPT0Igd2l0
aCBFQ0MgZW5hYmxlZCwgT09CIGJ5dGVzIHdpbGwgYmUgY2hhbmdlZAo+IGZyb20gZmYgZmYgZmYg
dG8gMDAgMDAgMDAsIHJlcG9ydGluZyBpbmNvcnJlY3QgRUNDIGVycm9ycy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgoKU2hv
dWxkIHRoZXJlIGJlIGEgRml4ZXM6IHRhZyBwcm92aWRlZCBoZXJlIGZvciBiYWNrIHBvcnRpbmcg
dG8gc3RhYmxlIHRyZWVzPwotLSAKRmxvcmlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
