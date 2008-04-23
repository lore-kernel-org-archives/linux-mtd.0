Received: from mail3.sea5.speakeasy.net ([69.17.117.5])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JoX8b-0007Tm-R7
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 05:03:22 +0000
Received: from 63-231-27-195.tukw.qwest.net (HELO t2.domain.actdsltmp)
	(xyzzy@[63.231.27.195]) (envelope-sender <tpiepho@freescale.com>)
	by mail3.sea5.speakeasy.net (qmail-ldap-1.03) with AES256-SHA encrypted
	SMTP for <linux-mtd@lists.infradead.org>; 23 Apr 2008 05:03:18 -0000
Date: Tue, 22 Apr 2008 22:02:06 -0700 (PDT)
From: Trent Piepho <tpiepho@freescale.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] CFI fixups for quirks in some new NOR flash chips (try 3)
Message-ID: <Pine.LNX.4.64.0804222159450.12267@t2.domain.actdsltmp>
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

Maybe the third time's the charm.  I'd like to get this in 2.6.26.  I
first posted these patchs last month.

The first patch extends the CFI probe code to get the extended ID from
AMD/Spansion flash chips.  I checked with Spansion's support and for AMD
or Spansion devices, a flash device id of 0x7e is always used to
indicates an extended ID is present later on in the CFI query data. 
There are no AMD/Spansion chips with a non-extended ID that is the same
as another chip's extended ID.  So, once can just replace the normal
device id (0x7e) with the extended one without losing any information. 
There's nothing to gain by adding a new field to the flash info struct
and then adding code to the fixup routines to also matches the new field,
etc.

The second patch is just a couple simple fixup entries that change the
sector count for the affected flash chips.  It uses the extended ID to
get the right chips.
