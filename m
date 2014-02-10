Date: Mon, 10 Feb 2014 09:46:16 +0100
From: Willy Tarreau <w@1wt.eu>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140210084616.GP22376@1wt.eu>
References: <20140208230159.GC22376@1wt.eu> <52F6BA07.60707@nod.at>
 <20140208231501.GG22376@1wt.eu> <52F6BCCD.5070302@nod.at>
 <20140208233758.GH22376@1wt.eu> <52F6C916.2030506@nod.at>
 <20140209075157.GJ22376@1wt.eu> <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140210082714.GB10872@localhost>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 10, 2014 at 05:27:15AM -0300, Ezequiel Garcia wrote:
> On Mon, Feb 10, 2014 at 09:35:50AM +0200, Artem Bityutskiy wrote:
> > On Sun, 2014-02-09 at 23:48 -0300, Ezequiel Garcia wrote:
> > > On Sun, Feb 09, 2014 at 08:51:57AM +0100, Willy Tarreau wrote:
> > > [..]
> > > > 
> > > > > > This I think it's a bad idea to artificially remove some features
> > > > > > if they're not broken.
> > > > > 
> > > > > Your arguments have convinced me, let's keep it and hope the best.
> > > > 
> > > 
> > > Let me add that keeping the write support follows the whole "mechanism,
> > > not policy" kernel motto, doesn't it?
> > > 
> > > Regarding users, well the option looks like this:
> > > 
> > >   [ ]     Enable write support (DANGEROUS)
> > > 
> > > I think any user would think twice before enabling it.
> > 
> > Linus and Andrew usually ask reasonable questions like these for new
> > features. I'd like to ask them for the write feature.
> > 
> > Who are the customers for these?
> > How are the user of the write feature? How many?
> 
> I'm not aware of any. So far all the users that I'm aware of will be using
> this to mount a squashfs.

I'm one of the users who were waiting for this for a long time. In
fact I wanted to try to write such a driver myself when I discovered
Ezequiel had already done it.

I've been experiencing trouble from time to time with initrd that
could not be mounted because the underlying NAND had bad blocks. So
I really wanted to have something to provide block device access on
top of UBI to abstract this part.

The write aspect of it provides several benefits :

  - upgrades are easy and will take care of bad blocks. In fact they
    will be as convenient as with eMMC.

  - it's possible to use small FS like ext2 to save some config and
    a few extra tools that are written a few times a year. There is
    no reason to fear wear levelling when writing a few times a year,
    and such FS are convenient for this since they're small, proven,
    and support recovery tools like fsck for the emergency situations
    which arise from time to time due to power loss.

> > Have it been tested? If yes, how?
> > 
> 
> To be honest, not much.

I have tested it a little bit. Performed squashfs upgrades, written
to ext2, and so far I didn't encounter any issue.

> > These are really the things which define whether the feature should be
> > in or not, I think.
> > 
> > If write support has 0 or 1.5 customers and it was not tested
> > extensively, and never used in any kind of production, I am not sure it
> > is needed to be there. But let's first hear your answers.
> > 
> 
> No, this hasn't been tested intensively and I'm pretty sure nobody would
> ever put it in production before conducting such tests himself.

For sure, but conversely, disabling it in the code would result in
nobody ever testing it !

> > It is simple is not good argument. It will be as simple to add it too.
> > 
> 
> OK.
> 
> > WRT to DANGEROUS sign, people do not read Kconfig help. Some distro will
> > just enable this, people will start using this, and then start sending
> > unappy e-mails. We have this with MTD block. No matter how many times I
> > wrote to people that this is just a debugging module, they still kept
> > using it.
> > 
> 
> If you really think distros will enable it and users will "just it", without
> thinking about the consequences, then I'd say let's just remove it.

In my opinion, this would result in users falling back to mtdblock as
they currently to when they want a block device. This is even worse.

I'd really like to have this feature as a standard one, it shortens
the gap which exists between MTD and eMMC which is becoming more and
more common these days, precisely because of the difficulty to deal
with NAND directly while eMMC provides the abstraction which offers
more flexibility.

Regards,
Willy
