Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8Jvw-0005dp-GQ
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 11:46:36 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: ahgu <ahgu@ahgu.homeunix.com>
In-Reply-To: <115601c5a98b$8b856290$1f1a12ac@atitech.com>
References: <10af01c5a978$c336df10$1f1a12ac@atitech.com>
	<1124977495.20120.111.camel@tglx.tec.linutronix.de>
	<115601c5a98b$8b856290$1f1a12ac@atitech.com>
Content-Type: text/plain
Date: Thu, 25 Aug 2005 15:47:24 +0000
Message-Id: <1124984845.20120.116.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: simulate a bad NAND block cause kernel hang
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-25 at 11:41 -0400, ahgu wrote:
> I am using 2.4.18 kernel.

Please read
http://www.linux-mtd.infradead.org/source.html#kernelversions


> jffs2_erase_failed(c, jeb);is the last function before the fault condition 
> get triggered.
> Where can I find the diff between 2.4.18 and 2.4.20?

diff -urN linux-2.4.18 linux-2.4.20 >veryvery_broken_vs_very_broken.diff


2.4. kernels have no working NAND support and will never get it.

tglx
