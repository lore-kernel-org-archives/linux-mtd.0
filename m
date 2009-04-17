Received: from bitbox.plus.com ([81.174.226.42] helo=pangolin.localnet)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LukDg-0004td-R2
	for linux-mtd@lists.infradead.org; Fri, 17 Apr 2009 09:18:56 +0000
Message-ID: <49E83C3D.8020404@bitbox.co.uk>
Date: Fri, 17 Apr 2009 09:22:21 +0100
From: Peter Horton <phorton@bitbox.co.uk>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH] mtd: fix timeout in M25P80 driver
References: <20090413142633.GA1560@sloth.localnet>
	<1239953060.3390.239.camel@localhost.localdomain>
In-Reply-To: <1239953060.3390.239.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, Peter Horton <zero@colonel-panic.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Mon, 2009-04-13 at 15:26 +0100, Peter Horton wrote:
>> Extend erase timeout in M25P80 SPI Flash driver.
>>
>> The M25P80 drivers fails erasing sectors on a M25P128 because the ready
>> wait timeout is too short. Change the timeout from a simple loop count to a
>> suitable number of seconds.
>>
>> Signed-off-by: Peter Horton <zero@colonel-panic.org>
>> ---
>> Index: linux-2.6.29-git12/drivers/mtd/devices/m25p80.c
>> ===================================================================
>> --- linux-2.6.29-git12.orig/drivers/mtd/devices/m25p80.c	2009-04-12 21:41:16.000000000 +0000
>> +++ linux-2.6.29-git12/drivers/mtd/devices/m25p80.c	2009-04-12 21:43:01.000000000 +0000
>> @@ -54,7 +54,7 @@
>>  #define	SR_SRWD			0x80	/* SR write protect */
>>  
>>  /* Define max times to check status register before we give up. */
>> -#define	MAX_READY_WAIT_COUNT	100000
>> +#define	MAX_READY_WAIT_JIFFIES	(10 * HZ)	/* eg. M25P128 specs 6s max sector erase */
>>  #define	CMD_SIZE		4
>>  
>>  #ifdef CONFIG_M25PXX_USE_FAST_READ
>> @@ -145,20 +145,20 @@
>>   */
>>  static int wait_till_ready(struct m25p *flash)
>>  {
>> -	int count;
>> +	unsigned long deadline;
>>  	int sr;
>>  
>> -	/* one chip guarantees max 5 msec wait here after page writes,
>> -	 * but potentially three seconds (!) after page erase.
>> -	 */
> Why did you remove the comment? Is it wrong or useless?
> 

I moved the comment up to the definition of MAX_READY_WAIT_JIFFIES. 
Looking through the code I missed the fact the driver can generate "chip 
erase", on the M25P128 the maximum ready timeout for this is 250s !!!

P.
