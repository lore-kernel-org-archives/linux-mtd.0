Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11zTAr-0005ag-00
	for mtd-list@infradead.org; Sat, 18 Dec 1999 23:22:05 +0000
Received: from out4.prserv.net ([165.87.194.239] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11zTAo-0005aa-00
	for mtd@infradead.org; Sat, 18 Dec 1999 23:22:02 +0000
From: "Dvir Oren" <dviro@lucidvon.com>
To: MTD <mtd@infradead.org>
Date: Sun, 19 Dec 1999 01:23:31 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: lilo clarification
Message-Id: <E11zTAo-0005aa-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I just realized that I forgot to mention that the lilo that I sent was 
compiled for libc6, and it is lilo version 21.

M-Systems provides a plilo which was compiled for libc5, and is lilo 
version 20.

Lilo version 20 is incompatible with lilo version 21, as far as the 
boot.b file is concerned.

Oh, and as of lilo 21, they already included some of the changes 
that M-Systems included in the patch, and put them under an 
#ifdef (xxx_LARBE_EBDA, or sometihng like that).  Now, if 
someone would be able to do that with EtherBoot, I would be a 
happy man.

---------
Dvir Oren <dvir@lucidvon.com>
Lucid VON Ltd. <http://www.lucidvon.com>
Twin Towers 2,     Suite 406,     P.O.Box 159
35 Jabotinsky street, Ramat-Gan 52511, ISRAEL
Tel:+972 3 6137214         Fax:+972 3 6137215


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
