Received: from mail-bl2nam02on0048.outbound.protection.outlook.com
 ([104.47.38.48] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2ycT-0004ru-9Q
 for linux-mtd@lists.infradead.org; Tue, 25 Apr 2017 11:26:59 +0000
Date: Tue, 25 Apr 2017 13:26:23 +0200
From: Jan Glauber <jan.glauber@caviumnetworks.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [RFC PATCH 2/2] nand: cavium: Nand flash controller for Cavium
 ARM64 SOCs
Message-ID: <20170425112623.GA25764@hc>
References: <20170327160524.29019-1-jglauber@cavium.com>
 <20170327160524.29019-3-jglauber@cavium.com>
 <20170329112932.267b3059@bbrezillon>
 <20170329100256.GA3819@hardcore>
 <20170329155933.7494c243@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170329155933.7494c243@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 29, 2017 at 03:59:33PM +0200, Boris Brezillon wrote:
> On Wed, 29 Mar 2017 12:02:56 +0200
> Jan Glauber <jan.glauber@caviumnetworks.com> wrote:
> 
> > > > +static void cvm_nand_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
> > > > +{
> > > > +	struct nand_chip *nand = mtd_to_nand(mtd);
> > > > +	struct cvm_nfc *tn = to_cvm_nfc(nand->controller);
> > > > +
> > > > +	memcpy(tn->buf.dmabuf + tn->buf.data_len, buf, len);
> > > > +	tn->buf.data_len += len;
> > > > +}  
> > > 
> > > It seems that cvm_nand_read/write_byte/buf() are returning data that
> > > have already been retrieved (problably during the ->cmdfunc() phase).  
> > 
> > Yes.
> > 
> > > That's not how it's supposed to work. The core is expecting the data
> > > transfer to be done when ->read/write_buf() is called. Doing that in  
> > > ->cmdfunc() is risky, because when you're there you have no clue about  
> > > how much bytes the core expect.  
> > 
> > It seems to work fine, I've never seen the core trying to do more bytes in
> > the read/write_buf() then requested in ->cmdfunc().
> 
> We already had problems in the past: when the core evolves to handle
> new NAND chips it might decide to read a bit more data than it used to
> be, and assuming that your driver will always take the right decision
> based on the information passed to ->cmdfunc() is a bit risky.
> 
> I still have the plan to provide a better interface allowing drivers to
> execute the whole operation sequence (cmd+addr+data cycles), but it's
> not there yet (see [1] for more details).
> If you're okay to volunteer, I can help you with design this new hook
> which should probably make your life easier for the rest of the driver
> code (and also help me improve existing drivers ;-)).

Hi Boris,

sorry for the long delay. In the meantime I've looked at your slides and
I can agree with many points. I'd like to go that way and hopefully I
can help with my limited understanding of the nand layer.

How far are you with the new interface, can you share some code?

Regards,
Jan

> Otherwise, you should try to implement ->cmd_ctrl() and try to transfer
> data on the bus only when ->read/write_buf() are called (sometime it's
> not possible).
> 
> 
> > >   
> > > > +
> > > > +static void cvm_nand_cmdfunc(struct mtd_info *mtd, unsigned int command,
> > > > +				  int column, int page_addr)  
> > > 
> > > Did you try implementing ->cmd_ctrl() instead of ->cmdfunc(). Your
> > > controller seems to be highly configurable and, at first glance, I think
> > > you can simplify the driver by implementing ->cmd_ctrl() and relying on
> > > the default ->cmdfunc() implementation.
> > >   
> > 
> > I've looked at the sunxi_nand driver but ->cmd_ctrl() is very different
> > from ->cmdfunc() and the later looks like a better match for our controller.
> > 
> > The Cavium controller needs to write the commands (NAND_CMD_READ0, etc.)
> > into its pseudo instructions (see ndf_queue_cmd_cle()).
> > So how can I do this low-level stuff with ->cmd_ctrl()?
> 
> I'd say that it's actually matching pretty well what is passed to
> ->cmd_ctrl().
> For each call to ->cmd_ctrl() you have the information about the type
> of access that is made on the bus:
> - if the NAND_CLE flag is set in ctrl (the 3rd argument) you have a CLE
>   cycle
> - if NAND_ALE is set in ctrl you have an ALE cycle
> - if NAND_CMD_NONE is passed in cmd (2nd argument), you should issue
>   the whole operation
> 
> You can update your cavium command each time NAND_CLE or NAND_ALE is
> passed (update the command information after each call), and then issue
> the command when NAND_CMD_NONE is passed.
> The only missing part in ->cmd_ctrl() are the data transfer cycles
> which are handled in ->read/write_buf().
> 
> > 
> > For instance for reading data I have ndf_page_read() that is used for
> > both NAND_CMD_READ0 and NAND_CMD_READOOB. Without hacking into ->cmdfunc(),
> > how would I differentiate between the two commands in read_buf()?
> 
> Do you have to? Can't you just issue a command that is solely doing
> data transfer cycles without the CMD and ADDR ones?
> 
> [...]
> > > > +union ndf_cmd {
> > > > +	u64 val[2];
> > > > +	union {
> > > > +		struct ndf_nop_cmd		nop;
> > > > +		struct ndf_wait_cmd		wait;
> > > > +		struct ndf_bus_cmd		bus_acq_rel;
> > > > +		struct ndf_chip_cmd		chip_en_dis;
> > > > +		struct ndf_cle_cmd		cle_cmd;
> > > > +		struct ndf_rd_cmd		rd_cmd;
> > > > +		struct ndf_wr_cmd		wr_cmd;
> > > > +		struct ndf_set_tm_par_cmd	set_tm_par;
> > > > +		struct ndf_ale_cmd		ale_cmd;
> > > > +		struct ndf_wait_status_cmd	wait_status;
> > > > +	} u;
> > > > +};  
> > > 
> > > I need some time to process all these information, but your controller
> > > seems to be a complex/highly-configurable beast. That's really
> > > interesting :-).
> > > I'll come up with more comments/question after reviewing more carefully
> > > the command creation logic.  
> > 
> > Great. I'm afraid out controller is quite different from existing
> > hardware, at least I didn't find a driver that does things simalar (like
> > the command building and queueing).
> 
> Hm, not so different actually, except you seem to have fine grained
> control on the sequencing, which is a really good thing because your
> driver can evolve with new NAND chip requirements.
> 
> > 
> > I'm happy to help with any more information you need about our hardware.
> 
> Thanks,
> 
> Boris
> 
> [1]http://free-electrons.com/pub/conferences/2016/elc/brezillon-nand-framework/brezillon-nand-framework.pdf
