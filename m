Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDIm8-00041j-JQ
	for linux-mtd@lists.infradead.org; Tue, 13 Apr 2004 08:56:08 +0100
Received: from il06exr03.mot.com (il06exr03.mot.com [129.188.137.133])
	by motgate8.mot.com (Motorola/Motgate3) with ESMTP id i3D7uJs6020701
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Apr 2004 00:56:19 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by il06exr03.mot.com (Motorola/il06exr03) with ESMTP id i3D7u2jF029041
	for <linux-mtd@lists.infradead.org>; Tue, 13 Apr 2004 02:56:03 -0500
Message-ID: <01139FC052A0D411900B00508B9535FC13AC402D@ZCH07EXM04.corp.mot.com>
From: Shen Aaron-r62966 <Aaron.Shen@motorola.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 13 Apr 2004 15:56:00 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Subject: Bad block check and ECC for NAND flash bootloader
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi friends,

  Can anyone give me some advice on 8 bit NAND flash bootloader?

  I'm going to add "bad block checking" and "ECC" for my current NAND flash bootloader. The current bootloader is divided into two parts: ipl is placed in the first 2k of NAND flash and spl is placed from 0x4000 to 0x100000. And there's no function to check bad block and do ECC now.

  For ipl, my idea is to read OOB to check bad block per block before copying spl from NAND flash to SDRAM.

  For spl, I'd like to add the same function to check bad block before erasing a block and also before copying kernel from NAND flash to SDRAM. And add ECC code after program data into the flash.

  Is that enough? Is there anything missed or wrong? I'm eager to get such an existing solution for reference. Looking forward to your advice, and any information about bad block checking and ECC for NAND flash is welcome!

Thanks.
//Aaron.

  
