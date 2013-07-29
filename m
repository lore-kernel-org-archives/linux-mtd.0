Received: from post.merula.co.uk ([217.146.97.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3i24-0002vP-KT
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2013 07:38:18 +0000
From: John Parker <John.Parker@lucyautomation.co.uk>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 29 Jul 2013 08:35:43 +0100
Subject: RE: ubifs on SPI NOR Flash with uniform 4k erase block size
Message-ID: <EAF1F21DA385DA4797F21C5DCAEF6BAC45856DEF36@AUTOSERVER1.auto.local>
References: <EAF1F21DA385DA4797F21C5DCAEF6BAC45856DEF1C@AUTOSERVER1.auto.local>
 <CAN8TOE_khPJN0-4+6fWyNZvqSmYeF2ju1kb-cLV_KmpLE-Rw3g@mail.gmail.com>
In-Reply-To: <CAN8TOE_khPJN0-4+6fWyNZvqSmYeF2ju1kb-cLV_KmpLE-Rw3g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Brian Norris [mailto:computersforpeace@gmail.com]
> Sent: 27 July 2013 20:50
> To: John Parker
> Cc: linux-mtd@lists.infradead.org; Artem Bityutskiy
> Subject: Re: ubifs on SPI NOR Flash with uniform 4k erase block size
>=20
> Hi John,
>=20
> On Fri, Jul 26, 2013 at 4:28 AM, John Parker
> <John.Parker@lucyautomation.co.uk> wrote:
> > I'm trying to get ubifs to work optimally on an 2M SPI NOR flash which =
has a
> 4k erase block size. The device is correctly recognised by the m25p80 dri=
ver
> which specifies that it supports 4k sectors.
> >
> > Mtd-utils is 1.5.0. Kernel is 2.6.31 but with a newer m25p80 driver to
> support the specific write commands for this particular flash device.
> >
> > Mtdinfo reports it correctly
> > Ubiformat, ubiattach, and ubimkvol all work as expected and ubinfo
> reports that the device has a PEB of 4096 and LEB of 3968.
> >
> > However, when I use mkfs.ubifs -v /dev/ubi0_0 it complains that the LEB=
 is
> too small and should be a minimum of 15360 (UBIFS_MIN_LEB_SZ).
> >
> >         Error: too small LEB sixe 3968, minimum is 15360
> >
> > (note there is an error in mkfs.ubifs.c in that the validate_options()
> > function reports c->min_io_size instead of c->leb_size if c->leb_size
> > is less than UBIFS_MIN_LEB_SZ - confusing but easy to fix)
> >
> > Where does the 15*1024 value for UBIFS_MIN_LEB_SZ come from in terms
> of the ubifs design? I know it's defined in ubifs-media.h - what I mean i=
s why
> is it 15k?
> >
> > Is it really a problem? If I take out the 4k sector capability from the=
 device
> spec in the m25p80 driver and let it use the 64k block size I only get 32=
 PEBs
> but the mkfs.ubifs works and I can mount and use the filesystem.
> >
> > There are a large number of these 4k uniform erase block devices out th=
ere
> so others must have hit this problem.
> >
> > Any ideas?
>=20
> I'm not an expert on the design of UBIFS, but it seems like
> UBIFS_MIN_LEB_SZ (15KiB) and UBIFS_MAX_LEB_SZ (2MiB) are rather
> arbitrary. And we may run into this same problem on the MAX size, since I
> hear there are some 4MiB eraseblock MLC NAND just around the corner.
>=20
> In fact, these MAX and MIN are not used in mkfs.ubifs other than to
> "validate" the input parameters. Perhaps they can be dropped entirely, an=
d
> the user is left at their own risk if they have "too large" or "too small=
" LEB
> size. But it's important to understand if there are real design reasons f=
or
> limiting the LEB size. So I'll leave the final answer to this question to=
 Artem,
> since he is much more familiar with the internals of UBIFS.
>=20
> Brian

Hi Brian

While the Max and Min are only used to validate - c->leb_size is used all o=
ver the place. If I comment out the min size check, I get a Segmentation vi=
olation when I run the mkfs.ubifs which strikes me as being odd but fair if=
 there is an internal limitation on the minimum LEB size.

I'll see if I can find where the segv is happening.

Regards

John
