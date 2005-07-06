Received: from gateway0.eecs.berkeley.edu ([169.229.60.93])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DqFIr-00049f-Pg
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2005 15:11:27 -0400
Received: from [192.168.1.104] (adsl-69-109-180-161.dsl.pltn13.pacbell.net
	[69.109.180.161]) (authenticated bits=0)
	by gateway0.EECS.Berkeley.EDU (8.13.4/8.13.3) with ESMTP id
	j66JBClJ028793
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-mtd@lists.infradead.org>;
	Wed, 6 Jul 2005 12:11:16 -0700 (PDT)
Message-ID: <42CC2CCA.2050409@eecs.berkeley.edu>
Date: Wed, 06 Jul 2005 12:11:06 -0700
From: Andrew Schultz <alschult@eecs.berkeley.edu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Problem booting DOCboot and Linux 2.6
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am currently having a problem getting DOCboot to work with a 256MB 
DoC2000 TSOP and a Linux 2.6.11 kernel image.  After following all the 
steps in the readme, I reboot the system and get the following:

Loading kernel...   CANNOT FIND IMAGE ON DEVICE

Looking at the doc_bootstub.S code, it looks like this results from not 
finding the "0xdbb1" signature in any of the pages denoting that the 
page holds part of the kernel image.  I'm not exactly sure why this is 
happening, as my doc_spl image that I wrote to the chip is the correct 
size (about 1.2MB, or approximately the size of the bzImage + size of 
doc_bootstub object file).  Other people have recently posted success 
using a very similar chip, the only difference being they used a 2.4 
kernel.  If anyone knows why this might be happening, or if anyone has 
had success using a 2.6 kernel (although I don't think that should 
matter), any help would be appreciated.

Andrew

Just for completeness, here are the steps I performed to get to this point:

1) Setup the chip with dformat:
    dformat /winl:0000 /winh:d8000 /bdkl0:2M (the /winl, /winh stuff is 
needed to work for some reason)

2) Reboot into linux off hard drive and put doc_spl image on chip:
    ./flash_eraseall /dev/mtd1
    ./nandwrite -o /dev/mtd1 doc_spl

3) Fdisk/format the /dev/inftla device to create the filesystem

4) Reboot and get the "CANNOT FIND IMAGE ON DEVICE" message
