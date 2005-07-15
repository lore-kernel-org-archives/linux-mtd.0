Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtJ5i-0008ND-S8
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2005 01:50:34 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Sunil Khandelwal <sunil_khandelwal@yahoo.com>
In-Reply-To: <20050715042650.24467.qmail@web31707.mail.mud.yahoo.com>
References: <20050715042650.24467.qmail@web31707.mail.mud.yahoo.com>
Content-Type: text/plain
Date: Fri, 15 Jul 2005 07:54:02 +0200
Message-Id: <1121406842.24449.79.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Nand Flash driver for dedicated conroller
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-07-14 at 21:26 -0700, Sunil Khandelwal wrote:
> Thanks for the reply, I am referring to file nand.c
> which is at location /drivers/mtd/nand/nand.c

You are referring to ancient, obsolete and broken code. Please read 
http://www.linux-mtd.infradead.org/source.html#kernelversions


> We have flash controller, which controls the signal
> going to flash Memory. There is no way I can control
> individual signals like ALE etc. 
> The architecture currently for nand expects me to
> control signal lines, which is not possible.

It does not. Read the API documentation. Read the drivers which are
dealing with controller/address line based designs.

tglx
