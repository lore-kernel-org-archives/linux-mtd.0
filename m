Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzRP-0004OZ-4G
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 09:54:01 +0000
Received: by mail-ot0-x22f.google.com with SMTP id a12so114121951ota.0
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 02:53:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490090645-8576-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-2-git-send-email-thomas.petazzoni@free-electrons.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2017 10:53:37 +0100
Message-ID: <CACRpkdYJdJW9z=V2_6Fy9x09G8ft-Q7Z2dj9nJg8KgAFEC41wA@mail.gmail.com>
Subject: Re: [PATCH 01/13] mtd: nand: fsmc: fix NAND width handling
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Stefan Roese <sr@denx.de>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 21, 2017 at 11:03 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> In commit eea628199d5b ("mtd: Add device-tree support to fsmc_nand"),
> Device Tree support was added to the fmsc_nand driver. However, this
> code has a bug in how it handles the bank-width DT property to set the
> bus width.
>
> Indeed, in the function fsmc_nand_probe_config_dt() that parses the
> Device Tree, it sets pdata->width to either 8 or 16 depending on the
> value of the bank-width DT property.
>
> Then, the ->probe() function will test if pdata->width is equal to
> FSMC_NAND_BW16 (which is 2) to set NAND_BUSWIDTH_16 in
> nand->options. Therefore, with the DT probing, this condition will never
> match.
>
> This commit fixes that by removing the "width" field from
> fsmc_nand_platform_data and instead have the fsmc_nand_probe_config_dt()
> function directly set the appropriate nand->options value.
>
> It is worth mentioning that if this commit gets backported to older
> kernels, prior to the drop of non-DT probing, then non-DT probing will
> be broken because nand->options will no longer be set to
> NAND_BUSWIDTH_16.
>
> Fixes: eea628199d5b ("mtd: Add device-tree support to fsmc_nand")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Good catch.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
