Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaJwt-0008E2-99
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 04:58:57 +0000
Received: by wgbds1 with SMTP id ds1so1075645wgb.18
 for <linux-mtd@lists.infradead.org>; Thu, 31 May 2012 21:58:52 -0700 (PDT)
Message-ID: <4FC84C08.4020408@monstr.eu>
Date: Fri, 01 Jun 2012 06:58:48 +0200
From: Michal Simek <monstr@monstr.eu>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] mtd/uclinux: Use generic __bss_stop instead of _ebss
References: <1338497739-2852-1-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1338497739-2852-1-git-send-email-geert@linux-m68k.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Paul Mundt <lethal@linux-sh.org>,
 Mike Frysinger <vapier@gentoo.org>, uclinux-dev@uclinux.org,
 linux-mtd@lists.infradead.org
Reply-To: monstr@monstr.eu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/31/2012 10:55 PM, Geert Uytterhoeven wrote:
> The standard (see BSS_SECTION() in<asm-generic/vmlinux.lds.h>  and
> <asm-generic/sections.h>) symbol for the end of BSS is __bss_stop.
> This allows to remove all local declarations that have been added to
> several architectures just to please CONFIG_MTD_UCLINUX.
>
> Not-Yet-Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
> ---
> This is a prerequisite for some future m68k changes:
>    - replacing the m68k-specific _[se]bss by the generic __bss_{start,stop},
>    - using the asm-generic version of<asm/sections.h>.
> ---
>   arch/blackfin/kernel/setup.c              |    1 -
>   arch/microblaze/include/asm/sections.h    |    4 ----
>   arch/microblaze/kernel/microblaze_ksyms.c |    3 ---
>   arch/microblaze/kernel/setup.c            |    4 ++--
>   arch/microblaze/kernel/vmlinux.lds.S      |    1 -
>   arch/sh/include/asm/sections.h            |    1 -
>   arch/sh/kernel/setup.c                    |    2 +-
>   arch/sh/kernel/sh_ksyms_32.c              |    1 -
>   arch/sh/kernel/vmlinux.lds.S              |    1 -
>   arch/sh/lib/mcount.S                      |    8 +++-----
>   drivers/mtd/maps/uclinux.c                |    5 ++---
>   11 files changed, 8 insertions(+), 23 deletions(-)
>

Looks good to me.

Acked-by: Michal Simek <monstr@monstr.eu>

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
