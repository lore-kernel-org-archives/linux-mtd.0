Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911A6C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 14:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sw0oAG+tPRz0TSvOTGI3QGBq1mxsgtaZvUoebekKIY=; b=VOjfAMkeNOpL0x
	nS84ov0HzWMb3C/EzbkGvdHknkIz2iBL+qdEm1ZBLHYJbY2YT9V9hG10NzjHDDkCEccsqt2lhgbD9
	BUc6z2CskkKFA7GWsAT7gr28IRw8kAWkzzbzBRba2fZk/6M0+MutZiYrLJLN5uRrGtQYhNs7kI/29
	XVZfmY92lTc5soPw7+UjLAxvB9F0fCi5YZgmKrKHevhYvIfNpc7GL/mh10ToyuoaeChCLHlC7dTk+
	si96X6rlXmOKpFh8wqlt8fsd4rA7h4XCqUqMjLgVMYLYeMuNIlhS+7TCUM9pD9s+y4sLokNUkoJEg
	er00+4IzosZkn64olSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njiIH-001ioS-77; Wed, 27 Apr 2022 14:05:25 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njiI5-001ilX-CF; Wed, 27 Apr 2022 14:05:14 +0000
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e9027efe6aso2008718fac.10; 
 Wed, 27 Apr 2022 07:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3hAzmL94k6R9PwkKXXDpGCbbCeAgk5EGfllFRPaGn08=;
 b=HNvd+Ncao495WuWbhT8whxMuymyeDcIYnt+m0HM6k6KkBPP2Sh0pI9S6cJp6DT7HQD
 vCGkd+dNC+MMLnNUOXdJh1s2obJ/IBCUcb/I9sHpWnvraeIcZfBoLP8sB/M6uf5nuZUB
 jVg/y+edEM4PI/G6Eq825jjXMLiy7XTNGUwTa6VKaur4egl01rn38rNdslmGbFbJjdsa
 YaR6DQlWLLV15v5phbJgwas4qaXdBvfndEH0EIyeRnTzfTwonZ8Q/hEHPjPFQQ+R0xrE
 z5vql8ypg+IKoFcY13Rb8CLaOjyouSJ6LW8r9E31Ohf6QEYBEiY3TU4OYEhZC+4Jcc/j
 3gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hAzmL94k6R9PwkKXXDpGCbbCeAgk5EGfllFRPaGn08=;
 b=eV3xDlvcVZQ8CfhTQLV+DKk+M7it88Qov5Ys8rHgZCiIXgyNgCuhmAEFVuZUFJ1M3X
 9cnHQfXLidSNruBp3me3yXd5ZrvlEByJGsZyVNTFJVo4CpXD6iCYv0G/zF5cA+NfK6uT
 ga09SeI3I2YMspcArmpqpwTwAAoxskj524P9udWLM/rd0TboFV/ggSE1H4r7r43XvxoE
 ksFpzCHU3/z8rR/dFybZqWSy5Occ/7Cy5O1Epa46eV2fBvp5PstbZPfPf7rM+NWxZDlr
 JFXNvMUU5xUPjuXZlAKajwue3ay+2adOYqlyZ5nBQeJyPdkHLFUN/hLdzSO42vvH+Bef
 ebZg==
X-Gm-Message-State: AOAM532Gi6GFnIjfyYna9KG322w1bIlx0x/DC/5WUff5Et7CEVHSiS0q
 SiKnitOxA8cHoShvh5Q1JcDEpsxzF8dtJlCJn2w=
X-Google-Smtp-Source: ABdhPJyJ03JPry6wbVQvJLHPYEG6SEWlxtrv4m0q9UnxBaFVB1qV8pE7PrJeQOeOS/99rpb2LllTG2sPJShUFpwQQz0=
X-Received: by 2002:a05:6871:824:b0:e9:1a6c:1e76 with SMTP id
 q36-20020a056871082400b000e91a6c1e76mr8582101oap.98.1651068309461; Wed, 27
 Apr 2022 07:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220424032527.673605-1-gch981213@gmail.com>
 <20220427112857.7ddd7fc8@xps13>
In-Reply-To: <20220427112857.7ddd7fc8@xps13>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 27 Apr 2022 22:04:57 +0800
Message-ID: <CAJsYDV+DfBEmWr7D1aO8F=3WMurAg6aEhf5gY86BXOUSyJ2nXA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] spi: add support for Mediatek SPI-NAND controller
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
X-CRM114-CacheID: sfid-20220427_070513_475163_B6203E7F 
X-CRM114-Status: GOOD (  10.47  )
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

Hi Miquel!

On Wed, Apr 27, 2022 at 5:29 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> [...]
>
> The patch actually look independent, so if it's fine for you I can take
> the two mtd patches and let you merge the spi/binding changes.

Out of curiosity:
Wouldn't that break the build for spi subsystem? Because...

> >  rename drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h (100%)

The spi driver needs this header file which is moved in the mtd patch.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
