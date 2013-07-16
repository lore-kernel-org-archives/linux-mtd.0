Received: from smtp1.lantiq.com ([195.219.66.200])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uz2Fq-0007UH-J2
 for linux-mtd@lists.infradead.org; Tue, 16 Jul 2013 10:13:11 +0000
From: <thomas.langer@lantiq.com>
To: <pekon@ti.com>, <wangyuhang2014@gmail.com>
Subject: RE: support DUAL and QUAD[patch v1]
Date: Tue, 16 Jul 2013 10:12:46 +0000
Message-ID: <593AEF6C47F46446852B067021A273D6D93B49E1@MUCSE039.lantiq.com>
References: <CAHSAbzP0Nc1ahf_ra6yDuMvV998_+EGcUOGDv5ifKaagYf+NOg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E84D2@DBDE04.ent.ti.com>
 <CAHSAbzMDOWo5oBqUHqMxybuDwUjFbczYwN+85gH+rxZ9z8u2Pw@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E851E@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9E851E@DBDE04.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: spi-devel-general@lists.sourceforge.net, sourav.poddar@ti.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Pekon,

Gupta, Pekon wrote on=A02013-07-16:
> >
> > Hi, Gupta
> >
> >
> > > [Pekon]: Instead of adding new fields you can use existing 'mode' fie=
ld to
> > > pass on the platform specific configurations. And if 'u8 mode' does n=
ot
> > > suffice you can increase it to 'u32'.
> > > #define QSPI_MODE       1 << 5; // just check which bit-fields are un=
-used
> > > spi_board_info->mode |=3D QSPI_MODE;
> > >
> >
> > well, can dual and quad be regarded as a spi mode? if so, your comment
> > seems
> > to be right.
>=20
> Yes, Quad and Dual modes should be regarded as extension of SPI protocol.
> - They follow the same basic principle of synchronous data transfer. Righ=
t ?
> - These modes are not adding any extra side-band | In-band signaling or
> controls to modify the protocol. They are just increasing the width of
>  data-channel for better throughput.
>=20
> with regards, pekon
>=20

In general, yes. But I think, for the interface we have to take care of mor=
e details.

For example, what happens in the following situation:
We have a spi-controller, which supports the QSPI mode, and a spi-flash, wh=
ich fulfils=20
the requirements, but the board has not connected all signals?

And the interface for the slave-driver (like m25p80) should allow to specif=
y the transfer mode
for each spi_message.
This will be necessary, because it depends on the flash and mode, how each =
phase of "cmd",
"address", and "data" will be transferred.

I don't know, if it is only me, but I would like to see some more abstract =
description for all=20
these scenarios, before the details of an interface really could be discuss=
ed and decided.

Best Regards,
Thomas
