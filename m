Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14QDfB-00049P-00
	for mtd-list@infradead.org; Tue, 06 Feb 2001 19:20:29 +0000
Received: from mik.rmt.ru ([194.67.128.138] helo=mx.mik.ru)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14QDfA-00049J-00
	for mtd@infradead.org; Tue, 06 Feb 2001 19:20:28 +0000
Received: from [194.67.151.5] (helo=NP1K15)
	by mx.mik.ru with esmtp (Exim 3.16 #2)
	id 14QDkU-0000Mk-00
	for mtd@infradead.org; Tue, 06 Feb 2001 22:25:58 +0300
Date: Tue, 6 Feb 2001 22:20:20 +0300
From: Ruslan Satlykov <ruslan@mik.ru>
Reply-To: Ruslan Satlykov <ruslan@mik.ru>
Message-ID: <6930.010206@mik.ru>
To: mtd@infradead.org
Subject: M-Sys's driver and public driver
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

Here is my (some) trouble. Under the Linux, I have a DOC partitioned
with M-Systems's doc driver to two partiotions. It's works fine after
rebooting, I can read/write on it, but some days ago I have tryed 2.4
kernel, with embedded DOC driver in it. Well, I had successfully
mounted the chip, but when I had rebooted I lose all my data on the
flash :(... GPL's driver "says" me words like 'ECC read error' at the
mount time, but I had ignored this warnings... And - unlucky final, as
you see :)

For details:
 DiskOnChip 2000, size - 4-8Mb, firmware version - 1.21.

And, after rebooting native M-System's driver can not 'fdisk' and
mount my chip (I need to repair it with original DOC's image, getted
with getmimg.bat from M-Systems floppy)

Thanks.
Ruslan.

P.S. But - thank you very much for your work!! :) And sorry for my
English.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
