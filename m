Received: from h24-66-20-25.wp.shawcable.net ([24.66.20.25] helo=iders01.iders.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18M8ky-0000Ai-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2002 15:26:41 +0000
From: "Christian Gan" <cgan@iders.ca>
To: <rkaiser@sysgo.de>, <linux-mtd@lists.infradead.org>,
   "yaffs list" <yaffs@toby-churchill.org>
Subject: RE: NAND and concat
Date: Wed, 11 Dec 2002 09:57:09 -0600
Message-ID: <NFBBLPGPLKFIKCCPLALEMEPJCEAA.cgan@iders.ca>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200212111138.gBBBcYs16381@dagobert.svc.sysgo.de>
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

I haven't really given it much thought either, but off the top of my head:

  1.  read_ecc and write_ecc
  2.  read_oob and write_oob

But really, I think this may be OK to do.  Since I need something like this
for my project anyways I can give it a shot and test.  Everything else
should be useable as is.

If anyone can think of anything I should watch out for, advice would be
great.

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Robert Kaiser
> Sent: Wednesday, December 11, 2002 6:47 AM
> To: Christian Gan; linux-mtd@lists.infradead.org; yaffs list
> Subject: Re: NAND and concat
>
>
> Am Mittwoch, 11. Dezember 2002 00:29 schrieb Christian Gan:
> > Is anyone working on concat for NAND flashes?
>
> Probably not.
>
> > I looked though and realised
> > that there is no functionality at the moment for NAND (i.e. no
> support for
> > read/write oob etc).
>
> I must admit that I knew nothing about NAND flashes when I wrote
> the concat
> stuff (and this hasn't improved much in the meantime) :-(.
>
> OTOH, all the concat stuff does is to redirect calls to the
> hardware drivers,
> so, except for the maintaining of OOB data, what NAND specific
> functionality
> would be needed ?
>
> Rob
>
> ----------------------------------------------------------------
> Robert Kaiser                         email: rkaiser@sysgo.de
> SYSGO AG
> Am Pfaffenstein 14                    phone: (49) 6136 9948-762
> D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
