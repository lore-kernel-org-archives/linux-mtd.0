Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aXpN-0005rC-00
	for mtd-list@infradead.org; Wed, 07 Mar 2001 06:53:41 +0000
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14aXpM-0005r6-00
	for mtd@infradead.org; Wed, 07 Mar 2001 06:53:41 +0000
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "Subodh Nijsure" <subodh@best.com>
Cc: <mtd@infradead.org>,
	<jffs-dev@axis.com>
Subject: Re: JFFS on a powerpc platform.
Date: Wed, 7 Mar 2001 07:53:09 +0100
Message-ID: <BKEKLBIBFPNGJKJDEODFAECHEIAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200103070646.WAA09143@shell9.ba.best.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

>I got the latest code and one of the problem is fixed now.
>i.e. if I copy a file to jffs partition I can read back the content.
>However if I mount partiton, copy a file to it, then unmount it and again
>mount it, I don't see the file I copied.

Yes this was actually a problem with the endianess problem you described
before. (jffs did not find its header infos anymore, since they where
byteswapped). Please try to eraseall the partition before you mount it. You
can find this tool under /utils of the mtd cvs tree.

eraseall /dev/mtd/0
mount -t jffs /dev/mtdblock/0 /mnt
cp foo /mnt/bar
umount /mnt
mount /dev/mtdblock/0 /mnt
ls /mnt

Gives me correct infos. So it works here!

Bye
   Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
