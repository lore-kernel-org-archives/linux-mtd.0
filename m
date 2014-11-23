Received: from mail-qc0-f179.google.com ([209.85.216.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsefJ-0007IL-Jx
 for linux-mtd@lists.infradead.org; Sun, 23 Nov 2014 21:25:54 +0000
Received: by mail-qc0-f179.google.com with SMTP id c9so5951143qcz.24
 for <linux-mtd@lists.infradead.org>; Sun, 23 Nov 2014 13:25:32 -0800 (PST)
Message-ID: <54725068.2010909@vanguardiasur.com.ar>
Date: Sun, 23 Nov 2014 18:23:52 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: improve wait-till-ready timeout loop
References: <1415183523-16265-1-git-send-email-computersforpeace@gmail.com>
 <54724EBA.3040904@vanguardiasur.com.ar>
In-Reply-To: <54724EBA.3040904@vanguardiasur.com.ar>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/23/2014 06:16 PM, Ezequiel Garcia wrote:
> On 11/05/2014 07:32 AM, Brian Norris wrote:
>> There are a few small issues with the timeout loop in
>> spi_nor_wait_till_ready():
>>
>>  * The first operation should not be a reschedule; we should check the
>>    status register at least once to see if we're complete!
>>
>>  * We should check the status register one last time after declaring the
>>    deadline has passed, to prevent a premature timeout erro (this is
>>    theoretically possible if we sleep for a long time after the previous
>>    status register check).
>>
>>  * Add an error message, so it's obvious if we ever hit a timeout.
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 5e3a1d363895..d0dcaa1372ec 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -202,19 +202,24 @@ static int spi_nor_ready(struct spi_nor *nor)
>>  static int spi_nor_wait_till_ready(struct spi_nor *nor)
>>  {
>>  	unsigned long deadline;
>> -	int ret;
>> +	int timeout = 0, ret;
>>  
>>  	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
>>  
>> -	do {
>> -		cond_resched();
>> +	while (!timeout) {
>> +		if (time_after_eq(jiffies, deadline))
>> +			timeout = 1;
>>  
>>  		ret = spi_nor_ready(nor);
>>  		if (ret < 0)
>>  			return ret;
>>  		if (ret)
>>  			return 0;
>> -	} while (!time_after_eq(jiffies, deadline));
>> +
>> +		cond_resched();
>> +	}
>> +
>> +	dev_err(nor->dev, "flash operation timed out\n");
>>  
>>  	return -ETIMEDOUT;
>>  }
>>
> 
> Looks good to me.
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 

On a second look... I find more readable to use a bool type for
booleans, but it's just a silly nitpick.

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
