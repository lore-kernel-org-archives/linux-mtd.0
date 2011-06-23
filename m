Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZfdr-00033Y-IA
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 08:52:04 +0000
Received: by pvg20 with SMTP id 20so1102350pvg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 01:51:55 -0700 (PDT)
Subject: RE: NAND OOB data.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 23 Jun 2011 11:52:40 +0300
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6036086@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C6034536@ex-mb1.corp.adtran.com>
	<0A40042D85E7C84DB443060EC44B3FD32A7208F91A@dekaexchange07.deka.local>
	<F9C551623D2CBB4C9488801D14F864C6036086@ex-mb1.corp.adtran.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308819164.18119.106.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Atlant Schmidt <aschmidt@dekaresearch.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-20 at 17:53 +0000, ANDY KENNEDY wrote:
> > -----Original Message-----
> > From: Atlant Schmidt [mailto:aschmidt@dekaresearch.com]
> > Sent: Monday, June 20, 2011 6:14 AM
> > To: ANDY KENNEDY; linux-mtd@lists.infradead.org
> > Subject: RE: NAND OOB data.
> > 
> > Andy:
> > 
> >   If you don't have the old bad block information saved
> >   away somewhere (a bad block table, a scrap of paper,
> >   etc.), then you *CAN'T* completely recover from this
> >   situation; the original bad block data for that chip
> >   is probably irretrievably lost.*
> 
> All the other boards apparently are all good (is that normal?), but,
> I'm not worried about the NAND having KNOWN bad blocks as this board
> is supposed to be mine.

I think someone implemented an utility or ioctl for this, probably
Matthew Castet, but I asked for some more improvements or something, and
he disappeared. Try to find the thread, may be you can continue his
work.

But in general, I think the ideal way would be:

1. be able to distinguish between factory-marked and user-marked bad
blocks.
2. allow unmarking user-marked bad blocks, but not factory marked.

Not sure this is always possible, though.

-- 
Best Regards,
Artem Bityutskiy
