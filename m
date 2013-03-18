Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHUNE-0008IT-8Y
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 07:20:49 +0000
Message-ID: <1363591314.20738.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing
 commands
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 18 Mar 2013 09:21:54 +0200
In-Reply-To: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
References: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2013-03-10 at 00:41 -0800, Brian Norris wrote:
> Traditionally, the command set used by SPI flash only supported a 3-byte
> address. However, large SPI flash (>= 32MB, or 256Mbit) require 4 bytes
> to address the entire flash. Most manufacturers have supplied a mode
> switch (via a "bank register writer", or a "enable 4-byte mode"
> command), which tells the flash to expect 4 address cycles from now on,
> instead of 3. This mode remains until power is cut, the reset line is
> triggered (on packages where present), or a command is sent to reset the
> flash or to reset the 3-byte addressing mode.

Aiaiai!

Build fails on all my general testing defconfigs.

--------------------------------------------------------------------------------
Failed to build the following commit for configuration "arm-omap2plus_defconfig" (architecture arm)":

d4222c5 mtd: nand: reword nand_chip bad block interface comments

drivers/mtd/devices/m25p80.c:1073: warning: type defaults to 'int' in declaration of '_dev_info'
drivers/mtd/devices/m25p80.c:1073: warning: function declaration isn't a prototype
drivers/mtd/devices/m25p80.c:1073: error: conflicting types for '_dev_info'
drivers/mtd/devices/m25p80.c:1073: note: a parameter list with an ellipsis can't match an empty parameter name list declaration
include/linux/device.h:960: note: previous declaration of '_dev_info' was here
drivers/mtd/devices/m25p80.c:1076: error: expected declaration specifiers or '...' before string constant
drivers/mtd/devices/m25p80.c:1076: error: expected declaration specifiers or '...' before 'flash'
drivers/mtd/devices/m25p80.c:1076: error: expected declaration specifiers or '...' before '(' token
drivers/mtd/devices/m25p80.c:1076: error: expected declaration specifiers or '...' before '(' token
drivers/mtd/devices/m25p80.c:1076: error: expected declaration specifiers or '...' before 'flash'
drivers/mtd/devices/m25p80.c:1076: error: expected declaration specifiers or '...' before 'flash'
drivers/mtd/devices/m25p80.c:1076: error: expected declaration specifiers or '...' before 'flash'
drivers/mtd/devices/m25p80.c:1076: warning: data definition has no type or storage class
drivers/mtd/devices/m25p80.c:1076: warning: type defaults to 'int' in declaration of 'no_printk'
drivers/mtd/devices/m25p80.c:1076: warning: function declaration isn't a prototype
drivers/mtd/devices/m25p80.c:1076: error: conflicting types for 'no_printk'
drivers/mtd/devices/m25p80.c:1076: note: a parameter list with an ellipsis can't match an empty parameter name list declaration
include/linux/printk.h:93: note: previous definition of 'no_printk' was here
drivers/mtd/devices/m25p80.c:1083: error: expected identifier or '(' before 'if'
drivers/mtd/devices/m25p80.c:1084: error: expected '=', ',', ';', 'asm' or '__attribute__' before '<' token
drivers/mtd/devices/m25p80.c:1084: error: expected '=', ',', ';', 'asm' or '__attribute__' before '++' token
drivers/mtd/devices/m25p80.c:1097: error: expected identifier or '(' before 'return'
drivers/mtd/devices/m25p80.c:1100: error: expected identifier or '(' before '}' token
make[4]: *** [drivers/mtd/devices/m25p80.o] Error 1

... ans so on for other configurations.

-- 
Best Regards,
Artem Bityutskiy
