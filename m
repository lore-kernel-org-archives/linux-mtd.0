From: jasmine@hex.linuxgrrls.org (Jasmine Strong)
Date: Mon, 24 Mar 2003 14:09:06 +0000 (GMT)
Subject: help: network cannot startup from FLASH
In-Reply-To: <OE64jukJ1zkc6g9wHRQ0000134f@hotmail.com>
Message-ID: <Pine.LNX.4.33.0303241406360.9298-100000@hex.linuxgrrls.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org


On Mon, 24 Mar 2003, guo_zhenglin wrote:

> I modify file: arch/ppc/8xx_io/enet.c:

Looks like your bootloader's data area is different when you
boot from Flash as opposed to booting from the RAM.  Maybe
the bootloader is trashing the EAP when you boot from Flash?  Or maybe
you jsut skip the part of the setup routine that sets the Enet
configuration?  This would make sense if the bootloader had some kind
boot-from-ethernet support that was causing it to get initialized when you
boot via the RAM system but not when you are booting from flash directly.

-J.


> ------original text ------------------------------------
>    int __init scc_enet_init(void)
>  {
>   ......
> #ifndef CONFIG_MBX
>         for (i=5; i>=0; i--)
>                 *eap++ = dev->dev_addr[i] = bd->bi_enetaddr[i];
> #else
>         for (i=5; i>=0; i--)
>              dev->dev_addr[i] = *eap++;
> #endif
>
> ------after modified  ------------------------------------
>    int __init scc_enet_init(void)
>  {
>   ......
> #ifndef CONFIG_MBX
>         for (i=5; i>=0; i--)
>                 *eap++ = dev->dev_addr[i] = bd->bi_enetaddr[i];
> #else
>         for (i=5; i>=0; i--)
>                 *eap++ = dev->dev_addr[i] = bd->bi_enetaddr[i];
>              /*      dev->dev_addr[i] = *eap++; */
> #endif
>
>
> then network MAC can be recognised correctly ,and BOOTP can  get  IP
> address.
> but I don't know that reason.
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
