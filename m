Received: from duster.selinc.com ([12.156.93.38])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JkRO4-0003eg-KA
	for linux-mtd@lists.infradead.org; Fri, 11 Apr 2008 22:06:25 +0000
Received: from edison2.selinc.com (localhost [127.0.0.1])
	by duster.selinc.com (Spam Firewall) with ESMTP id B0F77122D93C
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Apr 2008 15:06:22 -0700 (PDT)
Received: from edison2.selinc.com (edison2.ad.selinc.com [10.100.0.115]) by
	duster.selinc.com with ESMTP id VkMiKCdq99iyfodZ for
	<linux-mtd@lists.infradead.org>;
	Fri, 11 Apr 2008 15:06:22 -0700 (PDT)
To: linux-mtd@lists.infradead.org
Subject: Confused about how to make a UBIFS root filesystem
MIME-Version: 1.0
Message-ID: <OF3C0A65DB.1AE994C5-ON88257428.00773679-88257428.00796BFD@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Fri, 11 Apr 2008 15:06:23 -0700
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm sorry if this is a basic/dumb question but I'm not really strong yet 
on the higher layer/user space aspects of running the kernel.  I've got my 
NAND flash driver done and now I want to get my root filesystem on the 
NAND flash.  I sort of asked this question a couple of weeks ago when I 
asked about ubimkvol but I didn't know enough then to ask the right 
questions.

I've gotten all the tools I'm just not sure what order to use them in and 
on what devices/files.  If I understand it correctly, I use mkfs.ubifs on 
a filesystem that I want to ultimately be my rfs and output that to 
someother file (say ubi_rootfs.img).  I then process that through ubinize 
which produces a config file (say ubi_rootfs.cfg).  I then use 
ubiupdatevol to write ubi_rootfs.img to the NAND using ubi_rootfs.cfg to 
control the parameters of how the image gets written.  Where I get lost 
(if I'm not already lost) is how do I prep the NAND device to receive the 
image?  Do I use ubimkvol or mkfs.ubifs?  I've looked through the FAQ at 
infradead and if I knew more about filesystems and the kernel it might all 
make sense, but I'm afraid I'm one of those folks that has to have his 
nose rubbed in it to understand, kind of like an irish setter.  Any help 
or pointers to good references are greatly appreciated.  Thanks.

Bruce

------------------------------------------------

This e-mail may contain SEL confidential information.  The opinions
expressed are not necessarily those of SEL.  Any unauthorized disclosure,
distribution or other use is prohibited.  If you received this e-mail in
error, please notify the sender, permanently delete it, and destroy any
printout.

Thank you.

------------------------------------------------
