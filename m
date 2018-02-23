Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1epFc1-0001e3-Vq
 for linux-mtd@lists.infradead.org; Fri, 23 Feb 2018 15:50:24 +0000
Date: Fri, 23 Feb 2018 16:49:53 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Bean Huo <beanhuo@outlook.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, beanhuo
 <beanhuo@micron.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v1 3/3] drivers: mtd: chips: add support for the dual
 die stacked PNOR
Message-ID: <20180223164953.3dee49b0@bbrezillon>
In-Reply-To: <DM2PR12MB001437E51CB54D86406D2550A6CC0@DM2PR12MB0014.namprd12.prod.outlook.com>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
 <DM2PR12MB00143807EEF9602098FF0D4BA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
 <20180222143357.4ec680b6@bbrezillon>
 <DM2PR12MB001437E51CB54D86406D2550A6CC0@DM2PR12MB0014.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 Feb 2018 11:43:21 +0000
Bean Huo <beanhuo@outlook.com> wrote:

> Boris,
> >>
> >> +/*
> >> + * The dual die stacked device comprises two identical dies which connected  
> >                                                                   ^are  
> fixed in next patch.
> 
> >> + * in parallel.But there is only one die being selected each time according  
> 
>    >               ^ missing space after the period  
> fixed in next patch.
> 
> >> + * to maximum address line A[max]. When A[max] == 0, the lower die is selected,
> >> + * when A[max] == 1, the upper die is selected. This function will reture the  
> >
>  >                                                               ^return  
> >> + * CFI unlock-command base address according to accessing address.  
> >Is it really just about unlock commands?  
> 
> Except unlock commands, other commands also need but don't need to add
> 0x555/0x2AA. And current parallel nor driver already does this way.
> so we don't need to change.

Sorry, I don't understand, probably because I lack some background on
CFI. I'll try to document myself if I find some time.

> 
> >> + */
> >> +static loff_t get_cmd_base_address(struct map_info *map, struct flchip *chip,
> >> +             loff_t offset)
> >> +{
> >> +     struct cfi_private *cfi = map->fldrv_priv;
> >>
> >>+     unsigned long cmd_base_addr = chip->start;
> >>+
> >> +     if (cfi->device_stack == CFI_DEVICESTACK_2DIE) {
> >>+             if (offset >= (1 << (cfi->cfiq->DevSize - 1)))
> >>+                     cmd_base_addr += (1 << (cfi->cfiq->DevSize - 1));
> >> +     }  
> 
> >Could be done in a more generic way:  
> 
>  >    unsigned long die = offset >> (cfi->cfiq->DevSize - 1);  
> 
> >        if (cfi->device_stack == 1) {
>  >               WARN_ON(die);
>   >              return cmd_base_addr;
>   >      }  
> 
>    >     cmd_base_addr += die << (cfi->cfiq->DevSize - 1);  
> 
> it will be included in next patch, thanks.
> 
> ...
> >> -     cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> >> +     /* For the dual die device, rebase the command base address according  
> 
> >Please do not use net-style comments.  
> 
> To be honest, I don't know what is net-style comments.

Net-style comment:

/* blablabla
 * blablabla
 */

Kernel-style comment:

/*
 * blablabla
 * blablabla
 */

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
