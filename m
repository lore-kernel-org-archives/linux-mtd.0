Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Ynra-0001vm-K2
	for <linux-mtd@lists.infradead.org>; Sat, 05 Jul 2003 15:18:06 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HHK00E1I2DRL4@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Sat, 05 Jul 2003 16:17:52 +0200 (MEST)
Date: Sat, 05 Jul 2003 17:15:14 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <FCEAKDJJAPHPLJFINDAJCEAHDEAA.Stephan.Linke@epygi.de>
To: Stephan Linke <Stephan.Linke@epygi.de>, Alex Samoutin <samoutin@hotbox.ru>
Message-id: <200307051715.14902.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <FCEAKDJJAPHPLJFINDAJCEAHDEAA.Stephan.Linke@epygi.de>
Content-type: text/plain; charset=windows-1251
Content-transfer-encoding: 7BIT
cc: Linux-Mtd <linux-mtd@lists.infradead.org>
Subject: Re: Fw: corrupt my NAND flash device
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 03 July 2003 07:44, Stephan Linke wrote:
> Hi Alex,
>
> I just had a look at this mail and one of the problems you mention just
> reminds me of me experiences a few month ago. You say that write verify on
> you NAND flash sometimes failes. I had the same on my board using YAFFS on
> a NAND. I figured out that verify failes during partial writes. The reason
> the compair routine doesn'T deal with that special situation where there is
> already some data in the page and someone writes only a few 0's leaving the
> rest at 0xFF since the manual says to do so in partial writes. 

We have canceled partial page writes some time ago. 

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
