Received: from h1.handhelds.org ([192.58.209.91] helo=handhelds.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C9DjW-000735-0q
	for linux-mtd@lists.infradead.org; Sun, 19 Sep 2004 22:16:52 -0400
Message-ID: <414E3D41.6070507@joshuawise.com>
Date: Sun, 19 Sep 2004 22:15:29 -0400
From: Joshua Wise <joshua@joshuawise.com>
MIME-Version: 1.0
To: h2200-port mailing list <h2200-port@handhelds.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Bricking and debricking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Okay, so, good news and bad news.

Good news first: I can successfully brick an iPAQ.

wiseguy586@bluefire /mnt/raid/iPAQ/linux/debrick/hamcop $ ./hamcop -b
Found HAMCOP on h2210
Now bricking...
Successfully bricked your iPAQ. Enjoy your new doorstop.
wiseguy586@bluefire /mnt/raid/iPAQ/linux/debrick/hamcop $

-b (Brick) erases the first sector of flash. You must first brick before 
you can unbrick. (Actually, this is a bit strange. I expected -b to 
erase the first 16k of flash, although it only erased the first 528 bytes.)

Bad news second: I can't quite seem to unbrick it.

There's code in CVS to send what should be the write commands, but it 
seems to write only 0x00. Oddly enough, it seems to be consistent with 
the number of bytes I send (i.e., if I send 256 bytes, I get 256 0s and 
the rest FF, if I send 512, I get 512 0s, and if I send 528 bytes, I get 
all 0s), but the data just isn't there. The flash part reports that all 
went okay with the program, so there might be a problem with actually 
transporting the data to the device over JTAG.

Thoughts? CC'ing to mtd list too.

joshua
