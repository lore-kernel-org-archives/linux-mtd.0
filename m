Received: from mail-io0-x232.google.com ([2607:f8b0:4001:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e4ZBx-0008K3-7A
 for linux-mtd@lists.infradead.org; Tue, 17 Oct 2017 21:14:28 +0000
Received: by mail-io0-x232.google.com with SMTP id b186so3803362iof.8
 for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2017 14:14:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171017205642.1791-1-roy.franz@cavium.com>
References: <20171017205642.1791-1-roy.franz@cavium.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 17 Oct 2017 22:14:01 +0100
Message-ID: <CAKv+Gu8a=0-FERUwbFXayqBtCG4bnvVki7hz4Ozdjr2XG2J3ew@mail.gmail.com>
Subject: Re: [PATCH] mdt: slram: use memremap() instead of ioremap()
To: Roy Franz <rfranz@cavium.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, ddaney@cavium.com, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Roy Franz <roy.franz@cavium.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 October 2017 at 21:56, Roy Franz <rfranz@cavium.com> wrote:
> Convert slram to use memremap() to map the memory it uses to back an MTD
> device, as this is the proper interface for mapping memory. This change
> enables normal memory to be used to back an MTD device on arm64, as arm64
> prevents ioremap() being used on normal memory.
>
> Signed-off-by: Roy Franz <roy.franz@cavium.com>

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> ---
> Tested on arm64 simulation, using simulator to preload filesystem image into RAM,
> and also tested on x86_64 using video card memory.  This is useful for speeding
> up booting on (very slow) emulation environments by avoiding any processing of
> an initramfs.
>
>  drivers/mtd/devices/slram.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
> index 8087c36dc693..0ec85f316d24 100644
> --- a/drivers/mtd/devices/slram.c
> +++ b/drivers/mtd/devices/slram.c
> @@ -163,8 +163,9 @@ static int register_device(char *name, unsigned long start, unsigned long length
>         }
>
>         if (!(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start =
> -                               ioremap(start, length))) {
> -               E("slram: ioremap failed\n");
> +               memremap(start, length,
> +                        MEMREMAP_WB | MEMREMAP_WT | MEMREMAP_WC))) {
> +               E("slram: memremap failed\n");
>                 return -EIO;
>         }
>         ((slram_priv_t *)(*curmtd)->mtdinfo->priv)->end =
> @@ -186,7 +187,7 @@ static int register_device(char *name, unsigned long start, unsigned long length
>
>         if (mtd_device_register((*curmtd)->mtdinfo, NULL, 0))   {
>                 E("slram: Failed to register new device\n");
> -               iounmap(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start);
> +               memunmap(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start);
>                 kfree((*curmtd)->mtdinfo->priv);
>                 kfree((*curmtd)->mtdinfo);
>                 return(-EAGAIN);
> @@ -206,7 +207,7 @@ static void unregister_devices(void)
>         while (slram_mtdlist) {
>                 nextitem = slram_mtdlist->next;
>                 mtd_device_unregister(slram_mtdlist->mtdinfo);
> -               iounmap(((slram_priv_t *)slram_mtdlist->mtdinfo->priv)->start);
> +               memunmap(((slram_priv_t *)slram_mtdlist->mtdinfo->priv)->start);
>                 kfree(slram_mtdlist->mtdinfo->priv);
>                 kfree(slram_mtdlist->mtdinfo);
>                 kfree(slram_mtdlist);
> --
> 2.11.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
