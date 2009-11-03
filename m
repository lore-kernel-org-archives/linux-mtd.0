Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5LG0-0006Eb-Tz
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 15:25:21 +0000
To: linux-mtd@lists.infradead.org
Subject: mxc nand i.mx35: no OOB with HW_ECC
From: John Ogness <john.ogness@linutronix.de>
Date: Tue, 03 Nov 2009 16:25:10 +0100
Message-ID: <80bpjj7hrd.fsf@merkur.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: s.hauer@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I spent a while trying to figure out why JFFS2 was getting hardware ECC
errors on an i.MX35 NANDFC with 2K pages. The problem also existed when
using nandwrite together with the -n and -o options.

The problem is that for page sizes larger than 512 bytes, the i.MX35
NANDFC can only write the page and oob data together. When writing the
page and oob data, the ECC hardware also writes the ECC codes for
it. This is ok if the filesystem driver or userspace application
understands that only one write per page+oob is allowed.

But jffs2 and "nandwrite -n -o" assume that they can write the oob data
and the page data separately. With the recently posted mxc_nand.c
driver, this results in the NANDFC writing the ECC codes to flash
twice... with different values. This means the ECC codes that end up on
the flash chip are garbage.

When reading the page back, the ECC hardware uses the garbage ECC codes
to "fix" the data, which results in corrupted data.

ubifs does not touch the oob data, which is probably why nobody cares
about (or has noticed?) this issue.

As someone who is relatively new to the MTD layer, I don't have any
suggestions about how this should be fixed.

A quick tweak to fs/jffs2/wbuf.c:jffs2_nand_flash_setup() will allow
JFFS2 to run without available oob data. Maybe there should be an
official option to allow this.

John Ogness
