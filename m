Received: from motgate7.mot.com ([129.188.136.7])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BFpnT-0002RO-03
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2004 08:35:59 +0100
Received: from az33exr01.mot.com (az33exr01.mot.com [10.64.251.231])
	by motgate7.mot.com (Motorola/Motgate7) with ESMTP id i3K7Vs9i000478
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Apr 2004 00:31:55 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by az33exr01.mot.com (Motorola/az33exr01) with ESMTP id i3K7VLqg029744
	for <linux-mtd@lists.infradead.org>; Tue, 20 Apr 2004 02:31:22 -0500
Message-ID: <01139FC052A0D411900B00508B9535FC13AC4046@ZCH07EXM04.corp.mot.com>
From: Shen Aaron-r62966 <Aaron.Shen@motorola.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 20 Apr 2004 15:35:52 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: ECC byte 4 and 5 not equal to what have just been writen
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  Is there anyone aware of such problem about ECC?
  When I read back the OOB data after writing to a page, I find the offset 06 and 07 are not equal to what have just been writen into the page.

  The part of codes are :
==========================================
  ......
  // char spare[16] is for oob data in spare area
  mx2_write_ecc((char*)p, spare, last);		// My function to set the spare[16] before write a page
  printOut("The spare[ ] to write in flash is :\n");	// Messege printed out
  printOut(spare);					// Print out the spare[ ]
  if(NAND_Write_OnePage(page, (char*)p, spare))	// Write the page with spare[ ] into NAND flash
	return;
  NAND_Read_OOB(0, page, spare, 16);		// Read back the oob data into spare[ ]
  printOut("The spare[ ] to read back from flash is :\n");
  printOut(spare);					// Print out the spare[ ]
  ......
===========================================

  While, I got the follow output:
===========================================
......
The spare[ ] to write in flash is :
spare[00] = 56
spare[01] = 5A
spare[02] = 6B
spare[03] = 66
spare[04] = 00
spare[05] = FF
spare[06] = A6
spare[07] = 9B
spare[08] = FF
spare[09] = FF
spare[0A] = FF
spare[0B] = FF
spare[0C] = FF
spare[0D] = FF
spare[0E] = FF
spare[0F] = FF
The spare[ ] to read back from flash is :
spare[00] = 56
spare[01] = 5A
spare[02] = 6B
spare[03] = 66
spare[04] = 00
spare[05] = FF
spare[06] = C0
spare[07] = 33
spare[08] = C3
spare[09] = A9
spare[0A] = 02
spare[0B] = FF
spare[0C] = FF
spare[0D] = FF
spare[0E] = FF
spare[0F] = FF
......
===========================================

  As you may have found out, the spare[0]~spare[5] are the same as writen. But spare[6] and spare[7] are different, while spare[8], spare[9] and spare[A] are so strange.

  This will cause the failure of ecc correction for the upper 256 bytes of data in each page. Can you give me some comments?

  Is this a known problem of NAND_Read_OOB( )?

Thanks.
Aaron
