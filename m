Received: from e4.ny.us.ibm.com ([32.97.182.104])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmXIH-0004CZ-Ui
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2004 08:30:59 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Mak Kar <lin_mkar@yahoo.com>
In-Reply-To: <20040716190143.86645.qmail@web21425.mail.yahoo.com>
References: <20040716190143.86645.qmail@web21425.mail.yahoo.com>
Content-Type: text/plain
Message-Id: <1090240245.29112.27.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 19 Jul 2004 07:30:45 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: starting address of mtd device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-07-16 at 14:01, Mak Kar wrote:
> "cat /proc/mtd" would give me just the size of device
> and erase size.
> how can I get the starting address in flash of any
> single mtd device?

The physical addresses for flash are usually provided by the user in the
form of a board map driver.  If there isn't a specific map driver for
your board, see physmap.c.

In other words, if you don't tell MTD where to look, it won't find
anything. :)

josh
