Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jj2KG-0004xO-GA
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 01:08:40 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m3818bs1000919 for <linux-mtd@lists.infradead.org>;
	Mon, 7 Apr 2008 18:08:38 -0700 (MST)
Received: from [10.213.160.139] (vpn-10-213-160-139.am.freescale.net
	[10.213.160.139])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id m3818aQr017464
	for <linux-mtd@lists.infradead.org>;
	Mon, 7 Apr 2008 20:08:37 -0500 (CDT)
Date: Mon, 7 Apr 2008 18:05:54 -0700 (PDT)
From: Trent Piepho <tpiepho@freescale.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] CFI fixups for quirks in some new NOR flash chips (try 2)
Message-ID: <Pine.LNX.4.64.0804071759410.15143@t2.domain.actdsltmp>
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

I posted this last week, trying again.

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
