Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 193itm-00029u-CJ
	for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2003 21:43:54 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HD5001DIAWFWQ@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 10 Apr 2003 22:43:28 +0200 (MEST)
Date: Thu, 10 Apr 2003 23:43:37 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <200304101926.h3AJQ8b05913@marmot.intrinsyc.com>
To: csperandeo@intrinsyc.com, linux-mtd@lists.infradead.org
Message-id: <200304102343.37383.tglx@linutronix.de>
MIME-version: 1.0
References: <200304101926.h3AJQ8b05913@marmot.intrinsyc.com>
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

On Thursday 10 April 2003 21:26, Chris Sperandeo wrote:
> I have pulled the latest from CVS server, applied the changes and retested.
> There seems to be no change in behaviour.  Any other suggestions?

Can you send me a binary image of your flash ?

Turn on JFFS2 debugging to level 1 and log the debug messages on a serial  
console. Compress it and send it to me or put it anywhere for download. 

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
