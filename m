Received: from sncsmrelay2.nai.com ([67.97.80.206])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SU9FB-0005aM-CD
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 04:20:17 +0000
Message-ID: <4FB1D8D7.9010203@snapgear.com>
Date: Tue, 15 May 2012 14:17:27 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: uClinux development list <uclinux-dev@uclinux.org>,
 <linux-mtd@lists.infradead.org>, <dedekind1@gmail.com>
Subject: Re: [uClinux-dev] [PATCH] mtd: clean up uclinux.c map driver
References: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
In-Reply-To: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15/05/12 14:08, gerg@snapgear.com wrote:
[snip]
>   /****************************************************************************/
> @@ -65,22 +62,22 @@ static int __init uclinux_mtd_init(void)
>   		mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8))));
>   	mapp->bankwidth = 4;
>
> -	printk("uclinux[mtd]: RAM probe address=0x%x size=0x%x\n",
> +	printk(KERN_NOTICE "uclinux[mtd]: RAM probe address=0x%x size=0x%x\n",
>   	       	(int) mapp->phys, (int) mapp->size);
>
> -	mapp->virt = phys_to_virt(mapp->phys);
> +	mapp->virt = (void __iomem *) (unsigned long) phys_to_virt(mapp->phys);

I am a little un-easy with this casting. It would seem to indicate
some type of abuse of the virt field...

But this same thing has been done in other mtd mapping drivers, for
example drivers/mtd/maps/amd76xrom.c.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
