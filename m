Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZVSQ-0001kY-R6
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2003 13:51:02 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HHN00KNONOHCG@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 07 Jul 2003 14:50:46 +0200 (MEST)
Date: Mon, 07 Jul 2003 15:48:01 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <FCEAKDJJAPHPLJFINDAJAEDGDEAA.Stephan.Linke@epygi.de>
To: Stephan Linke <Stephan.Linke@epygi.de>, Alex Samoutin <samoutin@hotbox.ru>
Message-id: <200307071548.01226.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <FCEAKDJJAPHPLJFINDAJAEDGDEAA.Stephan.Linke@epygi.de>
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

On Monday 07 July 2003 11:27, Stephan Linke wrote:
> Hi Thomas,
>
> From my experience partial page write is still used by YAFFS in OOB area.
I see, I meant the data area. There we don't use partial programming. For the 
oob area it works with JFFS2. I have to check for YAFFS

> And I don't know how you are doing a journaling FS  on a NAND without
> partial writes.
By writing full data pages all the time.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
