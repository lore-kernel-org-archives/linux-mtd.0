Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131m95-0001lH-00
	for mtd-list@infradead.org; Tue, 13 Jun 2000 09:34:03 +0100
Received: from rmx614-mta.mail.com ([165.251.48.52])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 131m93-0001lB-00
	for mtd@infradead.org; Tue, 13 Jun 2000 09:34:02 +0100
Received: from web313-mc.mail.com (web313-mc.mail.com [165.251.48.171])
	by rmx614-mta.mail.com (8.9.3/8.9.3) with SMTP id EAA13392
	for <mtd@infradead.org>; Tue, 13 Jun 2000 04:33:59 -0400 (EDT)
Message-ID: <387127082.960885239676.JavaMail.root@web313-mc.mail.com>
Date: Tue, 13 Jun 2000 04:33:59 -0400 (EDT)
From: void void <void@dr.com>
To: mtd@infradead.org
Subject: Re: M-Systems Disk-On-Chip driver
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Tuesday, June 13, 2000, 12:34:54 PM, you wrote:

AL> Hi,

AL> Is the kernel driver for the doc devices working? I haven't tried mtd in
a
AL> while but I'd really like to replace the IGEL driver with something open
AL> source.

Hello.
I tried DOC2000 with mtd on 2.3.99-pre9 kernel.
It seems that dirver works properly, but I can't boot from DOC.
I can read from and write to /dev/nftlXX, but I can't boot :(
BIOS of my mb (Advantech PCA-6135L) can not find boot
device. On the same hardware M-Systems' driver allow me
to boot from DOC2000, but it works with kernel 2.2.XX, not 2.3.XX.
I'd like replace IGEL driver too, but I don't sure
it's possible now...
--
Sincerely,
Dmitry Kargapolov, ICQ 54000305, dk@gentex.ru

______________________________________________
FREE Personalized Email at Mail.com
Sign up at http://www.mail.com/?sr=signup



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
