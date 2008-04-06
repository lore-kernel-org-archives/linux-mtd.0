Received: from duster.selinc.com ([12.156.93.38])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JiegK-0006C1-0L
	for linux-mtd@lists.infradead.org; Sun, 06 Apr 2008 23:53:52 +0000
Received: from edison2.selinc.com (localhost [127.0.0.1])
	by duster.selinc.com (Spam Firewall) with ESMTP id 40D88EE117D
	for <linux-mtd@lists.infradead.org>;
	Sun,  6 Apr 2008 16:53:49 -0700 (PDT)
Received: from edison2.selinc.com (edison2.ad.selinc.com [10.100.0.115]) by
	duster.selinc.com with ESMTP id spk317LHfplvhNVk for
	<linux-mtd@lists.infradead.org>;
	Sun, 06 Apr 2008 16:53:49 -0700 (PDT)
To: linux-mtd@lists.infradead.org
Subject: Question about ubimkvol vs. mkfs.ubifs
MIME-Version: 1.0
Message-ID: <OF56D7FBB0.A3722ECD-ON88257423.008249AB-88257423.00833E0B@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Sun, 6 Apr 2008 16:53:37 -0700
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

This is probably a basic question but I'll admit to being lost.  I'm 
relatively new to kernel coding and up till now I've been focused on the 
very low level stuff, i.e., making hardware work and LEDs go 
blinkey-blinkey.  Currently I'm working on a NAND flash driver that I need 
to tie into UBI/UBIFS.  I've got the driver working, I can 
read/write/erase my flash parts, so the low level stuff that I understand 
is good.  Now I'm working at the higher levels/user space levels that I 
don't understand as well.  Basically my question is, what is the 
difference between ubimkvol and mkfs.ubifs?  I can run through the 
following steps and everything works just fine near as I can tell:

insmod my_flash_driver
insmod ubi mtd=1
insmod ubifs
ubimkvol /dev/ubi0 -m -N ubifs
mount -t ubifs ubi0:ubifs /mnt/nand

Once I do all that I can read/write/copy/delete/etc files just fine on the 
NAND flash.  So, like I said it appears to be working just fine.  But 
everything I see on the mailing list seems to be saying I should be using 
mkfs.ubifs.  But if everything works and I'm mounting the device as a 
UBIFS filesystem, what (if anything) is mkfs.ubifs going to do for me that 
I don't already have done?

Oh, another question.  I've seen reference to an 'fs-test' that's supposed 
to be part of mtd-utils, but I can't seem to find it anywhere.  Can 
someone please point me to the sources?  Is it a good test to run?

Thanks for the help.

See 'ya!

Bruce
