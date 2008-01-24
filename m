Received: from rv-out-0910.google.com ([209.85.198.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHyfW-0002Z3-3p
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 09:46:46 +0000
Received: by rv-out-0910.google.com with SMTP id c24so149270rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Jan 2008 01:42:45 -0800 (PST)
Message-ID: <47985D88.1060005@gmail.com>
Date: Thu, 24 Jan 2008 04:42:32 -0500
From: Max Stirling <vicky.irobot@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd block readonly low level nand driver cramfs
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This might sound quite basic question. This is the first time I am 
looking into the MTD code so have some really basic questions.

I am trying to mount a read only fs (cramfs) on the flash. Please let me 
know if the following steps are right:

1. Enabled the following in the Kconfig files
    CONFIG_MTD_PARITIONS
    CONFIG_MTD
    CONFIG_MTD_BLOCK_RO
    CONFIG_MTD_NAND
    CONFIG_MTD_NAND_IDS


After booting the compiled kernel I am able to see the mtdblock under 
/proc/devices using 31 Major number.

Now for me to mount the cramfs image that is on the flash I need to 
provide the low level nand driver code. This I need to write but before 
starting that can any one point me to a reference nand driver code that 
is used for read only mount? Which functionality would the MTD require 
to be implemented for mounting a cramfs image which is on the flash.

Would appreciate any pointers to how to get started off with this.

thanks in advance for the reply.

M.S
