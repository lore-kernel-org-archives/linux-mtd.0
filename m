Received: from [81.200.0.1] (helo=mail.su29.ru)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19tjnP-0001wA-Cr
	for <linux-mtd@lists.infradead.org>; Mon, 01 Sep 2003 09:12:19 +0100
Received: from mail.ru (host-81.200.0.26.su29.ru [81.200.0.26])
	by mail.su29.ru (Postfix) with ESMTP id 8B7EF13069
	for <linux-mtd@lists.infradead.org>;
	Mon,  1 Sep 2003 11:52:56 +0400 (MSD)
Message-ID: <3F52FB48.3020908@mail.ru>
Date: Mon, 01 Sep 2003 11:54:48 +0400
From: dima <_pppp@mail.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: trouble with samsung drive
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!
I got the Samsung flash drive last weekend. It looks like a noname one 
marked as "Samsung 128MB, Made in Korea" only. It might be something of 
the K9F28XXX0C series 
(http://www.samsung.com/Products/Semiconductor/Flash/NAND/128Mbit/K9F2816Q0C/K9F2816Q0C.htm).
I tried to get it working on my old laptop on Sunday but failed. It 
could be a problem with the USB hub since it is USB 1.1 & the flash 
drive is reported to be USB 2.0. I searched the web & figured out that 
Samsung chips must be NAND-compatible. I used DiskOnChip 2000 driver 
first, but it failed to probe the device (btw, USB hub didn't report any 
unclaimed devices). Then I tried almost all MTD drivers availble in the 
standard (kernel.org) kernel distribution (v2.4.20) -- none of them 
seemed to probe the device successfully.
So I have 3 questions:
1) Is this a problem with my old USB hub?
2) Which driver should I use if no?
3) I didn't enable SCSI emulation support in the kernel yet (I decided 
to leave it for the next step since the device hadn't been detected). 
Can it be the problem?
