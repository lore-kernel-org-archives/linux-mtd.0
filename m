Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGKKS-0006CD-GN
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 06:11:01 +0000
Date: Fri, 24 Jun 2016 08:10:37 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: only read UBI_VID_HDR_SIZE when reading the vid_hdr
Message-ID: <20160624061037.GH20657@pengutronix.de>
References: <1466688561-16103-1-git-send-email-s.hauer@pengutronix.de>
 <576BF461.2020108@nod.at> <20160623150631.GG20657@pengutronix.de>
 <576BFD36.8090702@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <576BFD36.8090702@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 23, 2016 at 05:16:06PM +0200, Richard Weinberger wrote:
> Am 23.06.2016 um 17:06 schrieb Sascha Hauer:
> >>>  	p = (char *)vid_hdr - ubi->vid_hdr_shift;
> >>>  	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
> >>> -			  ubi->vid_hdr_alsize);
> >>> +			  UBI_VID_HDR_SIZE);
> >>
> >> Hmm, I fear this will break as soon ubi->vid_hdr_shift is non-zero.
> > 
> > Ok, just tried and indeed it does break. Would it be an option to read
> > UBI_VID_HDR_SIZE + ubi->vid_hdr_shift bytes instead?
> 
> Well, you need to satisfy the trick UBI does.
> Please read the huge comment on it on top of io.c.
> 
> Since in most cases ubi->vid_hdr_shift is 0 we could also do a fast path.
> i.e.
> if (ubi->vid_hdr_shift)
> 	read_len = ubi->vid_hdr_alsize
> else
> 	read_len = UBI_VID_HDR_SIZE;

Yes. I thought reading UBI_VID_HDR_SIZE + ubi->vid_hdr_shift has the
advantage that even with vid_hdr_shift != 0 we can profit from reading
subpages. I tested it with a vid hdr offset of 512 and it works ok.

> 
> But first I have to review a view call sites. :-)

Yes, please. It lowers the chance that I break the kernel ;)

> 
> Can you tell a bit more on the NAND you're facing that speedup?
> I find it surprising that you gain a full second.

It's a Micron Nand with a page size of 8192+448. On an i.MX6 we only
have to read 512 bytes when reading the vid header.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
