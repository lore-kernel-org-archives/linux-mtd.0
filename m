Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D4bwO-0004n6-Q3
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2005 04:39:22 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0502250931370.5525@phoenix.infradead.org>
References: <20050224231739.LCON24441.mxfep03.bredband.com@mxfep03>
	<Pine.LNX.4.58.0502250931370.5525@phoenix.infradead.org>
Content-Type: text/plain
Message-Id: <1109324349.3033.2.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Fri, 25 Feb 2005 10:39:09 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND Driver skeleton?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-02-25 at 10:31, Artem B. Bityuckiy wrote:
> extabe@bredband.net wrote:
> > Hi all!
> > I will make a new NAND board driver for our own hardware. Is there a 
> good and basic driver whitch I can start from?
> > I saw drivers/mtd/nand/skeleton was mentioned in the "MTD NAND Driver 
> Programming Interface" manual, but I cant find the skeleton anyware.
> > 
> I don't know about drivers/mtd/nand/skeleton, but IMO nand_base.c contains 
> good enough "skeleton" comprised on default handlers of NAND operations.

Na, nand_base.c is not a skeleton for a board driver.

I never came around to hack the skeleton driver as I wanted to do it
with platform_device support.

Use one of the simple drivers like  edb7312.c or autcpu12.c as
reference.

tglx
