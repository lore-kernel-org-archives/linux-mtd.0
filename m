Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HmGs0-0006Nc-Ch
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 18:12:22 -0400
Subject: Re: NAND flash write goes wrong
From: Thomas Gleixner <tglx@linutronix.de>
To: borasah@gmail.com
In-Reply-To: <200705110037.08480.borasah@gmail.com>
References: <200705102150.31171.borasah@gmail.com>
	<1178824593.22802.48.camel@zod.rchland.ibm.com>
	<200705110037.08480.borasah@gmail.com>
Content-Type: text/plain
Date: Fri, 11 May 2007 00:15:14 +0200
Message-Id: <1178835314.22481.24.camel@localhost.localdomain>
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

On Fri, 2007-05-11 at 00:37 +0300, borasah@gmail.com wrote:
> jffs2: Erase block size too small (16KiB). Using virtual blocks size (32KiB) 
---------------------------------------------------^^^^^^^

The virtual block support was removed two years ago. Please use an up to
date kernel.

http://www.linux-mtd.infradead.org/source.html#kernelversions

	tglx
