Received: from host-84-9-202-199.bulldogdsl.com ([84.9.202.199]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FEDTn-0008KL-2s
	for linux-mtd@lists.infradead.org; Tue, 28 Feb 2006 17:38:11 -0500
Date: Tue, 28 Feb 2006 22:12:43 +0000
From: Ben Dooks <ben-mtd@fluff.org>
To: Jonathan McDowell <noodles@earth.li>
Message-ID: <20060228221243.GC25880@home.fluff.org>
References: <20060228205903.GZ14749@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060228205903.GZ14749@earth.li>
Sender: Ben Dooks <ben@fluff.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Feb 28, 2006 at 08:59:03PM +0000, Jonathan McDowell wrote:
> Hi.
> 
> I've been writing a NAND driver for the flash on the Amstrad E3. One of
> the peculiarities of this device is that the write & read enable lines
> are on a latch, rather than strobed by the act of reading/writing from
> the data latch. As such I've got custom read_byte/write_byte functions
> defined. However the nand_*_buf functions in drivers/mtd/nand/nand_base.c
> are all appropriate, except for the fact they call readb/writeb
> themselves, instead of using this->read_byte or this->write_byte. The
> patch below changes them to use these functions, meaning a driver just
> needs to define read_byte and write_byte functions and gains all the
> nand_*_buf functions free.

Why not make life easier on everyone else by over-riding the
functions for read/write buffer (etc) in the nand driver... less
intrusive into the core code!

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
