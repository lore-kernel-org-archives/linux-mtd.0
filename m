Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2923AC433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWtpwTZr4eQKwJGYf2QpMBlvHc+gLLJEqnv7T+VZa1Y=; b=4wikqzUaPuRPcd
	vd83SIvkvgsSM7cYkEkbPZY6d2OvkXcRyZlJv+lhVU9cUAD7ohThDO3huNGrhb/fiz63UB7N6yWDA
	SQY0JlShBbmLflyJqeR82EUilQiGMkGfaHBd401Su6wZsyO6i84P2/Nt0P3njAGxwnm2QSMDBskGO
	x/iQwCxiwa2phICcmYF0eOuK5tassQtDabc/0hSSLh3nkEOQ9blExuf3GXn3qevSsWmBzBFfnoJ5A
	cXXiFcuv8tEk9lnu2APWCYlQF9LFWBYIoPPyjcwqgU61/5Ys0TWinGR9TTis42WGLxqoBuemPeeTA
	xUWpJqpn39xQl66WtL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd8y4-002tyE-Bh; Sat, 09 Apr 2022 11:09:24 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd8xq-002tsc-Qr; Sat, 09 Apr 2022 11:09:12 +0000
Received: by mail-io1-xd2f.google.com with SMTP id g21so13381229iom.13;
 Sat, 09 Apr 2022 04:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mXOsPOedrWh9JPnGJrDbvXsPmuz7lk7F3CL0nw828sw=;
 b=m2A7ZRg72dgIz2UJq8zLcB7VoF7QMuODyG1+HBaIOvauTFlbyi2qMpic9j414OaSqq
 l0da5dQ/6dzIz4qBihIVT/q06S/Z6vUgJOm8RbRA1jApzaTLAShm1ClXHrabBRa77pBK
 T9ss6qJ+01+7LYQyeev7QBA6S6w8vDAX9REGCejPL/0kmbPbQiawi78wnlyScM4sMGxM
 5jo3Ctm0UeJ+YUlrnk7YixcrMobzbf1LAHyHO+/wMtF9gf8AggEKWlrKVfIKApWICZJD
 L5db3ItCqChBzmhrNzgv2LKDqjT87kvzLRS4DEWX3bKd3aBFX0Wz4rxT8PYo32Hp9Yao
 bfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mXOsPOedrWh9JPnGJrDbvXsPmuz7lk7F3CL0nw828sw=;
 b=UWxc4OaIGfjc8quLeqHCnzw/o1/Rq0nfvnyy32EG0mJAlQxVwWpd28zib0eKp4eqTV
 WEEZHySd+zwaGnoxK1gNdq3W5Q3xlszKh2fExLHJVEIjuujrP4pjWpE3hjLlOjIyAZ5A
 Gw7WQ27+cDCs+BIHLUEVc3JZ+RtK9yXkUUAO5tTPOggLdnbhUrJ5tdaiQj2kwdYWb4zU
 HNHzVBSL9a4QtGMmIB0XeN0xiiQoUArOFua6Rfe+HJrlgrYZYXtZk2QrUeZ8qPcPWFih
 YXBo08lQnbbNiR2P1/pVutRHTjrLpYg4Geg7MJYAsWQTl3luXGS2J3QsuC9JwDFshWVi
 XZNw==
X-Gm-Message-State: AOAM530qaUuy4IgP6p2PGLYzt6Xq9NKOr5VmVnKkxBtMd8v8UW67Pwh+
 eRrMhCwdxpdISc8glr4rmd22TQS74f0UYE4el+A=
X-Google-Smtp-Source: ABdhPJxaa0UopXfyxt0OHpLxN+9t8AjQXM2kRDcQzKG1MDoxOn+mEm/HNLg+P44PI8GuE2tZuhFkwUz4vdqaMPODdP0=
X-Received: by 2002:a02:8585:0:b0:321:440c:5e11 with SMTP id
 d5-20020a028585000000b00321440c5e11mr4532439jai.35.1649502548216; Sat, 09 Apr
 2022 04:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220407150652.21885-1-gch981213@gmail.com>
 <20220407150652.21885-2-gch981213@gmail.com>
 <20220408083214.1473e88a@xps13> <YlAqSQ5w3y39aOy+@sirena.org.uk>
In-Reply-To: <YlAqSQ5w3y39aOy+@sirena.org.uk>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 9 Apr 2022 19:08:57 +0800
Message-ID: <CAJsYDV+SkL0yCroidGz4yzKbdj5Yx37a0DW9RLftKsceSFGnnw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] mtd: nand: make mtk_ecc.c a separated module
To: Mark Brown <broonie@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20220409_040910_903107_4D1CD85F 
X-CRM114-Status: GOOD (  10.20  )
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

Hi Mark!

On Fri, Apr 8, 2022 at 8:28 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Apr 08, 2022 at 08:32:14AM +0200, Miquel Raynal wrote:
>
> > Otherwise on the MTD side the series looks good (besides the two
> > comments you already received).
>
> What's the plan for merging then?

I just tested this driver on a different chip and found out it's buggy
there. I'm still debugging.
Please wait for v5 of this series. Sorry.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
