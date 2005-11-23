Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eez3K-0001JG-E0
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 13:09:12 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IQF001QG6F39190@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 13:09:04 -0500 (EST)
Date: Wed, 23 Nov 2005 13:09:03 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <520AB2AD990DC04082102F77CA17263801CE70B4@dlee03.ent.ti.com>
To: "Menon, Nishanth" <x0nishan@ti.com>
Message-id: <Pine.LNX.4.64.0511231252230.6022@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <520AB2AD990DC04082102F77CA17263801CE70B4@dlee03.ent.ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Jffs2 issue on latest mtd for Sibley NOR
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 Nov 2005, Menon, Nishanth wrote:

> Hi All,
> I have been trying Sibley NOR flash and the latest (as of today) MTD
> tree on my kernel.
> When I use the character device, I am able to unlock, erase, write and
> read from it successfully. Unfortunately, when I try to use jffs2 on it,
> I face the following issue:
> root@128.247.81.110:/mnt# cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00020000 00020000 "bootloader"
> mtd1: 00020000 00020000 "params"
> mtd2: 00200000 00020000 "kernel"
> mtd3: 03dc0000 00020000 "filesystem"
> mtd4: 00040000 00040000 "bootloader"
> mtd5: 00040000 00040000 "params"
> mtd6: 00200000 00040000 "kernel"
> mtd7: 07d80000 00040000 "filesystem"
> 
> The first 4 are my strata flash partitions which work fine - even
> jffs2 works on it.

Do you have separate master MTD devices for them before registering 
partitions?  In other words, how do you probe them (what does your map 
driver look like)?

If you have only a single do_map_probe() for both chip types then you're 
in trouble.  A single do_map_probe() can indeed detect and handle 
multiple flash chips as long as they are of the same model.  Otherwise 
you'll have to provide two map objects covering a single chip model each 
and register separate MTD objects.

I just tested JFFS2 over Sibley flash using linux 2.6.15-rc2 and 
everything just worked fine with this simple test:

root@mainstone:~# flash_unlock /dev/mtd2
root@mainstone:~# flash_eraseall /dev/mtd2
Erased 61184 Kibyte @ 0 -- 100% complete.
root@mainstone:~# mount -t jffs2 /dev/mtdblock2 /mnt
root@mainstone:~# touch /mnt/test
root@mainstone:~# echo "Hello World" > /mnt/test2
root@mainstone:~# umount /mnt
root@mainstone:~# mount -t jffs2 /dev/mtdblock2 /mnt
root@mainstone:~# ls -l /mnt
total 1
-rw-r--r--    1 root     root            0 Nov 23 17:59 test
-rw-r--r--    1 root     root           12 Nov 23 17:59 test2
root@mainstone:~# cat /mnt/test2
Hello World


Nicolas
