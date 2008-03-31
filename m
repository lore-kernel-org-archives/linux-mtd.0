Received: from mail5.sea5.speakeasy.net ([69.17.117.7])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JgBTZ-0000pp-Rl
	for linux-mtd@lists.infradead.org; Mon, 31 Mar 2008 04:18:30 +0000
Received: from 71-37-33-91.tukw.qwest.net (HELO t2.domain.actdsltmp)
	(xyzzy@[71.37.33.91]) (envelope-sender <tpiepho@freescale.com>)
	by mail5.sea5.speakeasy.net (qmail-ldap-1.03) with AES256-SHA encrypted
	SMTP for <linux-mtd@lists.infradead.org>; 31 Mar 2008 04:18:25 -0000
Date: Sun, 30 Mar 2008 21:14:57 -0700 (PDT)
From: Trent Piepho <tpiepho@freescale.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: [PATCH] 0/2 Fixups for quirks in a few Spansion NOR flash chips
Message-ID: <Pine.LNX.4.64.0803302101060.16066@t2.domain.actdsltmp>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The first patch extends the CFI probe code to get the extended ID from
AMD/Spansion flash chips.  I checked with Spansion's support and for AMD or
Spansion devices, a flash device id of 0x7e is always used to indicates an
extended ID is present later on in the CFI query data.  There are no
AMD/Spansion chips with a non-extended ID that is the same as another chip's
extended ID.  So, once can just replace the normal device id (0x7e) with the
extended one without losing any information.  There's nothing to gain by
adding a new field to the flash info struct and then adding code to the fixup
routines to also matches the new field, etc.

The second patch is just a couple simple fixup entries that change the sector
count for the affected flash chips.  It uses the extended ID to get the right
chips.
