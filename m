Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AH9rv-0000BE-Vq
	for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2003 22:41:48 +0000
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1AH9qh-0000pd-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2003 23:40:31 +0100
To: linux-mtd@lists.infradead.org
From: Miernik <miernik@ctnet.pl>
Date: Tue, 4 Nov 2003 23:35:06 +0100
Message-ID: <slrnbqgacq.1t2.miernik@tarnica.ctnet.pl>
Sender: news <news@sea.gmane.org>
Subject: in CVS: drivers/mtd/mtdchar.c:65: called object is not a function
Reply-To: Miernik <miernik@ctnet.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I tried patching 2.6.0-test9 kernel with CVS code fetched today at ~ 
22:30 CET, and I ended with this:


  CC [M]  drivers/mtd/mtdcore.o
  CC [M]  drivers/mtd/mtdchar.o
drivers/mtd/mtdchar.c: In function `mtd_open':
drivers/mtd/mtdchar.c:65: called object is not a function
make[3]: *** [drivers/mtd/mtdchar.o] Error 1
make[2]: *** [drivers/mtd] Error 2
make[1]: *** [drivers] Error 2
make[1]: Leaving directory `/usr/src/kernel-source-2.6.0-test9'
make: *** [stamp-build] Error 2


-- 
    Miernik         ________________________ jabber:miernik@amessage.info
___________________/__ tel: +48608233394 __/      mailto:miernik@ctnet.pl
Support impeaching the war criminalist George W. Bush
http://www.votetoimpeach.org/
