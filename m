Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Lpjo-0001U8-00
	for mtd-list@infradead.org; Mon, 07 Aug 2000 17:26:52 +0100
Received: from cerberus.colubris.com ([207.35.116.195] helo=mail.colubris.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Lpjm-0001U2-00
	for mtd@infradead.org; Mon, 07 Aug 2000 17:26:51 +0100
From: "Stephane Laroche" <stephane.laroche@colubris.com>
To: "David Vrabel" <dvrabel@arcom.co.uk>
Cc: <mtd@infradead.org>
Subject: RE: 2nd CFI chip detection fails sometimes
Date: Mon, 7 Aug 2000 12:21:51 -0400
Message-ID: <NDBBJFCHBCKDFHNNGJAFGENPCBAA.stephane.laroche@colubris.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <398EC83C.D9F4AE57@arcom.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

You could try to reset the chip before starting a CFI probe.

Eg.
#if defined(CFIDEV_INTERLEAVE_2)
		ofs = cfi_send_cmd(0xFF, base, map, CFIDEV_INTERLEAVE_2,
CFI_DEVICETYPE_X8, &tmp);
		cfi_send_cmd(0x98, base, map, CFIDEV_INTERLEAVE_2, CFI_DEVICETYPE_X8,
NULL);

This should put the chips in the right state.

-Stephane

-----Original Message-----
From: owner-mtd@infradead.org [mailto:owner-mtd@infradead.org]On Behalf
Of David Vrabel
Sent: Monday, August 07, 2000 10:31
To: mtd@infradead.org
Subject: 2nd CFI chip detection fails sometimes


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



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
