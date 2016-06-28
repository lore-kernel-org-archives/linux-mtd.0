Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHuPI-0001Om-A4
 for linux-mtd@lists.infradead.org; Tue, 28 Jun 2016 14:54:33 +0000
Message-ID: <1467125648.2456.57.camel@gmail.com>
Subject: Re: [PATCH v2] UBI: only read necessary size when reading the VID
 header
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Date: Tue, 28 Jun 2016 17:54:08 +0300
In-Reply-To: <20160628140500.GN20657@pengutronix.de>
References: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
 <1467118829.2456.40.camel@gmail.com>
 <20160628140500.GN20657@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2016-06-28 at 16:05 +0200, Sascha Hauer wrote:
> On Tue, Jun 28, 2016 at 04:00:29PM +0300, Artem Bityutskiy wrote:
> > On Tue, 2016-06-28 at 13:51 +0200, Sascha Hauer wrote:
> > > When reading the vid hdr from the device UBI always reads a whole
> > > page. Instead, read only the data we actually need and speed up
> > > attachment of UBI devices by potentially making use of reading
> > > subpages if the NAND driver supports it.
> > > 
> > > Since the VID header may be at offset vid_hdr_shift in the page
> > > and
> > > we can only read from the beginning of a page we have to add that
> > > offset to the read size.
> > > 
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > ---
> > > 
> > > change since v1:
> > > - properly handle vid_hdr_shift != 0
> > > 
> > >  drivers/mtd/ubi/io.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> > > index 10cf3b5..ff8cafe 100644
> > > --- a/drivers/mtd/ubi/io.c
> > > +++ b/drivers/mtd/ubi/io.c
> > > @@ -1019,7 +1019,7 @@ int ubi_io_read_vid_hdr(struct ubi_device
> > > *ubi,
> > > int pnum,
> > >  
> > >  	p = (char *)vid_hdr - ubi->vid_hdr_shift;
> > >  	read_err = ubi_io_read(ubi, p, pnum, ubi-
> > > >vid_hdr_aloffset,
> > > -			  ubi->vid_hdr_alsize);
> > > +			  ubi->vid_hdr_shift +
> > > UBI_VID_HDR_SIZE);
> > 
> > There are pages and subpages underneath. Let me use old sizes. Say,
> > 2KiB pages, and 512KiB subpages.
> > 
> > If the VID header is in the first subpage, the MTD level probably
> > needs
> > to read the entire subpage anyway, because of per-subpage ECC. This
> > is
> > why we give it a buffer of subpage size.
> 
> The gpmi NAND driver allows reading subpages (NAND_SUBPAGE_READ is
> set), but
> it does not allow writing subpages (NAND_NO_SUBPAGE_WRITE is also
> set).

OK. In the generic code (nand_base.c) though you can find that if the
read request is for entire page or subpage, then the data is transfared
from the chip to the supplied buffer, ECC is verified, and the data are
returned. If the read request is for a fraction of a page or subpage,
then the data are transferred from the chip to an internal buffer, ECC
is verified, and then the required piece of data are copied from the
internal buffer to the supplied buffer. I.e., more memory copy
operations.

The code is very twisted, but I think the logic is in
'nand_do_read_ops()', you'll notice that in the "not aligned" case the
special 'chip->buffers->databuf' is used, otherwise the buffer supplied
by UBI is used.
