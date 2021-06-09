Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CB6C48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 12:30:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 393BA61351
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 12:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 393BA61351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NfBz68PkGQpRHhH4qmT9l9kAc1elc2y+OxLR7DwvuqY=; b=yNYkCGO4F7L35l6dnc6+0zBRHy
	c3kHhrG1RrLiZAb5Of9hQvEV54dz9yrln/eeP7LMML8A0gDm/hZuzcpoAA85o8i9CFWz1es5mdfD6
	dDnzKQuoGEhtfq22Kvbd1+4+FjmbUNrzayBid0nTzrTym4x0MFg/HiKLxSOFMgEy0i2F8gc7IrAuU
	oJhm52zM23OMUg1plB+6ppdxoCEueayeEV7sWfKsaEM3XvUiIqAaiN65MY96K7pEGkqqrPWhkCmMu
	y/aK06NoIRwXgiyu+72w6WDoedDgQrSAbJ2/y1MtTy9TNnE8nwyDXSWjZvMoEO8JgMdhlRhv7GudQ
	lk4sXvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqxLA-00Dh12-3K; Wed, 09 Jun 2021 12:29:48 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqwn0-00DTf0-6U
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 11:54:31 +0000
Received: from mail-wm1-f69.google.com ([209.85.128.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lqwmy-0007BW-Bj
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 11:54:28 +0000
Received: by mail-wm1-f69.google.com with SMTP id
 j6-20020a05600c1906b029019e9c982271so2527450wmq.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2021 04:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zLhTmNdHd7QsVRSZXglysFm3zyoNBR2RnD/RonHYik0=;
 b=DWFitUgzTVeQVFDAAFMPlztbXeD+oJbhKQ3OwqcTJTJxxwwS0CNzTiNm10lUxeu5Wz
 S6XRP0RySXF3H1coNYNNlaxPjl9Rmgu5rBGH5rLnElBJvrB5Au059eBsb3gay5XiEnX/
 EBH9DSSFUQB+WTDykfGloqOz6O9+X0AbMBQXde8U/czTsMRdJZfrgZ6jLh+WbYzngXLh
 PuorQj4v0c8OCH9D0ABHHBWOi4jZ+xpjOOUaKQ5gTXFtEPOA+O89mLVFtIgFyIfpu0r6
 XOz0x50Wtu4nS/pOOt3vLFQEJIGuZdl59psCvWkFHd6gOhnCEBbU3XLDAkTG75jZPDZA
 27Uw==
X-Gm-Message-State: AOAM531DYdPokwWL6Rw+/elJecwjMAF6mDZVOzHlJOlJ1TnfyjdSIZnS
 n2RSpwyvYPmjaMC6zawhN8vRgbPC6vbcFxd+YK06W2i/5JKSTog1JAjCajrmrkoSPXJtNjaD4ie
 P3LcUgElqe0GMB7S0jHuM7pl6HfaVDn7WW1X4YMxrtwI=
X-Received: by 2002:adf:ee46:: with SMTP id w6mr28653522wro.345.1623239668055; 
 Wed, 09 Jun 2021 04:54:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCt33hywH+M3y1CT+bTXzh8xJ2GJIIBftxRP+jWPUmJmFgjRVOBzLHkNPNuSSYkP5EMOKO/w==
X-Received: by 2002:adf:ee46:: with SMTP id w6mr28653501wro.345.1623239667931; 
 Wed, 09 Jun 2021 04:54:27 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id u15sm5852148wmq.48.2021.06.09.04.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 04:54:27 -0700 (PDT)
Subject: Re: [PATCH v22 12/18] memory: pl353-smc: Let lower level controller
 drivers handle inits
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-13-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b9be2ca0-7d62-c5fd-6aa8-e04c57b0f75c@canonical.com>
Date: Wed, 9 Jun 2021 13:54:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609080112.1753221-13-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_045430_309926_6076E582 
X-CRM114-Status: GOOD (  15.09  )
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

On 09/06/2021 10:01, Miquel Raynal wrote:
> There is no point in having all these definitions at the SMC bus level,
> these are extremely tight to the NAND controller driver implementation,
> are not particularly generic, imply more boilerplate than needed, do
> not really follow the device model by receiving no argument and some of
> them are actually buggy.
> 
> Let's get rid of these right now as there is no current user and keep
> this driver at a simple level: only the SMC bare initializations.
> 
> The NAND controller driver which I am going to introduce will take care
> of redefining properly all these helpers and using them directly.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/memory/pl353-smc.c | 294 -------------------------------------
>  include/linux/pl353-smc.h  |  30 ----
>  2 files changed, 324 deletions(-)
>  delete mode 100644 include/linux/pl353-smc.h
> 

I see you remove here a bunch of code. Are the series still fully
bisectable?


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
