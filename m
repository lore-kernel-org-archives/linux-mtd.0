Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdmjE-0001aA-Uq
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 16:10:08 +0000
Received: by fxm3 with SMTP id 3so820125fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jul 2010 09:10:03 -0700 (PDT)
Subject: Question regarding LP NAND chip with built-in ECC
From: Peter Barada <peter.barada@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Jul 2010 12:23:55 -0400
Message-ID: <1280247835.14079.136.camel@thunk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: peter.barada@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm working to add support for a new 2KiB page NAND chip on OMAP3 that
has built in ECC - the chip calculates the ECC on writes and programs
the ECC into the OOB area, leaving 16 bytes (out of 64) usable for OOB
information.  On reads the chip reads the page into the read buffer
caculating/correcting the ECC in the process and updating the
status with the result.

My problem is trying to figure out the best way to add support for it in
the current MTD NAND structure while modifying a minimal amount of code.

The chip requires on reads to send the following (starting with the
normal read sequence):

0x00  C1 C2 R1 R2 R3 0x30

At this point wait for tR_ECC, then read the status back to determine if
a hard/soft ECC occured:

0x70 <status>

Then issue the READSTART command:

0x00

and then read out the data.

Writes appear to be handled normally.

I was wondering if anyone has run across a chip such as this

I was thinking of adding NAND_ECC_CHIP as a new ECC mode and creating
nand_read_page_chipecc() to handle the reads and use the ecc entrypoints
for NAND_ECC_NONE to handle the other functions.

Would this work?

-- 
Peter Barada <peter.barada@gmail.com>
