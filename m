Received: from utopia.booyaka.com ([74.50.51.50])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U4hI6-0002js-5V
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2013 00:30:38 +0000
Date: Mon, 11 Feb 2013 00:30:36 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: onfi don't WARN if we are in 16 bits mode (fwd)
In-Reply-To: <CAN8TOE9K=__xFzvwsrPphqg7-5xzg_-_HjymrV5=8rcCZjH9GA@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1302110030020.6247@utopia.booyaka.com>
References: <alpine.DEB.2.00.1301260754500.19277@utopia.booyaka.com>
 <1359967187.13791.21.camel@sauron.fi.intel.com>
 <CAN8TOE9K=__xFzvwsrPphqg7-5xzg_-_HjymrV5=8rcCZjH9GA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Matthieu CASTET <matthieu.castet@parrot.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 10 Feb 2013, Brian Norris wrote:

> On Mon, Feb 4, 2013 at 12:39 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Sat, 2013-01-26 at 07:56 +0000, Paul Walmsley wrote:
> >> Hi Artem, David,
> >>
> >> if possible, it would be good to get this one into v3.8-rc, due to the
> >> large OMAP boot-time warning mentioned at:
> >>
> >> http://article.gmane.org/gmane.linux.ports.arm.omap/91317
> >
> > It is in David's tree, he merges things upstream, I do not know about
> > his plans WRT this patch, unfortunately.
> 
> It was merged for 3.8-rc7, FYI.

Thanks, things are much better now in v3.8-rc7.


- Paul
