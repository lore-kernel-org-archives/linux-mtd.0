Received: from node3.inaccessnetworks.com ([212.205.200.118]
	helo=inaccessnetworks.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FwJUO-0003N4-I5
	for linux-mtd@lists.infradead.org; Fri, 30 Jun 2006 09:57:13 -0400
Date: Fri, 30 Jun 2006 16:56:47 +0300
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: MTD device with multiple regions & JFFS2
Message-ID: <20060630135646.GA12360@inaccessnetworks.com>
References: <44A519A8.4030800@inaccessnetworks.com>
	<625fc13d0606300613q770a7f8cq57d90eea42255df@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <625fc13d0606300613q770a7f8cq57d90eea42255df@mail.gmail.com>
From: Angelos Manousarides <amanous@inaccessnetworks.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 30, 2006 at 08:13:21AM -0500, Josh Boyer wrote:
> On 6/30/06, Angelos Manousarides <amanous@inaccessnetworks.com> wrote:
> >
> > The code in mtdconcat does transfer the region info to the resulting
> > device, I see a mtd device with 2 (or 4 regions). The partitioning code
> > however does not. "numeraseregions" is 0 and "erasesize" is only used.
> >
> > While I was trying to fix the code in mtdpart.c, I discovered that this
> > is futile. The JFFS2 code does not seem to support this as well. Only
> > the "erasesize" is used there also. Does that mean that I cannot have a
> > JFFS2 filesystem that spans across multiple block size flash space?
> 
> Were you trying to fix it for "correctness", or is there a real
> problem here?  JFFS2 is known to work on Intel P30 chips without
> requiring it to understand the multiple erasesizes.  The chip command
> set driver should handle this.

The code in mtdpart.c does not propagate erase region information to the
slave device. I have ckeched with the git repository online and it is
still the same. Here is the code I am talking about, it is the only reference
in regions in mtdpard.c:

    if (master->numeraseregions>1) {
      /* Deal with variable erase size stuff */
      int i;
      struct mtd_erase_region_info *regions = master->eraseregions;

      /* Find the first erase regions which is part of this partition. */
      for (i=0; i < master->numeraseregions && slave->offset >= regions[i].offset; i++)
        ;

      for (i--; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
        if (slave->mtd.erasesize < regions[i].erasesize) {
          slave->mtd.erasesize = regions[i].erasesize;
        }
      }
    } else {
      /* Single erase size */
      slave->mtd.erasesize = master->erasesize;
    }

I have changed this to allocate slave->mtd.eraseregions and set
slave->mtd.numeraseregions properly.

If this is not needed, then definately I am missing something here.

> Btw, you forgot to mention what kernel you're running.  I'm assuming a
> fairly recent one since you didn't say you had to backport P30 support
> or anything like that.

I had to backport the P30 code, but the mtdpart and mtdconcat files do
not have any changes since them.

Now that I think of it, my first comment about the JFFS2 might be wrong.
The jffs2 layer calls mtd->erase(). Because normally all "small" sectors
are enclosed in "large" sector binaries, the erase() function will
probably handle the erase properly. The JFFS layer might be thinking it
is erasing a single block, but the mtd->erase will actually erase a few
small blocks. This is probably the reason that the erasesize in a
multi-region flash is set to the maximum block size. But this is just a
guess.

--
Angelos Manousaridis
