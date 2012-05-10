Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSXQh-00079H-LS
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 17:45:32 +0000
Date: Thu, 10 May 2012 19:45:27 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v3] ARM: OMAP3: gpmc: add BCH ecc api and modes
Message-ID: <20120510174527.GA11275@parrot.com>
References: <1335442669-13474-1-git-send-email-ivan.djelic@parrot.com>
 <20120509002927.GF5088@atomide.com>
 <20120509081047.GC17333@parrot.com>
 <20120509153141.GI5088@atomide.com>
 <1336655257.2625.8.camel@sauron.fi.intel.com>
 <20120510151725.GA11107@parrot.com>
 <1336665138.2243.1.camel@brekeke>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1336665138.2243.1.camel@brekeke>
Cc: "afzal@ti.com" <afzal@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 10, 2012 at 04:52:18PM +0100, Artem Bityutskiy wrote:
> On Thu, 2012-05-10 at 17:17 +0200, Ivan Djelic wrote:
> > But in order to do so, I need the changes that Afzal has submitted
> > (in particular [3]). Those changes (and as a consequence, my new patch)
> > won't hit 3.5.
> > 
> > So, when Afzal's patches are pushed, I'll submit a new, single MTD patch.
> 
> But this is not going to happen this merge window as I understood, may
> be not even the next one. We need to make UBIFS happy sooner than that,
> I think. So may be we go forward with your original patch?

I'm OK with this too, as the patches are ready and tested.
The MTD patch is [2], it depends on [1] which has been pushed, then dropped by Tony.
Do you need me to repost [2] ?

Tony, sorry to backpedal on this: would you re-push patch [1], if indeed Afzal's patches
are not going to be merged soon ? In the meantime, I can prepare a patch on top of Afzal's to
have a smooth transition w.r.t BCH support. What do you think ?

Best Regards,
--
Ivan

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-April/040965.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2012-April/041020.html
