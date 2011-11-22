Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSm9n-0006Wb-Ce
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 08:56:48 +0000
Received: by pzk34 with SMTP id 34so15842793pzk.2
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2011 00:56:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20111122043904.GA22504@thor.bakeyournoodle.com>
References: <20111122043904.GA22504@thor.bakeyournoodle.com>
Date: Tue, 22 Nov 2011 12:56:43 +0400
Message-ID: <CALT56yMTWOS=-3MUrLLFY--e1NcONX-aruDYPoJapppMx3Vf4Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: ndfc: fix typo in structure dereference
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Tony Breeds <tony@bakeyournoodle.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/22/11, Tony Breeds <tony@bakeyournoodle.com> wrote:
> In commit 9d7948c50055e74b693ce9e99a709b2e5bbc1942 (mtd: ndfc: use
> ofpart through generic parsing) we dereference a non pointer type
> causing the following compiler error:
> drivers/mtd/nand/ndfc.c: In function 'ndfc_chip_init':
> drivers/mtd/nand/ndfc.c:191: error: invalid type argument of '->' (have
> 'struct mtd_part_parser_data')
>
> Fix that.
>
> Signed-off-by: Tony Breeds <tony@bakeyournoodle.com>

Acked-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Sometimes I wander about this serie. I tried to test most
of the combinations, I could test at that momemt. The patches
were split in simple chunks to simplify review and testing. They
waited in linux-next for 2 or 3 releases. And I still see problems
with those patches.


> ---
>  drivers/mtd/nand/ndfc.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
> index ee17139..f8aacf4 100644
> --- a/drivers/mtd/nand/ndfc.c
> +++ b/drivers/mtd/nand/ndfc.c
> @@ -188,7 +188,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
>  	if (!flash_np)
>  		return -ENODEV;
>
> -	ppdata->of_node = flash_np;
> +	ppdata.of_node = flash_np;
>  	ndfc->mtd.name = kasprintf(GFP_KERNEL, "%s.%s",
>  			dev_name(&ndfc->ofdev->dev), flash_np->name);
>  	if (!ndfc->mtd.name) {
> --
> 1.7.6.4
>
> Yours Tony
>


-- 
With best wishes
Dmitry
