Received: from gate.epygi.de ([212.126.211.241])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZSHY-0001G5-Gv
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2003 10:27:36 +0100
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: <tglx@linutronix.de>, "Alex Samoutin" <samoutin@hotbox.ru>
Date: Mon, 7 Jul 2003 11:27:46 +0200
Message-ID: <FCEAKDJJAPHPLJFINDAJAEDGDEAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
In-Reply-To: <200307051715.14902.tglx@linutronix.de>
Content-Type: text/plain;
	charset="windows-1251"
Content-Transfer-Encoding: 7bit
cc: Linux-Mtd <linux-mtd@lists.infradead.org>
Subject: RE: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

>From my experience partial page write is still used by YAFFS in OOB area. And I don't know how you are doing a journaling FS  on a
NAND without partial writes.

Stephan

> -----Original Message-----
> From: Thomas Gleixner [mailto:tglx@linutronix.de]
> Sent: Samstag, 5. Juli 2003 17:15
> To: Stephan Linke; Alex Samoutin
> Cc: Linux-Mtd
> Subject: Re: Fw: corrupt my NAND flash device
>
>
> On Thursday 03 July 2003 07:44, Stephan Linke wrote:
> > Hi Alex,
> >
> > I just had a look at this mail and one of the problems you mention just
> > reminds me of me experiences a few month ago. You say that write verify on
> > you NAND flash sometimes failes. I had the same on my board using YAFFS on
> > a NAND. I figured out that verify failes during partial writes. The reason
> > the compair routine doesn'T deal with that special situation where there is
> > already some data in the page and someone writes only a few 0's leaving the
> > rest at 0xFF since the manual says to do so in partial writes.
>
> We have canceled partial page writes some time ago.
>
> --
> Thomas
> ________________________________________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx@linutronix.de
>
>
