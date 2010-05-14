Subject: Re: [PATCH 11/20] mtd: pxa3xx_nand: add debug messege
From: David Woodhouse <david.woodhouse@intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
In-Reply-To: <4BED07BD.7090403@pengutronix.de>
References: <AANLkTilMUQHJDzVrO5FXeEE8udXkDwS240Vrl1lIkdyG@mail.gmail.com>
	<4BED07BD.7090403@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 May 2010 09:35:19 +0100
Message-ID: <1273826119.9999.1634.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Eric Miao <eric.y.miao@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-05-14 at 09:20 +0100, Marc Kleine-Budde wrote:
> 
> If you really need to get this in mainline, try using pr_debug() for
> this, add
> 
> #if PXA3XX_NAND_DEBUG
> #define DEBUG
> #endif
> 
> to activate debugging. 

I _wish_ we could have a per-device 'debug' flag, and dev_dbg() would
work based on that. We should also be able to compile it out completely,
of course.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
