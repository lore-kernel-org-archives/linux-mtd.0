Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Lj9Z-0000Sa-00
	for mtd-list@infradead.org; Mon, 07 Aug 2000 10:25:01 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Lj9X-0000SU-00
	for mtd@infradead.org; Mon, 07 Aug 2000 10:25:00 +0100
Message-ID: <398E8115.6FDC06BF@arcom.co.uk>
Date: Mon, 07 Aug 2000 10:27:49 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: CFI chip detection
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

In cfi_cfi_probe() there is
	for (base = (1<<cfi.chipshift) * cfi.interleave; base < map->size; base
+=
	     (1<<cfi.chipshift) * cfi.interleave)
		cfi_probe_new_chip(map, base, &chip[0], &cfi);
		...
to detect aditional chips.  However is did not work on the board I have
(SBC-MediaGX).  Removing the `* cfi.interleave' caused additional chips
to be detected.  Is this a quirk particular to this board or is the
above code wrong?

The SBC-MediaGX has:
  1x 28F640 in x8 mode for the 8 Mbyte board
  2x 28F640 in x8 mode for the 16 Mbyte board

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
