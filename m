Received: from vsnlchnsym02.vsnlxchange.com ([59.163.96.19])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LcCGI-0001Xf-DC
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 05:24:53 +0000
Received: from vsnlchnsym02.vsnlxchange.com (unknown [127.0.0.1])
	by vsnlchnsym02.vsnlxchange.com (Symantec Brightmail Gateway) with
	ESMTP id EAAB92C01 for <linux-mtd@lists.infradead.org>;
	Wed, 25 Feb 2009 10:54:08 +0530 (IST)
From: "Sridhar C.R" <sridharcr@tataelxsi.co.in>
To: <linux-mtd@lists.infradead.org>
Subject: nandwrite problem
Date: Wed, 25 Feb 2009 10:54:40 +0530
Message-ID: <005a01c99709$5c8ec4d0$72063c0a@telxsi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
content-transfer-encoding: 7bit
Reply-To: sridharcr@tataelxsi.co.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using an 8Gbit ST Micro NAND flash. I am using the cross compiled mtd
utils (mtd-utils-05.07.23) for mips 64.
The flash eraseall is working. But when I try to write an image (jffs2 / any
other), I am getting the following error

# ./nandwrite -p /dev/mtd0 rootfs.jffs2
Writing data to block 0
pwrite: Input/output error
Data did not fit into device, due to bad blocks
: Illegal seek

The block 0 of this partition is a good block. This is verified by the boot
up info as well as the flash_eraseall utility.
Also the partition is large enough to hold the image in spite of few bad
blocks in the partition.

Can anybody have any ideas?

Thanks,
Sridhar


The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments contained in it.
