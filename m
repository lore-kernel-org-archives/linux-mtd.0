Received: from smtp103.biz.mail.mud.yahoo.com ([68.142.200.238])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EVvmr-0006ZJ-07
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2005 14:50:45 -0400
From: Pete Popov <ppopov@embeddedalley.com>
To: Sergei Shtylylov <sshtylyov@ru.mvista.com>
In-Reply-To: <4363C0EF.3000607@ru.mvista.com>
References: <4363C0EF.3000607@ru.mvista.com>
Content-Type: text/plain
Date: Sat, 29 Oct 2005 11:50:49 -0700
Message-Id: <1130611849.12171.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] NAND: AMD Au1550 driver reads write only register
Reply-To: ppopov@embeddedalley.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-10-29 at 22:35 +0400, Sergei Shtylylov wrote:
> Hello.
> 
>        I have noticed that during the last commit to AMD Au1550 NAND driver the
> old buglet was reintroduced: as MEM_STNDCTL register is write only, and
> seem to always read as 0x31, read-modify-write of it in au1xxx_nand_init()
> will cause undesirable effect of enabling -RCS0/1 pin override (bits 4/5 of
> this reg.), thus possibly causing a contention on the static bus when the NOR
> flash (which uses  -RCS0) or board control status regs. (using -RCS2) are
> read. Luckily, this now goes away with a first NAND access, since
> au1550_hwcontrol() doesn't try to read this register before writing anymore.
>       There's another issue with that though -- to be addressed by the next
> patch...

Thanks for catching that. I'll make a note in the code so it doesn't
happen again.

Pete

> WBR, Sergei
> 
> 
> 
> plain text document attachment (Au1550-NAND-STNDCTL-write-only.patch)
> Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
> 
> Index: au1550nd.c
> ===================================================================
> RCS file: /home/cvs/mtd/drivers/mtd/nand/au1550nd.c,v
> retrieving revision 1.12
> diff -a -u -p -r1.12 au1550nd.c
> --- au1550nd.c	23 Sep 2005 01:44:55 -0000	1.12
> +++ au1550nd.c	29 Oct 2005 18:21:04 -0000
> @@ -343,11 +343,8 @@ int __init au1xxx_nand_init (void)
>  	au1550_mtd->priv = this;
>  
> 
> -	/* disable interrupts */
> -	au_writel(au_readl(MEM_STNDCTL) & ~(1<<8), MEM_STNDCTL);
> - 
> -	/* disable NAND boot */
> -	au_writel(au_readl(MEM_STNDCTL) & ~(1<<0), MEM_STNDCTL);
> +	/* MEM_STNDCTL: disable ints, disable nand boot */
> +	au_writel(0, MEM_STNDCTL);
>  
>  #ifdef CONFIG_MIPS_PB1550
>  	/* set gpio206 high */
> 
> 
> 
