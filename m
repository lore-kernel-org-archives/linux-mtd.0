Received: from dragon.actrix.co.nz ([203.96.16.164] helo=desire.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 198QtT-0004k7-P3
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 21:31:04 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "A.L. Klyutchenya" <asoneofus@nm.ru>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 24 Apr 2003 08:32:07 +1200
References: <200304010207.14078.asoneofus@nm.ru>
	<200304021228.44997.tglx@linutronix.de> <200304221249.50740.asoneofus@nm.ru>
In-Reply-To: <200304221249.50740.asoneofus@nm.ru>
MIME-Version: 1.0
Message-Id: <20030423203110.B07D415208@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: K9F5608U0B-YIB0000: 528 byte in page, or 512?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[snip]
> > >
> > > I understand that page it is necessary to write, but what
> > > bring the first image: chain on 512+512.... or 512+16 free +
> > > 512+16 free...
> > >
> > > As even so write? :-) (to hrdware-level)
> >
> > Please read http://linux-mtd.infraded.org/tech/nand.html
>
> I read, and don't find answer.
>
> 1) make jffs2 image: correct erase block-size for NAND (512+16
> page x 32) is 0x4200 or (512 page x 32) 0x4000?

The eraseure size is 0x4000. 
>
> 2) for writing jffs2 image to NAND use only 512byte space on each
> page, or 512+16?

The 512-byte part is written by the write function and the 16 bit "spare" or 
"out of band"  area is written with the write_oob function.

-- Charles
