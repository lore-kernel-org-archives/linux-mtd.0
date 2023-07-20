Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347C3C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 06:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWB4fJ6AFUF5F6SLAzKFsxvFOeiC80amlWZZeI+sUfs=; b=XXcZ0MzxM/GnSe
	MKeTm0BRvST5E+QxqX96YsJWsp2dKGzIxau2DaD7zbRPtvMuZ9yq6drnr4kY5zXTUa2RuwgQ3YiSP
	0euC8t6BDVzp6z0/BzGXHZ59VXQCAcFOTzmqgHwOz4VqKiI6JGYmVN1kPVyI6B63w5EzOiQ/5TY1n
	wB8cvWZwOiK7lU8v42cChyZLxQ/urRyzzNI3R9Lg0wuD2b1f7gymbc+RIy074L2SxIkf0Py1yTdNH
	7gI/9hMTYpsZEdFU8JLWPQVjSq+0mX2lQtVF64TfXGMURPsA4QJxIuApgRyhTav5fUEmaLJcKa+rL
	YHKQuJS/xliYD/LXcpmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNXu-00A0ao-1r;
	Thu, 20 Jul 2023 06:53:54 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNXr-00A0ZO-1m
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 06:53:52 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fdd31bf179so659279e87.2
        for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 23:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689836027; x=1692428027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dTYti2msJuMkF2fFgZqBRwaKrMax7bGDLlfMmplPvvg=;
        b=wJJ4ewUjsh7r6wUXj7VvA3lxXNye1xdJbhbWKFSZUQtqd4qMg7HxeHfrILhUhvjUyR
         c8J78mKuixnMCo58ZCECxq52INslKpDiFcMUg9gpLc7Im8nP/ExdrLcdggVY907gVpqQ
         zcWELNFYrPPyhH4v2ZL61dGCcFc2PjqfO8D1yvtBEhA+6ydMPmnTDpRBI001Dak1/nfG
         6AmLTLnW34A4nv1lHozibXkwrCqLHpcfc7rbta/3/dZA2NWQT+EvXKtRIiMNluLYiJSh
         475Aag7ZsW+s9atyLlsJDFfACg37JhJ3TutBl4AN6LNX+5TxGH082CZzJegvQk8yG/Xe
         J1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689836027; x=1692428027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dTYti2msJuMkF2fFgZqBRwaKrMax7bGDLlfMmplPvvg=;
        b=IcsJ4q31LV3J6E2/H61lm20M4Auc0wbH9HDYhpNwIDhc6lRAsZeN1WluD46Rv39UUW
         Fv7HtqMK+ZAgmBRNPRxfdogCFG0YlmW5NWJ8ve3ZaOE34OSg/TNImByS3uvxV8f70beR
         UsWPVO4RVk2MG4Blb5GjKZFGRv3NQlrJ9Yo/grLEvaIgRoIi5zueYsGEnZHSh7cI9Ze/
         o5ExecqES/AoLboY2JPiN6Rd7ydA7dPmWMyvAQva/ie6bBXC1bOpfrJsAF2Zx3pbKW72
         r/uNAcglhz+hMSmuxK3R0v4jdgy0PQybZX3SYc2pDEJQzBsDcgf/AJAPjp888FQamA4q
         +qyA==
X-Gm-Message-State: ABy/qLZOxstfWHyYBOcxGuVGtWCwuwR8/2j/Z+si6/iZS6mM5/hG/cdz
	xCQ2XjsrKtjbXSZGSjCBvNDaow==
X-Google-Smtp-Source: APBJJlEbfLygNs+/rmSsrdJE9i65NUF2ppc8cecofdF2ORYAIysqb44pU112yXKT82GnEgHOdGNMBA==
X-Received: by 2002:ac2:4bd2:0:b0:4fd:d0d5:8771 with SMTP id o18-20020ac24bd2000000b004fdd0d58771mr1917762lfq.18.1689836027458;
        Wed, 19 Jul 2023 23:53:47 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id t8-20020a1c7708000000b003fa74bff02asm418605wmi.26.2023.07.19.23.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 23:53:47 -0700 (PDT)
Message-ID: <c88f0e23-124f-cd29-7ea3-bfe152291b69@linaro.org>
Date: Thu, 20 Jul 2023 07:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V1 1/1] linux: drivers: mtd: spi-nor: gigadevice.c
Content-Language: en-US
To: Victor Lim <vlim@gigadevice.com>, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, akumarma@amd.com
Cc: michael@walle.cc, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vikhyat.goyal@amd.com
References: <20230720042834.12296-1-vlim@gigadevice.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230720042834.12296-1-vlim@gigadevice.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_235351_592399_93CD9049 
X-CRM114-Status: UNSURE (   6.61  )
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

Does these flashes support SFDP tables? Here's how you can
determine that:
https://lore.kernel.org/linux-mtd/cover.1686557139.git.Takahiro.Kuwano@infineon.com/

If yes, then you could use the generic spi-nor driver,
thus you won't need to explicitly define flash entries.
See:
773bbe104497 mtd: spi-nor: add generic flash driver

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
