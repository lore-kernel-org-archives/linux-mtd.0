Received: from heimdall.doit.wisc.edu ([144.92.197.159]
	helo=smtp5.wiscmail.wisc.edu)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BeVAr-0004hz-1D
	for linux-mtd@lists.infradead.org; Sun, 27 Jun 2004 04:38:08 -0400
Received: from conversion-daemon.smtp5.wiscmail.wisc.edu by
	smtp5.wiscmail.wisc.edu
	(iPlanet Messaging Server 5.2 HotFix 1.24 (built Dec 19 2003))
	id <0HZY00901KK6PV@smtp5.wiscmail.wisc.edu>
	(original mail from jelenz@students.wisc.edu)
	for linux-mtd@lists.infradead.org; Sun, 27 Jun 2004 03:38:04 -0500 (CDT)
Received: from wiscmail.wisc.edu (happy [144.92.197.152])
	by smtp5.wiscmail.wisc.edu
	(iPlanet Messaging Server 5.2 HotFix 1.24 (built Dec 19 2003))
	with ESMTP id <0HZY00FZKLBGWL@smtp5.wiscmail.wisc.edu> for
	linux-mtd@lists.infradead.org; Sun, 27 Jun 2004 03:38:04 -0500 (CDT)
Date: Sun, 27 Jun 2004 03:38:03 -0500
From: JOHN E LENZ <jelenz@students.wisc.edu>
To: linux-mtd@lists.infradead.org
Message-id: <20bc1ac20b8a23.20b8a2320bc1ac@wiscmail.wisc.edu>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-language: en
Content-transfer-encoding: 7BIT
Content-disposition: inline
Subject: NAND buffer overflow
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I was getting some wierd errors accessing NAND flash.  I eventually traced the problem back to a buffer overflow in nand_read_raw.  This is using the current mtd CVS linked into a 2.6.7 kernel.

Here is the senerio.

in nand_bbt.c:nand_memory_bbt function calls create_bbt with
mtd->data_buf.  mtd->data_buf is of size 528

in create_bbt it calls nand_read_raw with the same buffer pointer and a readlen of 1024. Whups!

nand_read_raw drops into a loop and reads chuncks of pagesize into the buffer.  pagesize is 528, but the length to read is 1056, so it calls read_buf twice.  The problem is, the second call to read_buf will overflow and trash some memory since the buffer it is reading into is only 528 bytes.

The actual flash device is a Toshiba NAND 64MiB 3v3, 8-bit.

John

PS.  I tried sending this message with my standard mail client, but it is rejected by "Message has a suspicious header"  No other mailing lists I am on have problems.  What is this suspicious header and why is it blocking my email.  I wish the reject message would give me more information so I could actually fix the problem!!!  Oh I was going to attach the hardware driver I am using to control the nand device, but I don't really have access to it from this web client.
