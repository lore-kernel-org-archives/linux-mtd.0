Received: from mailrelay010.isp.belgacom.be ([195.238.6.177])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W70rL-00089t-70
 for linux-mtd@lists.infradead.org; Sat, 25 Jan 2014 10:53:08 +0000
Date: Sat, 25 Jan 2014 10:53:58 +0800
From: Fabian Frederick <fabf@skynet.be>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/4] mtd: block2mtd: char mtd major check
Message-Id: <20140125105358.f702dec03b3728270f5ca4d1@skynet.be>
In-Reply-To: <20140124214836.GA14088@localhost>
References: <20140123204947.fc1c03dc0a1624d3347b3837@skynet.be>
 <20140124214836.GA14088@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: joern@lazybastard.org, akpm@linux-foundation.org, rdunlap@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 24 Jan 2014 19:10:11 -0300
Ezequiel Garcia <ezequiel.garcia@free-electrons.com> wrote:

> On Thu, Jan 23, 2014 at 08:49:47PM +0100, Fabian Frederick wrote:
> > Deny use of a char mtd device to map as a block device.
> >=20
> > Signed-off-by: Fabian Frederick <fabf@skynet.be>
> > ---
> >  drivers/mtd/devices/block2mtd.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/bloc=
k2mtd.c
> > index d9fd87a..0efee5b 100644
> > --- a/drivers/mtd/devices/block2mtd.c
> > +++ b/drivers/mtd/devices/block2mtd.c
> > @@ -244,7 +244,8 @@ static struct block2mtd_dev *add_device(char *devna=
me, int erase_size)
> >  	}
> >  	dev->blkdev =3D bdev;
> > =20
> > -	if (MAJOR(bdev->bd_dev) =3D=3D MTD_BLOCK_MAJOR) {
> > +	if ((MAJOR(bdev->bd_dev) =3D=3D MTD_BLOCK_MAJOR) ||
> > +	    (MAJOR(bdev->bd_dev) =3D=3D MTD_CHAR_MAJOR)) {
> >  		pr_err("attempting to use an MTD device as a block device\n");
> >  		goto devinit_err;
> >  	}
> > --=20
> > 1.8.1.4
>=20
> Now that the changes are separated on a per-patch basis they're much
> much easier to review. Thanks!
>=20
> Regarding this changes, it seems to me it's not needed. Are you sure
> you can attach "block2mtd" to a char MTD device?
>=20
> That would be odd, given this function calls blkdev_get_by_{path/dev};
> which will check the device is of block type in the first place.
>=20
You're absoletly right.Thanks for your time checking these small patches.
As only patch 2 seems useful , I've sent version 2 with new error names.

Regards,
Fabian

> What's your motivation for this change?
> --=20
> Ezequiel Garc=EDa, Free Electrons
> Embedded Linux, Kernel and Android Engineering
> http://free-electrons.com
