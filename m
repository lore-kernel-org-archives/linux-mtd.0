Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1I3e-0005IM-0G
 for linux-mtd@lists.infradead.org; Mon, 31 Oct 2016 19:15:47 +0000
Received: by mail-wm0-x244.google.com with SMTP id p190so13500106wmp.1
 for <linux-mtd@lists.infradead.org>; Mon, 31 Oct 2016 12:15:25 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: add sleeping version of
 spi_nor_wait_till_ready for erase ops
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>
References: <eaa526ca-f0b4-4fde-d334-2ca6af72c32d@gmail.com>
 <716d2877-dc4f-f93d-5d93-cde671b89082@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <f49c0b7a-1c08-9f61-e1b1-4ce5d4e3687a@gmail.com>
Date: Mon, 31 Oct 2016 20:15:18 +0100
MIME-Version: 1.0
In-Reply-To: <716d2877-dc4f-f93d-5d93-cde671b89082@atmel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 31.10.2016 um 14:50 schrieb Cyrille Pitchen:
> Hi Heiner,
> 
Thanks for the very prompt review comments!

> +Marek
> 
> Le 30/10/2016 à 10:32, Heiner Kallweit a écrit :
>> Currently spi_nor_wait_till_ready in the poll loop permanently checks
>> for the WIP flag to be reset. Erase ops typically take >100ms for
>> sector erase and >10s for chip erase. Permanently polling for such
>> longer time periods puts unnecessary load on the SPI subsystem
>> (especially on systems w/o SPI DMA support or systems using bitbanging).
>>
>> Relax this by sleeping for a reasonable time between checking the
>> WIP flag.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 27 +++++++++++++++++++++------
>>  1 file changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index d0fc165..808ea4c 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/mutex.h>
>>  #include <linux/math64.h>
>>  #include <linux/sizes.h>
>> +#include <linux/delay.h>
>>  
>>  #include <linux/mtd/mtd.h>
>>  #include <linux/of_platform.h>
>> @@ -252,7 +253,8 @@ static int spi_nor_ready(struct spi_nor *nor)
>>   * Returns non-zero if error.
>>   */
>>  static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>> -						unsigned long timeout_jiffies)
>> +						unsigned long timeout_jiffies,
>> +						unsigned int sleep_msecs)
>>  {
>>  	unsigned long deadline;
>>  	int timeout = 0, ret;
>> @@ -269,7 +271,13 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>>  		if (ret)
>>  			return 0;
>>  
>> -		cond_resched();
>> +		if (!sleep_msecs)
>> +			cond_resched();
>> +		else if (sleep_msecs < 50)
>> +			usleep_range(sleep_msecs * 1000 - 100,
>> +				     sleep_msecs * 1000);
>> +		else
>> +			msleep(sleep_msecs);
>>  	}
>>  
>>  	dev_err(nor->dev, "flash operation timed out\n");
>> @@ -277,10 +285,17 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>>  	return -ETIMEDOUT;
>>  }
>>  
>> -static int spi_nor_wait_till_ready(struct spi_nor *nor)
>> +static inline int spi_nor_wait_till_ready_sleep(struct spi_nor *nor,
>> +						unsigned int sleep_msecs)
>>  {
>>  	return spi_nor_wait_till_ready_with_timeout(nor,
>> -						    DEFAULT_READY_WAIT_JIFFIES);
>> +						    DEFAULT_READY_WAIT_JIFFIES,
>> +						    sleep_msecs);
>> +}
>> +
>> +static inline int spi_nor_wait_till_ready(struct spi_nor *nor)
>> +{
>> +	return spi_nor_wait_till_ready_sleep(nor, 0);
>>  }
>>  
> 
> Not a big deal but, IMHO, you should remove spi_nor_wait_till_ready_sleep()
> from your patch to avoid introducing a 3rd spi_nor_wait_till_ready* function,
> so we don't have to wonder which version to call when we have to wait for the
> memory to be ready again.
> 
> Besides, spi_nor_wait_ready_sleep() is called only once so it is not so
> useful.
> 
> Finally, the duration expressed by the sleep_msecs parameter should not be
> higher than the duration of timeout_jiffies in
> spi_nor_wait_till_ready_with_timeout(). The spi_nor_wait_till_ready_sleep()
> hides the timeout_jiffies value so it's less obvious to choose a right value
> for sleep_msecs when you have to look at the implementation of the
> spi_nor_wait_till_ready_sleep() function to find out the actual value of
> timeout_jiffies.
> 
> What I mean is that those two parameters, timeout_jiffies and sleep_msec, are
> tightly bound. So when calling one of the spi_nor_wait_till_ready* functions(),
> those two parameters should be either both fixed (macro) or both variable.
> 
> Marek, what do you think about this point?
> 
>>  /*
>> @@ -387,7 +402,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>>  		timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
>>  			      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
>>  			      (unsigned long)(mtd->size / SZ_2M));
>> -		ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
>> +		ret = spi_nor_wait_till_ready_with_timeout(nor, timeout, 100);
> 
> Please, use macros instead of hardcoded values. For instance, here it could be
> CHIP_ERASE_READY_WAIT_SLEEP_MSEC or something else which clearly states
> that the value is for chip erase operations and is associated with the
> CHIP_ERASE_2MB_READY_WAIT_JIFFIES macro.
> 
>>  		if (ret)
>>  			goto erase_err;
>>  
>> @@ -408,7 +423,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>>  			addr += mtd->erasesize;
>>  			len -= mtd->erasesize;
>>  
>> -			ret = spi_nor_wait_till_ready(nor);
>> +			ret = spi_nor_wait_till_ready_sleep(nor, 2);
> See comments above.
> 
> Do you have some figures to show the impact of this patch on the performances?

Let's see whether Marek also has some comments, then I'll prepare a v2
of the patch. Regarding performance figures:

This patch saves me ~ 3 Mio SPI interrupts (5 Mio irq -> 2 Mio irq)
at first boot of OpenWRT/LEDE after flashing firmware (mainly when
preparing the jffs2 file system). Boot time is the same.

In detail per poll cycle (for my system setup):
With 33MHz SPI clock and 2 bytes for reading the status register
the SPI transfer per poll cycle takes ~ 0.5us. Plus overhead for
SPI message handling etc. let's assume one poll cycle takes ~ 1us.
With one interrupt per SPI transfer we then have 100.000 interrupts
just for waiting for one sector erase to finish.

In the patch the sleeping version is used just for sector erase
and chip erase. However there are more places where using it might
make sense, e.g. write_sr() takes longer time on several chips.

Rgds, Heiner

>>  			if (ret)
>>  				goto erase_err;
>>  		}
>>
> 
> Best regards,
> 
> Cyrille
> 
