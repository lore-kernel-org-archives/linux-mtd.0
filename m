Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wk8hO-00011T-49
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 09:08:34 +0000
Message-ID: <1399972089.1797.29.camel@sauron.fi.intel.com>
Subject: Re: [RFC PATCH] UBI: fix rb_tree node comparison in add_map
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 13 May 2014 12:08:09 +0300
In-Reply-To: <20140510011913.GH28907@ld-irv-0074>
References: <20140321195403.GA32529@redhat.com> <532CD1CB.4070707@nod.at>
 <20140510011913.GH28907@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-05-09 at 18:19 -0700, Brian Norris wrote:
> Hi Artem,
> 
> On Sat, Mar 22, 2014 at 12:56:59AM +0100, Richard Weinberger wrote:
> > Am 21.03.2014 20:54, schrieb Mike Snitzer:
> > > The comparisons used in add_vol() shouldn't be identical.  Pretty sure
> > > the following is correct but it is completely untested.
> > > 
> > > Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> > > ---
> > >  drivers/mtd/ubi/fastmap.c |    4 ++--
> > >  1 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > NOTE: I stumbled upon this code while implementing some rb_tree code
> > >       (and looking for some existing rb_tree code as a reference).
> > 
> > Thanks a lot for pointing this out!
> > 
> > Acked-by: Richard Weinberger <richard@nod.at>
> 
> Bump?
> 
> I'm passing through my queue, and I occasionally see some obvious,
> reviewed fixes like this one. Typically, you get around to them
> eventually, but you never know. Do you prefer the "bump"?

I'll pick this now, thanks for pointing. And yes, a "bump" is helpful.
E.g., I missed this ones.

-- 
Best Regards,
Artem Bityutskiy
