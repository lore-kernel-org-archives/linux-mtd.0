Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2jWA-0006pe-Bw
 for linux-mtd@lists.infradead.org; Thu, 12 Oct 2017 19:51:43 +0000
Received: by mail-wm0-x233.google.com with SMTP id i124so16191633wmf.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Oct 2017 12:51:19 -0700 (PDT)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 12 Oct 2017 12:51:16 -0700
Message-ID: <CAJ+vNU2YFMR5WkekSgHfRHo10PgqKBski0a47qEn2XKZ-zjE9Q@mail.gmail.com>
Subject: reading ubi from a NAND for programming to other devices
To: linux-mtd@lists.infradead.org, u-boot <u-boot@lists.denx.de>
Cc: Carlos Rafael Giani <dv@pseudoterminal.org>,
 Ryan Erbstoesser <rerbstoesser@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

I'm looking to understand what methods are available for
reading/writing ubi/ubifs from an existing NAND flash in order to
duplicate the contents onto another device in U-Boot, Linux, and with
JTAG flashing for production.

Typically I create ubi's using ubinize then I can use U-Boot 'nand
erase' and 'nand write' or JTAG to write the ubi without issues.
However if I use U-Boot 'nand read' to read a ubi then write it back
using the same method I get 'ubi0 warning: ubi_io_read: error -74 (ECC
error)' and 'ubi0 error: ubi_io_read: error -74 (ECC error)' messages
from Linux when its mounted. I find I run into the same problem when
JTAG programming ubi's: no issues when using a ubi created via ubinize
but when flashing one that came from a U-Boot 'nand read' I see ubi
errors when mounting it.

Some testing shows me that I can't use U-Boot nand read/erase/write
once U-Boot has 'attached' the UBI (via the U-Boot 'ubi part' command)
which scans and re-sizes the volume.

If I on the other hand take a ubi from U-Boot 'nand read' and use
Linux ubiformat to flash that onto a new device I get no ubi
warnings/errors when its mounted. My understanding is that ubiformat
is simply preserving erase counters but there must be something else
its doing.

What's going on here and what can I do in U-Boot/JTAG to properly
write ubi that's been read from an existing system? I'm hoping there
is a method that doesn't require iterating over the individual volumes
within the ubi.

Best Regards,

Tim
