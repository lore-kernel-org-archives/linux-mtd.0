Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KUDGq-00026e-2B
	for linux-mtd@lists.infradead.org; Sat, 16 Aug 2008 04:20:08 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KUDGl-0007LD-0T
	for linux-mtd@lists.infradead.org; Sat, 16 Aug 2008 04:20:03 +0000
Received: from d75-157-41-137.bchsia.telus.net ([75.157.41.137])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sat, 16 Aug 2008 04:20:03 +0000
Received: from dfoley by d75-157-41-137.bchsia.telus.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sat, 16 Aug 2008 04:20:03 +0000
To: linux-mtd@lists.infradead.org
From: dfoley <dfoley@telus.net>
Subject: ubifs mount size
Date: Fri, 15 Aug 2008 21:16:07 -0700
Message-ID: <g85ka8$cpi$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does this look right (info below) ?
I create a 55MiB volume, but df only shows 33968KiB
This is linux-2.6.24.4. I've also used linux-2.6.27-rc3.


root@tsi-sa2410:~# ubimkvol /dev/ubi1 -N root -s 55MiB
Volume ID 0, size 3755 LEBs (57676800 bytes, 55.0 MiB), LEB size 15360 
bytes (15.0 KiB), dynamic, name "root", alignment 1
root@tsi-sa2410:~# mount -t ubifs ubi1:root /mnt/linux2-root/
UBIFS: default file-system created
UBIFS: background thread "ubifs_bgt1_0" started, PID 930
UBIFS: mounted UBI device 1, volume 0, name "root"
UBIFS: file system size: 57292800 bytes (55950 KiB, 54 MiB, 3730 LEBs)
UBIFS: journal size: 2872320 bytes (2805 KiB, 2 MiB, 187 LEBs)
UBIFS: default compressor: LZO
UBIFS: media format 4, latest format 4
root@tsi-sa2410:~# df
Filesystem           1k-blocks      Used Available Use% Mounted on
rootfs                    8059      5284      2366  69% /
/dev/root                 8059      5284      2366  69% /
/dev/root                 8059      5284      2366  69% /dev/.static/dev
ubi1:root                33968         0     31204   0% /mnt/linux2-root
