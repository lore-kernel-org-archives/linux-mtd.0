Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hetuk-0005N0-R5
	for linux-mtd@lists.infradead.org; Fri, 20 Apr 2007 10:16:44 -0400
Message-ID: <4628CB3A.3000701@ru.mvista.com>
Date: Fri, 20 Apr 2007 18:16:26 +0400
From: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [PATCH] NAND Flash support for Intel IXP4xx platform
References: <46274486.9030609@ru.mvista.com> <462878F9.2090603@ru.mvista.com>
In-Reply-To: <462878F9.2090603@ru.mvista.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vitaly Wool wrote:
> Ruslan V. Sushko wrote:
>> +static struct ixp4xx_faddr_t {
>> +    int offset;
>> +    void (*chip_select)(unsigned int ctrl);
>> +} ixp4xx_faddr_info = {0, NULL};
>>   
> ixp4xx_faddr_t is a nice name for a structure ;)
> What the initialization to {0, NULL} is for? 
just through habit. What's wrong here?
> Also, if this is a per-chip thing as might be concluded by placing its 
> pointer into this->priv, why do you make it static structure?
> Same goes for
>
>> +static struct mtd_info *ixp4xx_mtd = NULL;
>> +static struct mtd_partition *ixp4xx_nand_parts = NULL;
>>   +
>> +    for ( i = 0 ; i < len ; i++ )
>> +        writeb(buf[i], this->IO_ADDR_W + addr_info->offset);
>>   
> Wrong whitespacing.
Will fixed
>> +}
>> +
>> +static void
>> +ixp4xx_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>> +{
>> +    struct nand_chip *this = mtd->priv;
>> +    struct ixp4xx_faddr_t *addr_info = this->priv;
>> +    if (ctrl & NAND_CTRL_CHANGE) {
>> +        addr_info->offset  = (ctrl & NAND_CLE) ? 1 : 0;
>> +        addr_info->offset |= (ctrl & NAND_ALE) ? 2 : 0;
>> +        if (addr_info->chip_select)
>> +            addr_info->chip_select(ctrl);
>> +    }
>> +
>> +    if (cmd != NAND_CMD_NONE)
>> +        writeb(cmd, this->IO_ADDR_W + addr_info->offset);
>> +}
>>   
> Wait please, can you explain the logic here?
> It looks like you'll be writing by ixp_write_buf to different base 
> addresses depending on how ctrl was set.
> Is this the expected behavior?
Yes it is. Two low bits of address bus is connected to ALE/CLE signals. 
Generally it not necessary for wrietbuff  routine, but it will not be 
error on this level, by the way I'll remove it. The hwcontrol must work 
in this way.
>
>> +    if ( nb_of_parts <= 0 )  { /* No partition from parsing, use 
>> default */
>>   
> Wrong whitespacing.
will fix
>> +        printk(KERN_INFO "Loading default partition table\n");
>> +        ixp4xx_nand_parts = plat->parts;
>> +        nb_of_parts = plat->nr_parts;
>> +    }
>> +
>> +    /* Register the partitions */
>> +    err = add_mtd_partitions(ixp4xx_mtd, ixp4xx_nand_parts, 
>> nb_of_parts);
>> +    if (err)  {
>> +        printk(KERN_ERR "Failed to add MTD partitions\n");
>> +        if ( ixp4xx_nand_parts != plat->parts )
>> +        kfree(ixp4xx_nand_parts);
>>   
> Wrong indentation.
> Moreover, if the number of partitions obtained by parse_mtd_partitions 
> is the same as the one provided by platform data, you'll get leakage 
> here.
how this can happens? Please describe.

>
> Vitaly
>

Best reagards,
Ruslan Sushko
