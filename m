Received: from mail3.aracnet.com ([216.99.193.38])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1765Zr-0000R4-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 09:16:35 +0100
Received: from tinman.seitzassoc.com (216-99-217-243.dsl.aracnet.com [216.99.217.243])
	by mail3.aracnet.com (8.12.2/8.12.1) with ESMTP id g4A8GWk3006032
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 01:16:33 -0700
Received: from tinman.seitzassoc.com (IDENT:galens@localhost [127.0.0.1])
	by tinman.seitzassoc.com (8.11.6/8.11.6) with ESMTP id g4A8GVP25163
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 01:16:32 -0700
Message-Id: <200205100816.g4A8GVP25163@tinman.seitzassoc.com>
To: linux-mtd@lists.infradead.org
Subject: can't rmmod cfi_cmdset_0002
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 10 May 2002 01:16:31 -0700
From: Galen Seitz <galens@seitzassoc.com>
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

In the course of hacking on pci.c, I've encountered an issue with removing
the cfi_cmdset_0002 module.  It seems that once I have successfully
loaded the pci module, I can't unload the cmdset module.  Is it likely
that I have created this problem?  How does one go about tracking
down a problem like this?

thanks,
galen

oz:~# cat /proc/version
Linux version 2.4.19-pre8 (galens@oz.seitzassoc.com) (gcc version 2.96 
20000731 (Red Hat Linux 7.1 2.96-98)) #1 Thu May 9 13:48:33 PDT 2002
oz:~# /sbin/modprobe -a mtdchar mtdblock cfi_cmdset_0002 map_rom cfi_probe
oz:~# /sbin/lsmod 
Module                  Size  Used by
cfi_probe               7424   0  (unused)
gen_probe               1712   0  [cfi_probe]
map_rom                  688   0  (unused)
chipreg                  704   0  [cfi_probe map_rom]
cfi_cmdset_0002        15616   0  (unused)
mtdblock                4608   0  (unused)
mtdchar                 4064   0  (unused)
mtdcore                 2176   0  [mtdblock mtdchar]
3c59x                  24928   1 
rtc                     6016   0  (autoclean)
oz:~# /sbin/rmmod mtdchar mtdblock cfi_cmdset_0002 map_rom cfi_probe
oz:~# /sbin/lsmod 
Module                  Size  Used by
gen_probe               1712   0 
chipreg                  704   0 
mtdcore                 2176   0 
3c59x                  24928   1 
rtc                     6016   0  (autoclean)
oz:~# /sbin/modprobe -a mtdchar mtdblock cfi_cmdset_0002 map_rom cfi_probe
oz:~# /sbin/modprobe -a pci                                               
oz:~# /sbin/lsmod 
Module                  Size  Used by
pci                     2880   0  (unused)
cfi_probe               7424   0 
map_rom                  688   0  (unused)
cfi_cmdset_0002        15616   2 
mtdblock                4608   0  (unused)
mtdchar                 4064   0  (unused)
gen_probe               1712   0  [cfi_probe]
chipreg                  704   0  [pci cfi_probe map_rom]
mtdcore                 2176   1  [pci mtdblock mtdchar]
3c59x                  24928   1 
rtc                     6016   0  (autoclean)
oz:~# /sbin/rmmod pci                                       
oz:~# /sbin/rmmod mtdchar mtdblock cfi_cmdset_0002 map_rom cfi_probe
cfi_cmdset_0002: Device or resource busy
oz:~# /sbin/lsmod 
Module                  Size  Used by
cfi_cmdset_0002        15616   1 
gen_probe               1712   0 
chipreg                  704   0 
mtdcore                 2176   0 
3c59x                  24928   1 
rtc                     6016   0  (autoclean)
