Return-Path: <SRS0=Q04P=YK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861B7ECE58E
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 11:30:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5976321835
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 11:30:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ITWSPuW2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxL1FETt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5976321835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCelMCjqgmvSwFnkRooP0g6bW3qd1lHFVpUh4ZnGQ9w=; b=ITWSPuW2ZOIHNZ
	FtaCzQNapd1jMn+r15zLIOP61ECv0jnnGUC08mR6ny8fqSc6sg99ZIMoEouN27LtWRYu8rLLubjyG
	tW7FMyF8zqtQFloNso29Uii7I61hfFIkl+cNfg+0MDp7r1t0KjHlqdK/x9d2Egh0aPvTpAKiQxVdg
	HVDRMWE92CN04kHz5xUoT8MW1+IgZVhS6wt0bsrm73W/evw1WQsPCvz4Ko6C/+qPKoyqt7OrTt7IG
	EdU+WgVUCWGzMZooCxaZn0mm83S0vZuMBXLwagI82GUGMpi4dTBOqEQnS1qvgb+0GdujhQan1e/7F
	cFY8fbUMh8ixKHwiNv9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL3zJ-0004iM-MJ; Thu, 17 Oct 2019 11:30:37 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL3zH-0004hd-Ct
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2019 11:30:36 +0000
Received: by mail-ed1-x542.google.com with SMTP id v8so1461408eds.2
 for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2019 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xOUnKgMCGvJAUS6ZmiNycMfRjAPWUKvG/ScZda78+rE=;
 b=YxL1FETtHlQHtaMhDaZE+71PQ4/7AGbOHQq4QSq/n4THHpMgTH8KjFhEgEc31MBRSH
 PhOhR3eucYV6Wv1QLau4+vcNh6FlYwI9CdlqYjyFDdtTroBHB0RUeqh84lU04fLADi4H
 Le7M4ECQGFRBhvS09UF9WS1pmP+37BmFO2rUdJsEWcbXOWzRYEk2E3x5K6z+WssWBkdn
 gSq+pTGgWlpwqkP7bpjPpzxgzNpjC2DC76O8v8crP2/jOeSP43iVOXpfKnczw9XfpyJu
 mGFhVovdVCn555iDdkRxoTKomSzAnhAnC1Wk3fnPdlBOy2oTcK1ZIFuXysOdEtwP4aaw
 sViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xOUnKgMCGvJAUS6ZmiNycMfRjAPWUKvG/ScZda78+rE=;
 b=TZUyCXzlqsGZgdiH/pmHFMMMYfz1GBDql4VZkRbAPmv6WXpeThU4pksrFsbl7owC5w
 56BU9C16+3mLIk346T04PFL7X0kI0CsvEheVffqpAgkA3aTv+LL0J6ctDcV6iDRj2g++
 Ro89pKyPeRZ+2oj7khoWIpklpUUOV7W5iaKZF9QGUg9GSimGZOYyuAUwucG7s0n1CpIG
 0ba3terwYhu0mhOdK2wM3AxsjS4avx/n16NXGCJrR0NBZkhBT3nV+QkAoDB9kuSTyR3U
 dFQFOmpA5dWgben+vJXQivOBupEW35t/ZJ/aB14iq+ySPpSkXFQBRR5HHrYtLPPLiWG+
 6KSw==
X-Gm-Message-State: APjAAAXL47bONzHrqzWnq96l1/yX+Tn0LI+MiSAtuB46pn1BBz6wo8Ox
 C8RDnktR+QeaB7rwznea7GkvMOPg/uAwJ1PWByTkoElr
X-Google-Smtp-Source: APXvYqz0BCequpqQtk3DLEXB4V3hf6VDFbhGpCB0CFvhsKBkDICNIKHulUg3eB1NY3Cbq4CLBW50if5yTfzGO5PYuOQ=
X-Received: by 2002:a50:98c6:: with SMTP id j64mr3145971edb.295.1571311832243; 
 Thu, 17 Oct 2019 04:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAH+2xPB7rbeJnOPU10Ss9BhV_2DJV-ToQ3XNOy97+vrGx+ubcg@mail.gmail.com>
 <20191014141344.uwnzy3j3kxngzv7a@pengutronix.de>
In-Reply-To: <20191014141344.uwnzy3j3kxngzv7a@pengutronix.de>
From: Bruno Thomsen <bruno.thomsen@gmail.com>
Date: Thu, 17 Oct 2019 13:30:16 +0200
Message-ID: <CAH+2xPCLr4B-=Z=Rf9NryF6wU2yLLYhFpNNZ6QBtKP8KEW_FTA@mail.gmail.com>
Subject: Re: Regression: dmaengine: imx28 with emmc
To: Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_043035_436012_7A846168 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: bth@kamstrup.com, vkoul@kernel.org, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, miquel.raynal@bootlin.com,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sascha,

Den man. 14. okt. 2019 kl. 16.13 skrev Sascha Hauer <s.hauer@pengutronix.de>:
>
> > I am getting a kernel oops[1] during boot on imx28 with emmc flash right
> > around rootfs mounting. Using git bisect I found the cause to be the
> > following commit.
> >
> > Regression: ceeeb99cd821 ("dmaengine: mxs: rename custom flag")
>
> Damn, I wasn't aware the DMA driver has other users than the GPMI Nand.
> Please try the attached patch, it should fix it for MMC/SD. It seems
> however, that I2C and AUART and SPI are also affected. Are you able to
> test any of these?

Thanks for looking into the reported issue.

I have tested your patch and it works. Rootfs is now successfully
mounted during boot and it seems to work in user-land as well.

Yes, our hardware uses I2C, AUARTs and SPI as well so I can test more patches.
I have not seen them produce kernel oops or errors, so maybe they
fallback to non-DMA mode.

> Subject: [PATCH] mmc: mxs: fix flags passed to dmaengine_prep_slave_sg
>
> Fixes: ceeeb99cd821 ("dmaengine: mxs: rename custom flag")
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reported-by: Bruno Thomsen <bruno.thomsen@gmail.com>
Tested-by: Bruno Thomsen <bruno.thomsen@gmail.com>

/Bruno

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
