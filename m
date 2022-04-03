Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0180DC433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 16:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwC8v2rmHvbn3SL7xGHCzfzNKWL1sGThcb9Y/kuM+1k=; b=MGUNOv7GAH7UAK
	LkmRsyWoGNnLBmHCpb8wfYPqGjq87jma+l8Ph5Ka2JQgPliqwiO5dCQZr5/ME6uOo6gnP5onVsrtF
	Rftm+samU23wnih0xR0urMV51f+MQdw7sZGyXCpqfzo8hIzwirJFfQncO59zY8myJZwhowPC1WAHc
	Km9OX/TTRY0pciswSQR1oXLljgm/kjEppXG0xha/0LVisfIcfva1n7gbjm2UVqaWZ47XnjY4+qMh7
	TM5cRsQOwb896yotzj/StmsaiYM7JQ6wH2lDxhovLcytrX+KfqpeL/RLuqILS5U95TeAi4oaOhAXS
	gw7FUHSjixblN/n8vy9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb2fu-00Bnz5-W4; Sun, 03 Apr 2022 16:01:59 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb2fi-00BnvB-K4; Sun, 03 Apr 2022 16:01:47 +0000
Received: by mail-io1-xd31.google.com with SMTP id g21so8530411iom.13;
 Sun, 03 Apr 2022 09:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/KVd5HFtfdl/4YhzYTy1ARrs2qcreXKLJ20n7fqioxY=;
 b=Lc3foFpYddqhED8+lp1gUshprjqka20POXoZ1Fqvhx5Nuf5x+ISBeP4wT+FG5RetpP
 +LiHFJYLTcUeyRHXZoK/Fnxf4SzeKxG9hEvyNFvIlVHa/NDu8yAs+jOx/p8dbbPURno/
 I+zZ9pyY9vPwheJIa8DuATLYb9+Pygcx3vyKwPrDZr6FmrT6YMBiZSVRpI37m+BVSgim
 2QVaVx8PfrTW106nE4HAcyQNbop5Jbvu75mx2fPV48jft1UOsbVwYDhs36WntKG1fROW
 0rhTSnw6KvbXpCIiZ6jbVmx6cd6y8kIzTlo+g66AjvKmslg+BngMJb+PDr7NZJrrHdqI
 +Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/KVd5HFtfdl/4YhzYTy1ARrs2qcreXKLJ20n7fqioxY=;
 b=o/bY99UYXiy9JKyt7oqefPknLGIOlzLsgL6iQTgNMlZ87Yljio1b0ICpPmKaiPxC/O
 3dFHVeJPakeLGho9jr+/nJp4Nwe+pCcBrDqXVEQkrGxlo7LMy2xeRjnolHMrl57c/XLo
 bXdpd5xLliPcHHP1Ds7xFnj2yQthXPMUTA6QvV29fscbJ0J4cf0i6jJ+kGisEFi5R8R2
 vYwo3rdFL41ggocYfLPlbLPPjUH8YyZNMqs57F/PzLarXp/lPBLKdooiQMoOMMWUEhMS
 d6PvPPQZo2dApX1Kc5uWXWpZQDM1OjJe7aED4MW8bP33cFvmRslc4YvvwNp4fecAR5QP
 3vQA==
X-Gm-Message-State: AOAM531MHSkH2VazdWkP3NQzX90YCpyPtXZIRNsUQvknYAlo6D1ymHKZ
 YaMDdZvRvrIDU+5KTN4Pn2eee14OKv2gAvV7mDU=
X-Google-Smtp-Source: ABdhPJwtM9rC5frTbOPfqFXajh8HCuXZAkrqVls+IUjlbS6KZoNTleMbBV69uFF+7VRl3sGXuqvc9T4HYSnSDMPqcSY=
X-Received: by 2002:a5e:9302:0:b0:648:c246:291 with SMTP id
 k2-20020a5e9302000000b00648c2460291mr3654500iom.88.1649001703873; Sun, 03 Apr
 2022 09:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220403131154.1267887-1-gch981213@gmail.com>
 <20220403131154.1267887-4-gch981213@gmail.com>
 <817dda10-39db-adfc-376d-a3d5e037937e@linaro.org>
 <CAJsYDVKYsz7c2yVe7TmPu_7kvBDXTih4+cceLsay2YJm21YntA@mail.gmail.com>
 <06ef6b4b-c8e8-549b-54be-9eecf59a7757@linaro.org>
In-Reply-To: <06ef6b4b-c8e8-549b-54be-9eecf59a7757@linaro.org>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 4 Apr 2022 00:01:32 +0800
Message-ID: <CAJsYDVK9UB=71Yj2t9Rc658W66Lf=uK6eLn5S+Y8Rj3skz4g+w@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: spi: add binding doc for spi-mtk-snfi
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, 
 Florian Fainelli <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, 
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>, 
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_090146_697533_86963448 
X-CRM114-Status: GOOD (  15.51  )
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

On Sun, Apr 3, 2022 at 11:49 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> [...]
> >>> +
> >>> +  ecc-engine:
> >>
> >> The nand-chip.yaml defines a nand-ecc-engine, so how about using that
> >> one? I know mtk-nand.txt uses ecc-engine, but for new schema better to
> >> use properties from existing YAML.
> >
> > The ecc-engine code is shared between mtk_nand.c and this driver, and
> > the property name is defined in the shared part. I left it as-is so that
> > existing dt for mtk_nand doesn't break.
>
> This can be easily fixed with:
>         np = of_parse_phandle(of_node, "nand-ecc-engine", 0);
>         if (!np) {
>                 /* Backwards compatible */
>                 np = of_parse_phandle(of_node, "ecc-engine", 0);
>         }
>
> I would like to avoid having one property in generic NAND schema and
> keep adding something slightly different everywhere else.

OK. I'll add a commit for this in the next version.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
