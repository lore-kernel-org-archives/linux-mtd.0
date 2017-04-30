Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d4oTb-00034A-BN
 for linux-mtd@lists.infradead.org; Sun, 30 Apr 2017 13:01:25 +0000
Date: Sun, 30 Apr 2017 15:01:00 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jan Glauber <jan.glauber@caviumnetworks.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [RFC PATCH 2/2] nand: cavium: Nand flash controller for Cavium
 ARM64 SOCs
Message-ID: <20170430150100.503bfb8f@bbrezillon>
In-Reply-To: <20170425112623.GA25764@hc>
References: <20170327160524.29019-1-jglauber@cavium.com>
 <20170327160524.29019-3-jglauber@cavium.com>
 <20170329112932.267b3059@bbrezillon>
 <20170329100256.GA3819@hardcore>
 <20170329155933.7494c243@bbrezillon> <20170425112623.GA25764@hc>
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

On Tue, 25 Apr 2017 13:26:23 +0200
Jan Glauber <jan.glauber@caviumnetworks.com> wrote:

> On Wed, Mar 29, 2017 at 03:59:33PM +0200, Boris Brezillon wrote:
> > On Wed, 29 Mar 2017 12:02:56 +0200
> > Jan Glauber <jan.glauber@caviumnetworks.com> wrote:
> >   
> > > > > +static void cvm_nand_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
> > > > > +{
> > > > > +	struct nand_chip *nand = mtd_to_nand(mtd);
> > > > > +	struct cvm_nfc *tn = to_cvm_nfc(nand->controller);
> > > > > +
> > > > > +	memcpy(tn->buf.dmabuf + tn->buf.data_len, buf, len);
> > > > > +	tn->buf.data_len += len;
> > > > > +}    
> > > > 
> > > > It seems that cvm_nand_read/write_byte/buf() are returning data that
> > > > have already been retrieved (problably during the ->cmdfunc() phase).    
> > > 
> > > Yes.
> > >   
> > > > That's not how it's supposed to work. The core is expecting the data
> > > > transfer to be done when ->read/write_buf() is called. Doing that in    
> > > > ->cmdfunc() is risky, because when you're there you have no clue about    
> > > > how much bytes the core expect.    
> > > 
> > > It seems to work fine, I've never seen the core trying to do more bytes in
> > > the read/write_buf() then requested in ->cmdfunc().  
> > 
> > We already had problems in the past: when the core evolves to handle
> > new NAND chips it might decide to read a bit more data than it used to
> > be, and assuming that your driver will always take the right decision
> > based on the information passed to ->cmdfunc() is a bit risky.
> > 
> > I still have the plan to provide a better interface allowing drivers to
> > execute the whole operation sequence (cmd+addr+data cycles), but it's
> > not there yet (see [1] for more details).
> > If you're okay to volunteer, I can help you with design this new hook
> > which should probably make your life easier for the rest of the driver
> > code (and also help me improve existing drivers ;-)).  
> 
> Hi Boris,
> 
> sorry for the long delay.

No problem. Actually, I've been busy too, and I didn't do the advanced
review I promised, so we're even ;-).

> In the meantime I've looked at your slides and
> I can agree with many points. I'd like to go that way and hopefully I
> can help with my limited understanding of the nand layer.

That's great news!

> 
> How far are you with the new interface, can you share some code?

I started to rework the NAND framework a while ago [1], but never had
time to finish it. I think I was too ambitious, so let's try to be
pragmatic this time, and focus on one problem at a time.

Your problem here is the separation of the CMD/ADDR cycles (done in
->cmdfunc() and/or cmd_ctrl()) and the DATA cycles (done in
->read/write_buf/byte/word()), which complexifies the driver logic.

What you should look at is defining a proper nand_operation object
(here's my initial definition [2], but you may want/need to remove some
fields or add new ones) and add a new ->exec_op() hook to nand_chip
taking a nand_operation struct (+ a pointer to the nand_chip, of
course).

Once you have that, you should patch all accesses from the core to use
the new ->exec_op() interface instead of ->cmdfunc() +
->read/write_xx(). Of course, that means providing a compatibility layer
for all drivers still implementing ->cmdfunc(), which is probably the
trickiest part of the job.

You'll have to rework the nand_do_read/write_ops() functions to
prevent the separation of the ->cmdfunc() call (done in
nand_do_read/write_ops() function) from the data transfer (done in
chip->ecc.read/write_page_xxx()).

I'll try to come up with an initial/ugly patch to show you the
direction, and I'll let you cleanup/massage the implementation ;-).

[1]https://github.com/bbrezillon/linux-sunxi/commits/nand-core-rework-v2
[2]https://github.com/bbrezillon/linux-sunxi/blob/3bd660ef57eb87408e61e8b8d6bb19043de1bfab/include/linux/mtd/nand2.h#L41
