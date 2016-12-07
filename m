Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEWqy-0006bl-4M
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 07:41:25 +0000
Date: Wed, 7 Dec 2016 08:40:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, richard@nod.at
Subject: Re: [PATCH 1/1] mtd: spi-nor: remove WARN_ONCE() message in
 spi_nor_write()
Message-ID: <20161207084058.6ebf1a68@bbrezillon>
In-Reply-To: <7dd7fecc-7f03-659a-ef00-a1ad69daceca@gmail.com>
References: <0078578d0f5d2402ac623afabf601d25998f84a9.1481044434.git.cyrille.pitchen@atmel.com>
 <096f8b4c-b00a-af89-e667-7385226c2e7e@gmail.com>
 <0b871c04-c105-ec94-441c-481e9773f19e@wedev4u.fr>
 <7dd7fecc-7f03-659a-ef00-a1ad69daceca@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 Dec 2016 04:07:05 +0100
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 12/07/2016 12:38 AM, Cyrille Pitchen wrote:
> > Le 06/12/2016 =C3=A0 20:00, Marek Vasut a =C3=A9crit : =20
> >> On 12/06/2016 06:14 PM, Cyrille Pitchen wrote: =20
> >>> This patch removes the WARN_ONCE() test in spi_nor_write().
> >>> This macro triggers the display of a warning message almost every tim=
e we
> >>> use a UBI file-system because a write operation is performed at offse=
t 64,
> >>> which is in the middle of the SPI NOR memory page. This is a valid
> >>> operation for ubifs. =20
> >>
> >> Is that a valid operation for all spi nors ?
> >> =20
> >=20
> > AFAIK, yes, it is. First we need to erase a sector or a block, then we
> > can send page program commands to write data into the memory. We cannot
> > write more than a page size within a single page program command but you
> > can write less and start in the middle of a page if you want. =20
>=20
> I wasn't aware this partial and even unaligned programming was available
> on all chips, OK.
>=20
> > I don't know whether we could cross the page boundary if we start
> > writing from the middle of a page as long as we write less data than a
> > single page size. However spi_nor_write() don't do so, this is why it
> > computes
> > page_remain =3D min_t(size_t, nor->page_size - page_offset, len - i) =20
>=20
> No, I don't think we can, I believe the PP would wrap around and program
> the same page from the beginning.
>=20
> > Well, now looking at the Spansion S25FL127S datasheet, the address is
> > wrapped if we cross the page boundary: =20
>=20
> Yeah, this matches my mental model.
>=20
> > "Depending on the device configuration, the page size can either be 256
> > or 512 bytes. Up to a page can be provided on SI after the 3-byte
> > address with instruction 02h or 4-byte address with instruction 12h has
> > been provided. If the 9 least significant address bits (A8-A0) are not
> > all 0, all transmitted data that goes beyond the end of the current page
> > are programmed from the start address of the same page (from the address
> > whose 9 least significant bits (A8-A0) are all 0) i.e. the address wraps
> > within the page aligned address boundaries. This is a result of only
> > requiring the user to enter one single page address to cover the entire
> > page boundary."
> >=20
> > Then from Adesto AT25DF321A datasheet:
> > "If the starting memory address denoted by A23-A0 does not fall on an
> > even 256-byte page boundary (A7-A0 are not all 0), then special
> > circumstances regarding which memory locations to be programmed will
> > apply. In this situation, any data that is sent to the device that goes
> > beyond the end of the page will wrap around back to the beginning of the
> > same page. For example, if the starting address denoted by A23-A0 is
> > 0000FEh, and three bytes of data are sent to the device, then the first
> > two bytes of data will be programmed at addresses 0000FEh and 0000FFh
> > while the last byte of data will be programmed at address 000000h. The
> > remaining bytes in the page (addresses 000001h through 0000FDh) will not
> > be programmed and will remain in the erased state (FFh). In addition, if
> > more than 256-bytes of data are sent to the device, then only the last
> > 256-bytes sent will be latched into the internal buffer."
> >=20
> >=20
> > Besides, the wear leveling is handled by the ubi layer I guess, at the
> > spi-nor level we write raw data. Maybe Richard and Boris could tell us
> > more but talking with them I've understood that's it is normal for the
> > ubi layer to write at offset 64. =20
>=20
> I'd understand RMW, but pure write seems a bit odd.
>=20
>=20

Well, UBI trusts what the MTD framwork says, and here [1] you say that
the minimum write unit is a byte, so UBI tries to optimize flash usage
by putting the EC and VID headers next to each other.
Now, if you want UBI to act differently, customize ->writesize on a,
but, by doing that, you may introduce regressions because some users
are already using UBI with this layout (ECH @0, VIDH @64).

[1]http://lxr.free-electrons.com/source/drivers/mtd/spi-nor/spi-nor.c#L1368
