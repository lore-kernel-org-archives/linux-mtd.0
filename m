Received: from [64.170.22.138] (helo=ns1.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15EWp5-000582-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2001 14:54:39 +0100
Message-Id: <5.1.0.14.0.20010625085615.00a660c8@mail.spewey.com>
Date: Mon, 25 Jun 2001 09:11:07 -0500
To: Russ Dill <Russ.Dill@asu.edu>,Abraham vd Merwe <abraham@2d3d.co.za>
From: Vipin Malik <mtd-linux@embeddedlinuxworks.com>
Subject: Re: safe flash filesystem
Cc: MTD for Linux <linux-mtd@lists.infradead.org>,
 elw_dev_list@embeddedlinuxworks.com
In-Reply-To: <3B36EF71.6518B49A@asu.edu>
References: <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com>
 <20010621125458.A23785@crystal.2d3d.co.za>
 <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com>
 <20010621155737.A26310@crystal.2d3d.co.za>
 <5.1.0.14.0.20010621091714.00a64c70@mail.spewey.com>
 <20010621163537.A26714@crystal.2d3d.co.za>
 <3B32668F.8020000@asu.edu>
 <20010622102154.E1828@crystal.2d3d.co.za>
 <3B337EF5.3030009@asu.edu>
 <20010625094555.D32358@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

At 12:59 AM 6/25/2001 -0700, Russ Dill wrote:
>Abraham vd Merwe wrote:
> >
> > Hi Russ!
> >
> > > > Yes, this is something in the lines I was thinking of. But what 
> complicates
> > > > things is if you start taking things like avoiding damaged blocks into
> > > > account, wear levelling (this is fairly easy to solve) and keeping 
> the flash
> > > > unfragmented.
> > > >
> > > if you only eraseblocks when you need to, you always have at least N-1
> > > eraseblocks of pevious data, (where N is the number of eraseblocks
> > > used). A CRC can be done after the store to see if the node written is
> > > ok, if not, write it again (in the next node). since its a small amount
> > > of data (maybe 4-8k) and written linearly, wear leveling and
> > > fragmentation is not a problem. Lets say 4 parameter blocks of 16k a
> > > peice are used, that would be 1 erase cycle per 8 configs written, this
> > > would allow 800,000 configs to be written on standard flash. If a config
> > > was written at a rate of once an hour, it would last 93 years. If it
> > > were on 2 128k standard blocks, then you wolud have 3.2M configs
> > > written, which at the same rate, would last about 332 years. Remember,
> > > you are only performing an erase cycle after a block fills up, not for
> > > every write.
> >
> > True, but once the flash fills up you have to start moving things around to
> > erase entire blocks and then the whole 4k-8k thing doesn't hold anymore.
> >
> > But anyhow, like you said, it's not the most complicated thing in the 
> world.
>
>you are overcomplicating things, there is one config file, and the flash
>is filled linearly, so once a block is full of written configs (only one
>of which being the current, valid config), the next eraseblock is
>erased. There is no moving things around, once we fill a block, all the
>other blocks have much older versions of the config, and we could care
>less


Russ, you are assuming a very trivial implementation (i.e. to a trivial 
requirement), where
the solution is the duplicate the entire config file and rewrite it *every 
time*, even
if just one of the config variables changed. (is my interpretation correct?).

While this may be what is required of a _few_ designs out there, it is very
difficult to extend, specially if you now want to store a "few" data values
whose value updates more frequently than your config values. How are you going
to handle this?

IMHO, this approach is tyring to reinvent the wheel- thinking it will be easier
this time (compared to JFFS which does essentially the same thing) because some
"features" are not required.

This may be very well be true for a particular case this time, but it sure 
won't work in most cases,
and I would suspect for quite a lot of cases. How many embedded systems
out there don't generate "data" value updates, as compared to only 
requiring (mostly static ) config
files.

I would be interested in hearing what the typical requirement is of the 
folks reading this.

This is really not a JFFS/MTD discussion per se and we run the risk of 
polluting this list.
If you care, just reply to me and the elw_dev_list@embeddedLinuxWorks.com 
where this
discussion is already going on.
(or subscribe at: 
http://www.embeddedlinuxworks.com/cgi-bin/signup/signup-dev.cgi)

(Russ,) I've written a first cut, requirement spec for what I think would 
be required of most embedded
systems that store config data as well as regular data value updates (and 
logs). Have you
seen it?

Regards,

Vipin
