Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Lnto-000185-00
	for mtd-list@infradead.org; Mon, 07 Aug 2000 15:29:04 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Lnti-00017e-00
	for mtd@infradead.org; Mon, 07 Aug 2000 15:29:03 +0100
Message-ID: <398EC83C.D9F4AE57@arcom.co.uk>
Date: Mon, 07 Aug 2000 15:31:24 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: 2nd CFI chip detection fails sometimes
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

In cfi_probe.c (line 189)

		/* put back previous value, in case we're operating on RAM... */
		map->write16(map, tmp, base+ofs); <-- error here
#endif /* CFIDEV_INTERLEAVE_1 */
#if defined(CFIDEV_INTERLEAVE_2)
		ofs = cfi_send_cmd(0x98, base, map, CFIDEV_INTERLEAVE_2,
CFI_DEVICETYPE_X8, &tmp);

The line marked error causes problems because it can put the flash chip
into an error state preventing correct detection.  We need some way of
knowing if it's RAM before we do the write.  Suggestions welcome!

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
