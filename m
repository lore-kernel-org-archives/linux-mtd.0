Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DHGVL-0000UX-DE
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2005 02:23:44 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Matthew Reimer <mreimer@vpop.net>
In-Reply-To: <200503311029.46475.mreimer@vpop.net>
References: <424B4FFA.7050906@joshuawise.com>
	<200503310929.59763.mreimer@vpop.net>
	<1112296829.4228.75.camel@tglx.tec.linutronix.de>
	<200503311029.46475.mreimer@vpop.net>
Content-Type: text/plain
Date: Fri, 01 Apr 2005 10:23:34 +0200
Message-Id: <1112343814.4228.79.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: oobavail issues
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-31 at 10:29 -0800, Matthew Reimer wrote:
> > I will fix this. But I still wonder why you hit this problem with JFFS2.
> > JFFS2 does not provide a filesystem buffer for oob data, so the memcpy
> > in nand_prepare_oobbuf is never invoked.
> 
> IIRC it wasn't jffs2 but the MTD_WRITEECC() we were doing to write a kernel to 
> a partition, which we had to do in preparation for mounting jffs2. Sorry for 
> the confusion.

Ok. Fixed in CVS. Thanks for pointing this out.

tglx
