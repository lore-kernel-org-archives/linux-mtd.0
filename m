Received: from mailout08.sul.t-online.com ([194.25.134.20])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BE1oG-00071a-So
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 09:01:20 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Dmitry Konyshev <dmitry.konyshev@auriga.ru>
Date: Thu, 15 Apr 2004 09:56:53 +0200
References: <407D59A6.7030102@auriga.ru>
	<200404141744.15766.tglx@linutronix.de> <407E3E9B.70903@auriga.ru>
In-Reply-To: <407E3E9B.70903@auriga.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404150956.53532.tglx@linutronix.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: nand driver bug?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 15 April 2004 09:49, Dmitry Konyshev wrote:
> Thomas Gleixner wrote:
> >>    The driver happens to fall in BUG in nand_select_chip when writing
> >>the last page of a device. It's trying to select_chip in nand_write_ecc
> >>even in case there's nothing left to write.
> >
> >Yep, you're right. I noticed this already and fixed it, but did not yet
> > commit it, as I changed a lot of other things.
> >Should be fixed until tomorrow morning
>
> Any changes should be done in boards' drivers? Fresh CVS version oopses
> in nand_scan.

Yep. I'm writing a short summary at the moment. 
Please check the changes in autcpu12.c

We need one additional buffer. The size is oobsize * pages per block, e.g.
blocksize 16384
pagesize 512
= 32 pages per block
* 16 byte oob
= 512 byte buffer
The pointer must be set before calling nand_scan


-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
