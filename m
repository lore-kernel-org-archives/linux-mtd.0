Received: from mail.bluewatersys.com ([202.124.120.130]
	helo=hayes.bluewaternz.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mpan4-0003NF-4x
	for linux-mtd@lists.infradead.org; Mon, 21 Sep 2009 04:46:22 +0000
Message-ID: <4AB70570.5050703@bluewatersys.com>
Date: Mon, 21 Sep 2009 16:47:44 +1200
From: Ryan Mallon <ryan@bluewatersys.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 02/13] mtd: SST25L (non JEDEC) SPI Flash driver
References: <200909181951.n8IJpeq1023467@imap1.linux-foundation.org>
	<1253380972.6317.22.camel@macbook.infradead.org>
In-Reply-To: <1253380972.6317.22.camel@macbook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linus.walleij@stericsson.com, andre@bluewatersys.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	avorontsov@ru.mvista.com, hartleys@visionengravers.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Fri, 2009-09-18 at 12:51 -0700, akpm@linux-foundation.org wrote:
>> +static int sst25l_wait_till_ready(struct sst25l_flash *flash)
>> +{
>> +       unsigned long deadline;
>> +       int status, err;
>> +
>> +       deadline = jiffies + MAX_READY_WAIT_JIFFIES;
>> +       do {
>> +               err = sst25l_status(flash, &status);
>> +               if (err)
>> +                       return err;
>> +               if (!(status & SST25L_STATUS_BUSY))
>> +                       return 0;
>> +
>> +               cond_resched();
>> +       } while (!time_after_eq(jiffies, deadline));
>> +
>> +       return -ETIMEDOUT;
>> +}
> 
> If your system is busy and you end up relinquishing the CPU for a long
> period of time during that cond_resched(), you could hit the timeout
> condition even though the hardware _is_ actually reporting 'ready'
> status by the time you get back on the CPU.
> 
> It's unlikely, admittedly, but it's good practice to make sure it can't
> happen like that. Something like
> 
>  while (busy) {
>     if (timed_out) return -ETIMEDOUT;
>     cond_resched();
>  }
> 

Just thinking about this a bit more. We don't want to call cond_resched
if the device is ready immediately, and we want to do the check _after_
cond_resched each time through the loop. There are probably enough
places that this sort of thing gets used that it may be worth having a
generic function like this (untested):

int cond_resched_wait_timeout(unsigned long timeout_jiffies,
			      int (*cond_check)(void *cookie),
			      void *data)
{
	unsigned long deadline;
	int ret;

	ret = cond_check(data);
	if (ret == 1)
		return 0;
	if (ret < 0)
		return ret;
	deadline = jiffies + timeout_jiffies;
	while (1) {
		cond_resched();
		ret = cond_check(data);
		if (ret == 1)
			return 0;
		if (ret < 0)
			return ret;

		if (time_after_eq(jiffies, deadline))
			return -ETIMEDOUT;
	}

	/* Not reached */
	return 0;
}

Not sure if the name is entirely appropriate, or where it should go as a
generic function. Thoughts?

~Ryan

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

       Ryan Mallon                              Unit 5, Amuri Park
       Phone: +64 3 3779127                     404 Barbadoes St
       Fax:   +64 3 3779135                     PO Box 13 889
       Email: ryan@bluewatersys.com             Christchurch, 8013
       Web:   http://www.bluewatersys.com       New Zealand
       Freecall Australia  1800 148 751         USA 1800 261 2934
