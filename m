Received: from mail-it0-x231.google.com ([2607:f8b0:4001:c0b::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccAAr-0003aB-F9
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 12:19:40 +0000
Received: by mail-it0-x231.google.com with SMTP id c7so140103815itd.1
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2017 04:19:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170209020937.62339-1-computersforpeace@gmail.com>
References: <20170209020937.62339-1-computersforpeace@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Feb 2017 13:19:15 +0100
Message-ID: <CACRpkdbQZ3PW_iqj6Zn1+b+wKs9eSQ4GHmhN6KTEJLZYMOfc8g@mail.gmail.com>
Subject: Re: [PATCH] mtd: physmap_of: fixup gemini/versatile dependencies
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 9, 2017 at 3:09 AM, Brian Norris
<computersforpeace@gmail.com> wrote:

> physmap_of sort of depends on the gemini and versatile modules (when
> they're enabled), but this isn't expressed in Kconfig. Let's just merge
> the modules all together, when enabled. Then we can avoid exporting a
> few symbols, and the versatile and gemini code can now be modular again
> (the below commit accidentally made them built-in only).
>
> Resolves errors like this:
>
> ERROR: "of_flash_probe_versatile" [drivers/mtd/maps/physmap_of.ko] undefined!
> ERROR: "of_flash_probe_gemini" [drivers/mtd/maps/physmap_of.ko] undefined!
>
> Fixes: 56ff337ea433 ("mtd: physmap_of: add a hook for Gemini flash probing")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Sorry for not responding quicker.

I hacked up this not entirely optimal solution to the same problem
but I think what you're doing is better:

 config MTD_PHYSMAP_OF_VERSATILE
-       bool "Support ARM Versatile physmap OF"
-       depends on MTD_PHYSMAP_OF
-       depends on MFD_SYSCON
+       bool "ARM Versatile OF-based physical memory map handling"
+       depends on MTD_PHYSMAP_OF=y
+       depends on MFD_SYSCON=y
        default y if (ARCH_INTEGRATOR || ARCH_VERSATILE || ARCH_REALVIEW)
        help
          This provides some extra DT physmap parsing for the ARM Versatile
          platforms, basically to add a VPP (write protection) callback so
          the flash can be taken out of write protection.

+config MTD_PHYSMAP_OF_GEMINI
+       bool "Cortina Gemini OF-based physical memory map handling"
+       depends on MTD_PHYSMAP_OF=y
+       depends on MFD_SYSCON=y
+       default ARCH_GEMINI
+       help
+         This provides some extra DT physmap parsing for the Gemini
+         platforms, some detection and setting up parallel mode on the
+         external interface.

I.e. I made the modules be only accessible when compiled-in.

Either solution is fine with me, but someone else might be annoyed
by my solution so let's go with yours.

And by the way: thanks for merging this!

Yours,
Linus Walleij
