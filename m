Received: from ctb-mesg2.saix.net ([196.25.240.82])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fplzz-0003gd-8q
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 13:58:33 +0100
Received: from kreon-mail.kreon.co.za (dsl-145-133-06.telkomadsl.co.za
	[165.145.133.6])
	by ctb-mesg2.saix.net (Postfix) with ESMTP id CEFD8395D
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 14:57:57 +0200 (SAST)
Received: from [192.168.0.102] ([192.168.0.102])
	by kreon-mail.kreon.co.za (8.13.4/8.13.4/SuSE Linux 0.7) with ESMTP id
	k5C8as8c007296
	for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2006 10:36:56 +0200
From: Kobus Wolvaardt <kobus@kreon.co.za>
To: linux-mtd@lists.infradead.org
Subject: Doc grub patch
Date: Mon, 12 Jun 2006 10:38:57 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606121038.57460.kobus@kreon.co.za>
Reply-To: kobus@kreon.co.za
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have been struggeling with compiling grub. I finally managed to compile it. 
This is for anyone who may be struggeling with the same.

I followed this howto: http://lakeshoremicro.com/diskonchip-grub-howto.html 
but I didnt use grub cvs seeing as it doesnt patch nicely (maybe there is 
newer patches, but I couldnt find it). I patched the 0.92 version of grub 
with the 0.92 patch and installed a 2.95 gcc. Compiling worked and gave me a 
grub_firmware. I also patched grub 0.94 with the 2003 patch (try 2003-01 and 
2003-11 one should patch with very few complaints). The patched grub 0.94 
compiled with gcc 3.3 (couldnt get 4.0 or 4.1 to work).

I made a cd using barts dos cd creating tools, adding the grub_firmare from 
0.94 to the cd. dformat /win:0xd0000 /bdkf0:grub_firmware loaded the firmware 
and left me with a fat16 partition. I wiped it using fdisk in linux created a 
new one and mkfs.ext2 on /dev/nftla1 and voilla.

Thanks,
Kobus

-- 
This message was scanned for viruses by MailScanner and Sophos.
