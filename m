Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOi4P-0004Xd-IB
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 05:55:30 +0000
Message-ID: <52427A9F.9070107@ti.com>
Date: Wed, 25 Sep 2013 11:24:39 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
References: <1380024647-18955-1-git-send-email-sourav.poddar@ti.com>
 <52427938.4070602@freescale.com> <524279F2.5020801@ti.com>
In-Reply-To: <524279F2.5020801@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: artem.bityutskiy@linux.intel.com, balbi@ti.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 25 September 2013 11:21 AM, Sourav Poddar wrote:
> On Wednesday 25 September 2013 11:18 AM, Huang Shijie wrote:
>> 于 2013年09月24日 20:10, Sourav Poddar 写道:
>>> +    flash->quad_read = false;
>>> +    if (spi->mode&&  SPI_RX_QUAD) {
>>> +        quad_enable(flash);
>>> +        flash->mtd._read = m25p80_quad_read;
>>> +        flash->quad_read = true;
>>> +    } else
>>> +        flash->mtd._read = m25p80_read;
>> How do you know the NOR support the QUAD read? by the spi->mode?
>>
>> i think you'd better add a DT node such as "m25p, quad-read".
> no need to add a new property, support is already there.
>
> If you see spi.c, "spi-rx-bus-width" property is already added. We 
> will set this
> property in dts to 4 in case of quad read. Once this is set, spi->mode 
> will
> be set to SPI_RX_QUAD in spi.c. which can be used by mtd layer to 
> device whether
Sorry for the 
typo..                                                                                 
^^^^
         
                                                                                                        decide
> flash supports quad read or not.
>>
>> thanks
>> Huang Shijie
>>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
