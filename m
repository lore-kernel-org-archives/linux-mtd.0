Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGrbk-0006Go-QB
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2004 04:44:08 +0100
Received: from il06exr02.mot.com (il06exr02.mot.com [129.188.137.132])
	by motgate8.mot.com (Motorola/Motgate3) with ESMTP id i3N3iMV7028391
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Apr 2004 20:44:22 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by il06exr02.mot.com (Motorola/il06exr02) with ESMTP id i3N3go7h025503
	for <linux-mtd@lists.infradead.org>; Thu, 22 Apr 2004 22:42:51 -0500
Message-ID: <01139FC052A0D411900B00508B9535FC13AC4057@ZCH07EXM04.corp.mot.com>
From: Shen Aaron-r62966 <Aaron.Shen@motorola.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 23 Apr 2004 11:43:52 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Write function for 16 bit NAND Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  I'm investigating to write boot code into an empty 16 bit NAND Flash. I met some problem, and if you have some experience, please be kindly to share with me.

  The current write program is for 8 bit NAND Flash(Samsung K9F5608Q0C) and is loaded by AXD. The flash is 32 page per block and 528(512+16) byte per page.  I use int type pointer to copy the boot data into the main area buffer of the flash. It's successful as I read back the data from the flash to verify.

  As the 16 bit NAND Flash(Samsung K9F5616Q0C) is also 32 page per block but 264(256+8) word per page, I try to use short int type pointer to copy. The data has truly been copied into the main area buffer of the flash. But after I read back it from the flash, it seems to be all 0xFFFF. Seems the data are not writen into the flash at all.

  Any comments and suggestion?

Thanks.
-Aaron.
  
