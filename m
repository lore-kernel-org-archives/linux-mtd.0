Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZWK2-0006La-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 11:00:34 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZWK1-0006LU-00
	for mtd@infradead.org; Mon, 27 Mar 2000 11:00:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: dhinds@pcmcia.sourceforge.org
Subject: FTL endianness
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 27 Mar 2000 11:01:37 +0100
Message-ID: <6457.954151297@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I'm porting the latest FTL code to the MTD system. I see code like this:

  if ((header.NumEraseUnits > 65536) || (header.BlockSize != 9) ||
	(header.EraseUnitSize < 10) || (header.EraseUnitSize > 31) ||
	(header.NumTransferUnits >= header.NumEraseUnits)) {
	printk(KERN_NOTICE "ftl_cs: FTL header corrupt!\n");
	return -1;
    }

This is odd - unless I'm missing something, it means that FTL on bigendian
machines has to be bigendian, and FTL on littleendian machines has to be
littleendian. And that you can't swap flash cards between the two.

The NFTL spec certainly says that the format on the media should be 
little-endian, so I byteswap it all. Isn't this the case for FTL?

If so - how many people are actually using FTL on BE machines? If there aren't 
{m,}any, we can just fix it and forget about it. Otherwise we could make it 
conditional and/or provide two modules - ftl_be and ftl_le.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
