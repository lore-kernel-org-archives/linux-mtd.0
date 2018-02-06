Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ej0S9-0003tL-KU
 for linux-mtd@lists.infradead.org; Tue, 06 Feb 2018 10:26:19 +0000
Date: Tue, 6 Feb 2018 11:25:54 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@smile.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Mark Brown
 <broonie@kernel.org>, linux-spi@vger.kernel.org, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Vignesh R <vigneshr@ti.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [RFC PATCH 1/6] spi: Extend the core to ease integration of SPI
 memory controllers
Message-ID: <20180206112554.533da612@bbrezillon>
In-Reply-To: <20180206104330.35ffb946@smile-e5570>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-2-boris.brezillon@bootlin.com>
 <20180206104330.35ffb946@smile-e5570>
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

Hi Maxime,

On Tue, 6 Feb 2018 10:43:30 +0100
Maxime Chevallier <maxime.chevallier@smile.fr> wrote:

> Hi Boris,
> 
> > From: Boris Brezillon <boris.brezillon@free-electrons.com>
> > 
> > Some controllers are exposing high-level interfaces to access various
> > kind of SPI memories. Unfortunately they do not fit in the current
> > spi_controller model and usually have drivers placed in
> > drivers/mtd/spi-nor which are only supporting SPI NORs and not SPI
> > memories in general.
> > 
> > This is an attempt at defining a SPI memory interface which works for
> > all kinds of SPI memories (NORs, NANDs, SRAMs).
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/spi/spi.c       | 423
> > +++++++++++++++++++++++++++++++++++++++++++++++-
> > include/linux/spi/spi.h | 226 ++++++++++++++++++++++++++ 2 files
> > changed, 646 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> > index b33a727a0158..57bc540a0521 100644
> > --- a/drivers/spi/spi.c
> > +++ b/drivers/spi/spi.c
> > @@ -2057,6 +2057,24 @@ static int of_spi_register_master(struct
> > spi_controller *ctlr) }
> >  #endif
> >    
> 
> [...]
> 
> > +int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> > +{
> > +	unsigned int tmpbufsize, xferpos = 0, totalxferlen = 0;
> > +	struct spi_controller *ctlr = mem->spi->controller;
> > +	struct spi_transfer xfers[4] = { };
> > +	struct spi_message msg;
> > +	u8 *tmpbuf;
> > +	int ret;
> > +
> > +	if (!spi_mem_supports_op(mem, op))
> > +		return -ENOTSUPP;
> > +
> > +	if (ctlr->mem_ops) {
> > +		if (ctlr->auto_runtime_pm) {
> > +			ret = pm_runtime_get_sync(ctlr->dev.parent);
> > +			if (ret < 0) {
> > +				dev_err(&ctlr->dev,
> > +					"Failed to power device:
> > %d\n",
> > +					ret);
> > +				return ret;
> > +			}
> > +		}
> > +
> > +		mutex_lock(&ctlr->bus_lock_mutex);
> > +		mutex_lock(&ctlr->io_mutex);
> > +		ret = ctlr->mem_ops->exec_op(mem, op);  
> 
> As a user, what prevented me from using spi_flash_read is that it
> bypasses the message queue. I have a setup that uses spi_async and I
> have to make sure everything goes in the right order, so I ended up
> using spi_write_then_read instead.
> 
> Is there a way to make so that the message that uses exec_op are issued
> in the correct order regarding messages that are already queued ?

Nope, that's not handled right now, and mem ops can indeed go in before
the already queued messages if spi_mem_exec_op() acquires the io_lock
before the dequeuing thread.

> 
> Maybe we could extend spi_message or spi_transfer to store all
> this opcode/dummy/addr information, so that we would use the standard
> interfaces spi_sync / spi_async, and make this mechanism of exec_op
> transparent from the user ?

That's a possibility. Note that SPI controllers are passed a spi_mem
object in ->exec_op(), not a spi_device. This is because I envision
we'll need to pass extra information to the controller to let it take
appropriate decisions (like the memory device size or other things that
may have an impact on how the controller handle the spi_mem_op
requests). 
Anyway, we could stuff a spi_mem_op and a spi_mem pointer in the
spi_message struct and adapt the queuing/dequeuing logic, but I fear
this will complexify the whole thing.

Another approach would be to flush the msg queue before calling
->exec_op(). That does not guarantee that the memory operation will be
placed exactly where it should (SPI messages might be queued while
we're pumping the queue), but I'm not sure we really care.

	/*
	 * When the generic queuing/dequeuing mechanism is in place
	 * pump all pending messages to enforce FIFO behavior, and
	 * execute the SPI mem operation after that.
	 */
	if (ctlr->transfer == spi_queued_transfer)
		__spi_pump_messages(ctlr, false);

	mutex_lock(&ctlr->bus_lock_mutex);
	mutex_lock(&ctlr->io_mutex);
	ret = ctlr->mem_ops->exec_op(mem, op);
	...	

> 
> 
> > +		mutex_unlock(&ctlr->io_mutex);
> > +		mutex_unlock(&ctlr->bus_lock_mutex);
> > +
> > +		if (ctlr->auto_runtime_pm)
> > +			pm_runtime_put(ctlr->dev.parent);
> > +
> > +		/*
> > +		 * Some controllers only optimize specific paths
> > (typically the
> > +		 * read path) and expect the core to use the regular
> > SPI
> > +		 * interface in these cases.
> > +		 */
> > +		if (!ret || ret != -ENOTSUPP)
> > +			return ret;
> > +	}
> > +
> > +	tmpbufsize = sizeof(op->cmd.opcode) + op->addr.nbytes +
> > +		     op->dummy.nbytes;
> > +
> > +	/*
> > +	 * Allocate a buffer to transmit the CMD, ADDR cycles with
> > kmalloc() so
> > +	 * we're guaranteed that this buffer is DMA-able, as
> > required by the
> > +	 * SPI layer.
> > +	 */
> > +	tmpbuf = kzalloc(tmpbufsize, GFP_KERNEL | GFP_DMA);
> > +	if (!tmpbuf)
> > +		return -ENOMEM;
> > +
> > +	spi_message_init(&msg);
> > +
> > +	tmpbuf[0] = op->cmd.opcode;
> > +	xfers[xferpos].tx_buf = tmpbuf;
> > +	xfers[xferpos].len = sizeof(op->cmd.opcode);
> > +	xfers[xferpos].tx_nbits = op->cmd.buswidth;
> > +	spi_message_add_tail(&xfers[xferpos], &msg);
> > +	xferpos++;
> > +	totalxferlen++;
> > +
> > +	if (op->addr.nbytes) {
> > +		memcpy(tmpbuf + 1, op->addr.buf, op->addr.nbytes);
> > +		xfers[xferpos].tx_buf = tmpbuf + 1;
> > +		xfers[xferpos].len = op->addr.nbytes;
> > +		xfers[xferpos].tx_nbits = op->addr.buswidth;
> > +		spi_message_add_tail(&xfers[xferpos], &msg);
> > +		xferpos++;
> > +		totalxferlen += op->addr.nbytes;
> > +	}
> > +
> > +	if (op->dummy.nbytes) {
> > +		memset(tmpbuf + op->addr.nbytes + 1, 0xff,
> > op->dummy.nbytes);
> > +		xfers[xferpos].tx_buf = tmpbuf + op->addr.nbytes + 1;
> > +		xfers[xferpos].len = op->dummy.nbytes;
> > +		xfers[xferpos].tx_nbits = op->dummy.buswidth;
> > +		spi_message_add_tail(&xfers[xferpos], &msg);
> > +		xferpos++;
> > +		totalxferlen += op->dummy.nbytes;
> > +	}  
> 
> Can't we use just one xfer for all the opcode, addr and dummy bytes ?

We can, if they have the same buswidth, but I didn't want to go that
far into optimization before making sure the approach was acceptable.
Definitely something I can add in a v2.

> 
> > +	if (op->data.nbytes) {
> > +		if (op->data.dir == SPI_MEM_DATA_IN) {
> > +			xfers[xferpos].rx_buf = op->data.buf.in;
> > +			xfers[xferpos].rx_nbits = op->data.buswidth;
> > +		} else {
> > +			xfers[xferpos].tx_buf = op->data.buf.out;
> > +			xfers[xferpos].tx_nbits = op->data.buswidth;
> > +		}
> > +
> > +		xfers[xferpos].len = op->data.nbytes;
> > +		spi_message_add_tail(&xfers[xferpos], &msg);
> > +		xferpos++;
> > +		totalxferlen += op->data.nbytes;
> > +	}
> > +
> > +	ret = spi_sync(mem->spi, &msg);
> > +
> > +	kfree(tmpbuf);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (msg.actual_length != totalxferlen)
> > +		return -EIO;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(spi_mem_exec_op);  
> 
> [...]
> 

Thanks for your feedback.

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
