Message-ID: <4C52F6C1.5090207@mvista.com>
Date: Fri, 30 Jul 2010 19:58:57 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] MTD: pxa2xx: move pxa2xx_flash_probe to .devinit.text
References: <1280504530-31737-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1280504530-31737-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Uwe Kleine-König wrote:

> This fixes the following warning by modpost:

> 	WARNING: vmlinux.o(.data+0x15018): Section mismatch in reference from the variable pxa2xx_flash_driver to the function .init.text:pxa2xx_flash_probe()
> 	The variable pxa2xx_flash_driver references
> 	the function __init pxa2xx_flash_probe()
> 	If the reference is valid then annotate the
> 	variable with __init* or __refdata (see linux/init.h) or name the variable:
> 	*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,

> I choosed to do this instead of using platform_driver_probe as the remove

    s/choosed/chose/

> function uses __devexit.

    Perhaps remove() method should have been fixed instead -- I doubt that 
this is a hotplug device.

WBR, Sergei
