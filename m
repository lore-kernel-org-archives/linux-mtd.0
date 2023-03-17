Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654C6C6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 03:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2vF494xDFFJqqM7LX8IE2uB7XVSorhaHxuQ6jcBH7Y=; b=T5wxpgPj0aWyn/
	at56S0A7sX7SSUKLPys1zCwlT05A9yInTdWpcaHV0IuVPBW5rVO9rl/emcxZNDMknqme6s4C+gOJX
	QUmn2okscG0Bj59aa4BqfyoyH5NVitS7xg+iZmo7NPC60ISGMY9WwmSBvgticUGQpq58n7xAVKHX4
	FSOaKtKnLx2yUHLbTiiGvoWN5kPwmPo1GCOuH4fEKozO/VrBXjGvg/BpJGBqpZSWftIBMWc/CZTXu
	Ic7lyn4//QzJQte6D5rKcA7kl/xmo822PjdvUDJdu9irWkYbuzT3oC5+yfmN7oaGgSJTUnn6xnRRL
	eHGH3Be79cJNfM2t6YIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd0do-000m1e-1I;
	Fri, 17 Mar 2023 03:20:28 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd0dl-000m0J-25
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 03:20:27 +0000
Received: by mail-ed1-x52c.google.com with SMTP id cy23so15288334edb.12
        for <linux-mtd@lists.infradead.org>; Thu, 16 Mar 2023 20:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679023223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKQoh23JUid9txHEv21l4LXzVlEr3St3BxpB8mmHGMc=;
        b=dF9IjF1Pa8axQXoOZ9jaqoLutAr/ilESjSJl14R/9UvGvWFlH5mWHRQL18tRU29k3a
         i1VY6jA6bb5Gvp3zoCs36Op/GvEel4K8RcNTcbUkAJNiV9qLXyQZ1PLtfFP1K2n66/Xl
         tfwGAGoXpggD/nliN85I5lCcogN5hkcZ5aEmzJYpdTHjQNb9Z/J8OMjsSlF9yPOPAaqM
         34LtXWKJQs+eNIG4IJ5b4K9TiaGs3FXR92DDe51AQukKcvUGjsO80FXRFohOtqQxuFwk
         rPBbVgcNrJjDbpoCKL5mDwF9bUtT9DEAZFuYwG+jrdJL4sV0eHa2zl8KoRNGeWREqmvJ
         AcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679023223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKQoh23JUid9txHEv21l4LXzVlEr3St3BxpB8mmHGMc=;
        b=w8Hk8bjI27ZbJOjBKj/XskmBbR/YLWPNIROfOPpRd5LZXHC2jwABc2qsfKdO2Gj9e+
         KANLXPhaPFZashBaIi/hiL3NRnEBF8/jNioYVrsHtjQ0tK9hhO9dmaB1MbWagrR1IuTR
         /jrAvZCOD1ngjKIfHviefPtEQs8CQeIkH5kLb/oJ7n8KMhdxDPClmmlHwur53eFDQWMr
         eJqZ3kevVP2UoQP2o59gUIcvlRy7t7ZFNQEV3wEHRyzCqi3PB+19l87Q83Z/eeC6i331
         HdRcWjfdVJHFDyniVXSEiA3zBILjOiaEFibQ9HXTSImCMQpc7H/tAYNmEWlQFlsqEnzK
         oC/w==
X-Gm-Message-State: AO0yUKVc+UHKyNgcaoQQRfeOx6+kS58JG4U8u2+oL0vVdVYsVg4nKcOP
	QXgfeHUWT5QPyN3M+N0q5JziSA==
X-Google-Smtp-Source: AK7set/Vo0En2f76N6Js0NKDwySOUkajaEz+JUvPaik2JeiOw0iQS2axn06KgEfQl3WUpEfPizHdtg==
X-Received: by 2002:aa7:c658:0:b0:4fb:e14:c25b with SMTP id z24-20020aa7c658000000b004fb0e14c25bmr1613203edr.33.1679023223014;
        Thu, 16 Mar 2023 20:20:23 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id n25-20020a1709061d1900b008e9c79ff14csm389407ejh.96.2023.03.16.20.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 20:20:22 -0700 (PDT)
Message-ID: <2248255d-bd9c-a18d-c7b1-547e71955d96@linaro.org>
Date: Fri, 17 Mar 2023 03:20:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 6/8] mtd: spi-nor: Add a RWW flag
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
 <20230201113603.293758-7-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230201113603.293758-7-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_202025_693266_57321607 
X-CRM114-Status: GOOD (  13.19  )
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

Hi, Miquel!

On 2/1/23 11:36, Miquel Raynal wrote:
> Introduce a new (no SFDP) flag for the feature that we are about to
> support: Read While Write. This means, if the chip has several banks and
> supports RWW, once a page of data to write has been transferred into the
> chip's internal SRAM, another read operation happening on a different
> bank can be performed during the tPROG delay.
> 
> Adding this new flag involves enlarging the no_sfdp_flags variable to 16
> bits.
> 

I've just skimmed over jesd216 - f version, and indeed it seems that
reads while write support is not covered by the standard. no_sfdp_flags
is not a good place to add this flag, because there can be flashes that
both support SFDP and RWW support. Please move this flag in info->flags.

BTW, does you flash define SFDP table(s)? You can dump the tables via
sysfs, here's an example:
https://lore.kernel.org/linux-mtd/20230203044853.23513-1-Takahiro.Kuwano@infineon.com/

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
