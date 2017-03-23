Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzbD-0001Wi-9Z
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 10:04:08 +0000
Received: by mail-ot0-x229.google.com with SMTP id o24so183598441otb.1
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 03:03:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490090645-8576-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-9-git-send-email-thomas.petazzoni@free-electrons.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2017 11:03:45 +0100
Message-ID: <CACRpkdbwUbD7jOMX657iooHe6RDdCWFwVdLz+BiUqUcnH_FvcA@mail.gmail.com>
Subject: Re: [PATCH 08/13] mtd: nand: fsmc: kill {nr_,
 }partitions structure fields
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

> The ->partitions and ->nr_partitions fields of struct
> fsmc_nand_platform_data are never set anywhere, so they are always
> NULL/0. The corresponding fields in 'struct fsmc_nand_data' are set to the
> value of the same fields in fsmc_nand_platform_data, i.e NULL/0.
>
> Therefore, we remove those two fields, and pass NULL/0 directly to
> mtd_device_register(), like many other NAND drivers already do.
>
> At the same time, we remove the comment about the fact that we pass
> partition info, since we are no longer doing this.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
