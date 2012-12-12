Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tij0e-0001s7-Uo
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 09:53:51 +0000
Received: from [10.217.3.59] ([10.217.3.59])
 by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id qBC9mQPV029507
 for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2012 01:48:27 -0800 (PST)
Message-ID: <50C85426.2090309@atmel.com>
Date: Wed, 12 Dec 2012 17:53:42 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [qestion] about multi-page read/write in nand flash
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

Hi,

I have a question about the nand flash driver. Whether the 
nand_ecc_ctrl->read_page/write_page can do more than one page operation? 
or is there any interface for nand_ecc_ctrl to let driver support 
multi-page read/write?

Since in that case I can do some optimization in multiple pages 
read/write operation. for example: prepare the buffer for next page.

Best Regards,
Josh Wu
