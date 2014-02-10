Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCmDO-0002tJ-R7
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 08:27:43 +0000
Date: Mon, 10 Feb 2014 05:27:15 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140210082714.GB10872@localhost>
References: <52F6B602.3030905@nod.at> <20140208230159.GC22376@1wt.eu>
 <52F6BA07.60707@nod.at> <20140208231501.GG22376@1wt.eu>
 <52F6BCCD.5070302@nod.at> <20140208233758.GH22376@1wt.eu>
 <52F6C916.2030506@nod.at> <20140209075157.GJ22376@1wt.eu>
 <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1392017750.31031.8.camel@sauron.fi.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 10, 2014 at 09:35:50AM +0200, Artem Bityutskiy wrote:
> On Sun, 2014-02-09 at 23:48 -0300, Ezequiel Garcia wrote:
> > On Sun, Feb 09, 2014 at 08:51:57AM +0100, Willy Tarreau wrote:
> > [..]
> > > 
> > > > > This I think it's a bad idea to artificially remove some features
> > > > > if they're not broken.
> > > > 
> > > > Your arguments have convinced me, let's keep it and hope the best.
> > > 
> > 
> > Let me add that keeping the write support follows the whole "mechanism,
> > not policy" kernel motto, doesn't it?
> > 
> > Regarding users, well the option looks like this:
> > 
> >   [ ]     Enable write support (DANGEROUS)
> > 
> > I think any user would think twice before enabling it.
> 
> Linus and Andrew usually ask reasonable questions like these for new
> features. I'd like to ask them for the write feature.
> 
> Who are the customers for these?
> How are the user of the write feature? How many?

I'm not aware of any. So far all the users that I'm aware of will be using
this to mount a squashfs.

> Have it been tested? If yes, how?
> 

To be honest, not much.

> These are really the things which define whether the feature should be
> in or not, I think.
> 
> If write support has 0 or 1.5 customers and it was not tested
> extensively, and never used in any kind of production, I am not sure it
> is needed to be there. But let's first hear your answers.
> 

No, this hasn't been tested intensively and I'm pretty sure nobody would
ever put it in production before conducting such tests himself.

> It is simple is not good argument. It will be as simple to add it too.
> 

OK.

> WRT to DANGEROUS sign, people do not read Kconfig help. Some distro will
> just enable this, people will start using this, and then start sending
> unappy e-mails. We have this with MTD block. No matter how many times I
> wrote to people that this is just a debugging module, they still kept
> using it.
> 

If you really think distros will enable it and users will "just it", without
thinking about the consequences, then I'd say let's just remove it.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
