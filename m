Received: from mailforwards.extendcp.co.uk ([79.170.40.74])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAPpG-0007Sp-5f
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 16:55:27 +0000
Received: from 81-179-7-96.dsl.pipex.com ([81.179.7.96] helo=hack)
	by mailforwards.extendcp.com with esmtpa (Exim 4.73)
	id 1QAPpE-0003Dv-Oz
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 17:55:24 +0100
Message-ID: <165001cbfac4$c10056b0$0400a8c0@hack>
From: "Mike Turner" <admin@islandsoftware.co.uk>
To: <linux-mtd@lists.infradead.org>
Subject: bug found in the core MTD driver code in 2.6.34 r97
Date: Thu, 14 Apr 2011 17:55:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

On the second and subsequent boots into my Gumstix NAND-resident ubifs RFS 
(Gumstix "minimal build" aimed at fast booting from NAND), it seems that 
udevadm - executing from the script /etc/init.d/udev - encounters a driver 
crash when drivers/mtd/ubi/gluebi.c:gluebi_read() passes the value 
0xFFFFFFF0 as a "struct ubi_volume_desc *" argument to  ubi_read() and 
thence ubi_leb_read().

I have established that the following prior occurrence is responsible for 
the 0xFFFFFFF0 pointer value :-

(1) drivers/mtd/mtd_blkdevs.c:blktrans_open() makes a call to 
drivers/mtd/mtdcore.c:get_mtd_device() which encounters a file lock in 
drivers/mtd/ubi/kapi.c:ubi_open_volume() causing the error code -EBUSY 
(0xFFFFFFF0) to be passed back instead of a structure pointer

(2) get_mtd_device() makes error retuns by casting the error code as a 
pointer by use of the macro ERR_PTR()

(3) blktrans_open() treats the return from get_mtd_device() in boolean 
fashion, and takes the error branch when the return value is NULL.

This disconnect has the effect that get_mtd_device() returns failure but 
blktrans_open() sees it as success.

I can't say why this problem only shows up on NAND + ubifs, as both 
functions involved in the bug are located in the MTD core functionality.  I 
can only assume it to derive from timing or other factors that mark 
differences between this RFS configuration and others.

Is this bug unique to my build, perhaps caused by an 
incomplete/wrong/missing patch, or is it the case in other builds?

I fixed it by making blktrans_open() behave exactly the same w.r.t. the 
return from get_mtd_device() as do all the other callers to that function. 
I presume that would be the correct approach?

Cheers,

Mike 
