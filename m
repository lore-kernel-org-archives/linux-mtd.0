Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 193Voz-0000hS-62
	for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2003 07:46:05 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HD400LL5841ZF@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 10 Apr 2003 08:45:38 +0200 (MEST)
Date: Thu, 10 Apr 2003 09:45:49 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <200304100020.h3A0KkS29681@marmot.intrinsyc.com>
To: csperandeo@intrinsyc.com, linux-mtd@lists.infradead.org
Message-id: <200304100945.49190.tglx@linutronix.de>
MIME-version: 1.0
References: <200304100020.h3A0KkS29681@marmot.intrinsyc.com>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
Subject: Re: JFFS2 on NAND problems on ppc linux-2.4.21-pre2
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 10 April 2003 02:20, Chris Sperandeo wrote:
> Hi,
>
> Wondering if anyone has experienced a bug described as follows.
>
> I am using the linux powerpc kernel 2.4.21-pre2.  We are using a March 09
> 2003 snapshot for MTD/JFFS2 from http://www.linux-mtd.infradead.org/.
>
> After rebooting the device we occasionally receive the following:
> ...
Could you please upgrade to latest CVS and try again ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
