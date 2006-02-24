Received: from host-84-9-202-22.bulldogdsl.com ([84.9.202.22]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FCbVO-0000EC-Ez
	for linux-mtd@lists.infradead.org; Fri, 24 Feb 2006 06:53:06 -0500
Date: Fri, 24 Feb 2006 11:24:25 +0000
From: Ben Dooks <ben-mtd@fluff.org>
To: Russ Dill <russ.dill@gmail.com>
Message-ID: <20060224112425.GA25880@home.fluff.org>
References: <f9d2a5e10602232107y57accef1r3420d9b903d9cf4c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9d2a5e10602232107y57accef1r3420d9b903d9cf4c@mail.gmail.com>
Sender: Ben Dooks <ben@fluff.org.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FPGA NAND Interface tips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 23, 2006 at 10:07:36PM -0700, Russ Dill wrote:
> I'm providing some input on the NAND wire up, and FPGA design on a new
> board (80200 + FPGA).  I'm currently using rtc_from4.c and s3c2410.c
> as examples.
> 
> So I'm thinking the following for a basic setup:
> 
> reed solomon encoder
> Bit in the FPGA to reset the reed solomon encoder
> place in the FPGA to read out rs codes from last written/read block
> CLE/ALE as address lines
> Read/Busy connected as gpio/interrupt (multiple chips connect to multiple lines)

these sound like good ideas.
 
> Also, when writing/reading to a single address, the 80200 will not
> burst, and round trip time is horrid, especially when talking to IO
> devices. Would a FIFO with a 32 byte interface be a good solution to
> this? maybe with 16 entries (512 bytes)? I realize that DMA would be
> more ideal, but a fifo seems like it might be simplier.

you might also think about a way of writing cmd+addr in one go, or
at-least the address cycles.
 
> Does anyone have any paticular pet peeves when dealing with their NAND
> interface?
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
