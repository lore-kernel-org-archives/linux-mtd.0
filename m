Received: from host-84-9-202-199.bulldogdsl.com ([84.9.202.199]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FEPqg-0001st-4p
	for linux-mtd@lists.infradead.org; Wed, 01 Mar 2006 06:50:34 -0500
Date: Wed, 1 Mar 2006 11:50:20 +0000
From: Ben Dooks <ben-mtd@fluff.org>
To: Jonathan McDowell <noodles@earth.li>
Message-ID: <20060301115020.GD25880@home.fluff.org>
References: <20060228205903.GZ14749@earth.li>
	<20060228221243.GC25880@home.fluff.org>
	<20060228222559.GC14749@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060228222559.GC14749@earth.li>
Sender: Ben Dooks <ben@fluff.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ben Dooks <ben-mtd@fluff.org>
Subject: Re: [PATCH] Make nand block functions use provided byte/word
	helpers.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 28, 2006 at 10:25:59PM +0000, Jonathan McDowell wrote:
> On Tue, Feb 28, 2006 at 10:12:43PM +0000, Ben Dooks wrote:
> > On Tue, Feb 28, 2006 at 08:59:03PM +0000, Jonathan McDowell wrote:
> > > I've been writing a NAND driver for the flash on the Amstrad E3. One of
> > > the peculiarities of this device is that the write & read enable lines
> > > are on a latch, rather than strobed by the act of reading/writing from
> > > the data latch. As such I've got custom read_byte/write_byte functions
> > > defined. However the nand_*_buf functions in drivers/mtd/nand/nand_base.c
> > > are all appropriate, except for the fact they call readb/writeb
> > > themselves, instead of using this->read_byte or this->write_byte. The
> > > patch below changes them to use these functions, meaning a driver just
> > > needs to define read_byte and write_byte functions and gains all the
> > > nand_*_buf functions free.
> > 
> > Why not make life easier on everyone else by over-riding the
> > functions for read/write buffer (etc) in the nand driver... less
> > intrusive into the core code!
> 
> If the patch is deemed too intrusive then that's what I'll do; I nearly
> did so originally but when I caught myself cut and pasting the code from
> nand_base I thought my patch was the cleaner way.
> 
> The patch shouldn't cause any extra work for anyone that I can see and I
> don't think it's intrusive at all; I submitted it because I figured it
> might save someone else some work down the line as well.

Well, a small iritation is that it adds work for the read and 
write byte function, as a function call adds instructions to
the path. Also, do you want to check that it dosen't break
any existing drivers?

Secondly, you'll probably have a better piece of code for the
E3 driver if you did the block calls with only one setup for
the r/w enable lines per block, instead of checking them for
every byte done. You may even want to use readsb/writesb or
DMA to accelerate the operation.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
