Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acqxu-0001hA-Rz
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 08:56:35 +0000
Subject: Re: [PATCH v5 03/26] memory: omap-gpmc: Introduce GPMC to NAND
 interface
To: Brian Norris <computersforpeace@gmail.com>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
 <1455916548-3441-4-git-send-email-rogerq@ti.com>
 <20160305013534.GJ55664@google.com>
CC: <tony@atomide.com>, <dwmw2@infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 <javier@dowhile0.org>, <fcooper@ti.com>, <nsekhar@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <56DD4208.8030604@ti.com>
Date: Mon, 7 Mar 2016 10:55:36 +0200
MIME-Version: 1.0
In-Reply-To: <20160305013534.GJ55664@google.com>
Content-Type: text/plain; charset="windows-1252"
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

On 05/03/16 03:35, Brian Norris wrote:
> Hi Roger,
> 
> On Fri, Feb 19, 2016 at 11:15:25PM +0200, Roger Quadros wrote:
>> The OMAP GPMC module has certain registers dedicated for NAND
>> access and some NAND bits mixed with other GPMC functionality.
>>
>> For the NAND dedicated registers we have the struct gpmc_nand_regs.
>>
>> The NAND driver needs to access NAND specific bits from the
>> following non-dedicated registers
>> 1) FIFOEVENT and TERMCOUNT from GPMC_IRQENABLE and GPMC_IRQSTATUS
>> 2) EMPTYWRITEBUFFERSTATUS from GPMC_STATUS
>>
>> For accessing these bits we introduce the struct gpmc_nand_ops.
>>
>> Rename the gpmc_update_nand_reg() API to gpmc_omap_get_nand_ops()
>> and make it return the gpmc_nand_ops along with updating the
>> gpmc_nand_regs. This API will be called by the OMAP NAND driver
>> to access the necessary bits in GPMC register space.
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> ---
>>  drivers/memory/omap-gpmc.c | 21 ++++++++++++++++++++
>>  include/linux/omap-gpmc.h  | 49 ++++++++++++++++++++++++++++++++++++++++++++--
>>  2 files changed, 68 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
>> index 6515dfc..c2f7320 100644
>> --- a/drivers/memory/omap-gpmc.c
>> +++ b/drivers/memory/omap-gpmc.c
>> @@ -1098,6 +1098,27 @@ void gpmc_update_nand_reg(struct gpmc_nand_regs *reg, int cs)
>>  	}
>>  }
>>  
>> +static struct gpmc_nand_ops nand_ops;
>> +
>> +/**
>> + * gpmc_omap_get_nand_ops - Get the GPMC NAND interface
>> + * @regs: the GPMC NAND register map exclusive for NAND use.
>> + * @cs: GPMC chip select number on which the NAND sits. The
>> + *      register map returned will be specific to this chip select.
>> + *
>> + * Returns NULL on error e.g. invalid cs.
>> + */
>> +struct gpmc_nand_ops *gpmc_omap_get_nand_ops(struct gpmc_nand_regs *reg, int cs)
>> +{
>> +	if (cs >= gpmc_cs_num)
>> +		return NULL;
>> +
>> +	gpmc_update_nand_reg(reg, cs);
>> +
>> +	return &nand_ops;
>> +}
>> +EXPORT_SYMBOL_GPL(gpmc_omap_get_nand_ops);
>> +
>>  int gpmc_get_client_irq(unsigned irq_config)
>>  {
>>  	int i;
>> diff --git a/include/linux/omap-gpmc.h b/include/linux/omap-gpmc.h
>> index 2dcef1c..7de9f9b 100644
>> --- a/include/linux/omap-gpmc.h
>> +++ b/include/linux/omap-gpmc.h
>> @@ -14,14 +14,59 @@
>>  #define GPMC_IRQ_FIFOEVENTENABLE	0x01
>>  #define GPMC_IRQ_COUNT_EVENT		0x02
>>  
>> +enum gpmc_nand_irq {
>> +	GPMC_NAND_IRQ_FIFOEVENT = 0,
>> +	GPMC_NAND_IRQ_TERMCOUNT,
>> +};
>> +
>> +/**
>> + * gpmc_nand_ops - Interface between NAND and GPMC
>> + * @nand_irq_enable: enable the requested GPMC NAND interrupt event.
>> + * @nand_irq_disable: disable the requested GPMC NAND interrupt event.
>> + * @nand_irq_clear: clears the GPMC NAND interrupt event status.
>> + * @nand_irq_status: get the NAND interrupt event status.
>> + * @nand_write_buffer_empty: get the NAND write buffer empty status.
>> + */
>> +struct gpmc_nand_ops {
>> +	int (*nand_irq_enable)(enum gpmc_nand_irq irq);
>> +	int (*nand_irq_disable)(enum gpmc_nand_irq irq);
>> +	void (*nand_irq_clear)(enum gpmc_nand_irq irq);
>> +	u32 (*nand_irq_status)(void);
> 
> ^^ These 4 aren't being used in this revision?

Right. I'll remove them.
> 
>> +	bool (*nand_writebuffer_empty)(void);
>> +};
>> +
>> +struct gpmc_nand_regs;
>> +
>> +#if IS_ENABLED(CONFIG_OMAP_GPMC)
>> +struct gpmc_nand_ops *gpmc_omap_get_nand_ops(struct gpmc_nand_regs *regs,
>> +					     int cs);
>> +#else
>> +static inline gpmc_nand_ops *gpmc_omap_get_nand_ops(struct gpmc_nand_regs *regs,
>> +						    int cs)
>> +{
>> +	return NULL;
>> +}
>> +#endif /* CONFIG_OMAP_GPMC */
>> +
>> +/*--------------------------------*/
>> +
>> +/* deprecated APIs */
>> +#if IS_ENABLED(CONFIG_OMAP_GPMC)
>> +void gpmc_update_nand_reg(struct gpmc_nand_regs *reg, int cs);
>> +#else
>> +static inline void gpmc_update_nand_reg(struct gpmc_nand_regs *reg, int cs)
>> +{
>> +	reg = NULL;
> 
> What are you trying to do here? 'reg' is local, so the assignment is
> pointless.

Indeed this is pointless. I'll remove this line.
I'll also add a patch in the end to get rid of this API as there are no more
users to it.
> 
>> +}
>> +#endif /* CONFIG_OMAP_GPMC */
> 

cheers,
-roger
