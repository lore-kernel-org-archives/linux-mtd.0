Received: from mail.rdsor.ro ([193.231.238.10])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CI01f-0003An-5u
	for linux-mtd@lists.infradead.org; Thu, 14 Oct 2004 03:27:54 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.rdsor.ro (Postfix) with ESMTP id 56FDEC1D9
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Oct 2004 10:23:29 +0300 (EEST)
Received: from mail.rdsor.ro ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 14350-01-60 for <linux-mtd@lists.infradead.org>;
	Thu, 14 Oct 2004 10:23:27 +0300 (EEST)
Received: from rdsor.ro (rezso.rdsor.ro [212.93.155.158])
	by mail.rdsor.ro (Postfix) with ESMTP id 32E49C1CC
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Oct 2004 10:23:27 +0300 (EEST)
From: Balint Cristian <rezso@rdsor.ro>
To: linux-mtd@lists.infradead.org
Date: Thu, 14 Oct 2004 10:27:43 +0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200410141027.44044.rezso@rdsor.ro>
Subject: [MD-2811-032] DoCMilPlus32 missrecognized on pxa250.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello  !

 I write in a last epuization of ideas,a call on list, because i hit a strange problem
and want to call a little bit advice from authors.

 I have a PDA with an PXA250 and an MD-2811-032 on it, but my chip is missrecognized
by the kernel:

"Flash chip found: Manufacturer ID: 98, Chip ID: A5 (Toshiba: NAND 2GiB 1,8V)"

 Uhmm 2GiB ??!? it is 32M.

 I have checked DoC registers it is 16 bit wired,it can be found in CS0 area at 0x00000000 of PXA.
 Also played with MRC0 regs to enable 32/16 bit of course driver worked, only if i used 8bit or 16 bit I/O  access mode in doc2000.h:

 32bit mmio for __arm__  < --- this not worked
 16bit mmio for __ppc__   < --- worked .
 readb/writeb else.            <---- worked.

 In 32bit [wich was original destinated for arm acording doc2000.h] it even dont recognise the chip ! 
The strangest part in all is that in 32 bit if i printf a little bit what happenning, the ChipID value for eg is 0xD3, value 
wich curiosly in reality is not at 0x00001000 is I expected to read from, this 0xD3 value is only present at 0x00000000  
[as i see via JTAG] !!
 Is it possible to read from another address in 32 bit mode of driver ??!?

 As specs, I used CVS version [a week old since now] of mtd with heandhealds org-2.6.8.1 kernel from an CVS tarball,
and i used old /mtd/drivers instead mtd/nand implementation because nand implementation said that not support this chip 
or something like this.


 Guys, any advice is welcome, please correct me if somewhere my suppositions are horrible,any idea is welcome
 i can send more printf more debugs give access to device, my C language skills are not the best but this really give headbang to me.

 As final words, i started adapt jtag-0.5.1 tool from openwince and combined with mtd-CVS drivers, it works at last fine
but recognise the chip as 2GiB Toshiba too :)) like linux kernel.
 Anyone wants to take a look in these lines of jtag ? 
Would be nice  to have a JTAG tool to handle these devices.


Thanks in advance,
~cristian

PS:
 excuse but english levels are poor too, it may sound in strange accords :)
