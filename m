Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0eFe-00083X-I3
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 06:18:51 -0500
Received: from custom-daemon.mailout1.samsung.com by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	id <0IBW00J04FFBJ9@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 20:18:47 +0900 (KST)
Received: from ep_mmp2 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IBW003F6FFBVL@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 20:18:47 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPSA id <0IBW0090JFFB9Z@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 20:18:47 +0900 (KST)
Date: Mon, 14 Feb 2005 20:18:47 +0900
From: kyungmin park <kyungmin.park@samsung.com>
In-reply-to: <1108376630.16612.294.camel@tglx.tec.linutronix.de>
To: tglx@linutronix.de
Message-id: <0IBW0090KFFB9Z@mmp2.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=ks_c_5601-1987
Content-transfer-encoding: 7BIT
Cc: 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: RE: [RFC] adding support for OneNAND flash memory
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[snip]
> May be it makes sense to put it to drivers/mtd/nand/onenand if some
> parts of the existing code (like BBT, etc) may be reused? Possibly,
> you'll need to split the existing code on what is NAND-specific and what
> is OK for both OneNAND and NAND.
> 
> => As I said before, it's difficult to modify/extend current nand
directory
> to support OneNAND. That's why I suggested to add onenand directory.

> It's not hard to extend. Just add onenand.c to it, if thats all what is
> needed. The question is whether the bad block table code can be shared
> or not. I agree that nand_base.c can not be tweaked for OneNAND.

Although OneNAND uses NAND core internally, the interface is very different
from NAND. The viewpoint of the hardware it seems to be connected with NOR.
Also OneNAND supports synchronous burst read as NOR does
I wonder the different interface of flash putting together is accptable?

Currently, I don't apply bad block table code to onenand. But I think
there's no problem to use current bbt code.
