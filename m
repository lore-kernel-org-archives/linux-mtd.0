Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJUT9-0008Pa-5P
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2005 06:42:39 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: zheng wei <jeanwelly@gmail.com>
In-Reply-To: <c2bc1f405040702476af04972@mail.gmail.com>
References: <c2bc1f405040702476af04972@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 07 Apr 2005 13:42:38 +0200
Message-Id: <1112874158.4228.130.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Error found when mounting a NANDFlash block as yaffs
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-04-07 at 17:47 +0800, zheng wei wrote:
> do.Linux version 2.4.18-rmk7-pxa1 (root@localhost.localdomain) (gcc

1. The NAND driver in 2.4.18 is broken and not usable.

2. Please read:
http://www.linux-mtd.infradead.org/source.html#kernelversions

> VFS: Mounted root (cramfs filesystem).

CRAMFS on NAND is not a really good idea. CRAMFS is not bad block aware.

> Unable to handle kernel NULL pointer dereference at virtual address 00000004
> pgd = c3eb4000
> ....
>  r4 = 0204FE88

Please read: linux/Documentation/oops-tracing.txt

tglx
