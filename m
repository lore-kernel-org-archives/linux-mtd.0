Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19cuqt-0006TD-IF
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2003 23:34:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: llandre <r&d@wawnet.biz>
In-Reply-To: <5.1.1.6.0.20030716101901.026acca0@192.168.2.1>
References: <5.1.1.6.0.20030715182633.027cd5c0@dns.struinfo.it>
	 <5.1.1.6.0.20030715182633.027cd5c0@dns.struinfo.it>
	 <5.1.1.6.0.20030716101901.026acca0@192.168.2.1>
Message-Id: <1058394863.2914.30.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 16 Jul 2003 23:34:23 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
cc: tglx@linutronix.de
cc: linux-mtd@lists.infradead.org
Subject: Re: Help to understand error messages (MTD on Samsung NAND chips)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-07-16 at 09:51, llandre wrote:
> thanks for your quick response. I downloaded and applied the latest=20
> snapshot (2003-07-15) but, after that, I can't build my own low-level=20
> driver, derived it from Marius Gr=C3=83=C2=B6ger's edb7312.c, anymore :-(

I changed a lot of stuff in the nand drivers. In drivers/mtd/nand, run
the command: cvs diff -up -D "last month" edb7312.c

> I have a very strange error about the __init end __exit keywords?!?!

#include <linux/init.h>

> Besides, I had a look at the new MTD's sources and I saw that some=20
> functions changed the formal parameteres (for example nand_scan).

Add the extra 'struct mtd_info *' argument to your own methods; you can
ignore it if you want. Pass '1' as the second argument to nand_scan()
since you only have one chip there.

--=20
dwmw2
