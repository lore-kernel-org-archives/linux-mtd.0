Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Li3x-0000IP-00
	for mtd-list@infradead.org; Mon, 07 Aug 2000 09:15:09 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Li3u-0000IJ-00
	for mtd@infradead.org; Mon, 07 Aug 2000 09:15:07 +0100
Message-ID: <398E70B1.DB59E92D@arcom.co.uk>
Date: Mon, 07 Aug 2000 09:17:53 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: JFFS corruption
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

After running the following test during the weekend the JFFS filesystem
was corrupted.
    copy files from dir1 to dir2
    check checksums match
    copy files from dir2 to dir1
    check checksums match
    repeat
The board would then be reset at a random time (using the hardware
watchdog).

All the files have strange stuff in them eg
EPPEAQTEPPED@ADDADUPQ@AAEPDEDAE... and so on...

Unfortunatly syslogd was logging to this partition (with hindsight I
should have logged elsewhere...) so the log was trashed but after the
corruption we have
 kernel: Waiting for chip, status = 4 <-- from cfi_cmdset_0001.c
 kernel: Didn't read all bytes in flash_safe_read() <-- from JFFS
several times (all at the same time).  Don't know if this is relevant
since it only occured once 24 hrs after.

According to the logs of the actual test (which I did log remotely) the
corruption did not occur after a reboot but after 30 or so iterations of
the test.

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
