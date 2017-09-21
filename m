Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1duwOv-0003op-RK
 for linux-mtd@lists.infradead.org; Thu, 21 Sep 2017 08:00:08 +0000
Date: Thu, 21 Sep 2017 09:59:30 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "William A. Kennington III" <wak@google.com>
Cc: linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] mtd: powernv: Support MTD_NO_ERASE
Message-ID: <20170921095930.4b473f91@bbrezillon>
In-Reply-To: <20170905202339.20732-1-wak@google.com>
References: <20170905202339.20732-1-wak@google.com>
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

+the DT maintainers

On Tue,  5 Sep 2017 13:23:39 -0700
"William A. Kennington III" <wak@google.com> wrote:

> As of skiboot@ba99af9b149d02438347b055e6e7d6bd15e33551, we now support

I didn't find this commit in mainline.

> adding a device tree entry which marks a flash device as not needing
> erase. This patch adds support for setting MTD_NO_ERASE on powernvflash
> devices which have the property no-erase.
> 
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  drivers/mtd/devices/powernv_flash.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
> index f5396f26ddb4..fab9f9121b4c 100644
> --- a/drivers/mtd/devices/powernv_flash.c
> +++ b/drivers/mtd/devices/powernv_flash.c
> @@ -196,6 +196,8 @@ static int powernv_flash_set_driver_info(struct device *dev,
>  	mtd->name = of_get_property(dev->of_node, "name", NULL);
>  	mtd->type = MTD_NORFLASH;
>  	mtd->flags = MTD_WRITEABLE;
> +	if (of_property_read_bool(dev->of_node, "no-erase"))
> +		mtd->flags |= MTD_NO_ERASE;

I don't see this property document in a DT binding doc, which is
mandatory. Actually, there's no DT bindings doc at all for the
'ibm,opal-flash' device in mainline, is this normal?

>  	mtd->size = size;
>  	mtd->erasesize = erase_size;
>  	mtd->writebufsize = mtd->writesize = 1;
