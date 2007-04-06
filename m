Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HZv0l-0006WI-0f
	for linux-mtd@lists.infradead.org; Fri, 06 Apr 2007 16:26:21 -0400
Subject: Re: Is there a minimal size requirement for oobfree area?
From: Thomas Gleixner <tglx@linutronix.de>
To: Kevin Zhang <kzhang01mail@gmail.com>
In-Reply-To: <e81bc78a0704051010sbd13f7as3512eec13bef5f0e@mail.gmail.com>
References: <e81bc78a0704051010sbd13f7as3512eec13bef5f0e@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 06 Apr 2007 22:26:46 +0200
Message-Id: <1175891206.28263.476.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-04-05 at 12:10 -0500, Kevin Zhang wrote:
> Hi,
> 
> I am trying to understand if there is a size requirement for the
> oobfree area. For the 512-byte nand flash, does the oobfree area have
> to be at least 8 bytes?

No, there is no real requirement. The oob area is not mandatory for
JFFS2. If you want to use YAFFS, it is AFAIK.

	tglx


	
