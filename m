Received: from flock1.newmail.ru ([212.48.140.157])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 197tkZ-00061r-IX
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 10:07:39 +0100
From: "A.L. Klyutchenya" <asoneofus@nm.ru>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 22 Apr 2003 13:06:58 +0400
References: <200304010207.14078.asoneofus@nm.ru>
	<200304010943.04279.asoneofus@nm.ru> <200304021228.44997.tglx@linutronix.de>
In-Reply-To: <200304021228.44997.tglx@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200304221249.50740.asoneofus@nm.ru>
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 8bit
Subject: Re: K9F5608U0B-YIB0000: 528 byte in page, or 512?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2 Апрель 2003 14:28, Thomas Gleixner написал:
> On Tuesday 01 April 2003 13:02, A.L. Klyutchenya wrote:
> > Dear sir,
> > Thank you for quick answer.
> >
> > 1 Апрель 2003 07:36, Charles Manning написал:
> > > This is NAND flash. Do not try to treat it as NOR flash.
> > > Use it with mtd/nand  and use YAFFS or JFFS2 file system.
> >
> > I want to write the first image, for booting system. I
> > create this image (with kernel, MTD & Co). I have a
> > possibility his write. Herewith: I have an physical access
> > to page: size 256+256+16, and block on 32 pages. While NO
> > MTD and NO kernel!
> >
> > > You must write NAND in whole pages, not on a per-byte
> > > basis.
> >
> > I understand that page it is necessary to write, but what
> > bring the first image: chain on 512+512.... or 512+16 free +
> > 512+16 free...
> >
> > As even so write? :-) (to hrdware-level)
>
> Please read http://linux-mtd.infraded.org/tech/nand.html

I read, and don't find answer.

1) make jffs2 image: correct erase block-size for NAND (512+16 
page x 32) is 0x4200 or (512 page x 32) 0x4000?

2) for writing jffs2 image to NAND use only 512byte space on each 
page, or 512+16?

-- 
ВсехБлаг!      
      ____   __
     /   |  / / А. Л. Клютченя
    / /| | / /  (asoneofus)
   / /_| |/ /   mail:   asoneofus@kde.ru
  / ____  _ \   www:    http://www.qt.kde.ru
 / /   | | \ \  icq:    113679387
/_/    |_|  \_\ 
