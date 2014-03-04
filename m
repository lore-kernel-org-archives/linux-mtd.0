Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKq75-0005kx-Cw
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 14:14:32 +0000
Message-ID: <1393942396.6302.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: block: do not use term "attach"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 04 Mar 2014 16:13:16 +0200
In-Reply-To: <20140304135910.GB8826@localhost>
References: <1393927373-1472-1-git-send-email-dedekind1@gmail.com>
 <1393937858.6302.1.camel@sauron.fi.intel.com>
 <20140304135910.GB8826@localhost>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-03-04 at 10:59 -0300, Ezequiel Garcia wrote:
> On Tue, Mar 04, 2014 at 02:57:38PM +0200, Artem Bityutskiy wrote:
> > On Tue, 2014-03-04 at 12:02 +0200, Artem Bityutskiy wrote:
> > > + * This feature is compiled in the UBI core, and adds a 'block' parameter
> > > + * to allow early creation of block devices on top of UBI volumes. Runtime
> > > + * block creation/removal for UBI volumes is provided through two UBI ioctls:
> > > + * UBI_IOCVOLATTBLK and UBI_IOCVOLDETBLK.
> > >   */
> > 
> > I think the ioctl names should also be consistent.
> > s/AT/CR/, s/DET/RM/, may be?
> > 
> 
> Ah, yes. Good catch.
> 
> Let's write them down, so we can see how they result: UBI_IOCVOLCRBLK,
> UBI_IOCVOLRMBLK. Aren't these too unreadable?

Dunno, the other ones are similarly unreadable.

> How about something along UBI_IOCBLK_CREAT UBI_IOCBLK_RM ?

Well, would be a little inconsistent, but more readable, yes. Usually
ioctl names to not have underscores, though, no?

-- 
Best Regards,
Artem Bityutskiy
