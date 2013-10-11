Received: from mail-ie0-x22c.google.com ([2607:f8b0:4001:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUjUH-0006t3-0x
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 20:39:05 +0000
Received: by mail-ie0-f172.google.com with SMTP id x13so9425059ief.31
 for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2013 13:38:40 -0700 (PDT)
Date: Fri, 11 Oct 2013 13:38:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH] [RESEND] mtd: docg4: fix status polling loop
Message-ID: <20131011203837.GN23337@ld-irv-0074.broadcom.com>
References: <1381425927-1881-1-git-send-email-mikedunn@newsguy.com>
 <20131011181615.GK23337@ld-irv-0074.broadcom.com>
 <525843F6.8050907@newsguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <525843F6.8050907@newsguy.com>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 11, 2013 at 11:31:18AM -0700, Mike Dunn wrote:
> On 10/11/2013 11:16 AM, Brian Norris wrote:
> > On Thu, Oct 10, 2013 at 10:25:27AM -0700, Mike Dunn wrote:
> >> The loop that polls the status register waiting for an operation to complete
> >> foolishly bases the timeout simply on the number of loop iterations that have
> >> ocurred.  When I increased the processor clock speed, timeouts started to appear
> >> for long block erasure operations.  This patch measures the timeout using
> >> jiffies.
> >>
> >> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
> >> ---
> >>
> >> This is a rework of an earlier patch, based on Artem's recommendation to use
> >> jiffies, not udelay() (thanks Artem).  I didn't mark it 'v2' because the rework
> >> makes the original name of the patch inaccurate, so now it has a different name.
> >>
> >> This was originally sent a couple months ago... was probably a bad time.
> > 
> > Wow, this identical patch was sent as far back as May 31 and is being
> > submitted for the 3rd time now :( I hope there will be fewer "bad times"
> > like this in the future.
> 
> 
> Thanks much Brian.  No big deal.  There's only one other user of this driver
> that I'm aware of :(
> 
> Thanks also for volunteering to shoulder some of the mtd maintenance duties.
> Good job!

Thanks! It's an interesting job.

Brian
