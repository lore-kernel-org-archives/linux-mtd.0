Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbdrI-0000D6-EF
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 22:03:25 +0000
Received: by mail-ob0-f178.google.com with SMTP id wm4so2138271obc.23
 for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2013 15:03:00 -0700 (PDT)
Date: Wed, 30 Oct 2013 18:02:57 -0400
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v3 00/10] About the SLC/MLC
Message-ID: <20131030220257.GC20059@norris.computersforpeace.net>
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <20130826144153.568f2b1c@skate> <20130827033020.GA2182@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA297AE@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA297AE@DBDE04.ent.ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Late response, but better late than never?

On Tue, Oct 22, 2013 at 05:11:37AM +0000, Pekon Gupta wrote:
> > From:  Huang Shijie
> > On Mon, Aug 26, 2013 at 02:41:53PM +0200, Thomas Petazzoni wrote:
> > > Dear Huang Shijie,
> > >
> > > On Mon, 26 Aug 2013 17:36:38 +0800, Huang Shijie wrote:
> > > > In current mtd code, the MTD_NANDFLASH is used to represent both the
> > > > SLC nand MLC(including the TLC). But we already have the
> > MTD_MLCNANDFLASH
> > > > to stand for the MLC. What is worse is that the JFFS2 may run on the MLC
> > > > nand with current code. For the reason of READ/WRITE disturbance, the
> > JFFS2
> > > > should runs on the SLC only,
> > >
> > > Pardon the probably very silly question, but would you mind giving more
> > > details about why JFFS2 is not appropriate on MLC flashes? Is there
> > > anything that UBI/UBIFS does that JFFS2 isn't doing to take into
> > > account read/write disturbance?
> > I try to explain it.
> > 
> > For the UBIFS, it will writes the page(including the oob) only one time;
> > but for jffs2, it may writes the page(including the oob) twice, one for the
> > marker, one for the real data.
> > 
> > For the MLC, the write disturbance will cause some bitflips in this
> > page. Since you write a page twice, so in the jffs2, you will meet
> > uncorrectable
> > ECC error.
> > 
> But, doesn't JFFS2 checks for the blank page before second-write of data ?
> UBI does it here..
> File: $KERNEL/drivers/mtd/ubi/io.c
> @@ubi_io_write (... )
> [...]
> 	err = ubi_self_check_all_ff(ubi, pnum, offset, len);
> 
> So, isn't it better to add this check in JFFS2 code so that its more
> bit-flips tolerant ?
> This way bit-flips caused by first write to OOB (cleanmarker) would be
> caught before using that page for data write. And so MLC should also be
> good for JFFS2..

Sorry, no. MLC (and some SLC these days, actually) has a fundamental
limitation that it can only be programmed once per erase-cycle. This
measure is abbreviated as "NOP" (Number Of Partial-programs?), and for
MLC, NOP=1.

So trying to support the JFFS2 model of double-programming a page is
simply counter-productive when NOP=1.

Brian
