Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CeLun-0007ax-GT
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2004 18:17:12 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: MQuicquaro@necii.com
In-Reply-To: <OFD7229C12.76AD2125-ON85256F6A.007CB17C-85256F6A.007F521E@necii.com>
References: <OFD7229C12.76AD2125-ON85256F6A.007CB17C-85256F6A.007F521E@necii.com>
Content-Type: text/plain
Date: Wed, 15 Dec 2004 00:17:03 +0100
Message-Id: <1103066223.3406.82.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 - mtd - nand flash works....except....
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-12-14 at 18:09 -0500, MQuicquaro@necii.com wrote:
> Just about everything seems to be working great as far as I can see
> except subsector writing.

Subsector writes are not permitted in the nand driver.

I'm curious why you don not get an error on write.

Hmm, someone should fix nandtest and remove the subsector stuff.

tglx
