Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0lW6-0002bs-5E
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 14:32:04 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Brian T <btuch@usa.net>
In-Reply-To: <053c01c48c60$4976ad80$fd0ba8c0@briantpc>
References: <042901c48c42$2593cd30$fd0ba8c0@briantpc>
	<045201c48c4b$8407dc40$fd0ba8c0@briantpc>
	<Pine.LNX.4.61.0408271203050.2901@xanadu.home>
	<053c01c48c60$4976ad80$fd0ba8c0@briantpc>
Content-Type: text/plain
Message-Id: <1093631103.16320.14.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Fri, 27 Aug 2004 20:25:03 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: undefined reference to `__ffs'
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-08-27 at 20:04, Brian T wrote:
> So MTD is no longer compatable with the current 2.4 tree?  I just unpacked
> it and didn't see it in linux/asm-i386/bitops.h .  Am I looking in the wrong
> place?

__ffs was never in 2.4. Move to 2.6 or add it to compatmac.h and provide
a nice patch, if you really want to hang on with 2.4

tglx
