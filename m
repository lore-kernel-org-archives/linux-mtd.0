Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0eQS-0008UC-JH
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 06:30:01 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: kyungmin.park@samsung.com
In-Reply-To: <1108380228.16612.300.camel@tglx.tec.linutronix.de>
References: <0IBW0090KFFB9Z@mmp2.samsung.com>
	<1108380228.16612.300.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Mon, 14 Feb 2005 12:29:58 +0100
Message-Id: <1108380598.16612.303.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: RE: [RFC] adding support for OneNAND flash memory
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-02-14 at 12:23 +0100, Thomas Gleixner wrote:
> > 
> > Currently, I don't apply bad block table code to onenand. But I think
> > there's no problem to use current bbt code.
> 
> Ok, so I guess it makes sense to put it into drivers/mtd/onenand. If you
> want to use the bbt code from nand it's no problem, just a tweak in
> KConfig.

If you are going to implement a block replacement scheme, please put it
into a seperate file, so it can be used by others too. 

thanks

tglx
