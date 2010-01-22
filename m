Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NYLs4-00077s-JX
	for linux-mtd@lists.infradead.org; Fri, 22 Jan 2010 15:56:33 +0000
Received: by bwz4 with SMTP id 4so1294739bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jan 2010 07:56:27 -0800 (PST)
Subject: [PATCH 0/6] MTD: Many fixes and preparation for SmartMedia support
	in nand subsystem
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Jan 2010 17:56:21 +0200
Message-ID: <1264175781.24012.42.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>, joern <joern@logfs.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This patch series add few fixes and changes to nand subsystem.

First patch, fixes the MTD_OOB_PLACE support in nand.
I want to use ->read_oob to read both raw oob and data and use ecc.
MTD_OOB_PLACE should do that, but due to a wrong check it will refuse to
work.

Second patch, probably the most important patch in this series.
I changed behavier of MTD_OOB_RAW to match the one of MTD_OOB_PLACE
minus ecc validation.
This way it is easy to use both modes in same code.
This mode is only used in one place, in scan_read_raw in nand_bbt.c
I edited this function to achieve exactly same effect as was before.

Third patch is another bugfix that I need to be able to write several
pages in one go. ->write_oob should do that, but it was incorrectly
implemented.
I need this and former patch to add support for 256 byte nand chips in
the smartmedia FTL very elegantly.

Fourth patch exports few functions from nand_base.c, so one can write
custom ->block_mark_bad, and ->block_is_bad functions.
I use these functions in next patch.

Fifth patch, adds small helper module for nand drivers for SmartMedia/xD
readers. It contains bad block handlers and ecc layer.

And last patch, adds some workarounds to nand core to make xD work with
it.

It adds new ID table (which is similiar to current ID table, but
dfferent in that it has IDS for readonly SmartMedia devices, and it has
special settings for new xD cards that share ID with regular nand
devices, but unfortunely don't report proper information in READ ID
command, and have other problems.)

It also adds a workaround for broken writeprotect status.
Older smartmedia devices had a special seal for writeprotect, aka a
additional connector. This should be handled by nand driver itself.
Newer xD cards have no write protect support at all.

Best regards,
Maxim Levitsky
