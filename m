Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1gdw-0006zy-PO
 for linux-mtd@lists.infradead.org; Tue, 01 Nov 2016 21:30:54 +0000
Received: by mail-wm0-x241.google.com with SMTP id p190so18195756wmp.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Nov 2016 14:30:31 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: spi-nor: add sleeping version of
 spi_nor_wait_till_ready for erase ops
To: Jagan Teki <jagan@openedev.com>
References: <3591c563-7a90-c060-f6f0-c61d35bbef0e@gmail.com>
 <CAD6G_RTzdGzcV55gYOOOLVVkF+hBatG=DXL3-9F4gDk1M0Q+5g@mail.gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <03d09a00-62a9-0fce-7146-6cb308cebbb2@gmail.com>
Date: Tue, 1 Nov 2016 22:30:22 +0100
MIME-Version: 1.0
In-Reply-To: <CAD6G_RTzdGzcV55gYOOOLVVkF+hBatG=DXL3-9F4gDk1M0Q+5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 01.11.2016 um 19:58 schrieb Jagan Teki:
> On Tue, Nov 1, 2016 at 10:35 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
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
>> v2:
>> - add defines for numeric constants
>> - Don't introduce a third spi_nor_wait_till_ready_.. function.
>> - add sanity check to ensure that sleep time <= timeout
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 27 ++++++++++++++++++++++-----
>>  1 file changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index d0fc165..7c793a6 100644
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
>> @@ -37,6 +38,10 @@
>>   */
>>  #define CHIP_ERASE_2MB_READY_WAIT_JIFFIES      (40UL * HZ)
>>
>> +#define READY_WAIT_NO_SLEEP                    0
>> +#define SECTOR_ERASE_READY_WAIT_SLEEP_MSECS    2
>> +#define CHIP_ERASE_READY_WAIT_SLEEP_MSECS      100
>> +
>>  #define SPI_NOR_MAX_ID_LEN     6
>>  #define SPI_NOR_MAX_ADDR_WIDTH 4
>>
>> @@ -252,11 +257,13 @@ static int spi_nor_ready(struct spi_nor *nor)
>>   * Returns non-zero if error.
>>   */
>>  static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>> -                                               unsigned long timeout_jiffies)
>> +                                               unsigned long timeout_jiffies,
>> +                                               unsigned int sleep_msecs)
>>  {
>>         unsigned long deadline;
>>         int timeout = 0, ret;
>>
>> +       sleep_msecs = min(sleep_msecs, jiffies_to_msecs(timeout_jiffies));
>>         deadline = jiffies + timeout_jiffies;
>>
>>         while (!timeout) {
>> @@ -269,7 +276,13 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>>                 if (ret)
>>                         return 0;
>>
>> -               cond_resched();
>> +               if (!sleep_msecs)
>> +                       cond_resched();
>> +               else if (sleep_msecs < 50)
>> +                       usleep_range(sleep_msecs * 1000 - 100,
>> +                                    sleep_msecs * 1000);
>> +               else
>> +                       msleep(sleep_msecs);
> 
> Sorry, I am unable to check the different possible sleep scenarios
> with these numerical checks like sleep_msecs < 50 can you explain?
> 
See also Documentation/timers/timers-howto.txt
msleep can be quite inaccurate when intending to sleep a few msecs only.
The threshold of 50msecs however is somewhat arbitrary, I have to admit.

In case of sleep_msecs == 0 the function behaves like before, no sleep
is inserted.

>>         }
>>
>>         dev_err(nor->dev, "flash operation timed out\n");
>> @@ -280,7 +293,8 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>>  static int spi_nor_wait_till_ready(struct spi_nor *nor)
>>  {
>>         return spi_nor_wait_till_ready_with_timeout(nor,
>> -                                                   DEFAULT_READY_WAIT_JIFFIES);
>> +                                                   DEFAULT_READY_WAIT_JIFFIES,
>> +                                                   READY_WAIT_NO_SLEEP);
> 
> So this should identical as with previous behaviour of no-sleep isn't
> it? where it eventually call the cond_resched().
> 
Right, semantics of spi_nor_wait_till_ready() hasn't changed.

>>  }
>>
>>  /*
>> @@ -387,7 +401,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>>                 timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
>>                               CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
>>                               (unsigned long)(mtd->size / SZ_2M));
>> -               ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
>> +               ret = spi_nor_wait_till_ready_with_timeout(nor, timeout,
>> +                                       CHIP_ERASE_READY_WAIT_SLEEP_MSECS);
>>                 if (ret)
>>                         goto erase_err;
>>
>> @@ -408,7 +423,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>>                         addr += mtd->erasesize;
>>                         len -= mtd->erasesize;
>>
>> -                       ret = spi_nor_wait_till_ready(nor);
>> +                       ret = spi_nor_wait_till_ready_with_timeout(nor,
>> +                                       DEFAULT_READY_WAIT_JIFFIES,
>> +                                       SECTOR_ERASE_READY_WAIT_SLEEP_MSECS);
> 
> I don't think sleeping version should require for sector-erase unlike
> the chip-erase sector-erase enough of using default ready_wait jiffies
> which eventually similar ready_wait for program operations as well.
> did you find any diff while testing this?
> 
I have to admit that I don't fully understand your question. I think it's
about why different sleep time for sectore erase vs. chip erase and why
no sleep time for program operations.

Sector erase:
Typically takes 100ms+, so sleeping 2ms between each poll should be a
fair value.

Chip erase:
Takes 10s+, therefore a sleep time of 100ms should be ok.

Page program:
Takes 200us on the SPI NOR chip I deal with and I think there's not
really a benefit in inserting a sleep.

There are other places in spi-nor.c where inserting a sleep could make
sense, e.g. writing the status register takes quite a lot of time on
some chips.
However I don't have the HW to test and I didn't want to overload this
patch. If there are more use cases for the sleeping version separate
patches should be submitted.

> thanks!
> 
Thanks for review, Heiner
