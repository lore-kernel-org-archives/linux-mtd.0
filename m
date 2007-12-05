Received: from ms.csie.ntu.edu.tw ([140.112.30.68])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IzlUP-0003W3-Vs
	for linux-mtd@lists.infradead.org; Wed, 05 Dec 2007 04:04:09 +0000
Received: from localhost (localhost [127.0.0.1])
	by ms.csie.ntu.edu.tw (Postfix) with ESMTP id 6B7B64F3A63
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Dec 2007 11:58:13 +0800 (CST)
Received: from csie.ntu.edu.tw (localhost [127.0.0.1])
	by ms.csie.ntu.edu.tw (Postfix) with ESMTP id F2C4E4F3A4E
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Dec 2007 11:58:12 +0800 (CST)
From: "r93072" <r93072@csie.ntu.edu.tw>
To: linux-mtd@lists.infradead.org 
Subject: nand_write_page faile
Date: Wed, 5 Dec 2007 11:58:12 +0800
Message-Id: <20071205033853.M53454@csie.ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=big5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,
  Here is a problem when I use mtd on NAND flash.  When I use nandwrite to 
  write data into nand flash, sometimes it would fail and return -EIO.  This
  is because the data on chip and on buffer were not coherent, and the
function,    
  nand_verify_buf would return error.  Is it a hardware issue?  Or is there any  
  mechanism to recover it?  My Soc is MV88f5281 and NAND flash is samsung  
  K9F1G08U0B.  The file system is yaffs2, kernel version is 2.6.18.6.

Thanks,
George
 
--
Open WebMail Project (http://openwebmail.org)
