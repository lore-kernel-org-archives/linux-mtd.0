Subject: Re: [patch 02/13] mtd: SST25L (non JEDEC) SPI Flash driver
From: David Woodhouse <dwmw2@infradead.org>
To: akpm@linux-foundation.org
In-Reply-To: <200909181951.n8IJpeq1023467@imap1.linux-foundation.org>
References: <200909181951.n8IJpeq1023467@imap1.linux-foundation.org>
Content-Type: text/plain
Date: Sat, 19 Sep 2009 10:22:52 -0700
Message-Id: <1253380972.6317.22.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linus.walleij@stericsson.com, ryan@bluewatersys.com, andre@bluewatersys.com,
	linux-mtd@lists.infradead.org, hartleys@visionengravers.com,
	avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-09-18 at 12:51 -0700, akpm@linux-foundation.org wrote:
> 
> +static int sst25l_wait_till_ready(struct sst25l_flash *flash)
> +{
> +       unsigned long deadline;
> +       int status, err;
> +
> +       deadline = jiffies + MAX_READY_WAIT_JIFFIES;
> +       do {
> +               err = sst25l_status(flash, &status);
> +               if (err)
> +                       return err;
> +               if (!(status & SST25L_STATUS_BUSY))
> +                       return 0;
> +
> +               cond_resched();
> +       } while (!time_after_eq(jiffies, deadline));
> +
> +       return -ETIMEDOUT;
> +}

If your system is busy and you end up relinquishing the CPU for a long
period of time during that cond_resched(), you could hit the timeout
condition even though the hardware _is_ actually reporting 'ready'
status by the time you get back on the CPU.

It's unlikely, admittedly, but it's good practice to make sure it can't
happen like that. Something like

 while (busy) {
    if (timed_out) return -ETIMEDOUT;
    cond_resched();
 }

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
