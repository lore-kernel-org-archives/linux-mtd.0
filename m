Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196DlQ-0001Oo-Nm
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 19:05:36 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HDI000AE28OTR@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 17 Apr 2003 20:05:13 +0200 (MEST)
Date: Thu, 17 Apr 2003 21:05:05 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <002a01c304fc$e3e4d3c0$a10486da@w0a3t0>
To: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>, csperandeo@intrinsyc.com,
 linux-mtd@lists.infradead.org
Message-id: <200304172105.05365.tglx@linutronix.de>
MIME-version: 1.0
References: <200304101926.h3AJQ8b05913@marmot.intrinsyc.com>
 <002a01c304fc$e3e4d3c0$a10486da@w0a3t0>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
Subject: Re: JFFS2 on NAND reboot problems
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 17 April 2003 18:17, matsunaga wrote:
> It seems to me that the system was rebooted without wbuf flush.
> If it is true, another problem I think is that mount process cannot detect
> the inode inconsistency. This fs should be designed on the premise that
> power failure happens. The last accessing file do not need to be saved, but
> fs does.
> Sorry if this is solved on the latest code

It is designed this way. But we are neither perfect nor can we predict every 
10e12 possibilities to produce a hidden bug.

I cannot reproduce it here. 
That's why I asked for a bainary Image of the flash content, but I received 
none until now.

We can only solve problems, which are either reproducable or which can be 
reproduced by some user supplied pattern / image. 

We all do our very best to make this code stable and reliable, but we need the 
help from _USERS_ to detect insufficiencies. That's the way open source 
software works. If we don't get the requested feedback / help we can only 
say: You got the code. Feel free to fix it.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
