Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dur4a-0007bT-8d
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 08:19:49 -0400
Message-ID: <42DCEFD6.8010006@cetrtapot.si>
Date: Tue, 19 Jul 2005 14:19:34 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <42DCD1D3.8070303@cetrtapot.si>	<42DCD6C1.6010509@yandex.ru>	<42DCDCDA.2090909@cetrtapot.si>	<42DCDE8C.702@yandex.ru>	<42DCE7E4.2050303@cetrtapot.si>
	<42DCEC94.8050505@yandex.ru>
In-Reply-To: <42DCEC94.8050505@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
> Hinko Kocevar wrote:
> 
>> There you go. This is with JFFS2 debug set to 2 and MTD debug set to 3.
>> ...
>> NET: Registered protocol family 17
>> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 
>> 0x234a instead
> 
> 
> Even though you enabled JFFS2 debugging,
> the debugging messages are not seen on your console.
> 
> Could you please dump the first N (say, 128) bytes at the offset 
> 0x00000000 of the JFFS2 partition (/dev/mtd2)? Does it contain 0x234a 
> (LE) as the first 16-bit word?
> 

Creating 3 MTD partitions on "Trizeps2 flash":
0x00000000-0x00060000 : "Bootloader"
mtd: Giving out device 0 to Bootloader
0x00060000-0x00140000 : "Kernel"
mtd: Giving out device 1 to Kernel
0x00140000-0x01000000 : "Filesystem"
mtd: Giving out device 2 to Filesystem


Core#0>md 0x140000
00140000 : 20031985 0000000c e41eb0b1 e0011985  ... ............
00140010 : 0000002b 7d266ee6 00000001 00000000  +....n&}........
00140020 : 00000002 424913b1 00000403 daeea20c  ......IB........
00140030 : 556683ff ff6e6962 e0021985 00000044  ..fUbin.....D...
00140040 : 98f7fb1d 00000002 00000001 000041ed  .............A..
00140050 : 006403e8 00000000 424913b1 424913b1  ..d.......IB..IB
00140060 : 424913b1 00000000 00000000 00000000  ..IB............
00140070 : 00000000 00000000 379225cb e0011985  .........%.7....
00140080 : 0000002b 7d266ee6 00000001 00000001  +....n&}........
00140090 : 00000003 4242dd58 00000403 855955ad  ....X.BB.....UY.
001400a0 : ee322817 ff766564 e0021985 00000044  .(2.dev.....D...
001400b0 : 98f7fb1d 00000003 00000001 000041ed  .............A..
001400c0 : 006403e8 00000000 4242dd58 4242dd58  ..d.....X.BBX.BB
001400d0 : 4242dd58 00000000 00000000 00000000  X.BB............
001400e0 : 00000000 00000000 c54033c0 e0011985  .........3@.....
001400f0 : 0000002b 7d266ee6 00000001 00000002  +....n&}........


I've spotted possible problem here - it seems that kernel overwrites part of 
the rootfs at the begining - I have reserved 0xe0000 for kernel partition, but 
I noticed that my newer kernels are larger than this. Need to check this out...

-- 
..because under Linux "if something is possible in principle,
then it is already implemented or somebody is working on it".

					--LKI
