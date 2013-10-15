Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWA2k-00021A-Ew
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 19:12:35 +0000
Received: by mail-ie0-f176.google.com with SMTP id u16so8566664iet.35
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2013 12:12:12 -0700 (PDT)
Date: Tue, 15 Oct 2013 12:12:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: MTD utils v1.5.0: MEMERASE64 ioctl failed error
Message-ID: <20131015191205.GT23337@ld-irv-0074.broadcom.com>
References: <566CE8F1DB913147957287757DA6396B3E9D5FD4@DBDE04.ent.ti.com>
 <20131011222459.GQ23337@ld-irv-0074.broadcom.com>
 <566CE8F1DB913147957287757DA6396B3E9D6A93@DBDE04.ent.ti.com>
 <201310151226.51513.vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201310151226.51513.vapier@gentoo.org>
Cc: "Mukherjee, Somnath" <somnath@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "Shah, Minal" <minal.shah@ti.com>, "Parikh,
 Urmil" <urmil@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 15, 2013 at 12:26:48PM -0400, Mike Frysinger wrote:
> On Tuesday 15 October 2013 04:32:23 Shah, Minal wrote:
> > Hi Brian,
> > Thanks a lot for the explanation; I understood the reason for failure.
> > 
> > > So why do you want to erase bad blocks?
> > 
> > The reason why I want to erase bad blocks is because they actually don't
> > seem to be bad. Block0 itself is shown as bad.
> > I have few partitions (like MLO and u-boot env) of size equal to 1 erase
> > block. The block is marked as bad and hence I cannot write anything to
> > this partition. One of the solutions is to increase that partition size to
> > 2 blocks so even if 1 block is bad then it will atleast be able to write
> > to the other block of the same partition. But I don't think I should do
> > this while the block is not really bad (what if all the blocks for some
> > reason are marked as bad while they are actually not).
> > 
> > This question came in my mind from the fact that "nand scrub" command is
> > allowed from u-boot which allows to also completely erase all the bad
> > blocks; so why not from the kernel level.
> 
> as mentioned, there was discussion some time ago about adding this 
> functionality.  but the work never finished.  if you're interested, i'd suggest 
> picking up the work there.

Really old work:

  http://lists.infradead.org/pipermail/linux-mtd/2010-October/032577.html

More recent discussion:

  http://thread.gmane.org/gmane.linux.drivers.mtd/41624/

There were several proposals thrown around, and we ended up in a cycle
of over-engineering suggestions. I don't really see why we can't just
implement an ioctl (MEMNUKE? MEMFORCEERASE? MEMSCRUB?) that skips the
"don't erase bad blocks" check in MEMERASE64. There may be other
reasonable alternatives, but I would warn against anything too complex.

Brian
