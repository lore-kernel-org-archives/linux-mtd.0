Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3n0Q-0000CU-5g
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2013 12:56:55 +0000
Date: Mon, 29 Jul 2013 14:56:26 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: wangyuhang <wangyuhang2014@gmail.com>
Subject: Re: [PATCH] SPI: DUAL and QUAD support
Message-ID: <20130729145626.6c227aa0@parrot.com>
In-Reply-To: <1375095194-7093-1-git-send-email-wangyuhang2014@gmail.com>
References: <20130729064234.GS9858@sirena.org.uk>
 <1375095194-7093-1-git-send-email-wangyuhang2014@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "pekon@ti.com" <pekon@ti.com>, "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 "sourav.poddar@ti.com" <sourav.poddar@ti.com>,
 "tpiepho@gmail.com" <tpiepho@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Mon, 29 Jul 2013 11:53:14 +0100,
wangyuhang <wangyuhang2014@gmail.com> a =E9crit :

> Hi,
>=20
> modify two things.
> 1:
> >> @@ -1316,6 +1324,12 @@ int spi_setup(struct spi_device *spi)
> >>         /* help drivers fail *cleanly* when they need options
> >>          * that aren't supported with their current master
> >>          */
> >> +       if (((spi->mode >> 8) & 0x03) =3D=3D 0x03 ||
> >> +               ((spi->mode >> 10) & 0x03) =3D=3D 0x03) {
> >> +               dev_err(&spi->dev,
> >> +               "setup: can not select dual and quad at the same
> >> time\n")
> >> +               return -EINVAL;
> >> +       }
> >> +               return -EINVAL;
> >> +       }
>=20
> >This code won't work if the constants you added for mode flags change
> >value.  More importantly, anyone searching the code for SPI_TX_DUAL,
> >etc. won't find this code.
>=20
> so use the certain macro to replace.
>=20
> 2:
> >You need to make sure that existing userspace binaries can run
> >unmodified, changing the types will change the layout of the ioctl
> >arguments.  This may mean that you need to add new ioctls if you
> >need to change types.
>=20
> I recovered the SPI_IOC_RD_LSB_FIRST ioctl.
> Add new ioctl to fit u16 mode.
> In addition,may SPI_IOC_RD_LSB_FIRST should be del in a better way.
>=20
> Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
> ---

>  /* IOCTL commands */
> @@ -54,6 +61,8 @@
>   * @tx_buf: Holds pointer to userspace buffer with transmit data, or
> null.
>   *     If no data is provided, zeroes are shifted out.
>   * @rx_buf: Holds pointer to userspace buffer for receive data, or
> null.
> + * @tx_nbits: number of bits used for writting.
> + * @rx_nbits: number of bits used for reading.
>   * @len: Length of tx and rx buffers, in bytes.
>   * @speed_hz: Temporary override of the device's bitrate.
>   * @bits_per_word: Temporary override of the device's wordsize.
> @@ -85,6 +94,8 @@
>  struct spi_ioc_transfer {
>         __u64           tx_buf;
>         __u64           rx_buf;
> +       __u8            tx_nbits;
> +       __u8            rx_nbits;
>=20
>         __u32           len;
>         __u32           speed_hz;
You still break old userspace ABI.

You need to create a new structure, if you need to add fields.


Matthieu
