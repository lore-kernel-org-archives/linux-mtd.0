Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TF3Rp-0008Ln-4d
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2012 13:39:14 +0000
From: Marek Vasut <marex@denx.de>
To: artem.bityutskiy@linux.intel.com
Subject: Re: [PATCH] mtd: m25p80: Disable 4K erase for s25sl032p, s25sl064p
Date: Fri, 21 Sep 2012 15:39:08 +0200
References: <1346729496-3303-1-git-send-email-marex@denx.de>
 <1348233151.7550.0.camel@sauron.fi.intel.com>
In-Reply-To: <1348233151.7550.0.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201209211539.08938.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem Bityutskiy,

> On Tue, 2012-09-04 at 05:31 +0200, Marek Vasut wrote:
> > Quoting from the datasheet for S25FL064P, rev. 05, Nov 18 2011,
> > section 9.17:
> > 
> > A 64 kB sector erase (D8h) command issued on 4 kB or 8 kB erase
> > sectors will erase all sectors in the specified 64 kB region.
> > However, please note that a 4 kB sector erase (20h) or 8 kB
> > sector erase (40h) command will not work on a 64 kB sector.
> > 
> > Refering further to Table 8.1 and Table 8.2, it is clearly seen
> > that most of the sectors are 64kB, therefore disable this 4K
> > erase support since it's valid only on first/last sectors.
> 
> Pushed to l2-mtd.git, thanks!

Thank you!

Best regards,
Marek Vasut
