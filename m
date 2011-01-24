Received: from 173-11-172-146-houston.txt.hfc.comcastbusiness.net
	([173.11.172.146] helo=mail.breakawaysystems.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PhVXj-0003ov-Ec
	for linux-mtd@lists.infradead.org; Mon, 24 Jan 2011 23:09:52 +0000
Received: from [192.168.1.100]
	(173-11.172.145-houston.txt.hfc.comcastbusiness.net [173.11.172.145])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: dlambert)
	by mail.breakawaysystems.com (Postfix) with ESMTPSA id BA0328BA002
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Jan 2011 17:09:46 -0600 (CST)
Message-ID: <4D3E06BA.4030305@lambsys.com>
Date: Mon, 24 Jan 2011 17:09:46 -0600
From: David Lambert <dave@lambsys.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Problems using sub-pages when NAND_VERIFY_WRITE is used
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

Due to some hardware problems, I tried to enable the NAND_VERIFY_WRITE 
in the 2.3.30.1 kernel on an Atmel AT91RM9200 chip. All seemed to work 
as expected until I attempted to make a UBI volume. On further 
investigation it appears to be when UBI attempts sub-page writes. I have 
narrowed the problem down by using mtd_subpagetest which also errors. 
Running mtd_pagetest runs fine, as does mtd_subpagetest on a kernel 
without NAND_VERIFY_WRITE enabled. I took a quick look in nand_base.c 
and there does not seem to be a separate verification for partial pages. 
I am quite a newbie to the kernel MTD at this level.


Thanks for any advice on where to look next,

Dave.


# echo 8 > /proc/sys/kernel/printk
# insmod 
/lib/modules/2.6.30.1/kernel/drivers/mtd/tests/mtd_subpagetest.ko dev=4

=================================================
mtd_subpagetest: MTD device: 4
mtd_subpagetest: MTD device size 104857600, eraseblock size 262144, page 
size 4096, subpage size 1024, count of eraseblocks 0, pages per 
eraseblock 0, OOB size 128
mtd_subpagetest: scanning for bad eraseblocks
mtd_subpagetest: scanned 400 eraseblocks, 0 are bad
mtd_subpagetest: erasing whole device
mtd_subpagetest: erased 400 eraseblocks
mtd_subpagetest: writing whole device
mtd_subpagetest: error: write failed at 0x400
mtd_subpagetest:   write size: 0x400
mtd_subpagetest:   written: 0x0
mtd_subpagetest: error -5 occurred
=================================================
insmod: cannot insert 
`/lib/modules/2.6.30.1/kernel/drivers/mtd/tests/mtd_subpagetest.ko': 
Input/output error (-1): Input/output error
# insmod /lib/modules/2.6.30.1/kernel/drivers/mtd/tests/mtd_pagetest.ko 
dev=4

=================================================
mtd_pagetest: MTD device: 4
mtd_pagetest: MTD device size 104857600, eraseblock size 262144, page 
size 4096, count of eraseblocks 400, pages per eraseblock 64, OOB size 128
mtd_pagetest: scanning for bad eraseblocks
mtd_pagetest: scanned 400 eraseblocks, 0 are bad
mtd_pagetest: erasing whole device
mtd_pagetest: erased 400 eraseblocks
mtd_pagetest: writing whole device
mtd_pagetest: written up to eraseblock 0
mtd_pagetest: written up to eraseblock 256
mtd_pagetest: written 400 eraseblocks
mtd_pagetest: verifying all eraseblocks
mtd_pagetest: verified up to eraseblock 0
mtd_pagetest: verified up to eraseblock 256
mtd_pagetest: verified 400 eraseblocks
mtd_pagetest: crosstest
mtd_pagetest: reading page at 0x0
mtd_pagetest: reading page at 0x63ff000
mtd_pagetest: reading page at 0x0
mtd_pagetest: verifying pages read at 0x0 match
mtd_pagetest: crosstest ok
mtd_pagetest: erasecrosstest
mtd_pagetest: erasing block 0
mtd_pagetest: writing 1st page of block 0
mtd_pagetest: reading 1st page of block 0
mtd_pagetest: verifying 1st page of block 0
mtd_pagetest: erasing block 0
mtd_pagetest: writing 1st page of block 0
mtd_pagetest: erasing block 399
mtd_pagetest: reading 1st page of block 0
mtd_pagetest: verifying 1st page of block 0
mtd_pagetest: erasecrosstest ok
mtd_pagetest: erasetest
mtd_pagetest: erasing block 0
mtd_pagetest: writing 1st page of block 0
mtd_pagetest: erasing block 0
mtd_pagetest: reading 1st page of block 0
mtd_pagetest: verifying 1st page of block 0 is all 0xff
mtd_pagetest: erasetest ok
mtd_pagetest: finished with 0 errors
