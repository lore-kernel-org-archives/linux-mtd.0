Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKqVE-0006Vi-Mk
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 14:39:29 +0000
Date: Tue, 4 Mar 2014 11:39:03 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: block: do not use term "attach"
Message-ID: <20140304143901.GC8826@localhost>
References: <1393927373-1472-1-git-send-email-dedekind1@gmail.com>
 <1393937858.6302.1.camel@sauron.fi.intel.com>
 <20140304135910.GB8826@localhost>
 <1393942396.6302.7.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1393942396.6302.7.camel@sauron.fi.intel.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 04, 2014 at 04:13:16PM +0200, Artem Bityutskiy wrote:
> On Tue, 2014-03-04 at 10:59 -0300, Ezequiel Garcia wrote:
> > On Tue, Mar 04, 2014 at 02:57:38PM +0200, Artem Bityutskiy wrote:
> > > On Tue, 2014-03-04 at 12:02 +0200, Artem Bityutskiy wrote:
> > > > + * This feature is compiled in the UBI core, and adds a 'block' parameter
> > > > + * to allow early creation of block devices on top of UBI volumes. Runtime
> > > > + * block creation/removal for UBI volumes is provided through two UBI ioctls:
> > > > + * UBI_IOCVOLATTBLK and UBI_IOCVOLDETBLK.
> > > >   */
> > > 
> > > I think the ioctl names should also be consistent.
> > > s/AT/CR/, s/DET/RM/, may be?
> > > 
> > 
> > Ah, yes. Good catch.
> > 
> > Let's write them down, so we can see how they result: UBI_IOCVOLCRBLK,
> > UBI_IOCVOLRMBLK. Aren't these too unreadable?
> 
> Dunno, the other ones are similarly unreadable.
> 

Yes, indeed.

> > How about something along UBI_IOCBLK_CREAT UBI_IOCBLK_RM ?
> 
> Well, would be a little inconsistent, but more readable, yes.

Indeed, it's less consistent.

> Usually
> ioctl names to not have underscores, though, no?
> 

A quick grep shows some ioctls follow that rule, some don't.
I'd say it's your call.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
