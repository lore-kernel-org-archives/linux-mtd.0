Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHtdj-0002Mk-Od
 for linux-mtd@lists.infradead.org; Tue, 28 Jun 2016 14:05:24 +0000
Date: Tue, 28 Jun 2016 16:05:00 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] UBI: only read necessary size when reading the VID
 header
Message-ID: <20160628140500.GN20657@pengutronix.de>
References: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
 <1467118829.2456.40.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1467118829.2456.40.camel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 28, 2016 at 04:00:29PM +0300, Artem Bityutskiy wrote:
> On Tue, 2016-06-28 at 13:51 +0200, Sascha Hauer wrote:
> > When reading the vid hdr from the device UBI always reads a whole
> > page. Instead, read only the data we actually need and speed up
> > attachment of UBI devices by potentially making use of reading
> > subpages if the NAND driver supports it.
> > 
> > Since the VID header may be at offset vid_hdr_shift in the page and
> > we can only read from the beginning of a page we have to add that
> > offset to the read size.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> > 
> > change since v1:
> > - properly handle vid_hdr_shift != 0
> > 
> >  drivers/mtd/ubi/io.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> > index 10cf3b5..ff8cafe 100644
> > --- a/drivers/mtd/ubi/io.c
> > +++ b/drivers/mtd/ubi/io.c
> > @@ -1019,7 +1019,7 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi,
> > int pnum,
> >  
> >  	p = (char *)vid_hdr - ubi->vid_hdr_shift;
> >  	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
> > -			  ubi->vid_hdr_alsize);
> > +			  ubi->vid_hdr_shift + UBI_VID_HDR_SIZE);
> 
> There are pages and subpages underneath. Let me use old sizes. Say,
> 2KiB pages, and 512KiB subpages.
> 
> If the VID header is in the first subpage, the MTD level probably needs
> to read the entire subpage anyway, because of per-subpage ECC. This is
> why we give it a buffer of subpage size.

The gpmi NAND driver allows reading subpages (NAND_SUBPAGE_READ is set), but
it does not allow writing subpages (NAND_NO_SUBPAGE_WRITE is also set).
With this mtd->subpage_sft becomes 0 and ubi->hdrs_min_io_size becomes
the full page size.
UBI does not distinguish between the minimum read size and the minimum
write size. We could pass this information from mtd to UBI, then UBI
could make use of it.

> 
> Now if you give it a buffer of smaller size, say, 256 bytes, MTD will
> have to read the subpage into its own buffer first, validate ECC, then
> copy 256 bytes from the internal buffer to your buffer. Compare this
> with MTD copying data directly to your buffer.

BTW ubi_io_read_ec_hdr() also reads non subpage aligned sizes when
reading the EC header, so at least this function has the right default
for my setup ;)

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
