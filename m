Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZnFN-0003Tg-UX
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2003 08:50:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <200307071548.01226.tglx@linutronix.de>
References: <FCEAKDJJAPHPLJFINDAJAEDGDEAA.Stephan.Linke@epygi.de>
	 <200307071548.01226.tglx@linutronix.de>
Message-Id: <1057650656.28965.49.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 08 Jul 2003 08:50:56 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Alex Samoutin <samoutin@hotbox.ru>
cc: Linux-Mtd <linux-mtd@lists.infradead.org>
cc: Stephan Linke <Stephan.Linke@epygi.de>
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-07-07 at 14:48, Thomas Gleixner wrote:
> I see, I meant the data area. There we don't use partial programming. For the 
> oob area it works with JFFS2. 

Not always. I've encountered some Toshiba NAND chips which zero the
entire data page and the unwritten part of the OOB area if you try a
partial OOB write. In fact, even if you try a complete OOB write they
zero the data page.

Issuing a RESET before the write command fixes this.

-- 
dwmw2
