Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QXdDc-0008UA-Ol
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2011 17:52:34 +0000
Received: by yxe42 with SMTP id 42so1757234yxe.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Jun 2011 10:52:28 -0700 (PDT)
Message-ID: <4DFB9458.1030304@gmail.com>
Date: Fri, 17 Jun 2011 13:52:24 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Eric Nelson <eric.nelson@logicpd.com>,
	Peter Barada <peter.barada@logicpd.com>
Subject: Problem with clean markers/partial writes on Micron 4-bit ECC NAND
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using a 2K page Micron NAND that has an internal 4-bit ECC engine.

The Micron NAND chip uses 8-bytes per 512 bytes of main data area + 4 
bytes of the OOB.  This allows the 32 bytes of ECC to correct 2048 bytes 
of the main data area and 16 bytes of the OOB area.

The problem I'm running into with JFFS2 is that empty flash is first 
marked with a clean marker into the OOB, and then a 2nd write to the 
main data area is done (w/o an intervening erase) to that page with data 
which corrupts the ECCs that were first modified by writing the cleanmarker.

The OOB layout I'm using (which allows ECC'ng 16 bytes of the OOB) is:

ecclayout = {
         eccbytes = 32,
         eccpos = { 8, 9, 10, 11, 12, 13, 14, 15,
                 24, 25, 26, 27, 28, 19, 30, 31,
                 40, 41, 42, 43, 44, 45, 46, 47,
                 56, 57, 58, 59, 60, 61, 62, 63},
         .oobfree = {
                 { .offset = 4,
                   .length = 4},
                 { .offset = 20,
                   .length = 4},
                 { .offset = 36,
                   .length = 4},
                 { .offset = 52,
                   .length = 4},
         },
};

After the cleanmarker is written into bytes 4-7 and 16-23 of the OOB, 
nanddump shows:

   OOB Data: ff ff ff ff 85 19 03 20 5a e3 da 69 01 40 f1 36
   OOB Data: ff ff ff ff 08 00 00 00 91 99 3c 05 01 d0 5d b3
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

Note the ECCs in bytes 8-15 and 25-31 are no longer 0xFF since the ECC 
at bytes 8-15 covers data area bytes 0-511 as well as OOB bytes 4-7 and 
the ECC at bytes 16-23 covers data area bytes 512-1023 as well as OOB 
bytes 16-23.

I believe I've figured out a workaround:

1) Modify the ecclayout to add the other 8 bytes of the OOB that are NOT 
ECCd *after* the 16 bytes that are ECCd (so the ecc layout looks like):

  ecclayout = {
         eccbytes = 32,
         eccpos = { 8, 9, 10, 11, 12, 13, 14, 15,
                 24, 25, 26, 27, 28, 19, 30, 31,
                 40, 41, 42, 43, 44, 45, 46, 47,
                 56, 57, 58, 59, 60, 61, 62, 63},
         .oobfree = {
                 { .offset = 4,
                   .length = 4},
                 { .offset = 20,
                   .length = 4},
                 { .offset = 36,
                   .length = 4},
                 { .offset = 52,
                   .length = 4},
                 { .offset = 2,
                   .length = 2},
                 { .offset = 18,
                   .length = 2},
                 { .offset = 24,
                   .length = 2},
                 { .offset = 42,
                   .length = 2},
         },
};

2) Then set ops.ooboffs to 16 in jffs2_write_nand_cleanmarker and 
jffs2_check_nand_cleanmarker.

This "offsets" the read/writes by 16 bytes to move the cleanmarker into 
OOB bytes that do not perturb the ECCs, and so far it looks to work.

However I feel this is a hack as our product will use two different NAND 
chips, the other being a more traditional SLC that can use 1-bit hamming 
for ECC (which does not ECC any bytes in the OOB).

How can I best code this into the MTD layer such that JFFS2 (and other 
NAND FSs that does partial writes including OOB bytes) can understand 
that some OOB bytes perturb the data area ECC?

I think adding a "non_ecc_oob_offset" variable to the ecclayout could 
capture this nuance of the OOB/ECC interaction for this chip and JFFS2 
could set ops.ooboffs to non_ecc_oob_offset in 
jffs2_write_nand_cleanmarker and jffs2_check_nand_cleanmarker.

Any comments are appreciated!

-- 
Peter Barada
peter.barada@gmail.com
