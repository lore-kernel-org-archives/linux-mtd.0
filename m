Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7dlf-0001aI-MI
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2013 03:53:36 +0000
Message-ID: <1376020723.2219.105.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6 00/10] mtd: add datasheet's ECC information to
 nand_chip{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 09 Aug 2013 06:58:43 +0300
In-Reply-To: <20130808230630.GA14434@norris.computersforpeace.net>
References: <1368760654-28754-1-git-send-email-b32955@freescale.com>
 <CAN8TOE-QvScbPUEPyrs-fYVQZmPu1h-wWX2hjz46KYtaWRckBw@mail.gmail.com>
 <520357DF.3030403@freescale.com>
 <20130808230630.GA14434@norris.computersforpeace.net>
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

On Thu, 2013-08-08 at 16:06 -0700, Brian Norris wrote:
> On Thu, Aug 08, 2013 at 04:33:35PM +0800, Huang Shijie wrote:
> > Hi Artem & Brian:
> > >Hi Huang and others,
> > >
> > >On Thu, May 16, 2013 at 8:17 PM, Huang Shijie<b32955@freescale.com>  wrote:
> > >>1.) Why add the ECC information to the nand_chip{} ?
> ...
> > >Reviewed-by: Brian Norris<computersforpeace@gmail.com>
> > >Tested-by: Brian Norris<computersforpeace@gmail.com>
> > >
> > >Thanks for the work Huang.
> > >
> > Could you please merge this patch set?
> 
> Thanks for the reminder. I haven't sorted through all the piles of
> backed up stuff yet!
> 
> I made a few minor changes (for checkpatch.pl, regarding
> __attribute__((packed)), and to make the style a little more
> easily-read) and tested the generic stuff on my platform. I've pushed
> the series to l2-mtd.git. Thanks for the patience!

I guess you can try aiaiai, I run it for all the patches I take to
l2-mtd.git. It uses also coccinelle/smatch/sparse and other tools to
verify the patches, not only checkpatch. And this git tree contains
scripts and various defconfigs for various MTD drivers - the scripts run
aiaiai.

For example, to check Huang's patches, I run something like:

aiaiai-concat-mboxes ~/tmp/huang*.mbox | ./verify ../l2-mtd/ gpmi-nand

where "huang*.mbox" is Huang's patch set.

There are aliases for verious drivers. There is a 'gen' alias which I
use for general changes like changes in nand_base.c.

Read about the tool here:
http://git.infradead.org/users/dedekind/aiaiai.git/blob/HEAD:/doc/README.announcement
http://git.infradead.org/users/dedekind/aiaiai.git/blob/HEAD:/doc/README

The mtd maintenance helpers:
http://git.infradead.org/users/dedekind/maintaining.git

There are few minor issues in aiaiai, which I can fix if you hit them
and complain. Also, I did not invest much time in making the user
interface and experience very nice. But this can also be improved.

-- 
Best Regards,
Artem Bityutskiy
