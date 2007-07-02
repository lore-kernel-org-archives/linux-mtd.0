Received: from smtp.hyd.hellosoft.com ([202.153.40.245]
	helo=hyd.hyd.hellosoft.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I5Jke-0004Y0-Md
	for linux-mtd@lists.infradead.org; Mon, 02 Jul 2007 07:07:31 -0400
Received: from [192.168.2.243] (unknown [192.168.4.39])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hyd.hyd.hellosoft.com (Postfix) with ESMTP id 0AE60F58031
	for <linux-mtd@lists.infradead.org>;
	Mon,  2 Jul 2007 16:46:11 +0530 (IST)
Message-ID: <4688DC5D.3070909@hyd.hellosoft.com>
Date: Mon, 02 Jul 2007 16:37:09 +0530
From: Ranga Raju B <brraju@hyd.hellosoft.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: NAND Driver in case of NAND Flash Controller
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: brraju@hyd.hellosoft.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
    I need to write a Linux MTD NAND Driver for an SoC. It has NAND 
Flash Controller (ARASAN NAND Flash Controller) and I am using a 2Gb 
Micron NAND Flash. The MTD drivers I currently see in the Linux tree are 
basically having the NAND Flash connected directly to the processors 
using GPIO or Address Lines. In this case it is appropriate to write 
callback functions for

hwcontrol
dev_ready
write_byte
read_byte
verify_byte
write_buf
read_buf
verify_buf

Since the IO data lines and control lines are controlled directly by the 
processor.

In case of NAND flash controller we don't have this controller. We need 
to program only the registers and we can get status only from the status 
registers. We have data ports
which can take only 512 bytes at a time. Has anyone written the Linux 
driver for this kind of situation?

I have control only at stage 1. Which are nothing but memory mapped 
interface.

                1                                             2
   ARM  --->  NAND Flash Controller   ---> NAND Flash

I don't  know  where to start this driver. I intend to use JFFS2 over 
MTD partitions.

Best regards
Ranga Raju B
