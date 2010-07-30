Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oeufl-0005dA-5C
	for linux-mtd@lists.infradead.org; Fri, 30 Jul 2010 18:51:10 +0000
Date: Fri, 30 Jul 2010 20:51:06 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] MTD: pxa2xx: move pxa2xx_flash_probe to .devinit.text
Message-ID: <20100730185106.GA25446@pengutronix.de>
References: <1280504530-31737-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<4C52F6C1.5090207@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4C52F6C1.5090207@mvista.com>
Cc: Nicolas Pitre <nico@marvell.com>, linux-kernel@vger.kernel.org,
	Julia Lawall <julia@diku.dk>, Russell King <rmk+kernel@arm.linux.org.uk>,
	Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 30, 2010 at 07:58:57PM +0400, Sergei Shtylyov wrote:
> Uwe Kleine-König wrote:
>
>> This fixes the following warning by modpost:
>
>> 	WARNING: vmlinux.o(.data+0x15018): Section mismatch in reference from the variable pxa2xx_flash_driver to the function .init.text:pxa2xx_flash_probe()
>> 	The variable pxa2xx_flash_driver references
>> 	the function __init pxa2xx_flash_probe()
>> 	If the reference is valid then annotate the
>> 	variable with __init* or __refdata (see linux/init.h) or name the variable:
>> 	*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,
>
>> I choosed to do this instead of using platform_driver_probe as the remove
>
>    s/choosed/chose/
oh right, thanks.

>> function uses __devexit.
>
>    Perhaps remove() method should have been fixed instead -- I doubt that 
> this is a hotplug device.
Actually I don't care much.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
