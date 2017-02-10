Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccFY4-0001SJ-If
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 18:03:59 +0000
Received: by mail-pg0-x243.google.com with SMTP id v184so3647098pgv.1
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2017 10:03:35 -0800 (PST)
Date: Fri, 10 Feb 2017 10:03:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: physmap_of: fixup gemini/versatile dependencies
Message-ID: <20170210180331.GB67059@google.com>
References: <20170209020937.62339-1-computersforpeace@gmail.com>
 <CACRpkdbQZ3PW_iqj6Zn1+b+wKs9eSQ4GHmhN6KTEJLZYMOfc8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbQZ3PW_iqj6Zn1+b+wKs9eSQ4GHmhN6KTEJLZYMOfc8g@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 10, 2017 at 01:19:15PM +0100, Linus Walleij wrote:
> On Thu, Feb 9, 2017 at 3:09 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> 
> > physmap_of sort of depends on the gemini and versatile modules (when
> > they're enabled), but this isn't expressed in Kconfig. Let's just merge
> > the modules all together, when enabled. Then we can avoid exporting a
> > few symbols, and the versatile and gemini code can now be modular again
> > (the below commit accidentally made them built-in only).
> >
> > Resolves errors like this:
> >
> > ERROR: "of_flash_probe_versatile" [drivers/mtd/maps/physmap_of.ko] undefined!
> > ERROR: "of_flash_probe_gemini" [drivers/mtd/maps/physmap_of.ko] undefined!
> >
> > Fixes: 56ff337ea433 ("mtd: physmap_of: add a hook for Gemini flash probing")
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Sorry for not responding quicker.

Eh, no problem. It's mostly my fault for batch processing within the
last week before the merge window :)

I've applied my solution to l2-mtd.git. Thanks for reviewing.

> I hacked up this not entirely optimal solution to the same problem
> but I think what you're doing is better:
> 
>  config MTD_PHYSMAP_OF_VERSATILE
> -       bool "Support ARM Versatile physmap OF"
> -       depends on MTD_PHYSMAP_OF
> -       depends on MFD_SYSCON
> +       bool "ARM Versatile OF-based physical memory map handling"
> +       depends on MTD_PHYSMAP_OF=y
> +       depends on MFD_SYSCON=y
>         default y if (ARCH_INTEGRATOR || ARCH_VERSATILE || ARCH_REALVIEW)
>         help
>           This provides some extra DT physmap parsing for the ARM Versatile
>           platforms, basically to add a VPP (write protection) callback so
>           the flash can be taken out of write protection.
> 
> +config MTD_PHYSMAP_OF_GEMINI
> +       bool "Cortina Gemini OF-based physical memory map handling"
> +       depends on MTD_PHYSMAP_OF=y
> +       depends on MFD_SYSCON=y
> +       default ARCH_GEMINI
> +       help
> +         This provides some extra DT physmap parsing for the Gemini
> +         platforms, some detection and setting up parallel mode on the
> +         external interface.
> 
> I.e. I made the modules be only accessible when compiled-in.
> 
> Either solution is fine with me, but someone else might be annoyed
> by my solution so let's go with yours.

Sounds good.

> And by the way: thanks for merging this!

No problem.

Brian
