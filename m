Received: from atllc.net ([24.242.128.194] helo=mail.atllc.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18P3dw-0002q1-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2002 16:35:28 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Brian Austin <brian@atllc.net>
To: <wolff@turnkiek.nl>
Subject: Re: problem using jffs2 on DiskOnChip
Date: Thu, 19 Dec 2002 06:21:38 -0600
References: <000301c2a773$6f5d5360$446410ac@lt-gw8l30j.turnkiek.nl>
In-Reply-To: <000301c2a773$6f5d5360$446410ac@lt-gw8l30j.turnkiek.nl>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200212190621.38374.brian@atllc.net>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thursday 19 December 2002 09:29, Carl Wolff wrote:

use ext3 instead.  Depending onhow big your chip is.
or reiserfs


> Hello David,
>
> OK. Two questions:
> 1) Does JFFS2 actually work on a DiskOnChip?
> 2) Other alternatives? We need a powersafe filesystem on DiskOnChip.
>
>
> Thanks, and happy newyear, I'm going on holiday now.
>
> Carl.
>
> > -----Original Message-----
> > From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
> > Woodhouse
> > Sent: donderdag 19 december 2002 11:14
> > To: wolff@turnkiek.nl
> > Cc: linux-mtd@lists.infradead.org
> > Subject: Re: problem using jffs2 on DiskOnChip
> >
> > wolff@turnkiek.nl said:
> > > Short read: 0x10 bytes at 0x000001f0 instead of requested 44
> >
> > The DiskOnChip hardware driver hasn't been used much with
> > anything other
> > than NFTL. It appears not to do a full read if you ask it to
> > read a range
> > of data which crosses a page boundary. Fix it accordingly by
> > putting an
> > appropriate loop in instead of...
> >
> >         /* Don't allow a single read to cross a 512-byte
> > block boundary */
> >         if (from + len > ((from | 0x1ff) + 1))
> >                 len =3D ((from | 0x1ff) + 1) - from;
> >
> > --
> > dwmw2
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
