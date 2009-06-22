Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MIenO-0008U8-GQ
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 08:22:37 +0000
Subject: Re: [PATCH v2 2/3] NAND: Add new ECC mode - ECC_HW_OOB_FIRST
From: Artem Bityutskiy <dedekind@infradead.org>
To: s-paulraj@ti.com
In-Reply-To: <1245183797-11469-1-git-send-email-s-paulraj@ti.com>
References: <1245183797-11469-1-git-send-email-s-paulraj@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Jun 2009 11:21:41 +0300
Message-Id: <1245658901.9487.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
	Sneha Narnakaje <nsnehaprabha@ti.com>,
	linux-mtd@lists.infradead.org, tglx@linutronix.de,
	dwmw2@infradead.org, akpm@linux-foundation.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-06-16 at 16:23 -0400, s-paulraj@ti.com wrote:
> From: Sandeep Paulraj <s-paulraj@ti.com>
> 
> The patch applies to linux-mtd GIT tree
> 
> This patch adds the new mode NAND_ECC_HW_OOB_FIRST in the nand code to
> support 4-bit ECC on TI DaVinci devices with large page (up to 4K) NAND
> chips. This ECC mode is similar to NAND_ECC_HW, with the exception of
> read_page API that first reads the OOB area, reads the data in chunks, feeds
> the ECC from OOB area to the ECC hw engine and perform any correction on the
> data as per the ECC status reported by the engine.
> 
> "ECC_HW_OOB_FIRST" name suggested by Thomas Gleixner
> 
> Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
> Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com

I've applied your 3 patches and they do not compile:

  CC [M]  drivers/mtd/nand/nand_ecc.o          
drivers/mtd/nand/nand_base.c: In function ‘nand_scan_tail’:
drivers/mtd/nand/nand_base.c:2724: error: ‘NAND_ECC_HW_OOB_FIRST’ undeclared (first use in this function)
drivers/mtd/nand/nand_base.c:2724: error: (Each undeclared identifier is reported only once              
drivers/mtd/nand/nand_base.c:2724: error: for each function it appears in.)                              
make[3]: *** [drivers/mtd/nand/nand_base.o] Error 1                                                      
make[3]: *** Waiting for unfinished jobs....                                                             
  CC [M]  drivers/mtd/devices/docprobe.o                                                                 

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
