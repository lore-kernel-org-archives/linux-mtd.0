Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtM4g-0004DT-Kq
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 20:51:31 +0000
Date: Mon, 2 Nov 2015 21:51:04 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jesper Nilsson <jespern@axis.com>, linux-cris-kernel@axis.com
Subject: Re: Problems with 'mtd: warn when registering the same master many
 times'
Message-ID: <20151102205103.GC22903@axis.com>
References: <5637843C.10307@roeck-us.net> <20151102174356.GA13101@localhost>
 <20151102200931.GA26577@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151102200931.GA26577@roeck-us.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 02, 2015 at 12:09:31PM -0800, Guenter Roeck wrote:
> On Mon, Nov 02, 2015 at 09:43:56AM -0800, Brian Norris wrote:
> > On Mon, Nov 02, 2015 at 07:41:48AM -0800, Guenter Roeck wrote:
> > > I also see the warning in crisv32 runtime tests. This is because the code in
> > > arch/cris/arch-v32/drivers/axisflashmap.c calls mtd_device_register() multiple times
> > > with the same mtd_info argument, each time to register a different partition.
> > > I am not sure if the check is appropriate for this case either, since the code calls
> > > mtd_device_register(), both 'type' and 'parser_data' are NULL, parse_mtd_partitions()
> > > does not do anything, and the problem you are concerned about does not apply.
> > 
> > Actually, that platform is probably one of the main reasons for the
> > warning patch. It is not kosher to call mtd_device_register() as many
> > times as it does. So, you get a warning until somebody can be bothered
> > to fix that ugly code.
> > 
> > > How about changing the warning to something like the following ?
> > > 
> > > WARN_ONCE(types && mtd->_reboot && mtd->reboot_notifier.notifier_call, "MTD already registered\n");
> > 
> > No, that doesn't make much sense. We might as well just be removing the
> > check entirely at that point, since this just looks like you're shooting
> > at a random/fragile hack.
> > 
> > > This would eliminate (what I think are) false positives and only warn if there
> > > is a real problem.
> > 
> > I think we have the option of either taking patch [1] or taking your
> > first suggestion. But the axisflashmap.c is not a false positive, and it
> > should be fixed. Or just live with the warning, if it's unmaintained.
> > 
> We'll see if Jesper has any comments. I didn't see an easy way to fix that
> driver myself, so I guess we may have to live with the warning for now.

Yeah, I'm sorry to say that we're aware of the problem but haven't
got to fixing it... At one time (3.20?), the code actually went into
an infinite loop on startup. :-(
I'll boost this to the head of the queue to be fixed, but I hope you can live
with the warning until we can find a mythical "Round Tuit".

> Thanks,
> Guenter

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
