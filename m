Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7gxU-0004TP-D7
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2013 07:18:01 +0000
Message-ID: <1376032991.2219.122.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6 00/10] mtd: add datasheet's ECC information to
 nand_chip{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 09 Aug 2013 10:23:11 +0300
In-Reply-To: <52048565.1030707@gmail.com>
References: <1368760654-28754-1-git-send-email-b32955@freescale.com>
 <CAN8TOE-QvScbPUEPyrs-fYVQZmPu1h-wWX2hjz46KYtaWRckBw@mail.gmail.com>
 <520357DF.3030403@freescale.com>
 <20130808230630.GA14434@norris.computersforpeace.net>
 <1376020723.2219.105.camel@sauron.fi.intel.com>
 <52048565.1030707@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 vikram186@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-08-08 at 23:00 -0700, Brian Norris wrote:
> On 08/08/2013 08:58 PM, Artem Bityutskiy wrote:
> > On Thu, 2013-08-08 at 16:06 -0700, Brian Norris wrote:
> >> On Thu, Aug 08, 2013 at 04:33:35PM +0800, Huang Shijie wrote:
> >>> Hi Artem & Brian:
> >>>> Hi Huang and others,
> >>>>
> >>>> On Thu, May 16, 2013 at 8:17 PM, Huang Shijie<b32955@freescale.com>  wrote:
> >>>>> 1.) Why add the ECC information to the nand_chip{} ?
> >> ...
> >>>> Reviewed-by: Brian Norris<computersforpeace@gmail.com>
> >>>> Tested-by: Brian Norris<computersforpeace@gmail.com>
> >>>>
> >>>> Thanks for the work Huang.
> >>>>
> >>> Could you please merge this patch set?
> >>
> >> Thanks for the reminder. I haven't sorted through all the piles of
> >> backed up stuff yet!
> >>
> >> I made a few minor changes (for checkpatch.pl, regarding
> >> __attribute__((packed)), and to make the style a little more
> >> easily-read) and tested the generic stuff on my platform. I've pushed
> >> the series to l2-mtd.git. Thanks for the patience!
> >
> > I guess you can try aiaiai, I run it for all the patches I take to
> > l2-mtd.git. It uses also coccinelle/smatch/sparse and other tools to
> > verify the patches, not only checkpatch. And this git tree contains
> > scripts and various defconfigs for various MTD drivers - the scripts run
> > aiaiai.
> 
> Thanks, I actually already used it on his series :)
> 
> > For example, to check Huang's patches, I run something like:
> >
> > aiaiai-concat-mboxes ~/tmp/huang*.mbox | ./verify ../l2-mtd/ gpmi-nand
> >
> > where "huang*.mbox" is Huang's patch set.
> 
> What's the use of 'aiai-concat-mboxes' over a simple 'cat'?

Good question, I do not remember. There was some problem with plain cat.
May be related to the fact that with plain cat you end up with an extra
newline, but right now I do not see how this can be a problem.

Weird, why I wrote this script?

We used Aiaiai for automatic testing of all patches in a mailing list,
and at that times I decided that I need that script, but don't remember
now.

Sorry :-)

>  Just 
> inserting the extra blank line, I guess? But if I have a concatenated 
> mailbox, this is better:
> 
> ./verify ../l2-mtd/ gpmi-name < ~/tmp/huang.mbox
> 
> > There are few minor issues in aiaiai, which I can fix if you hit them
> > and complain. Also, I did not invest much time in making the user
> > interface and experience very nice. But this can also be improved.
> 
> One issue (possibly related to the above question?) was that aiaia 
> complained (via checkpatch.pl) about no sign-offs when I processed using 
> the input redirection method on a multi-message mbox. 

Yes, aiaiai runs checkpatch.pl for individual patches, and then to a
concatenated patch, and the latter does not have a signed-off-by. Fixing
is about adding --no-signoff to the right place.

Other issue is that in ARM targets there are some AS strings which are
not properly filtered out. I the simplest fix is about filtering those
out completely in aiaiai-diff-log. More complex fix would need to match
those lines. The problem is that the warnings are in tmp files, and the
file-names are different, thus they are shown in the diff.

> I can take a 
> closer look next time, but it's not a big deal, since I can verify this 
> pretty easily.
> 
> Thanks again for the help and for the nice tools.

NP, thank you for helping too.

I am a bit worried that at some point we may screw each other's work by
pushing things out at the same time. We should be very careful with
--force.

-- 
Best Regards,
Artem Bityutskiy
