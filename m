Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196EsK-00021z-2Y
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 20:16:48 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HDI000JT5JCTR@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 17 Apr 2003 21:16:25 +0200 (MEST)
Date: Thu, 17 Apr 2003 22:16:17 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <002001c30514$f78e78a0$150a0ac0@jbmsoft.com>
To: "Brian T." <btuch@usa.net>, linux-mtd@lists.infradead.org
Message-id: <200304172216.17590.tglx@linutronix.de>
MIME-version: 1.0
References: <002001c30514$f78e78a0$150a0ac0@jbmsoft.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: jffs2 compression question
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 17 April 2003 21:10, Brian T. wrote:
> Hi,
>
> I have jffs2 running on a 2.4.20 kernel custom Embedded box with 16MB ROM
> (Intel flash) and 32MB RAM.  The file system is about 52% full, and has
> about 22MB of free RAM.  When I copy 4 ~1.6MB programs over to the ROMFS I
> loose about 3MB of space with compression.  The system however also uses
> another ~3MB RAM once the files are done being copied.  My question is,
> when does (if ever) that 3MB RAM get freed up?  If I delete the files I
> just copied, the RAM appears to be freed up.   If I reboot the unit, the
> RAM gets reset back to the original 22MB RAM free.

Have you taken the +/- buffers/cache into account ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
