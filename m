Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HhnBZ-0001Ku-Il
	for linux-mtd@lists.infradead.org; Sat, 28 Apr 2007 09:42:02 -0400
Message-ID: <46334F28.70506@ru.mvista.com>
Date: Sat, 28 Apr 2007 17:42:00 +0400
From: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: [PATH] NAND Flash support for Intel IXP4xx platform
References: <463332F9.9040105@ru.mvista.com>
	<1177763736.7646.149.camel@localhost.localdomain>
In-Reply-To: <1177763736.7646.149.camel@localhost.localdomain>
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

Thomas,
please see my comments below

Thomas Gleixner wrote:
> On Sat, 2007-04-28 at 15:41 +0400, Ruslan V. Sushko wrote:
>   
>> +static void ixp_write_buf(struct mtd_info *mtd, const u_char * buf, int 
>> len)
>> +{
>> +       int i;
>> +       struct nand_chip *this = mtd->priv;
>> +
>> +       for (i = 0; i < len; i++)
>> +               writeb(buf[i], this->IO_ADDR_W);
>> +}
>>     
>
> How excatly is this functionally different from the generic write_buf
> function in nand_base.c ?
>
> static void nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
> {
>         int i;
>         struct nand_chip *chip = mtd->priv;
>
>         for (i = 0; i < len; i++)
>                 writeb(buf[i], chip->IO_ADDR_W);
> }
>
>   
This function should be removed. It was different for originally. ALE 
and CLE signal assertion was herre, but I decide this functionality is 
not necessary for data writing, so I've remove that, but forget to check 
remainder with generic code.
>> +static void ixp4xx_hwcontrol(struct mtd_info *mtd, int cmd, unsigned 
>> int ctrl)
>> +{
>> +       struct nand_chip *this = mtd->priv;
>> +       struct ixp4xx_faddr_info_t *addr_info = this->priv;
>>     
>
> Newline between variables and code !
>   
will fixed.
>   
>> +       if (ctrl & NAND_CTRL_CHANGE) {
>> +               addr_info->offset = (ctrl & NAND_CLE) ? IXP4XX_NAND_CLE : 0;
>> +               addr_info->offset |= (ctrl & NAND_ALE) ? IXP4XX_NAND_ALE 
>> : 0;
>>     
>
> Your patch is word wrapped !
>   
will fixed
>   
>> +               if (addr_info->chip_select)
>> +                       addr_info->chip_select(ctrl);
>> +       }
>> +
>> +       if (cmd != NAND_CMD_NONE)
>> +               writeb(cmd, this->IO_ADDR_W + addr_info->offset);
>> +}
>>     
>
> Aside of that I agree with Lennert, that we really need to get around
> and make this real platform code.
>   
Sorry don't understand
Do you propose to move all these (especially hw_ctrl function) 
functionality to platform/arch code?


Best regards,
Ruslan
> 	tglx
>
>
>   
