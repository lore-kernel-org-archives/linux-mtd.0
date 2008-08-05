Subject: Re: [PATCH] cfi_cmdset_0001: Timeouts for erase, write and unlock
	operations
From: David Woodhouse <dwmw2@infradead.org>
To: Anders =?ISO-8859-1?Q?Grafstr=F6m?= <grfstrm@users.sourceforge.net>
In-Reply-To: <48977822.4040401@users.sourceforge.net>
References: <48977822.4040401@users.sourceforge.net>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2008 14:40:37 +0100
Message-Id: <1217943637.3454.733.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-08-04 at 23:44 +0200, Anders Grafström wrote:
> Timeouts are currently given by the typical operation time times 8.
> It works in the general well-behaved case but not when an erase block is
> failing. For erase operations, it seems that a failing erase block will
> keep the device state machine in erasing state until the vendor
> specified maximum timeout period has passed. By this time the driver
> would have long since timed out, left erasing state and attempted
> further operations which all fail. This patch implements timeouts using
> values from the CFI Query structure when available.
> The patch also sets a longer timeout for locking operations. The current
> value used for locking/unlocking given by 1000000/HZ microseconds is too
> short for devices like J3 and J5 Strataflash which have a typical clear
> lock-bits time of 0.5 seconds.
> 
> Signed-off-by: Anders Grafström <grfstrm@users.sourceforge.net>

patching file drivers/mtd/chips/cfi_cmdset_0001.c
Hunk #1 FAILED at 478.
Hunk #2 FAILED at 1034.
Hunk #3 FAILED at 1043.
Hunk #4 succeeded at 1153 with fuzz 2.
Hunk #5 FAILED at 1166.
Hunk #6 FAILED at 1178.
Hunk #7 succeeded at 1238 with fuzz 2.
Hunk #8 FAILED at 1473.
Hunk #9 FAILED at 1645.
Hunk #10 FAILED at 1714.
Hunk #11 FAILED at 1850.
Hunk #12 FAILED at 2030.
10 out of 12 hunks FAILED -- saving rejects to file
drivers/mtd/chips/cfi_cmdset_0001.c.rej
patching file include/linux/mtd/flashchip.h
Hunk #1 FAILED at 73.
1 out of 1 hunk FAILED -- saving rejects to file
include/linux/mtd/flashchip.h.rej


-- 
dwmw2
