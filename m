Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18bxRQ-0000c9-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Jan 2003 06:35:52 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H9700IXWIEIVU@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Fri, 24 Jan 2003 08:06:19 +0100 (MET)
Date: Fri, 24 Jan 2003 08:04:45 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Pb : JFFS2 & NAND with bad blocks
In-reply-to: <002e01c2c323$b3c99740$0200a8c0@windows>
To: Olivier ERIBON <olivier.eribon@free.fr>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200301240804.45513.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <002e01c2c323$b3c99740$0200a8c0@windows>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thursday 23 January 2003 22:09, Olivier ERIBON wrote:
> Hi!
>
> I use the latest CVS MTD together with a 64MB NAND Flash and
> JFFS2 (from 2.4.18 Montavista kernel).
>
> I patch mtd only (without -j option in order to patch jffs2 because I have
> a problem with ZLIB)
That's the reason for your problem.

> [oeribon@serdnt25 linux-2.4.18_mvl30]$ grep JFFS2 .config
> CONFIG_JFFS2_FS=y
> CONFIG_JFFS2_FS_DEBUG=0

CONFIG_JFFS2_NAND=y is missing.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
