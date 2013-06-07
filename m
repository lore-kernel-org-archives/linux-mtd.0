Message-ID: <51B1A2B7.6090602@prisktech.co.nz>
Date: Fri, 07 Jun 2013 21:07:03 +1200
From: Tony Prisk <linux@prisktech.co.nz>
MIME-Version: 1.0
To: "Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>
Subject: Re: NAND buffer allocation fails
References: <51B1A1DE.3020603@prisktech.co.nz>
In-Reply-To: <51B1A1DE.3020603@prisktech.co.nz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 07/06/13 21:03, Tony Prisk wrote:
> Could someone explain why the following situation might occur:
>
> In drivers/mtd/nand/nand_base.c, we have:
>
> int nand_scan_tail(struct mtd_info *mtd)
> {
>     int i;
>     struct nand_chip *chip = mtd->priv;
>
>     /* New bad blocks should be marked in OOB, flash-based BBT, or 
> both */
>     BUG_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
>             !(chip->bbt_options & NAND_BBT_USE_FLASH));
>
>     if (!(chip->options & NAND_OWN_BUFFERS))
>         chip->buffers = kmalloc(sizeof(*chip->buffers), GFP_KERNEL);
>     if (!chip->buffers)
>         return -ENOMEM;
> ...
>
> For some reason, the kmalloc always fails on my configuration/hardware 
> (arch-vt8500: WonderMedia/VIA APC8750).
>
> The strange thing is that if I add the NAND_OWN_BUFFERS option, and 
> allocate my own buffers in the driver probe everything is fine.
> Driver probe code below:
>
>     priv->nand.buffers = devm_kzalloc(priv->dev, 
> sizeof(*priv->nand.buffers), GFP_KERNEL);
>     if (!priv->nand.buffers) {
>         dev_err(priv->dev, "failed to allocate NAND buffers\n");
>         return -ENOMEM;
>     }
>
> The devm_kzalloc does occur earlier than the nand_scan_tail alloc 
> would have, but there doesn't appear to be a shortage of memory on the 
> platform so I don't think it's failing for a memory shortage.
>
> Is there any real difference between using kmalloc and devm_kzalloc to 
> allocate the buffer (other than the obvious 0'ing of the buffer)?
> Why would one call fail and the other succeed?
>
> Regards
> Tony Prisk

Resend to correct the linux-arm-kernel mailing list address.

Tony P
