Received: from pc-5.tkhnl.demon.nl
	([195.11.235.101] helo=intranet.turnkiek.nl ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18OjKZ-0000hW-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2002 18:54:08 +0000
Reply-To: <wolff@turnkiek.nl>
From: "Carl Wolff" <wolff@turnkiek.nl>
To: "'Russ Dill'" <Russ.Dill@asu.edu>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: problem using jffs2 on DiskOnChip
Date: Wed, 18 Dec 2002 20:26:47 +0100
Message-ID: <001a01c2a6cb$6943d420$446410ac@lt-gw8l30j.turnkiek.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1040238853.2843.3.camel@timmy>
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


> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Russ Dill
> Sent: woensdag 18 december 2002 20:14
> To: wolff@turnkiek.nl
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: problem using jffs2 on DiskOnChip
>
>
> On Wed, 2002-12-18 at 12:03, Carl Wolff wrote:
> > Hello,
> >
> > I've got a problem with jffs2. I'm using a DiskOnChip
> module type milennium.
> >
> > Do I need NFTL support?
> > I've managed to copy a jffs2 image onto the diskonchip
> using cp image
> > /dev/mtd/0.
>
> eraseall /dev/mtd/0

I did it. I checked the contents after the eraseall and saw only FF's.
Then I copied the image and verified the contents of the device with the
orginial file: they are the same.
So I think the data is correctly put into the flash....

>
> --
> Russ Dill <Russ.Dill@asu.edu>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
