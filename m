Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CEXCS-0001kq-Oj
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 14:04:41 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: skorinkod@mosk.ru
In-Reply-To: <200410042126.10303.skorinkod@mosk.ru>
References: <200410011858.28776.skorinkod@mosk.ru>
	<1096751135.21297.73.camel@thomas>
	<200410042126.10303.skorinkod@mosk.ru>
Content-Type: text/plain
Message-Id: <1096912615.21297.429.camel@thomas>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 19:56:55 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with DiskOnChip 2000
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-04 at 19:26, Dmitry Skorinko wrote:
> oops, it's mistake. Knoppix 3.6 has 2.6.7 kernel....
> :)
> ok, I wil do install linux diskette with 2.6.8.1 
> but what modules i must have there??

drivers/mtd/nand/diskonchip

> what about 2.4.x kernel? Will these new drivers included in this kernels? With 
> 2.6 I must rewrite other self drivers and it's not best way for me...

The MTD CVS code works with 2.4.

tglx
