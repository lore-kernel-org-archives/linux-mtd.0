Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VeSk-00018Q-IB
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 22:39:26 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HH300A61YTI8O@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 26 Jun 2003 23:39:18 +0200 (MEST)
Date: Fri, 27 Jun 2003 00:37:05 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <Sea2-F25OGQOuE3chAH00004e5c@hotmail.com>
To: Mark George <ice9973@hotmail.com>, linux-mtd@lists.infradead.org
Message-id: <200306270037.05885.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <Sea2-F25OGQOuE3chAH00004e5c@hotmail.com>
Content-type: text/plain; charset=gb2312
Content-transfer-encoding: 7BIT
Subject: Re: jffs2 over nand flash, kernel panic, help me!
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 17 June 2003 10:22, Mark George wrote:
> My platform is Samsung 44b0x (ARM7TDMI) ,uClinux-2.4.20.
> When I run the nandtest, I got the 'kernel panic'. :(
nandtest is not a useful thing. It needs to be reworked.
> Anybody can give me some advice?
> Sash command shell (version 1.1.1)
> /> nandtest /dev/mtdblock1
> mtdblock_open
> ok
> MEMGETINFOmtdblock_release
> Unhandled fault: alignment exception (93) at 0x00000001
Switch on kernel-mode alignement handler in general setup
-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
