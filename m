Date: Sun, 11 Aug 2013 15:52:32 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/4] mtd: gpmi: support two nand chips at most
Message-ID: <20130811195230.GA28172@gmail.com>
References: <1371197185-27491-1-git-send-email-b32955@freescale.com>
 <20130811060921.GB16906@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130811060921.GB16906@norris.computersforpeace.net>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 10, 2013 at 11:09:21PM -0700, Brian Norris wrote:
> On Fri, Jun 14, 2013 at 04:06:21PM +0800, Huang Shijie wrote:
> > 
> >  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |   14 ++++++++++++++
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    7 +++----
> >  drivers/mtd/nand/gpmi-nand/gpmi-regs.h |    3 +++
> >  3 files changed, 20 insertions(+), 4 deletions(-)
> 
> What's the status on this patch set? It doesn't look like it got merged.
> Do you have any testing for this? It looks sane enough to me.

Please ignore this patch set. I find a better solution to fix this
issue. I will send a new version of this patch set when it is ready.


thanks
Huang Shijie
