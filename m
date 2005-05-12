Received: from mail2.racnet.net ([213.144.11.11])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DW61N-0003d7-WA
	for linux-mtd@lists.infradead.org; Thu, 12 May 2005 01:14:07 -0400
Message-ID: <4282E615.9010502@rac.de>
Date: Thu, 12 May 2005 07:13:57 +0200
From: Marcus Mikolaiczyk <m.mikolaiczyk@rac.de>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <4281C196.2010806@rac.de> <1115848017.22180.112.camel@tglx>
In-Reply-To: <1115848017.22180.112.camel@tglx>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Patching only NAND specific stuff possible?
Reply-To: m.mikolaiczyk@rac.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>Considering the four Layers (jffs2,mtd,nand,hardware-drivers) it should
>>be possible onloy to 'update' the nand and hardware-drivers stuff.
>>Any objections to this?
> 
> 
> No, as long as you do not ask questions, why it doesnt work. :)
> The current nand driver needs the current mtd layer and JFFS2 from the
> last century will not work with those.

Thanks for this info. The NAND is a large page one with some extented
commands for large page devices. I have an older driver on the system so
the way is to upgrade this one to an appropriate one supporting the
large page nand with it's commands.

Marcus
