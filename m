Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13A6Jd-0005VB-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 08:43:21 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13A6JH-0005V5-00
	for mtd@infradead.org; Thu, 06 Jul 2000 08:43:13 +0100
From: Dvir Oren <dvir@lucidvon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Date: Thu,  6 Jul 2000 10:41:14 +0300 (IDT)
To: rmoya@tsai.es
CC: MTD <mtd@infradead.org>
Subject: plilo problems
In-Reply-To: <E139nuV-0002H3-00@infradead.org>
References: <E139nuV-0002H3-00@infradead.org>
Message-ID: <14692.14101.108681.624675@jodie.lucid>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Rodrigo Moya writes ("plilo problems"):

> /mnt/doc/sbin/plilo -C /mnt/doc/etc/lilo.conf -i /mnt/doc/boot/boot.b -m
> /mnt/doc/boot/map
> I get the following message:
> First boot sector doesn't have a valid LILO signature

First try using the patched LILO (and boot.b file) provided either in
the MTD releases, or you might find it floating around somwhere in
this mailing list archive.  That should solve your problem.

There were a lot of discussions in this mailing list regarding this
problem.  Basically, there are two problems in the plilo binary
that M-Systems provide:  it's compiled against libc5 (unless they
changed that in the newer release) and it is patched against LILO
version 20, not 21.

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
