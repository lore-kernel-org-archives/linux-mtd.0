Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13MUP5-00086f-00
	for mtd-list@infradead.org; Wed, 09 Aug 2000 12:52:11 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13MUP2-00086Z-00
	for mtd@infradead.org; Wed, 09 Aug 2000 12:52:08 +0100
Message-ID: <39914687.2D805542@arcom.co.uk>
Date: Wed, 09 Aug 2000 12:54:47 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: JFFS garbage collection(?) fails
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I was running a script which copies files back and forth checking their
checksums.  The machine would then reboot after a random time (between
5-10 min). The test had been running successfully for about 2 hrs. 


Here's a sample of the log produced

Aug  9 12:17:33 linux-sbc logger: 1k: OK
Aug  9 12:17:33 linux-sbc logger: 2k: OK
Aug  9 12:17:33 linux-sbc logger: 4k: OK
Aug  9 12:17:33 linux-sbc logger: 8k: OK
Aug  9 12:17:33 linux-sbc logger: Success
Aug  9 12:17:33 linux-sbc kernel: jffs_garbage_collect_thread():
collecting. 
Aug  9 12:17:33 linux-sbc last message repeated 21 times
Aug  9 12:17:33 linux-sbc kernel: Waiting for chip, status = 4 
[machine reboots here]

Aug  9 12:18:59 linux-sbc syslogd 1.3-3: restart.
Aug  9 12:18:59 linux-sbc kernel: jffs_mknod: bogus imode (140755) 
[The above line looks odd too...]
Aug  9 12:18:59 linux-sbc logger: Starting test...
Aug  9 12:18:59 linux-sbc logger: 1k: OK
Aug  9 12:18:59 linux-sbc logger: 2k: OK
Aug  9 12:18:59 linux-sbc logger: 4k: OK
Aug  9 12:18:59 linux-sbc logger: 8k: OK
Aug  9 12:18:59 linux-sbc logger: Success

[lots more successes...(about 20)]

Aug  9 12:19:04 linux-sbc logger: 1k: OK
Aug  9 12:19:04 linux-sbc logger: 2k: OK
Aug  9 12:19:05 linux-sbc logger: 4k: OK
Aug  9 12:19:05 linux-sbc logger: 8k: OK
Aug  9 12:19:05 linux-sbc logger: Success
Aug  9 12:19:05 linux-sbc kernel: jffs_garbage_collect_thread():
collecting. 
Aug  9 12:19:05 linux-sbc kernel: jffs_garbage_collect_thread():
collecting. 
Aug  9 12:19:05 linux-sbc kernel: jffs_flash_erasable_size() given
length which runs off the end of device (ofs 160000 + len 27ad4 =
187ad4, > 180000) 
Aug  9 12:19:05 linux-sbc kernel: jffs_erasable_size:
flash_erasable_size() returned something less than zero (-3). 
Aug  9 12:19:05 linux-sbc kernel: jffs_erasable_size: offset =
0x00160000 
Aug  9 12:19:05 linux-sbc kernel: jffs_garbage_collect_thread():
collecting. 
Aug  9 12:19:05 linux-sbc kernel: jffs_flash_erasable_size() given
length which runs off the end of device (ofs 160000 + len 27b1c =
187b1c, > 180000) 
Aug  9 12:19:05 linux-sbc kernel: jffs_erasable_size:
flash_erasable_size() returned something less than zero
(-3).              
[and on and on and on...]

The JFFS filesystem is now garbled.

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
