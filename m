Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13HqPq-0008B5-00
	for mtd-list@infradead.org; Thu, 27 Jul 2000 17:21:46 +0100
Received: from [195.88.125.154] (helo=smtp.zls.de)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13HqPo-0008Az-00
	for mtd@infradead.org; Thu, 27 Jul 2000 17:21:44 +0100
Received: from zls.de(ws-cal.zls.de[172.16.0.35]) (1514 bytes) by smtp.zls.de
	via sendmail with P:smtp/R:remote_hosts/T:smtp
	(sender: <cal@zls.de>)
	id <m13HqQP-000MPUC@smtp.zls.de>
	for <mtd@infradead.org>; Thu, 27 Jul 2000 18:22:21 +0200 (MEST)
	(Smail-3.2.0.109 1999-Oct-27 #3 built 1999-Nov-16)
Message-ID: <398061A4.192DE8A2@zls.de>
Date: Thu, 27 Jul 2000 18:21:56 +0200
From: Christian Lademann <cal@zls.de>
MIME-Version: 1.0
To: Karl Pitrich <pit@linuxaustria.at>
CC: mtd@infradead.org
Subject: Re: Request: examples of using LILO or GRUB to boot from DOC
References: <397F3B15.D420B9AF@zls.de> <397F46EF.417AD6CE@linuxaustria.at>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Thank you for your helping hand. It worked with the "DOC123.EXB"-firmware

installed and the /dev/nftla1 being the FAT12-fs created by dformat.

Repartitioning the nftla worked as well but no success booting anymore.

Using the M-Systems-driver, /dev/fla* and plilo repartitioning and

booting works well.

cu, Christian.

PS: where do I find a 'as86' that is able to compile lilo? The current

bin86-release found on metalab.unc.edu does not do the job.

--
*  Christian A. Lademann, ZLS Software GmbH               mailto:cal@zls.de
*  ZLS Software GmbH
*  Frankfurter Strasse 59       Postfach 1628             mailto:zls@zls.de
*  D-65779 Kelkheim             D-65766 Kelkheim          http://www.zls.de
*  Telefon +49-6195-9902-0      Telefax +49-6195-900600
*  Geschäftsführer John A. Shuter     -     Amtsgericht Königstein HRB 3105





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
