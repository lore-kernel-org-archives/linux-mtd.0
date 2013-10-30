Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbSsb-0004Zv-V6
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 10:20:02 +0000
Message-ID: <5270DD2E.1010805@ti.com>
Date: Wed, 30 Oct 2013 15:49:26 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [Rebase/PATCHv2] drivers: mtd: m25p80: Add quad read support.
References: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
 <5270DD0C.2090902@freescale.com>
In-Reply-To: <5270DD0C.2090902@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: marex@denx.de, dedekind1@gmail.com, balbi@ti.com,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 October 2013 03:48 PM, Huang Shijie wrote:
> 于 2013年10月30日 17:20, Sourav Poddar 写道:
>> @@ -1051,6 +1184,15 @@ static int m25p_probe(struct spi_device *spi)
>>       flash->page_size = info->page_size;
>>       flash->mtd.writebufsize = flash->page_size;
>>
>> +    if (spi->mode&  SPI_RX_QUAD&&  info->flags&  M25P80_QUAD_READ) {
>> +        ret = set_quad_mode(flash, info->jedec_id);
>> +        if (ret) {
>> +            dev_err(&flash->spi->dev, "quad mode not supported\n");
>> +            return ret;
>> +        }
>> +        flash->quad_read = true;
>> +    }
> Do we really need the M25P80_QUAD_READ?
>
This is what we allign initially that its correct to  get this 
information through flash itself rather than dt.
> Some NOR flash can supports both the QUAD read and DDR QUAD read, 
> while some NOR flash only supports the
> QUAD read.
>
> when we try to add the DDR QUAD READ support, should we add another 
> flag, such as M25P80_DDR_QUAD_READ?
>
I suppose we need to.
> Add Mark for this email.
>
> I think you'd better CC this patch to the SPI maillist & Mark,.
>
>
> thanks
> Huang Shijie
>
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
