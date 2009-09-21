Received: from mail.bluewatersys.com ([202.124.120.130]
	helo=hayes.bluewaternz.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MpZUk-0008LZ-EQ
	for linux-mtd@lists.infradead.org; Mon, 21 Sep 2009 03:23:22 +0000
Message-ID: <4AB6F1FC.6070302@bluewatersys.com>
Date: Mon, 21 Sep 2009 15:24:44 +1200
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

Okay, makes sense. I'm a bit busy at the moment, but I'll try and post a
fix in the next couple of days. Is the patch still going to be merged as
is, or are you waiting on a fix for this?

The function above is based on the one of the same name from
drivers/mtd/devices/m25p80.c, so that should also be changed? There are
possibly other mtd drivers which also have this construct.

~Ryan

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

       Ryan Mallon                              Unit 5, Amuri Park
       Phone: +64 3 3779127                     404 Barbadoes St
       Fax:   +64 3 3779135                     PO Box 13 889
       Email: ryan@bluewatersys.com             Christchurch, 8013
       Web:   http://www.bluewatersys.com       New Zealand
       Freecall Australia  1800 148 751         USA 1800 261 2934
