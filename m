Subject: Re: MTD driver for MLC NAND chips
From: David Woodhouse <dwmw2@infradead.org>
To: z l <zql@glomationinc.com>
In-Reply-To: <217325.81825.qm@web413.biz.mail.mud.yahoo.com>
References: <217325.81825.qm@web413.biz.mail.mud.yahoo.com>
Content-Type: text/plain
Date: Sat, 27 Oct 2007 08:49:35 -0400
Message-Id: <1193489375.2533.25.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-10-22 at 17:18 -0700, z l wrote:
> It's interesting that if I turn on the MTD debug
> (doesn't matter which level I set) the error goes away
> and everything works perfectly.
> 
> Attached is the boot message when it bombs out.

Show your board driver. You did look carefully at the BUG() at line 174
of nand_base.c, I hope? It hints quite heavily at where to look.

-- 
dwmw2
