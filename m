Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PSlpj-0002uu-1a
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 07:31:32 +0000
Message-ID: <4D086EC8.6030800@nokia.com>
Date: Wed, 15 Dec 2010 09:31:20 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 2/7] mtd: OneNAND: add enable / disable methods to
	onenand_chip
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>	<20101213122057.20685.68480.sendpatchset@ahunter-work.research.nokia.com>
	<AANLkTi=0W8NuF3SNhWwjwDZtuCzyOM8219_pXG=9pU6O@mail.gmail.com>
In-Reply-To: <AANLkTi=0W8NuF3SNhWwjwDZtuCzyOM8219_pXG=9pU6O@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14/12/10 02:17, Kyungmin Park wrote:
> Hi,
>
> Now I'm used the clock gating for OneNAND instead of regulator.
> so I think the mechanism is similar.

I am not sure what you are trying to say here.  We need the regulator
enable / disable to stop the regulator going to sleep (because it cannot
supply enough current when it is asleep) and also we need to call down to
the board level to set latency constraints.  These things seem pretty
specific to the OMAP driver hence the new enable() / disable() methods.

We do not need any clock gating.  The OneNAND clock is dealt with by
the OMAP GPMC OneNAND controller and GPMC has auto-idle / smart-idle
facilities that let OMAP gate clocks and power it off when it is not
being used.

>
> On Mon, Dec 13, 2010 at 9:20 PM, Adrian Hunter<adrian.hunter@nokia.com>  wrote:
>>  From 16b760999cb79f9cf71728c9253f1399717be63a Mon Sep 17 00:00:00 2001
>> From: Adrian Hunter<adrian.hunter@nokia.com>
>> Date: Fri, 19 Feb 2010 15:39:52 +0100
>> Subject: [PATCH 2/7] mtd: OneNAND: add enable / disable methods to onenand_chip
>>
>> Add enable / disable methods called from get_device() / release_device().
>> These can be used, for example, to allow the driver to prevent the voltage
>> regulator from being put to sleep while OneNAND is in use.
>>
>> Signed-off-by: Adrian Hunter<adrian.hunter@nokia.com>
>> ---
>>   drivers/mtd/onenand/onenand_base.c |    4 ++++
>>   include/linux/mtd/onenand.h        |    2 ++
>>   2 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
>> index c38bf9c..bde274f 100644
>> --- a/drivers/mtd/onenand/onenand_base.c
>> +++ b/drivers/mtd/onenand/onenand_base.c
>> @@ -948,6 +948,8 @@ static int onenand_get_device(struct mtd_info *mtd, int new_state)
>>                 if (this->state == FL_READY) {
>>                         this->state = new_state;
>>                         spin_unlock(&this->chip_lock);
>> +                       if (this->enable)
>> +                               this->enable(mtd);
>>                         break;
>>                 }
>>                 if (new_state == FL_PM_SUSPENDED) {
>
> I put the code the end of function like:
>
> static int onenand_get_device(struct mtd_info *mtd, int new_state)
> {
>          struct onenand_chip *this = mtd->priv;
>          DECLARE_WAITQUEUE(wait, current);
>
>          /*
>           * Grab the lock and see if the device is available
>           */
>          while (1) {
>                  spin_lock(&this->chip_lock);
>                  if (this->state == FL_READY) {
>                          this->state = new_state;
>                          spin_unlock(&this->chip_lock);
>                          break;
>                  }
>                  if (new_state == FL_PM_SUSPENDED) {
>                          spin_unlock(&this->chip_lock);
>                          return (this->state == FL_PM_SUSPENDED) ? 0 : -EAGAIN;
>                  }
>                  set_current_state(TASK_UNINTERRUPTIBLE);
>                  add_wait_queue(&this->wq,&wait);
>                  spin_unlock(&this->chip_lock);
>                  schedule();
>                  remove_wait_queue(&this->wq,&wait);
>          }
>
>          if (this->clk)
>                  clk_enable(this->clk);
>
>          return 0;
> }
>
>
>> @@ -974,6 +976,8 @@ static void onenand_release_device(struct mtd_info *mtd)
>>   {
>>         struct onenand_chip *this = mtd->priv;
>>
>> +       if (this->state != FL_PM_SUSPENDED&&  this->disable)
>> +               this->disable(mtd);
> Need to check the SUSPENDED at here? when enter the suspend get_device
> is called.
> release device is called when resume. so no need to check
> FL_PM_SUSPENDED in my case.

onenand-get_device should have had:

	if (new_state != FL_PM_SUSPENDED && this->enable)
		this->enable(mtd);

I will resend the patch.


>
>>         /* Release the chip */
>>         spin_lock(&this->chip_lock);
>>         this->state = FL_READY;
>
> and put the same as like:
>
> static void onenand_release_device(struct mtd_info *mtd)
> {
>          struct onenand_chip *this = mtd->priv;
>
>          /* Release the chip */
>          spin_lock(&this->chip_lock);
>          this->state = FL_READY;
>          wake_up(&this->wq);
>          spin_unlock(&this->chip_lock);
>
>          if (this->clk)
>                  clk_disable(this->clk);
> }
>
> Thank you,
> Kyungmin Park
>
>> diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
>> index 6da3fe3..ae418e4 100644
>> --- a/include/linux/mtd/onenand.h
>> +++ b/include/linux/mtd/onenand.h
>> @@ -118,6 +118,8 @@ struct onenand_chip {
>>         int (*chip_probe)(struct mtd_info *mtd);
>>         int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
>>         int (*scan_bbt)(struct mtd_info *mtd);
>> +       int (*enable)(struct mtd_info *mtd);
>> +       int (*disable)(struct mtd_info *mtd);
>>
>>         struct completion       complete;
>>         int                     irq;
>> --
>> 1.7.0.4
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
