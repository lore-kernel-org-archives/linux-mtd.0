Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ezh1-0002S2-00
	for mtd-list@infradead.org; Fri, 29 Sep 2000 13:55:11 +0100
Received: from trappist.elis.rug.ac.be ([157.193.67.1] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ezgz-0002Rw-00
	for mtd@infradead.org; Fri, 29 Sep 2000 13:55:09 +0100
Received: from rug.ac.be (polaris.elis.rug.ac.be [157.193.67.43])
	by trappist.elis.rug.ac.be (8.9.3/8.9.2) with ESMTP id OAA29330
	for <mtd@infradead.org>; Fri, 29 Sep 2000 14:55:07 +0200
Message-ID: <39D49129.7629180E@rug.ac.be>
Date: Fri, 29 Sep 2000 14:55:05 +0200
From: Michiel Ronsse <Michiel.Ronsse@rug.ac.be>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: SBC-MediaGX
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



Hi,

after checking all the messages in the archive of this
mailing list I managed to access the Intel Strataflash
chip on our Arcom SBC-MediaGX board. I 'repartitioned' the flash:
256kB for the BIOS extension, 1.5MB for DOS and the remainder
for Linux. The linux partition was formatted with JFFS.
Everything seems to work find although JFFS makes a lot
of noise when mounting the partition, moreover it finds only
13MB free and df only reports 4MB free... 

The next logical step would be to make the flash bootable
by overwriting the BIOS extension. I'm a bit reluctant to
do this as I don't want to make my board unbootable. E.g.
what happens if there is something wrong with the new BIOS?
Can you prevent somehow the BIOS on the board 
from executing the BIOS extension in the flash? 


Another question: why is the BIOS extension area soo big as
the extension itself is only about 14kB? The autoexec.bat file
on the Arcom bootfloppy mentions that the extension was enlarged
some time ago to 256KB in order to accomodate the Windows CE
registry???



Michiel Ronsse.


-- 
+- Michiel Ronsse --- michiel.ronsse@rug.ac.be -+
| Parallel Information Systems Group            |
| ELIS - Ghent University  - Ghent, Belgium     |
| Phone: +32/9/264.33.67   Fax: +32/9/264.35.94 |
+------ http://www.elis.rug.ac.be/~ronsse ------+

In a train station the train stops, in a work station ...


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
