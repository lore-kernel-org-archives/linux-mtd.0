Received: from zmaj.etf.bg.ac.yu ([147.91.8.62])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lWrC-0002er-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2002 15:09:31 +0000
Received: from localhost (localhost [127.0.0.1])
	by zmaj.etf.bg.ac.yu (Postfix) with ESMTP id 8B8C146252
	for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2002 16:20:43 +0100 (CET)
Received: from burzum.etf.bg.ac.yu (burzum.etf.bg.ac.yu [147.91.9.13])
	by zmaj.etf.bg.ac.yu (Postfix) with ESMTP id 1426F461FC
	for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2002 16:20:40 +0100 (CET)
Date: Thu, 14 Mar 2002 16:20:40 +0100
From: Veselin Mijuskovic <panzer@etf.bg.ac.yu>
To: linux-mtd@lists.infradead.org
Subject: DOC2000 + GRUB/LILO booting problems
Message-ID: <20020314152040.GA24274@etf.bg.ac.yu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

	Hi!

	I have a Advantech SBC with DOC2000. I have used M-Sys drivers for a 
while, but choose to switch to 2.4.x kernels and MTD. I could manage to create
partition (/dev/nftla1) and install everything on it (a have also one IDE disk
connected). However, I couldn't manage to boot the system from DOC2000. First
I tried mtd-lilo and kernel loads fine but fails to mount the root partiton;
VFS panics and says that it could not mount root partition from the device 03:03.
No matter what I do, changing the root device with rdev and such, it always 
complains that it wish to mount device 03:03.

	So I switched to GRUB. I've grabbed the source from the CVS and installed
the patch from the mtd/patches and it compiled fine. I've used ./doc_loadbios
to install the grub_firmware and rebooted. It loaded GRUB and I've got the 
'grub>' prompt, but I couldn't load the kernel as it complains that it can 
find the DOC drive (dc0) but could not recognize the partition (replying something
like 'using the whole disk'). The command 'root (dc0,0)' fails, as well as 
find. The partition /dev/nftla1 can be mounted with no problems when I boot from
disk. I've used the DOC2000 with DOS on it, and just created the partition with
'fdisk' and formatted it with 'mke2fs'. What can be wrong and is there something
that I should do but didn't?

Thanks in advance,
-- 
 | \|/ Panzer (a.k.a Veselin Mijuskovic), Unix SysAdmin 
/|\ |  Computer Centre, School of Electical Engineering, University of Belgrade
-------------------------------------------------------------------------------
       Unix is very friendly, it's just picky about who its friends are
