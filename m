Received: from linux-sh.org ([111.68.239.195])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaF5m-0000W8-2x
 for linux-mtd@lists.infradead.org; Thu, 31 May 2012 23:47:47 +0000
Date: Fri, 1 Jun 2012 08:47:07 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] mtd/uclinux: Use generic __bss_stop instead of _ebss
Message-ID: <20120531234706.GE11445@linux-sh.org>
References: <1338497739-2852-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1338497739-2852-1-git-send-email-geert@linux-m68k.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Michal Simek <monstr@monstr.eu>,
 Mike Frysinger <vapier@gentoo.org>, uclinux-dev@uclinux.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 31, 2012 at 10:55:39PM +0200, Geert Uytterhoeven wrote:
> The standard (see BSS_SECTION() in <asm-generic/vmlinux.lds.h> and
> <asm-generic/sections.h>) symbol for the end of BSS is __bss_stop.
> This allows to remove all local declarations that have been added to
> several architectures just to please CONFIG_MTD_UCLINUX.
> 
> Not-Yet-Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> This is a prerequisite for some future m68k changes:
>   - replacing the m68k-specific _[se]bss by the generic __bss_{start,stop},
>   - using the asm-generic version of <asm/sections.h>.

I like it. The only reason we have _ebss on sh at all is for the mtd map
anyways.

Acked-by: Paul Mundt <lethal@linux-sh.org>
