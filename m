Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15aFu5-000355-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2001 13:17:38 +0100
Received: from [211.172.225.159] (helo=hartford.siteprotect.co.kr)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 15aFzn-0003Lw-00
	for linux-mtd@lists.infradead.org; Fri, 24 Aug 2001 13:23:31 +0100
Received: (from kernelhacker@localhost)
	by hartford.siteprotect.co.kr (8.9.3/8.9.3) id VAA00528
	for mtd@infradead.org; Fri, 24 Aug 2001 21:23:24 +0900
Date: Fri, 24 Aug 2001 21:23:24 +0900
From: Kim Jong-chan <kernelhacker@hartford.siteprotect.co.kr>
To: linux-mtd@lists.infradead.org
Subject: Bootable NAND flash
Message-ID: <20010824212324.C32180@hartford.siteprotect.co.kr>
Reply-To: zeppelin@kernelhacker.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I need some advice from the people of this mailing list.
Any suggestions are welcome.

Currently, I'm working on NAND work with MediaGX board.
The point is that I want to boot linux directly from NAND flash.

Details of my board spec is...
- MediaGX 300MHz
- 16MB NAND flash(SAMSUNG K9F2808U0B-YCB0)
  Data on I/O port 0x310
  Control on I/O port 0x311

To be able to boot from NAND flash, I think BIOS modification must be done.
Or, some BIOS extension mechanism is needed just like DOC is doing.
Today, I'm very surprised to hear something.
I heard that someone make NAND flash bootable without any modification to BIOS. Is it possible?

If possible, could anyone show me the way to bootable NAND flash without any
BIOS modification or BIOS extension?

Thank you for your advice in advance. and sorry for my poor English.
