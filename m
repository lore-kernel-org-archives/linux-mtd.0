Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUZ4b-0001lO-EN
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 09:31:53 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "Poddar, Sourav" <sourav.poddar@ti.com>, Trent Piepho <tpiepho@gmail.com>,
 Peter Korsgaard <peter@korsgaard.com>, Mark Brown <broonie@kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: RE: [PATCH 1/3] spi/qspi: Add memory mapped read support.
Date: Fri, 11 Oct 2013 09:30:48 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA211D8@DBDE04.ent.ti.com>
References: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
 <1381332284-21822-2-git-send-email-sourav.poddar@ti.com>
 <20131009160759.GQ21581@sirena.org.uk>	<52558A49.5090904@ti.com>
 <20131009174027.GS21581@sirena.org.uk>	<87hacq1d5k.fsf@dell.be.48ers.dk>
 <CA+7tXii4J_Hie2v-DaSevFHn-YqriiVowhpXCP9H+U51_tbhvQ@mail.gmail.com>
 <52566ACC.1080100@ti.com>
In-Reply-To: <52566ACC.1080100@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> From: Poddar, Sourav
> > On Thursday 10 October 2013 07:57 AM, Trent Piepho wrote:
> > I've found that the SPI layer adds rather a lot of overhead to SPI
> > transactions.  It appears to come mostly from using another thread to
> > run the queue.  A fast SPI message of a few dozen bytes ends up having
> > more overhead from the SPI layer than the time it takes the driver to
> > do the actual transfer.
> >
> > So memory mapped mode via some kind of SPI hack seems like a bad
> > design.  All the SPI layer overhead and you don't get DMA.  Memory
> > mapped SPI could be a win, but I think you'd need to do it at the MTD
> > layer with a mapping driver that could read the mmapped SPI flash
> > directly.
> Yes, you are correct in all your comments above. I also feel that SPI
> framework
> should be bypassed. But the subject patch is derived based on the
> following points/limitation:
>=20
> 1. There is a setup register in QSPI, that need to be filled, as of now
> I am filling it
>      in my driver as a MACRO.
>=20
Based on you previous information of set_up_register..
> > What is "set_up_register"?
> > set_up_register is a memory mapped specific register with the
> > following fields:
> > - RCMD (Read command, which is actually the flash read command)
> > - NUmber of Address bytes
> > - Number of dummy bytes
> > - Read type(Single, dual and quad read).
> > - Write command.

set_up_register should be filled from DT not from Macros, as these
value change from NAND device to device, and based on that
populate 'struct m25p' in m25p_probe().Otherwise it might end-up
in similar situation as in fsl_spinor driver.
Refer below as an example.
http://lists.infradead.org/pipermail/linux-mtd/2013-September/048552.html



> 2. Controller repsonds to memory mapped read for read opcodes,
>  so during the read path we should tell the controller to switch to
>  memory mapped port.
>=20
As you would be know from DT when to enable MMODE, so you  can
actually make MM_MODE as your *default mode*. And only when
SPI framework is used you selectively switch to SPI_MODE and
revert back to MM_MODE while returning.

This way you can use memcpy() or dma_copy() directly in flash driver
like m25p80.c, and avoid getting SPI generic framework delays.
So, it should be like this..

/* Make MM_MODE your default mode in controller driver */
qspi_driver.c: configure_qspi_controller(mode) {
if (mode =3D=3D MM_MODE)
	- do all your controller configurations for MM_MODE
	- do all OPCODE selections for MM_MODE
}

qspi_controller_probe()
	if (of_mode_property("spi-flash-memory-map") {
		spi->mode |=3D MM_MODE;
		/* configure_qspi_controller (MM_MODE) */
	} else {
		/* configure_qspi_controller(SPI_MODE) */
	}


/* Case 1: MM_MODE=3Denabled: Flash driver calls memcpy() */
m25p80.c: m25p80_quad_read() {
	if (flash->mmap_read)
		/* controller is already in MM_MODE by default */
		memcpy(*from, *to, length);
	else
		/* usual call to spi_framework */
}


/* Case 2: SPI_MODE=3Denabled: Flash driver follows spi framework */
m25p80.c: m25p80_quad_read() {
	if (flash->mmap_read)
		/* ignored */
	else
		spi_add_message_to_tail();
}=09

qspi_driver.c: prepare_transfer_hardware()
	if (spi->mode & MM_MODE) {
		/* controller is in MM_MODE by default, so switch
		  * to controller to SPI_MODE */
		configure_qspi_controller (SPI_MODE);
	} else {
		/* controller is already in SPI_MODE always */
	}

qspi_driver.c: transfer_one_message ()
	if (spi->mode & MM_MODE) {
		/* controller was switched to SPI_MODE in
		* prepare_transfer_hardware(),so revert back
		  * back to MM_MODE */
		configure_qspi_controller (MM_MODE);
	} else {
		/* controller is already in SPI_MODE always*/
	}
}

*Important*
But you need to be careful, because  you need to synchronize
with kthread_worker running inside SPI generic framework.
So, lock your spi_controller while doing MMODE accesses.
else you might end up in situation where a starving kthead_worker
suddenly woke-up  and changed your configurations from MMODE to
SPI_MODE in between ongoing memcpy() or dma_cpy().

(Request David W, and Mark B to please review this proposal
 based on m25p80.c and SPI generic framework, as I may be
 missing some understanding here).


with regards, pekon
