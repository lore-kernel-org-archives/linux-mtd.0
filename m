Received: from lilly.ping.de ([83.97.42.2])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LN4I9-00035f-5A
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 11:52:16 +0000
Date: Wed, 14 Jan 2009 12:50:57 +0100
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: Access entire device with mtdblock0
Message-ID: <20090114115056.GD7994@leila.ping.de>
References: <4967F2B2.4060405@jkmicro.com>
	<8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>
	<878wpeclf1.fsf@macbook.be.48ers.dk>
	<8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com>
From: wolfgang@leila.ping.de (Wolfgang Wegner)
Cc: linux-mtd@lists.infradead.org, Adam Yergovich <ayergo@jkmicro.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2009 at 05:58:43AM -0500, Mike Frysinger wrote:
> On Wed, Jan 14, 2009 at 04:00, Peter Korsgaard wrote:
> > "Mike" == Mike Frysinger <writes:
> >>> Any recommendations on a simple way to create a partition using the
> >>> entirety of flash?
> >>
> >> looks like no one responded.  i'm pretty sure the answer is to use
> >> add_mtd_device() even in face of add_mtd_partitions().
> >
> > Why not just add a partition spanning the entire device in addition to
> > the other partitions?
> 
> i was not aware partition tables allowed for overlaps.  if that's
> true, then the answer is obvious and easy to implement in boards ...

They are allowed, but I have not been able yet to do a correct query
for erase_size in case of a partition covering a whole device having
multiple different-sized erase regions.

Regards,
Wolfgang
