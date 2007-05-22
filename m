Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HqQyM-0008P8-61
	for linux-mtd@lists.infradead.org; Tue, 22 May 2007 05:48:23 -0400
Message-ID: <4652BC51.9090009@ru.mvista.com>
Date: Tue, 22 May 2007 13:48:01 +0400
From: "Vladimir A. Barinov" <vbarinov@ru.mvista.com>
MIME-Version: 1.0
To: Semih Hazar <semih.hazar@indefia.com>
Subject: Re: Generic Platform NAND Driver
References: <464D98DF.5020004@indefia.com> <4652B321.90006@indefia.com>
In-Reply-To: <4652B321.90006@indefia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, vitalywool@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Semih Hazar wrote:
> Hi Vitaly,
>
> I couldn't get any replies from the list and I wonder if I'm missing a 
> point here.
>
> struct plat_nand_data seems useless to users of this generic nand 
> driver, and there is no way of passing user data in mtd structures.
>
> Does that make sense, or am I missing something ?
>
> Also the priv members in platform_nand_chip and platform_nand_ctrl are 
> not used in any way. Maybe a better solution would be to utilize these ?
>   
That structures are for arch related code for NAND flashes that 
registers are memory mapped but
has special h/w control.

You can look at the first (I guess) usage example here:
http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=4385/2

>   
>> Hi,
>>
>> In the new generic platforn NAND driver, line 54;
>>
>> 	data->chip.priv = &data;
>> 	data->mtd.priv = &data->chip;
>>
>> mtd->priv->priv points to struct plat_nand_data which is defined in the 
>> plat_nand.c and never used by it.
>> Can we change it so that this priv points to a host specific data, and 
>> the helper functions (board specific) can make use of it.
>> Below is a suggested patch:
>>
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index d2365c8..256957b 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -599,10 +599,12 @@ struct platform_nand_ctrl {
>>   * struct platform_nand_data - container structure for platform-specific data
>>   * @chip:		chip level chip structure
>>   * @ctrl:		controller level device structure
>> + * @host:		pointer to host specific data structure
>>   */
>>  struct platform_nand_data {
>>  	struct platform_nand_chip	chip;
>>  	struct platform_nand_ctrl	ctrl;
>> +	void				*host;
>>  };
>>  
>>  /* Some helpers to access the data structures */
>> diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
>> index cd725fc..1e47ad3 100644
>> --- a/drivers/mtd/nand/plat_nand.c
>> +++ b/drivers/mtd/nand/plat_nand.c
>> @@ -51,7 +51,7 @@ static int __init plat_nand_probe(struct platform_device *pdev)
>>  		return -EIO;
>>  	}
>>  
>> -	data->chip.priv = &data;
>> +	data->chip.priv = pdata->host;
>>  	data->mtd.priv = &data->chip;
>>
>>  	data->mtd.owner = THIS_MODULE;
>>   
>>     
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>   
