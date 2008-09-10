Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KdFrH-0004Jt-Ct
	for linux-mtd@lists.infradead.org; Wed, 10 Sep 2008 02:55:08 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KdFrC-00049z-OO
	for linux-mtd@lists.infradead.org; Wed, 10 Sep 2008 02:55:02 +0000
Received: from s142-179-108-133.bc.hsia.telus.net ([142.179.108.133])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2008 02:55:02 +0000
Received: from dfoley by s142-179-108-133.bc.hsia.telus.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2008 02:55:02 +0000
To: linux-mtd@lists.infradead.org
From: Dallas Foley <dfoley@techsol.ca>
Subject: Re: ubifs mount size
Date: Tue, 09 Sep 2008 19:48:35 -0700
Message-ID: <ga7clt$kuv$1@ger.gmane.org>
References: <g85ka8$cpi$1@ger.gmane.org> <1219339475.18027.87.camel@sauron>
	<1219679497.18027.110.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1219679497.18027.110.camel@sauron>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> Hi,
> 
> On Thu, 2008-08-21 at 20:24 +0300, Artem Bityutskiy wrote:
>>> root@tsi-sa2410:~# ubimkvol /dev/ubi1 -N root -s 55MiB
>>> Volume ID 0, size 3755 LEBs (57676800 bytes, 55.0 MiB), LEB size 15360 
>>> bytes (15.0 KiB), dynamic, name "root", alignment 1
>>> root@tsi-sa2410:~# mount -t ubifs ubi1:root /mnt/linux2-root/
>>> UBIFS: default file-system created
>>> UBIFS: background thread "ubifs_bgt1_0" started, PID 930
>>> UBIFS: mounted UBI device 1, volume 0, name "root"
>>> UBIFS: file system size: 57292800 bytes (55950 KiB, 54 MiB, 3730 LEBs)
>>> UBIFS: journal size: 2872320 bytes (2805 KiB, 2 MiB, 187 LEBs)
>>> UBIFS: default compressor: LZO
>>> UBIFS: media format 4, latest format 4
>>> root@tsi-sa2410:~# df
>>> Filesystem           1k-blocks      Used Available Use% Mounted on
>>> rootfs                    8059      5284      2366  69% /
>>> /dev/root                 8059      5284      2366  69% /
>>> /dev/root                 8059      5284      2366  69% /dev/.static/dev
>>> ubi1:root                33968         0     31204   0% /mnt/linux2-root
>> I've explored this a little. Currently UBIFS indeed reports 15%-20% less
>> free space than it actually has, and we'll try to fix this.
> 
> We have improved UBIFS free space reporting and it should be much better
> now. Please, pull master branch of the ubifs-2.6.git tree to find the
> fixes.
> 
Yes, looks good now.

I'm now using a different size nand device (128MiB, 2KiB page size). 2 
partitions in the driver as (16MiB, and 112MiB), which I've just mapped 
1:1 with ubimkvol (ie. ubimkvol /dev/ubi0 -N boot -m and
ubimkvol /dev/ubi1 -N root -m)

root@Linux tsi-tpcxx 2.6.27-rc5-next-20080905 #1 Wed Sep 10 02:22:05 UTC

2008 armv4tl unknowntsi-tpcxx:~# df
Filesystem           1k-blocks      Used Available Use% Mounted on
rootfs                  102744     13096     84588  13% /
ubi1:root               102744     13096     84588  13% /
ubi0:boot                12916      1692     10520  14% /boot
