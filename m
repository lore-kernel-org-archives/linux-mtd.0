Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56463C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 09:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XKKFPLagokfDGBmk2rlCZHQxR+d1STFDKLKU9NEy1g=; b=ztm85LIYULeYzF
	YoNuS+r1AP8xlNOfAC5F2KJ08k1H1Am3QjU3aygXY8wMZPfqgYsPpW/AKy9fY9locget6xz5EXo1S
	D7F/gE7Johrev4QcPBOKxw3M7qEnJN4qRwTuh/knhpFpvCekE/KPgcbvBF0Sp9KM7ZnDvY2ELTnwI
	FEpoqgGFLyHN75def4SnU3aZx4EGLJXdcsa5HORAc1w/pNffSu8B+Un6DpY24ZUhR5PSVtLh1ycsH
	sk/CbqIJ1ZJdd6T6APzAhR/EOYfIdujVxxXYWThBL2tTsUl5xAx/iBw6JJPIJ8wGdNNNTjXid50+P
	NlvEWzU0ioR4cZ4IUs1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbIqx-00E8DN-GN; Mon, 04 Apr 2022 09:18:27 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbIqj-00E842-Hi; Mon, 04 Apr 2022 09:18:14 +0000
Received: by mail-io1-xd2e.google.com with SMTP id b16so10482115ioz.3;
 Mon, 04 Apr 2022 02:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UnaFhwCYQRKWSH+CeXac4WqG9Xl8JMA4f5GGyBthARA=;
 b=OM0XkGIma7ffY2S1PmsiiXE0UWKkPQn0DhxmwB2NRmkgKaS2XttPCAefGJvp2SBMHr
 YCoCGmQ8DUMxaZqFE1R/3bjLIokY0sgVIPjAlx2bi3ZUqZNzsi3mVRPqlsza78d6zowO
 s3YiXPP0cTu/ZbVFgnF/vuEuVyOx35G46rmKOKqA7aHYaEg7rdgJKD+yDCukc6UYNn6m
 8P6fmXonD5Wb1bP/RZ42tvytZiRetlCfu1275s0rzuB3FQvzMyyG10aFgCvi0O5/p4zh
 R22LXf8qpGTNzR8i3lOD9+y9eCuE9g3vITwNNePGgInZ3yeda+62vtd9paQl9sOxltAM
 vmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UnaFhwCYQRKWSH+CeXac4WqG9Xl8JMA4f5GGyBthARA=;
 b=Ddy3g7IqZWkIGyZA3E5bvY2KlPPxNHBNDMQet8CMu+qb3aPD95qSP3n0hWrfiRhQNO
 vZwpOahzw2azHMtVoe801lynQpNgJPBHYMeSb2v+r3vL/i5ydoPpP6QrEuh4KkqJFkR7
 p2T4lYlpJYtb2FcaQnqe1ear7WxPHJykO0ldgMAwWZbQGaJbrRncIatVfS+33Fa5sz4z
 FMGHfuUwkK2DqDO4SbZeATKZ58uVOpvofHW2FFk91RHiypUM05bdl5N2AFGG9ih2iWOn
 YO0+7GgLCsmo5twkrLVq61NYXGHUafM7r/C0wEDFWwyf6kKG+sjuIdPQ3C7ApeC0JQaZ
 fR4g==
X-Gm-Message-State: AOAM531ZdkL6f5r/nUmaNQJy1xFJ5jygzpI94fnHedRWGjkZcJVwj2Ma
 8jOfTPD06dqCmn/t7IU0VmCvRpBG2aQ/79Xn2ro=
X-Google-Smtp-Source: ABdhPJwk1obp4MUEJ6Ns1yJyfhGQSi+qsYFyZKkkGsHXlVIW1zk9zcdQAeQYY7sPN3ShTR1WQ3jghmwju5nGv2ueg5g=
X-Received: by 2002:a05:6638:438e:b0:323:8ec2:e177 with SMTP id
 bo14-20020a056638438e00b003238ec2e177mr11404567jab.164.1649063890353; Mon, 04
 Apr 2022 02:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220404040153.1509966-1-gch981213@gmail.com>
 <20220404040153.1509966-3-gch981213@gmail.com>
 <20220404095937.20089db7@xps13>
 <CAJsYDVK6ya7FR90CtAjbpbF-_+c0GVnsKsN=1wYaoBFx=ysUtQ@mail.gmail.com>
In-Reply-To: <CAJsYDVK6ya7FR90CtAjbpbF-_+c0GVnsKsN=1wYaoBFx=ysUtQ@mail.gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 4 Apr 2022 17:17:59 +0800
Message-ID: <CAJsYDVLaaGhD6wRvoQokPUQYBvSpN2kZ1kMMw4Z0fCZnHOVYWw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] spi: add driver for MTK SPI NAND Flash Interface
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, 
 Florian Fainelli <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, 
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_021813_620096_B56267B2 
X-CRM114-Status: GOOD (  11.39  )
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

Hi!

On Mon, Apr 4, 2022 at 5:13 PM Chuanhong Guo <gch981213@gmail.com> wrote:
> [...]
> I can implement the following:
> 1. select the minimum capability exceeding ecc.user_conf
> 2. If that doesn't exist, use the calculated one and warn
>    if it doesn't meet ecc.requirements

I mean If there is no ecc.user_conf in the 2nd case :)

> Is this OK?

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
