Received: from c000-h007.c000.snv.cp.net ([209.228.32.71] helo=c000.snv.cp.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 163fPx-0004r4-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 15:24:06 +0000
Message-ID: <003d01c16c58$71c0d7f0$7f01010a@instant802.com>
From: "Simon Barber" <simon@barber.net>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: <linux-mtd@lists.infradead.org>
References: <20011105172238.A10542@wohnheim.fh-wedel.de> <20011106133944.A1828@wohnheim.fh-wedel.de> <000201c16bc4$dae53120$7f01010a@instant802.com> <20011113125222.A2490@wohnheim.fh-wedel.de>
Subject: Re: Bug in mtdblock_ro
Date: Tue, 13 Nov 2001 07:32:42 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
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

I'm travelling right now - so I can't, sorry - but it's a version I checked
out from the anon CVS a few days (maybe 10) ago. With this bug fix it works
great for me. Without the fix I get a kernel panic on trying to mount a
mtd_ro partition as rootfs.

Simon

----- Original Message -----
From: "Jörn Engel" <joern@wohnheim.fh-wedel.de>
To: "Simon Barber" <simon@barber.net>
Cc: <linux-mtd@lists.infradead.org>
Sent: Tuesday, November 13, 2001 3:52 AM
Subject: Re: Bug in mtdblock_ro


> Moin!
>
> > the call in mtdblock_request to MTD_READ/WRITE passes nr_sectors, it
should
> > pass current_nr_sectors.
>
> Could you quickly add, what version has this problem? The filename
> should be enough. When I get back from vacation (Thursday), I will
> have a look at it.
>
> Jörn
>
> --
> If you treat your beta-testers as if they're your most valuable resource,
> they will respond by becoming your most valuable resource.
