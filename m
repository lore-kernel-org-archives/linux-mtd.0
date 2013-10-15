Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW6de-0004AX-6X
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 15:34:26 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "Poddar, Sourav" <sourav.poddar@ti.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 1/3] spi/qspi: Add memory mapped read support.
Date: Tue, 15 Oct 2013 15:33:19 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA23446@DBDE04.ent.ti.com>
References: <52566ACC.1080100@ti.com> <20131010101410.GG21581@sirena.org.uk>
 <52568AA3.9080203@ti.com> <20131011100839.GA21581@sirena.org.uk>
 <525CDB77.4040201@ti.com> <20131015111647.GX2443@sirena.org.uk>
 <525D2BB3.4020705@ti.com> <20131015124656.GM2443@sirena.org.uk>
 <525D41E2.30206@ti.com>
In-Reply-To: <525D41E2.30206@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Peter Korsgaard <peter@korsgaard.com>, Trent Piepho <tpiepho@gmail.com>,
 "Balbi, Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> From:  Poddar, Sourav
> > On Tuesday 15 October 2013 06:16 PM, Mark Brown wrote:
> > On Tue, Oct 15, 2013 at 05:19:07PM +0530, Sourav Poddar wrote:
> >> On Tuesday 15 October 2013 04:46 PM, Mark Brown wrote:
> >>> Can you fix this by enabling the clock is enabled when you return the
> >>> buffer to the MTD layer and then disabling the clock when the buffer =
is
> >>> released?
> >> Sorry, I did not get you here. With memory mapped read, there is no
> >> buffer exchanged, everything takes place at the mtd layer only, what g=
ets
> >> exchanged is just the memory mapped address.
> > The buffer is the memory mapped address - part of getting the address
> > should be preparing the hardware for it.
> >
> >>       if (spi->mode&&  SPI_RX_MMAP) {
> >>           printk("memory mapped mode set\n");
> >> -        flash->mmap_read =3D true;
> >> +        flash->mmap_read =3D spi->memory_map;
> > So this probably needs to be a function call to get the buffer (and a
> > corresponding one to free it).
> So, the flow can be something like this:
>=20
> drivers/mtd/devices/m25p80.c
> get_flash_buf()
> {
>      lock();
>=20
>       t[0] =3D GET_BUFFER;
>       t[1] =3D buf;
>       ......
>=20
>       spi_sync();
>=20
>      unlock();
> }
>=20
Problem here..
spi_sync() is not blocking, that means it would just add a spi_message
to queue and return. And it depends on kthread_worker when it pumps
this spi_message to QPSI controller driver for actual configuration.
So this is actually a race-condition. You cannot use spi_sync() to configur=
e.

(refer my comments in previous emails).
If you really want to configure QSPI controller just before memcpy(),
Then you need to somehow prevent spi kthead_worker from accessing.
This you can do by locking the spi_meesage queue/list at that time.


> mtd_read
> {
>      get_flash_buf();
>=20
>      if (flash->buf) {
>          memcpy();
>         return 0;
>    }
> }
>=20
> Not sure, if free buf is needed as devm_* variant is used to allocate tha=
t
> memory.
>=20
>=20
> }

With regards, pekon
