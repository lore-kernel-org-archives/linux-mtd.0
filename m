Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikana.artecdesign.ee)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EU9q3-0006gG-FL
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2005 17:26:44 -0400
Received: from malvek.artecdesign.ee ([62.65.32.4] helo=pcy.artec.ee)
	by postikana.artecdesign.ee with esmtp (Exim 3.35 #1 (Debian))
	id 1EU9iJ-0005cu-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Oct 2005 00:18:39 +0300
Date: Tue, 25 Oct 2005 00:26:35 +0300 (EEST)
From: Olav Kongas <ok@artecdesign.ee>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.63.0510250011420.25354@pcy.artec.ee>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Solved - Buffer I/O error - chip access timings in 2.6.13?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


It turned out that the flash chip was in the 'read' mode, 
while it was expected to be in the 'read status' mode. Hence 
the errors described in the parent e-mail. The following 
patch cures the problem for me. I hope the patch is suitable 
for submission to mainline. 

Olav


--- linux-2.6.14-rc4-or/drivers/mtd/chips/cfi_cmdset_0001.c	2005-10-11 04:19:19.000000000 +0300
+++ linux-2.6.14-rc4-flash/drivers/mtd/chips/cfi_cmdset_0001.c	2005-10-24 23:52:12.000000000 +0300
@@ -643,6 +643,9 @@ static int get_chip(struct map_info *map
 	switch (chip->state) {
 
 	case FL_STATUS:
+		/* Some chips (e.g. Sharp's LHF64F12) need to be
+		   explicitly set to 'status read' mode. */
+		map_write(map, CMD(0x70), adr);
 		for (;;) {
 			status = map_read(map, adr);
 			if (map_word_andequal(map, status, status_OK, status_OK))
