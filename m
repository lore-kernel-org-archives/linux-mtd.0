Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13sYey-0004Aq-00
	for mtd-list@infradead.org; Sun, 05 Nov 2000 22:53:08 +0000
Received: from [64.165.192.135] (helo=server1.skystream.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13sYex-0004Ak-00
	for mtd@infradead.org; Sun, 05 Nov 2000 22:53:07 +0000
Message-ID: <B25E2E5A003CD311B61E00902778AF2A018278EB@server1.skystream.com>
From: Brian Kuschak <brian.kuschak@skystream.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Erase unit header corrupted when using FTL
Date: Sun, 5 Nov 2000 14:52:57 -0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello,

I'm having a major problem when using the FTL.  I format and mount a
filesystem on the FTL device, and do this:

  - copy a file onto the device
  - sync
  - remove the file 
  - sync
  - copy another file onto the device
  - sync.

The file is ~84KB and the sector size is 128KB.  The second copy causes the
FTL to start erasing the first erase unit.  At this point, the erase always
fails.  Seems like the erase unit is not getting a valid header written to
it after being erased.  I can verify that the erase callback is being
called.  Any ideas?

Thanks,
Brian Kuschak


Just after format:

	sh-2.03# /tmp/ftl_check /dev/mtd0
	Memory region info:
	  Region size = 256 kb  Erase block size = 128 kb

	Partition header:
	  Formatted size = 125440 bytes, erase units = 2, transfer units = 1
	  Erase unit size = 128 kb, virtual block size = 512 bytes

	Erase unit 0:
	  Logical unit 0, erase count = 0
	  Block allocation: 3 control, 208 data, 25 free, 20 deleted

	Erase unit 1:
	  Transfer unit, erase count = 0

After the second copy and sync.  These error messages repeat for about 120
sectors.

	sh-2.03# cp /bin/ftp /mnt/
	sh-2.03# sync
	In erase callback.
	ftl_cs: erase failed: state = 192
	ftl_cs: reclaim failed: no suitable transfer units!
	ftl_write returned -5
	end_request: I/O error, dev 2c:00 (ftl), sector 78
	ftl_cs: reclaim failed: no suitable transfer units!
	ftl_write returned -5
	end_request: I/O error, dev 2c:00 (ftl), sector 80
	ftl_cs: reclaim failed: no suitable transfer units!

	sh-2.03# /tmp/ftl_check /dev/mtd0
	Memory region info:
	  Region size = 256 kb  Erase block size = 128 kb

	Partition header:
	  Formatted size = 125440 bytes, erase units = 2, transfer units = 1
	  Erase unit size = 128 kb, virtual block size = 512 bytes

	Erase unit 0:
	  Erase unit header is corrupt.

	Erase unit 1:
	  Logical unit 0, erase count = 0
	  Block allocation: 3 control, 208 data, 1 free, 44 deleted
	sh-2.03#


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
