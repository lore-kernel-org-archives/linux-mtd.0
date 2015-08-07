Message-ID: <55C51319.2010901@tul.cz>
Date: Fri, 07 Aug 2015 22:20:41 +0200
From: Petr Cvek <petr.cvek@tul.cz>
MIME-Version: 1.0
To: daniel@zonque.org, haojian.zhuang@gmail.com,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 dwmw2@infradead.org, computersforpeace@gmail.com, eric.y.miao@gmail.com
CC: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: [BUG, RFC] MTD Execute in Place on ARM breaks build
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Configuration:

	CONFIG_MTD_XIP=y

on PXA2xx architecture causes request of undefined macros from 

	drivers/mtd/chipscfi_cmdset_0001.c

These macros (using ICIP and ICMR) are defined here:

	http://lxr.free-electrons.com/source/arch/arm/mach-pxa/include/mach/mtd-xip.h#L20

register definitions for ICIP and ICMR were removed by commit:
	
	5d284e353eb11ab2e8b1c5671ba06489b0bd1e0c

Similar is for macros with OSCR (lines 23 and 24), which have different type.
Re-adding ICIP and ICMR definition and explicit type conversion will fix the build
and the kernel boots, but I'm not yet able to test XIP functionality (too many different
bugs to flash over windows mobile image).

My temporal fix (ugly):

#define ICIP __REG(0x40D00000)  /* Interrupt Controller IRQ Pending Register */
#define ICMR __REG(0x40D00004)  /* Interrupt Controller Mask Register */
...
#define xip_currtime()		((unsigned long) OSCR)
#define xip_elapsed_since(x)	(signed)((((unsigned long) OSCR) - (x)) / 4)


P.S. Same macros are used on omap1 and sa1100 too.

Petr Cvek
