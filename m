Received: from 12-234-34-139.client.attbi.com ([12.234.34.139] helo=heavens.murgatroid.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17sFm6-0006uK-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2002 05:52:18 +0100
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'Louie Boczek'" <louie@calimatech.com>,
	"'ARM Linux kernel Mailinglist'" <linux-arm-kernel@lists.arm.linux.org.uk>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Unlocking flash problem with the epxa10db device
Date: Thu, 19 Sep 2002 21:52:14 -0700
Message-ID: <000001c26061$7d20c8f0$7e00000a@bergamot>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3D8A91C3.5030404@calimatech.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I wrote cfi_intelext_varsize_frob().  It is behaving as intended.

You have to unlock/lock/erase/etc. an *entire* block/sector at a time.  

There's no way to unlock 4 bytes and leave the other (erasesize - 4)
bytes locked.  So the function returns EINVAL if the size isn't an even
"multiple" of the block size(s).  ("Multiple" here is not meant strictly
in the mathematical sense; consider variably-sized blocks.)

You'll find the other functions behave identically, e.g. erase.

-ch


-----Original Message-----
From: linux-arm-kernel-admin@lists.arm.linux.org.uk
[mailto:linux-arm-kernel-admin@lists.arm.linux.org.uk] On Behalf Of
Louie Boczek
Sent: Thursday, September 19, 2002 8:11 PM
To: ARM Linux kernel Mailinglist
Subject: Unlocking flash problem with the epxa10db device


I just started working with the Altera Excalibur board and ran into the 
following problem.

I was not able to write to the flash and found the problem lied in the 
unlocking code.  
In the epxa10db-flash.c:epxa10db_mtd_init() routine it calls:

       mymtd->unlock(mymtd, mymtd->eraseregions[i].offset + j * 
mymtd->eraseregions[i].erasesize, 4);

which eventually calls "cfi_cmdsetc_001.c:cfi_intelext_varsize_frob()" 
in this routine there is a check to make sure that the region being 
unlocked is the whole region with  the check:
        if ((ofs + len) & (regions[i].erasesize -1))
            return -EINVAL;

this fails since the call was only to unlock 4 bytes not erasesize.  So 
I fixed the problem by changing the call to mymtd->unlock()  to pass the

erasesize instead of 4.

But the question is, should "cfi_intelext_varsize_frob()" check to see 
if the whole region is specifed or should it unlock the region that the 
specified location is located.  I think the later.

I am using the linux-2.4.18-rmk7 but I also checked linux-2.4.19 and the

problem is also there.


I am new to this, I hope I gave enough and thorough informartion.

thanks
louie


-------------------------------------------------------------------
Subscription options:
http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
FAQ/Etiquette:
http://www.arm.linux.org.uk/armlinux/mailinglists.php
