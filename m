Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D55ECAAD4
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Aug 2022 13:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHoLHeaN7B/5W33cb1e/gyxJEdxwySq1qkjU2icDxOU=; b=Oo29lywBZyFSzk
	8EM4c5pdhK7LcAgy9rauEBUuUgC3U4y3OvnsAIhkFNmHT6jHD4JzLjAUat1agJq6WLAVEhMeNpw0r
	EYXkWAlLfTDk6+thSiF3WL6LldKfCVnnzzvPiwE/odESKoT+iuzxVqekDngoPA1THyRT2u6YFHQHI
	w8zYqCKZkTCuExq0T3jb23EwcGpoCIwLpOemmMyp8gXdUEBTtqBF8V95qvi9kfjsmnV7LathIOvb+
	+bEZcqtZC8Mi12A1rcrIb9ogwvCHTxrz8+mDmU98QalUWONFVePiw5Lf548jSpO0+DAanAid5UkzT
	opBeBk+eoduFdR2C1Sng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT1RM-00HOxU-Ju; Tue, 30 Aug 2022 13:38:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT1R4-00HOnw-Qz
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2022 13:37:48 +0000
Received: by mail-wr1-x434.google.com with SMTP id e13so13355819wrm.1
        for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2022 06:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=eJwvPnyxYM+rkWN/B5T3u9GVEhfio+TrUX3WU5XcQn0=;
        b=eJ8Q9S1/vCT7cijJVAWN8HR5xnr4XG/bT9gfNLUDKdyxQxPABjo+s4Y6pUxKK4Tl4O
         jPc2/lY4v59LZSUGa9aKxBb01w/WAWEog2r8xqVxzlhi7sYloua5sSMoo8h1Ju3qINN/
         3avwaD6Hws/C4g+njGzPWYxF+RusS9DNMyl9nt2y5ZJnNdOG5bGLLNdGTXWMMHpi5f2E
         IIjR87c/vXSr0+OPP2cwmM1pzjUy5FHA+vG4pvTZWF9oCnm1SdWfv32yZASc1o+ERboZ
         XMrCHtZPBtVNx/gkiYGlNPnexb2ABfjXNmkHIEWQAhFq4YntlmA92bdCXkafb7r0LXVd
         7Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=eJwvPnyxYM+rkWN/B5T3u9GVEhfio+TrUX3WU5XcQn0=;
        b=ocaMMHbDPacDEoSrndqomvZZikEQSYPZb2irdSIt8qwmkBI3QTbOVgZfoVhptfBu6J
         gVqSUN+CeeepSuWUYhXcZ1rufj6Qs99Po7rp3JLSURhO3GK6z1Pf80Xqtz/aL6sSWZpV
         ceLvPS9eX/nTTR/4kWXu8mTO4sby/65ntuYuE84YUnCZQxmeZxxzdvvKeTIcwDWR4hUg
         yHVkBi15KUHHfKT9xt2jiaSjjSkbhfpMvAyyPXFtGDkkBhBb7N7VipKjCfSKm5S7eDKo
         jZWIdIh0oS6e2lobcFFCIbeqeMabAdDXLzP1jd5mtO1Z8Jw0styfp9R/18a3iEOSijNb
         tZNQ==
X-Gm-Message-State: ACgBeo3hoULRNpPZUZzZ7lWRG+MM3d1YUV+E1HRN1ulA5+Is6COJ9TQP
	CXN4b9uVX2s5/MqrV1XCdjZv2Q==
X-Google-Smtp-Source: AA6agR4QHq093VZ3/eQb0FJDYlUt9A1Mn1xHd/D1qdIE2cMIfLfOMQUBjFLqXGMVXyoshwbgON+EAQ==
X-Received: by 2002:adf:dec9:0:b0:226:e033:c048 with SMTP id i9-20020adfdec9000000b00226e033c048mr3225813wrn.577.1661866663228;
        Tue, 30 Aug 2022 06:37:43 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id n8-20020a5d4848000000b00226d01a4635sm9658965wrs.35.2022.08.30.06.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 06:37:42 -0700 (PDT)
Message-ID: <791ea3b6-c326-9e71-e23b-93206e305c85@linaro.org>
Date: Tue, 30 Aug 2022 14:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 00/14] nvmem: core: introduce NVMEM layouts
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20220825214423.903672-1-michael@walle.cc>
 <768ff63a-54f5-9cde-e888-206cdf018df3@milecki.pl>
 <267821eee5dcab79fd0ecebe0d9f8b0c@walle.cc>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <267821eee5dcab79fd0ecebe0d9f8b0c@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_063746_902804_A266192C 
X-CRM114-Status: GOOD (  20.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thanks Michael for the work.

On 29/08/2022 09:22, Michael Walle wrote:
> 
>> One thing I believe you need to handle is replacing "cell_post_process"
>> callback with your layout thing.
>>
>> I find it confusing to have
>> 1. cell_post_process() CB at NVMEM device level
>> 2. post_process() CB at NVMEM cell level
> 
> What is wrong with having a callback at both levels?

we should converge this tbh, its more than one code paths to deal with 
similar usecases.

I have put down some thoughts in "[PATCH v1 06/14] nvmem: core: 
introduce NVMEM layouts" and "[PATCH v1 07/14] nvmem: core: add per-cell 
post processing" review.


--srini
> 
> Granted, in this particular case (it is just used at one place), I still
> think that it is the wrong approach to add this transformation in the
> driver (in this particular case). The driver is supposed to give you
> access to the SoC's fuse box, but it will magically change the content
> of a cell if the nvmem consumer named this cell "mac-address" (which
> you also found confusing the last time and I do too!).
> 
> The driver itself doesn't add any cells on its own, so I cannot register
> a .post_process hook there. Therefore, you'd need that post_process hook
> on every cell, which is equivalent to have a post_process hook at
> device level.
> 
> Unless you have a better idea. I'll leave that up to NXP to fix that (or
> leave it like that).
> 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
