Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGBml-0001qf-Iu
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 20:31:24 +0000
Date: Mon, 4 Jan 2016 21:31:02 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Heiko
 Schocher <hs@denx.de>, Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH for-4.4] mtd: nand: assign reasonable default name for
 NAND drivers
Message-ID: <20160104213102.4e3757d3@bbrezillon>
In-Reply-To: <1451934663-68925-1-git-send-email-computersforpeace@gmail.com>
References: <1451934663-68925-1-git-send-email-computersforpeace@gmail.com>
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

Hi Brian,

On Mon,  4 Jan 2016 11:11:03 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> Commits such as commit 853f1c58c4b2 ("mtd: nand: omap2: show parent
> device structure in sysfs") attempt to rely on the core MTD code to set
> the MTD name based on the parent device. However, nand_base tries to set
> a different default name according to the flash name (e.g., extracted
> from the ONFI parameter page), which means NAND drivers will never make
> use of the MTD defaults. This is not the intention of commit
> 853f1c58c4b2.
> 
> This results in problems when trying to use the cmdline partition
> parser, since the MTD name is different than expected. Let's fix this by
> providing a default NAND name, where possible.
> 
> Note that this is not really a great default name in the long run, since
> this means that if there are multiple MTDs attached to the same
> controller device, they will have the same name. But that is an existing
> issue and requires future work on a better controller vs. flash chip
> abstraction to fix properly.

Yep, and IMHO, the chip numbering currently in use in most NAND
controller drivers is not the best solution either. We should somehow
find a way to describe the mtd id using something like:

mtd-id: <nand-controller-id>@<cs-line>
nand-controller-id: <nand-controller-ip-name>-<ip-address>

Anyway, let's discuss that after the nand-chip <-> nand-controller
separation rework.

> 
> Reported-by: Heiko Schocher <hs@denx.de>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Heiko Schocher <hs@denx.de>
> Cc: Frans Klaver <fransklaver@gmail.com>
> ---
> This patch is needed in additon to commit 472b444eef93 ("mtd: fix cmdlinepart
> parser, early naming for auto-filled MTD") to fix Heiko's reported problem. At
> this point, I'm not sure if this should be targeted toward late 4.4 or for 4.5.
> It's a 4.4 regresssion, but a very small one. And I'm not sure if this will
> have wide enough impact that it should be given a longer time to be reviewed
> and tested. We can always send it to -stable later, if it's really needed.
> 
>  drivers/mtd/nand/nand_base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ece544efccc3..9f169566fba4 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3826,6 +3826,9 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  	if (!type)
>  		type = nand_flash_ids;
>  
> +	if (!mtd->name && mtd->dev.parent)
> +		mtd->name = dev_name(mtd->dev.parent);
> +

Just nitpicking, but I think this would be better placed in
nand_set_defaults() or in nand_scan_ident() before nand_get_flash_type()
call.

Anyway,

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

>  	for (; type->name != NULL; type++) {
>  		if (is_full_id_nand(type)) {
>  			if (find_full_id_nand(mtd, chip, type, id_data, &busw))

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
