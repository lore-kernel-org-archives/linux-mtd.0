Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uz3JT-0000S3-JS
 for linux-mtd@lists.infradead.org; Tue, 16 Jul 2013 11:21:00 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "wangyuhang2014@gmail.com" <wangyuhang2014@gmail.com>
Subject: RE: support DUAL and QUAD[patch v1]
Date: Tue, 16 Jul 2013 11:20:26 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E85D0@DBDE04.ent.ti.com>
References: <CAHSAbzP0Nc1ahf_ra6yDuMvV998_+EGcUOGDv5ifKaagYf+NOg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E84D2@DBDE04.ent.ti.com>
 <CAHSAbzMDOWo5oBqUHqMxybuDwUjFbczYwN+85gH+rxZ9z8u2Pw@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E851E@DBDE04.ent.ti.com>
 <593AEF6C47F46446852B067021A273D6D93B49E1@MUCSE039.lantiq.com>
In-Reply-To: <593AEF6C47F46446852B067021A273D6D93B49E1@MUCSE039.lantiq.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> Hello Pekon,
>=20
> Gupta, Pekon wrote on=A02013-07-16:
> > >
> > > Hi, Gupta
> > >
> > >
> > > > [Pekon]: Instead of adding new fields you can use existing 'mode' f=
ield
> to
> > > > pass on the platform specific configurations. And if 'u8 mode' does=
 not
> > > > suffice you can increase it to 'u32'.
> > > > #define QSPI_MODE       1 << 5; // just check which bit-fields are =
un-
> used
> > > > spi_board_info->mode |=3D QSPI_MODE;
> > > >
> > >
> > > well, can dual and quad be regarded as a spi mode? if so, your commen=
t
> > > seems
> > > to be right.
> >
> > Yes, Quad and Dual modes should be regarded as extension of SPI
> protocol.
> > - They follow the same basic principle of synchronous data transfer. Ri=
ght ?
> > - These modes are not adding any extra side-band | In-band signaling or
> > controls to modify the protocol. They are just increasing the width of
> >  data-channel for better throughput.
> >
> > with regards, pekon
> >
>=20
> In general, yes. But I think, for the interface we have to take care of m=
ore
> details.
>=20
> For example, what happens in the following situation:
> We have a spi-controller, which supports the QSPI mode, and a spi-flash,
> which fulfils
> the requirements, but the board has not connected all signals?
>=20
[Pekon]: So, actual implementation should set QSPI_MODE based on both
(1) device capabilities (detected in probe)
(2) board-DT properties (this would take care of your other constrains)

> And the interface for the slave-driver (like m25p80) should allow to spec=
ify
> the transfer mode
> for each spi_message.
> This will be necessary, because it depends on the flash and mode, how eac=
h
> phase of "cmd",
> "address", and "data" will be transferred.
>=20
[Pekon]: Are you saying that same controller can send interleaved=20
Quad-SPI and Single-SPI spi_messages to same device (here flash device)?

Is it due to flash-device constrain that it accepts some flash-commands=20
(like erase, etc) only on Single-wire-SPI, whereas  data transfers can be=20
Performed on Quad-SPI mode ?
In such case you need to add 'mode' field in struct spi_message, so that
this information moves along with the spi_message in queue. And then
when that message reaches spi_pump_message() and=20
transfer_one_message() is called, then you can do needful configs.

However, I still don't think you need to control 'QSPI_MODE' at granularity
of spi_transfer level, because m25p80 flash-driver use spi_write() API to
pass data to SPI driver, which internally creates a spi_message in each cal=
l.

Following best explains use of spi_message in /include/linux/spi.h
---------------------------------------------------
* A @spi_message is used to execute an atomic sequence of data transfers,
 * each represented by a struct spi_transfer.  The sequence is "atomic"
 * in the sense that no other spi_message may use that SPI bus until that
 * sequence completes.  On some systems, many such sequences can execute as
 * as single programmed DMA transfer.  On all systems, these messages are
 * queued, and might complete after transactions to other devices.  Message=
s
 * sent to a given spi_device are alway executed in FIFO order.
---------------------------------------------------


> I don't know, if it is only me, but I would like to see some more abstrac=
t
> description for all
> these scenarios, before the details of an interface really could be discu=
ssed
> and decided.
>=20
Agree.. Does above matches your requirement ?

=20
with regards, pekon

> Best Regards,
> Thomas
