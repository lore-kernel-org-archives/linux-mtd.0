Subject: Re: [PATCH] [2.6.23] nand_flash_dev - add manufacturer ID
From: David Woodhouse <dwmw2@infradead.org>
To: Egor Martovetsky <egor@pasemi.com>
In-Reply-To: <200707032354.l63Ns7gh010492@escobita.pasemi.com>
References: <200707032354.l63Ns7gh010492@escobita.pasemi.com>
Content-Type: text/plain
Date: Tue, 03 Jul 2007 20:03:44 -0400
Message-Id: <1183507424.29081.73.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: olof@lixom.net, tglx@linutronix.de, c@pasemi.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-07-03 at 16:54 -0700, Egor Martovetsky wrote:
> Patch for adding the manufacturer's ID to the nand_flash_dev
> struct.  This is needed to avoid selecting wrong flash device,
> when device ID happens to be the same for different devices.
> This change was prompted by addition of Micron MT29F4G08BABWP,
> whose device ID(0xDC), matches a device ID of a Samsung flash.

Hm. Please provide name and ICBM coordinates of the hardware engineers
involved.

On the other hand, it _is_ very similar to that Samsung flash.

+       {"NAND 512MiB 3,3V 8-bit", -1, 0xDC, 0, 512, 0, LP_OPTIONS},

+       /* Micron MT29F4G08BABWP 4 Gigabit device */
+       {"NAND 512MiB 3,3V 8-bit", NAND_MFR_MICRON, 0xDC, 0, 512, 0,
+        NAND_NO_AUTOINCR | NAND_CACHEPRG | NAND_NO_READRDY

The difference between LP_OPTIONS and the options you've set for the new
chip is just NAND_NO_PADDING | NAND_COPYBACK, right? Neither of which we
actually use right now _anyway_.

I wonder if we should do this differently, and mask certain features in
or out according to the manufacturer, after identifying the chip.

Thomas?

-- 
dwmw2
