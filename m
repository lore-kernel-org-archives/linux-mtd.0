Received: from motgate8.mot.com ([129.188.136.8])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cerc1-0008AN-GJ
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 04:08:07 -0500
Received: from il06exr04.mot.com (il06exr04.mot.com [129.188.137.134])
	by motgate8.mot.com (Motorola/Motgate8) with ESMTP id iBG99PfL009820
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Dec 2004 02:09:25 -0700 (MST)
Received: from zch01exm40.ap.freescale.net (zch01exm40.sps.mot.com
	[10.192.130.11])
	by il06exr04.mot.com (Motorola/il06exr04) with ESMTP id iBG96NrQ028585
	for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2004 03:06:25 -0600
Message-ID: <9FCDBA58F226D911B202000BDBAD467307D4DC@zch01exm40.sps.mot.com>
From: Shen Aaron-r62966 <aaron.shen@freescale.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 16 Dec 2004 17:07:39 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="GB2312"
Subject: Problem of sending reset operation for NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

      I met a problem when sending reset command to nand flash.

	When the command "NAND_CMD_READ0" (0x0) and "NAND_CMD_READ_ID"(0x90) are passed, it 
	can successfully execute. But when we pass "NAND_CMD_RESET"(0xff), it hangs on the statement
	      "while((!(_reg_NFC_NF_CONFIG2&NAND_FLASH_CONFIG2_INT)));". Below is the code:

	------------------------------------------------------------------------------------------
	u32 NAND_Command(IN u16 command)
	{
	    _reg_NFC_NF_CONFIG2&=~NAND_FLASH_CONFIG2_INT;
	
	    _reg_NFC_NAND_FLASH_CMD=command;
	    _reg_NFC_NF_CONFIG2&=~NAND_FLASH_CONFIG2_FCMD;
	    _reg_NFC_NF_CONFIG2|=NAND_FLASH_CONFIG2_FCMD;
	
	     while((!(_reg_NFC_NF_CONFIG2&NAND_FLASH_CONFIG2_INT)));
	    if(!(_reg_NFC_NF_CONFIG2&NAND_FLASH_CONFIG2_INT))
	        return ERR_TIME_OUT;
	
	    return 0;
	}
	------------------------------------------------------------------------------------------
	
	Is there any difference to send the reset command? Anybody can give comments 
	to me?

Best Regards!
Feng Shen (Aaron)
