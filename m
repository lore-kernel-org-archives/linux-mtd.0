Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaP7U-0003CQ-HX
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 07:16:40 +0000
Subject: Re: [patch 5/8] mtd: register orion_nand using platform_driver_probe()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <200908062305.n76N5Y08004955@imap1.linux-foundation.org>
References: <200908062305.n76N5Y08004955@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 Aug 2009 10:14:15 +0300
Message-Id: <1249888455.19638.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: gregkh@suse.de, joern@logfs.org, nico@marvell.com, saeed@marvell.com,
	linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de,
	dwmw2@infradead.org, buytenh@marvell.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-08-06 at 16:05 -0700, akpm@linux-foundation.org wrote:
> From: Uwe Kleine-Knig <u.kleine-koenig@pengutronix.de>
> 
> orion_nand_probe lives in .init.text, so using platform_driver_register to
> register it is wrong because binding a device after the init memory is
> discarded (e.g.  via sysfs) results in an oops.
> 
> As requested by Nicolas Pitre platform_driver_probe is used instead of
> moving the probe function to .devinit.text as proposed initially.  This
> saves some memory, but devices registered after the driver is probed are
> not bound (probably there are none) and binding via sysfs isn't possible.
> 
> Signed-off-by: Uwe Kleine-Knig <u.kleine-koenig@pengutronix.de>
> Cc: Lennert Buytenhek <buytenh@marvell.com>
> Cc: Saeed Bishara <saeed@marvell.com>
> Cc: Joern Engel <joern@logfs.org>
> Acked-by: Nicolas Pitre <nico@marvell.com>
> Cc: Greg Kroah-Hartman <gregkh@suse.de>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

This one is in my l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
