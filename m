Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAFEA-0008LH-FO
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 12:35:56 +0000
Date: Mon, 15 May 2017 14:35:23 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jan Glauber <jan.glauber@caviumnetworks.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [RFC PATCH 2/2] nand: cavium: Nand flash controller for Cavium
 ARM64 SOCs
Message-ID: <20170515143523.539feaa9@bbrezillon>
In-Reply-To: <20170515143337.52c49094@bbrezillon>
References: <20170327160524.29019-1-jglauber@cavium.com>
 <20170327160524.29019-3-jglauber@cavium.com>
 <20170329112932.267b3059@bbrezillon>
 <20170329100256.GA3819@hardcore>
 <20170329155933.7494c243@bbrezillon> <20170425112623.GA25764@hc>
 <20170430150100.503bfb8f@bbrezillon>
 <20170515143337.52c49094@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 15 May 2017 14:33:37 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Jan,
> 
> On Sun, 30 Apr 2017 15:01:00 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> >   
> > > 
> > > How far are you with the new interface, can you share some code?    
> > 
> > I started to rework the NAND framework a while ago [1], but never had
> > time to finish it. I think I was too ambitious, so let's try to be
> > pragmatic this time, and focus on one problem at a time.
> > 
> > Your problem here is the separation of the CMD/ADDR cycles (done in  
> > ->cmdfunc() and/or cmd_ctrl()) and the DATA cycles (done in
> > ->read/write_buf/byte/word()), which complexifies the driver logic.    
> > 
> > What you should look at is defining a proper nand_operation object
> > (here's my initial definition [2], but you may want/need to remove some
> > fields or add new ones) and add a new ->exec_op() hook to nand_chip
> > taking a nand_operation struct (+ a pointer to the nand_chip, of
> > course).
> > 
> > Once you have that, you should patch all accesses from the core to use
> > the new ->exec_op() interface instead of ->cmdfunc() +  
> > ->read/write_xx(). Of course, that means providing a compatibility layer    
> > for all drivers still implementing ->cmdfunc(), which is probably the
> > trickiest part of the job.
> > 
> > You'll have to rework the nand_do_read/write_ops() functions to
> > prevent the separation of the ->cmdfunc() call (done in
> > nand_do_read/write_ops() function) from the data transfer (done in
> > chip->ecc.read/write_page_xxx()).
> > 
> > I'll try to come up with an initial/ugly patch to show you the
> > direction, and I'll let you cleanup/massage the implementation ;-).  
> 
> I finally had time to finish the PoC I had in mind [1], unfortunately I
> didn't have time to provide a reference implementation to show you how
> it is supposed to work from a driver PoV.

One more thing, this is completely untested (only compile-tested), so
you're likely to face bugs when testing it ;-).
