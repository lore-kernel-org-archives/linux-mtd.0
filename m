Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13SNTe-0001mm-00
	for mtd-list@infradead.org; Fri, 25 Aug 2000 18:41:14 +0100
Received: from [213.255.48.147] (helo=giga.prosa.it ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13SNTc-0001mf-00
	for mtd@infradead.org; Fri, 25 Aug 2000 18:41:13 +0100
Received: from localhost (root@localhost [127.0.0.1])
	by giga.prosa.it (8.9.3/8.9.3/Debian/GNU) with ESMTP id TAA01317
	for <mtd@infradead.org>; Fri, 25 Aug 2000 19:31:29 +0200
Date: Fri, 25 Aug 2000 19:42:11 +0200
From: Ciro Cattuto <ciro@prosa.it>
To: mtd@infradead.org
Subject: nftl_format and 2 Mb DOC
Message-ID: <20000825194211.A14265@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

in the nftl_format sources I read the following:

 ---------------------------------------------------
 if (meminfo.erasesize != 0x2000) {
     printf("Erase size not 8Kb - I'm confused\n");
     close(fd);
     return 1;
     }
 ---------------------------------------------------

...now, 2 Mb DOC have 4k erase size, and I'd like to add support for this.
Is there something I should be aware of before I start hacking to make
nftl_format happy, instead than confused? ;)

Ciro

-- 
Ciro Cattuto, Open Source Developer, Linuxcare Italia SpA
Tel. +39.338.3002140  Fax +39.049.8036484 
ciro@linuxcare.com    http://www.linuxcare.com/
ciro@prosa.it         http://www.prosa.it/
Linuxcare. Support for the revolution.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
