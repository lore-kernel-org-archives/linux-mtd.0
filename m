Received: from mta076c.interbusiness.it ([85.37.17.76])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft3bg-0007jI-6L
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 10:23:08 -0400
Message-ID: <44995486.6060000@eptar.com>
Date: Wed, 21 Jun 2006 16:15:34 +0200
From: Claudio Lanconelli <lanconelli.claudio@eptar.com>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: FAT vs jFFS2 for NAND.
References: <BAY110-F16C625F11A1D80EA24563ABC860@phx.gbl>	<4497DCA6.2080006@eptar.com>	<1150806658.17609.55.camel@hades.cambridge.redhat.com>	<4497F758.5090708@eptar.com>	<1150811549.6780.192.camel@localhost.localdomain>	<44982FC3.8080501@eptar.com>
	<1150825284.6780.270.camel@localhost.localdomain>
In-Reply-To: <1150825284.6780.270.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

Thomas Gleixner wrote:
> This looks up the bad block table which is created in ram after the NAND
> chip has been detected in nand_scan() and helps you to avoid reading bad
> blocks. Just skip the block, when the function returns 1.
>
> The only exception I think is block 0, which contains the SSFDC header
> and is marked bad for protection.
>
>   
Are you sure about block 0 marked bad for protection? I read in
smartmedia specification by Toshiba that SSFDC header called CIS/IDI is
located on the first good block. Here the sentence:

"The CIS/IDI Field is placed in physical block 0.
If physical block 0 is found to be a defective block, the area is placed 
in the
first normal block that is found after physical block 0.
Irrespective of the page size, only one block is assigned."
[...]
"The indication of a defective block and logical block arrangement in 
the data
area will be set in the redundancy area.
In the case of the 512+16 bytes/page models, the 6th byte (byte address 
517th)
in all pages in the redundant section contains two or more “0” bits to 
indicate
a defective block."

My code follow these instructions on the SSFDC header location, is it 
correct?
Anyone who knows it for sure?


Another question about the ECC placement. I think the MTD default ECC 
bytes placement
in the redundant area is not suitable for SSFDC. I found the 
CONFIG_MTD_NAND_ECC_SMC
in mtd configuration, but it's not used anywhere in the code. How can 
the ssfdc_ro layer tell
to use smartmedia ECC bytes placement?

Thanks,
Claudio
