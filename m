Received: from mail1.windriver.com ([147.11.146.13])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Skbk5-00026P-QO
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 14:00:15 +0000
Message-ID: <4FEDB4E6.4090109@windriver.com>
Date: Fri, 29 Jun 2012 10:00:06 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 2/3] mtd: delete SBC82xx/SBC8560 MTD mapping support
References: <1340740469-31445-1-git-send-email-paul.gortmaker@windriver.com>
 <1340740469-31445-3-git-send-email-paul.gortmaker@windriver.com>
 <1340958563.3070.132.camel@sauron.fi.intel.com>
In-Reply-To: <1340958563.3070.132.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <David.Woodhouse@intel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12-06-29 04:29 AM, Artem Bityutskiy wrote:
> On Tue, 2012-06-26 at 15:54 -0400, Paul Gortmaker wrote:
>> The SBC8260 support was dropped back when we moved from ppc to
>> powerpc.  We are now also dropping the support for the EOL SBC8560,
>> so we can also delete this mapping support, as they were the only
>> users of it.
>>
>> Cc: David Woodhouse <David.Woodhouse@intel.com>
>> Cc: linux-mtd@lists.infradead.org
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> You forgot this:
> 
> diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
> index 68a9a91..deb43e9 100644
> --- a/drivers/mtd/maps/Makefile
> +++ b/drivers/mtd/maps/Makefile
> @@ -47,7 +47,6 @@ obj-$(CONFIG_MTD_SCB2_FLASH)  += scb2_flash.o
>  obj-$(CONFIG_MTD_H720X)                += h720x-flash.o
>  obj-$(CONFIG_MTD_IXP4XX)       += ixp4xx.o
>  obj-$(CONFIG_MTD_IXP2000)      += ixp2000.o
> -obj-$(CONFIG_MTD_WRSBC8260)    += wr_sbc82xx_flash.o

Agreed.  I'd figured that died back in 2.6.2x when the old
ppc board got removed, and it never even crossed my mind to
git grep for it.  Funny that some automated orphan CONFIG_
checker script didn't find it (assuming there is one.)

Thanks,
Paul.
--

>  obj-$(CONFIG_MTD_DMV182)       += dmv182.o
>  obj-$(CONFIG_MTD_PLATRAM)      += plat-ram.o
>  obj-$(CONFIG_MTD_INTEL_VR_NOR) += intel_vr_nor.o
> 
> I've amended the patch and pushed to l2-mtd.git tree, thanks!
> 
