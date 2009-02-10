Received: from vsnlchnsym02.vsnlxchange.com ([59.163.96.19])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LWnex-0000Fh-Vl
	for linux-mtd@lists.infradead.org; Tue, 10 Feb 2009 08:08:03 +0000
Received: from vsnlchnsym02.vsnlxchange.com (unknown [127.0.0.1])
	by vsnlchnsym02.vsnlxchange.com (Symantec Brightmail Gateway) with
	ESMTP id BC4821E15 for <linux-mtd@lists.infradead.org>;
	Tue, 10 Feb 2009 13:37:24 +0530 (IST)
From: <santhoshunnikrishnan@tataelxsi.co.in>
To: <linux-mtd@lists.infradead.org>
Subject: Cowardly refusing to erase blocks on filesystem with no valid JFFS2
	nodes empty_blocks , can't read superblock
Date: Tue, 10 Feb 2009 13:35:50 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
content-transfer-encoding: 7bit
Message-ID: <VSNLCHNFE002kAy8T0O00059758@VSNLCHNFE002.VSNLXCHANGE.COM>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 
Hi all,

   I am having a problem in using with flash_erasell -j and mount commands
together.

I erased one NAND partition using the command "flash_eraseall -j /dev/mtd1"

The erase was successfully completed and the clean up marker were written
(as per the prints , i am saying this)

Then i tried to mount the erased partition using the command "mount -t jffs2
/dev/mtdblock1 /mnt"

but i got one error message saying that 

"Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 8, bad_blocks 0, c->nr_blocks 48
mount: /dev/mtdblock1: can't read superblock"

I tried to erase the flash using the command "flash_eraseall /dev/mtd1" 

and then i tried to mount the erased partition using the command "mount -t
jffs2 /dev/mtdblock1 /mnt"

This time it successfully mounted and i am able to write contents to the
partition.

I want to know why i am not able to mount after erasing the flash using the
-j option. I know that -j is to write the cleanup marker and the MTD site
recommands erasing the flash with this "-j"

Can anyone help me what the problem is ? 


Regards,
Santhosh Unnikrishnan


The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments contained in it.
