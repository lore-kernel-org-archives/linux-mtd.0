Received: from smtp.lynuxworks.com ([207.21.185.24])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16BIOb-000131-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Dec 2001 16:26:13 +0000
Date: Tue, 4 Dec 2001 08:36:51 -0800 (PST)
From: Aleksander Sanochkin <asanochkin@Lnxw.COM>
To: <joern@wohnheim.fh-wedel.de>
cc: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>
Subject: Re: JFFS1/MTD bug-fixes
Message-ID: <Pine.LNX.4.33.0112040830450.7813-100000@newbast.lynuxworks.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
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

Hi!

>
>
> Hi!
>
> > > We have also added a possibility for run-time partitioning of an
> > > MTD device, and use this usage_counter to prevent deleting of a
> > > partition while it is being used by some process.
> >
> > In that context, I agree that it makes sense. Have you seen Jörn
Engel's
> > rewrite of the partitioning code, which I was intending to look at
merging
> > in 2.5? It would be useful to make that does what you require before
we
> > merge it.
>
> http://wh.fh-wedel.de/~joern/software/kernel/
> http://wh.fh-wedel.de/~joern/software/kernel/mtd.patch.core.2.4.15
>
> Not having seen any code, I fear that your patch won't easily merge
> with mine. But I would like to have a look - it might get rid of some
> dear old problems, commonly known as reboot. :)

Yes, it won't be easy to merge. Though it won't be harder than to merge
your patch with the current MTD code.
