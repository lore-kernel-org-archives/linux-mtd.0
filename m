Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F1BC001DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7OXnvC5lrcnXr7XqhxZitW0SqgteX6I4/0LBcmWlYw=; b=sEiuASn13WNt5C
	gSk9KSpw3HrClN60xxE98gCrnsFGe+Blij/DXE0OCDBgNQhFzNu3CxmfDwzfydxdPv5dzafNY52NV
	XJpoWAYlmV2ZKYuCDBQ13R2QHPzzA+nmTJqwa3knRvAS2kV91n/C+gPJZC6xYe0d/eyttN3cZhodd
	UNvZiYPUsEd5jcMtZ8L3NiJUlbH+hBGlsykuFFXE+TQHRzlR0V4GxkOcuttBp34Z46n1ZvuNUiof0
	jpe4TgNH+4RDBpCZKe0Gt9ny+CasxsKVv/FVXNL5028yyc46L36FYLDp3KJBAPWoc5eEDFgR9UxoJ
	1uWHlYr44nJj4zD9D/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCyz-006gQC-2L;
	Tue, 25 Jul 2023 08:01:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCyx-006gPY-0O
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 08:01:24 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so892635966b.2
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2023 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690272081; x=1690876881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2peQ1noDAoiHYN6K38zNqNTdmp8k9kWLJIpot0ExkzQ=;
        b=KM7wfE4wS3kuzm90PLLiM2n9qCzWQKLRxAC+8OW5gLDIhhaMuBzq6BdGVdqWL0726E
         G7H5hrakmr/46/22RzaeQITbRnP9TdX0UgAYv5Bq8qof//rdPwU98BOhK+DhHeapMYdg
         cE3rI6mYkFThy9aT2BoYwUqWf+wqyJXPyGoaPuTfl8tkjAWywvs6utApFGLf8zuR9c2h
         oDRAUoXUlN/4DisByDCdAugKCeGB+3jTEF1jWSFYpTElcbDcQjKZaHVIr50pv05wv49f
         ZUWjISGWGU1pF5LQPaclqoUicfjwU4/+2/JW4XbsOkmaFgijdYNsdA3JzLPn1PlNXyEk
         81NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690272081; x=1690876881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2peQ1noDAoiHYN6K38zNqNTdmp8k9kWLJIpot0ExkzQ=;
        b=dbPq3HAC4G5844e4sa2o3FNaV7n+A12/o/7tM6qP6t89EGYMMFBqXBa9XesqWFHSnf
         SygfnIj2RLPYcsnbV4dVceHpj/03DTpMOqrehyLnVjSuPMeS01pciRkKkGiP6FSGMBzO
         vMH6IgFo4jhS91KQTWKOm+XovVCrlwcI9njsNnS/zu6HLX7tEYEWa200cPBXIUNiS4Hp
         ivY3TXTG204Bn0/QOiuQ7UeEfMmkY25sv10sb07FS5hJklog/9A3xxFO3KJnwoKP+rUq
         AxA6a39gjWZHewT7O05rFcev2CaWK1UpWhgk7ntflqQ/2UTb6kcWFk+ByYYbDO36EZ/q
         KdSw==
X-Gm-Message-State: ABy/qLZzvLJnx7zrcpEw6Vs2HkmAYNR2YJck7Npbrb8mQxe1sd47F3wN
	VCjuip+f/gwRZNkW9Y3M7HI7Fw==
X-Google-Smtp-Source: APBJJlGIyyg+xuVlHC3TpWwgWikOmddAYZgUuLiuKKKk1wvzHZOHu8J7oNaiSuBrJuxluCQzFuZA5Q==
X-Received: by 2002:a17:907:a064:b0:982:7545:efb6 with SMTP id ia4-20020a170907a06400b009827545efb6mr12204948ejc.66.1690272080937;
        Tue, 25 Jul 2023 01:01:20 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id f12-20020a1709067f8c00b0098d15d170a0sm7780245ejr.202.2023.07.25.01.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 01:01:15 -0700 (PDT)
Message-ID: <15276c56-011c-1b55-d905-d0fbb822c4ef@linaro.org>
Date: Tue, 25 Jul 2023 09:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 0/2] Add octal DTR support for Macronix flash
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_010123_201697_AA21725C 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 7/25/23 03:23, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao.tw@gmail.com>
> 
> This series add method for Macronix Octal DTR Eable/Disable
> and add Macronix Octal flash support.

Do all these flashes swap the bytes in octal DTR mode? If yes,
you should add the infrastructure so that controllers can swap
the bytes back, otherwise you'll break bootloaders which work
in 1-1-1 mode, and breaking the boot chain is unacceptable.

Tudor

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
