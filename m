Received: from www.optixsoft.de ([213.187.73.226])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MTYP-00023e-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2002 13:39:05 +0000
Date: Thu, 12 Dec 2002 15:09:11 +0100 (MET)
From: Tobias Otto-Adamczak <toa@indakom.de>
To: <linux-mtd@lists.infradead.org>
cc: Geoffroy Stevenne <geof@hellea.com>,
   =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: bbram access problems
In-Reply-To: <20021212134542.GB29974@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.31.0212121456200.22502-100000@www.optixsoft.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
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

J=F6rn Engel, 2002-12-12, 14:45h:

> > We're trying to use BBRAM on a VersaLogic VSBC-6 m-b.  We use the slram
> > driver and the 2.4.18 kernel.  The problem is that we can't acces the
> > entire memory of the BBRAM, just the first 64k page.
>                                              ^^^
> >
> > Other problem: we added to our lilo.conf:
> >
> > append=3D"slram=3DBBRAM,0xE0000,+0x10000"
>                               ^^^^^^^^
> If you can read hex, you will notice that you told slram to map 64k.
> Change the append line in your /etc/lilo.conf.

I think its correct because that BBRAM (how much is it, anyway ?) is
mapped page-wise into the physical memory space from 0xE0000 - 0xEFFFF
and you have to select pages if you want to access more than the first
64KB.

> > append=3D"slram=3DBBRAM,0xE0000,+0x10000"
>                       ^^^^^^^
> slram took memory from the first Megabyte. Is this correct? Does you
> machine have only 896k of memory plus the bbram? I doubt it. ;-)

According to the manual, that address looks fine. Geoffroy, it also says
"CMOS setup is used to choose between DRAM and PC/104 for three sections
of memory from 0C0000h to 0EFFFFh." (p.52) Did you do the right settings
?

> Figure out, how much memory you have, how much bbram and where the
> bbram starts in the address range. Then you can come back or - better
> yet - read up what the "slram=3D" and "mem=3D" parameters do.
> Understanding the problem beats having it solved by someone else. :-)

Other question: does the slram driver map this area in when it is
already covered by the kernel ?

Regards
Tobias
