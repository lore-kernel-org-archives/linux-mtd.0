Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Qhda-0007jI-Ed
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 07:02:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Chris <csperandeo@intrinsyc.com>
In-Reply-To: <Pine.LNX.4.44.0306121704110.1757-100000@intrinsyc.com>
References: <Pine.LNX.4.44.0306121704110.1757-100000@intrinsyc.com>
Message-Id: <1055484161.16455.133.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 13 Jun 2003 07:02:41 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Reliability of NAND JFFS2 vs YAFFS for Embedded Systems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-06-13 at 01:05, Chris wrote:
> I was hoping that anyone who had some experience with JFFS2 and YAFFS NAND 
> devices could give a good idea of the reliability of both filesystems.  I 
> have attempted the JFFS2 filesystem on Toshiba NAND TC58256AFT with some 
> success but have encountered CRC errors when rebooting or interrupting 
> power during writing.

Yes, of course you do. That's what the CRC is _for_ -- to detect nodes
which were partially-written due to such circumstances. 

Do you actually see corruption or are you just complaining about the
verbosity of the file system?

> I am considering moving to the YAFFS filesystem due to reliablity 
> concerns, but I am also wondering if YAFFS will have its own can of 
> worms.  I would like to have reliability, performance and space but 
> reliability is the most important concern. 
> 
> Does anyone have experience with testing reliability of both 
> configurations?  
> If so what were the resutls?

There's been powerfail testing done on JFFS2 on NOR; not yet for NAND
and there are some known corner cases which need sorting out before I
really undertake that. 

-- 
dwmw2
