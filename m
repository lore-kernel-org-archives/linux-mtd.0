Subject: Re: [patch 02/13] mtd: SST25L (non JEDEC) SPI Flash driver
From: David Woodhouse <dwmw2@infradead.org>
To: Ryan Mallon <ryan@bluewatersys.com>
In-Reply-To: <4AB70570.5050703@bluewatersys.com>
References: <200909181951.n8IJpeq1023467@imap1.linux-foundation.org>
	<1253380972.6317.22.camel@macbook.infradead.org>
	<4AB70570.5050703@bluewatersys.com>
Content-Type: text/plain
Date: Sun, 20 Sep 2009 23:14:16 -0700
Message-Id: <1253513656.6317.235.camel@macbook.infradead.org>
Mime-Version: 1.0
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

On Mon, 2009-09-21 at 16:47 +1200, Ryan Mallon wrote:
> >  while (busy) {
> >     if (timed_out) return -ETIMEDOUT;
> >     cond_resched();
> >  }
> > 
> 
> Just thinking about this a bit more. We don't want to call cond_resched
> if the device is ready immediately, and we want to do the check _after_
> cond_resched each time through the loop.

Right, absolutely.

And that's exactly what the loop above was doing, isn't it? If you
unroll the loop, it goes...

 if (busy) {
  if (timed_out) return -ETIMEDOUT;
  cond_resched();
  if (busy) {
    if (timed_out) return -ETIMEDOUT;
    cond_resched();
    if (busy) {
      if (timed_out) return -ETIMEDOUT;
      cond_resched();
      if (busy) {
        ...

It _isn't_ calling cond_resched() if the device is ready immediately,
and it _is_ doing the check _after_ cond_resched() each time. Yes?
  
> There are probably enough places that this sort of thing gets used
> that it may be worth having a generic function like this (untested):
> 
> int cond_resched_wait_timeout(unsigned long timeout_jiffies,
>                               int (*cond_check)(void *cookie),
>                               void *data)

Yes, it's probably a good idea. Maybe better off as a macro, rather than
having a function call to evaluate the condition. Much like wait_event?

-- 
dwmw2
