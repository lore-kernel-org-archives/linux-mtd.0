Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzcY-0003KR-6k
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 10:05:32 +0000
Received: by mail-oi0-x234.google.com with SMTP id w81so61655786oig.1
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 03:05:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490090645-8576-11-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-11-git-send-email-thomas.petazzoni@free-electrons.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2017 11:05:08 +0100
Message-ID: <CACRpkdZ6Ehe0AKT-PLBaR+ziyZ_23Ti8MaSXNnZS6pY=548Ypw@mail.gmail.com>
Subject: Re: [PATCH 10/13] mtd: nand: fsmc: finally remove
 fsmc_nand_platform_data
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 21, 2017 at 11:04 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> Since the driver now only supports DT probing, it doesn't make a lot of
> sense to have a private data structure called platform_data, fill it in
> with information coming from the DT, and then copying this into the
> driver-specific structure fsmc_nand_data.
>
> So instead, we remove fsmc_nand_platform_data entirely, and have
> fsmc_nand_probe_config_dt() fill in the fsmc_nand_data structure
> directly.
>
> This requires calling fsmc_nand_probe_config_dt() after fsmc_nand_data
> has been allocated instead of before.
>
> Also, as an added bonus, we now propagate properly the return value of
> fsmc_nand_probe_config_dt() instead of returning -ENODEV on failure. The
> error message is also removed, since it no longer made any sense.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Sweet!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
