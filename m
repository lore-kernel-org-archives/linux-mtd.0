Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikana.artecdesign.ee)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EvrHI-0005zh-Md
	for linux-mtd@lists.infradead.org; Mon, 09 Jan 2006 02:17:22 -0500
Received: from malvek.artecdesign.ee ([62.65.32.4] helo=pcy.artec.ee)
	by postikana.artecdesign.ee with esmtp (Exim 3.35 #1 (Debian))
	id 1Evr6k-0000VE-00
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2006 09:06:22 +0200
Date: Mon, 9 Jan 2006 09:17:08 +0200 (EET)
From: Olav Kongas <ok@artecdesign.ee>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.63.0601090858480.11546@pcy.artec.ee>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [PATCH] cfi_cmdset_0001.c: Set flash explicitly to 'status read'
 mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Set flash explicitly to 'status read' mode. Without this patch, I have
experienced failures like an example below, if running executables from the
cramfs residing on Sharp's LHF64F12 flash chip.

	Waiting for chip to be ready timed out. Status 3c31
	end_request: I/O error, dev mtdblock0, sector 5400
	Buffer I/O error on device mtdblock0, logical block 675
	Error -3 while decompressing!

Signed-off-by: Olav Kongas <ok@artecdesign.ee>

--- linux-2.6.15-a/drivers/mtd/chips/cfi_cmdset_0001.c	2006-01-06 16:43:05.000000000 +0200
+++ linux-2.6.15-b/drivers/mtd/chips/cfi_cmdset_0001.c	2006-01-06 16:46:36.000000000 +0200
@@ -687,6 +687,9 @@ static int get_chip(struct map_info *map
 	switch (chip->state) {
 
 	case FL_STATUS:
+		/* Some chips (e.g. Sharp's LHF64F12) need to be
+		   explicitly set to 'status read' mode. */
+		map_write(map, CMD(0x70), adr);
 		for (;;) {
 			status = map_read(map, adr);
 			if (map_word_andequal(map, status, status_OK, status_OK))
