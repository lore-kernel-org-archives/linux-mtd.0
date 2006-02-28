Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FE7zU-0003oc-Q7
	for linux-mtd@lists.infradead.org; Tue, 28 Feb 2006 11:46:27 -0500
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id DF1EFBC03
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Feb 2006 17:46:07 +0100 (CET)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44976-07 for <linux-mtd@lists.infradead.org>;
	Tue, 28 Feb 2006 17:46:02 +0100 (CET)
Received: from [192.1.1.75] (unknown [192.168.66.2])
	by n1.cetrtapot.si (Postfix) with ESMTP id 999B6BBF6
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Feb 2006 17:46:02 +0100 (CET)
Message-ID: <44047E4A.7060208@cetrtapot.si>
Date: Tue, 28 Feb 2006 17:46:02 +0100
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: readback after write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a general question regarding FLASH memories (It does not have to 
do anything directly with linux MTD).
I have connected SPI serial flash to my embedded device. Due to slow 
speed provided by the device I had to drop JFFS2 or similar flash fs in 
favor of accessing the flash memory in raw mode (using stdio I/O 
functions). It works nice and much faster than JFFS2.

What I would like to add to my code is read-back operation after write 
operation, to make sure I haven't overwritten any of the date already 
present on the flash. My intention was to:
- open fp for read and write
- (erase the sector if needed)
- write data to flash
- seek back
- read data back and compare write and read buffer byte-by-byte

This could have major performance downside considering I can transfer 
(R/W) 64K of data in ~700ms to/from the device (SLOWWW). Device is sized 
at 4Mbit. In the worst case this would probably double (triple?) R/W 
times for single operation, which is why I would like to ask if anyone 
has any information/algoritm for such things?

regards,
hinko
-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenija
Tel. +386 (0) 4 280 66 37
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
