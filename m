Received: from web50802.mail.re2.yahoo.com ([206.190.38.111])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JSDr9-0005Bf-QR
	for linux-mtd@lists.infradead.org; Thu, 21 Feb 2008 16:01:08 +0000
Date: Thu, 21 Feb 2008 08:01:06 -0800 (PST)
From: Mangesh Edake <m_edake@yahoo.com>
Subject: Re: JFFS2 as rootfs on DataFlash
To: michael <trimarchi@gandalf.sssup.it>
In-Reply-To: <47BD4E1E.9090102@gandalf.sssup.it>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1240903012-1203609666=:92868"
Content-Transfer-Encoding: 8bit
Message-ID: <389154.92868.qm@web50802.mail.re2.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0-1240903012-1203609666=:92868
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Id: 
Content-Disposition: inline

Hi Michel,

Many thanks for your reply. 

I tried with removing -s 0x210 option, so command now
looks like,
mkfs.jffs2 -p -l -e 0x2100 -n -d /home/me/rootdir -o
jffs2.img

At the same time I added erase command in the u-boot
as suggested by you. But unfortunately the result is
same...

However I found that dataflash driver in u-boot
doesnot deal with extra 16-bytes (oob) and doesnot
write any JFFS2 specific magic bitmask, node crc,
cleanmarker etc. info to the oob. But the nand flash
(legacy) driver does the same in u-boot. Also
kernel-mtd driver for at45 dataflash is missing with
read_oob, write_oob functions whereas mtd-nand uses
those routines. So my concern is, while copying the
jffs2 image to dataflash is it necessory to write
jffs2 specific info in oob region..? My assumption is,
this info should be present in image itself and
mkfs.jffs2 must take care of this while creating an
image. (Please corret me if I'm wrong...)
I've also seen code of nandwrite (mtd utility) where
it uses -j option that takes care of jffs2_oobinfo.

So I've two problems-
i) the way I download an image (cp from u-boot method)
is wrong ? or
ii) am I creating a wrong image..? 
Please reply...

P.S. Attached here is the jffs2 image dump created as,
jffs2dump -l -c jffs2.img > dump.txt

--
Thanks and Regards,
Mangesh Edake.

 


--- michael <trimarchi@gandalf.sssup.it> wrote:

> Hi
> >> I am totally lost and cannot figure out the
> reason for
> >> the errors. I'd appericiate if anybody help to
> find
> >> out the reason.
> >>
> >> Following is the ouput LOG.
> >> ----------------------------
> >>     
> > Clean all the dataflash before, or padding the
> size with 0xff
> > If using an u-boot system add the command for
> erasing dataflash.
> >
> > Regards Michael
> >
> >   
> Do you have some news?
> 
> Regards Michael
> 
> 


      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
--0-1240903012-1203609666=:92868
Content-Type: text/plain; name="dump.txt"
Content-Description: 3618999001-dump.txt
Content-Disposition: inline; filename="dump.txt"

         Dirent     node at 0x00000000, totlen 0x0000002b, #pino     1, version     0, #ino         2, nsize        3, name bin
         Inode      node at 0x0000002c, totlen 0x00000044, #ino      2, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00000070, totlen 0x0000002b, #pino     1, version     1, #ino         3, nsize        3, name dev
         Inode      node at 0x0000009c, totlen 0x00000044, #ino      3, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000000e0, totlen 0x0000002b, #pino     1, version     2, #ino         4, nsize        3, name etc
         Inode      node at 0x0000010c, totlen 0x00000044, #ino      4, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00000150, totlen 0x0000002c, #pino     1, version     3, #ino         5, nsize        4, name home
         Inode      node at 0x0000017c, totlen 0x00000044, #ino      5, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000001c0, totlen 0x0000002b, #pino     1, version     4, #ino         6, nsize        3, name lib
         Inode      node at 0x000001ec, totlen 0x00000044, #ino      6, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00000230, totlen 0x0000002f, #pino     1, version     5, #ino         7, nsize        7, name linuxrc
         Inode      node at 0x00000260, totlen 0x0000004f, #ino      7, version     1, isize       11, csize       11, dsize       11, offset        0
         Dirent     node at 0x000002b0, totlen 0x0000002b, #pino     1, version     6, #ino         8, nsize        3, name mnt
         Inode      node at 0x000002dc, totlen 0x00000044, #ino      8, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00000320, totlen 0x0000002b, #pino     1, version     7, #ino         9, nsize        3, name opt
         Inode      node at 0x0000034c, totlen 0x00000044, #ino      9, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00000390, totlen 0x0000002c, #pino     1, version     8, #ino        10, nsize        4, name proc
         Inode      node at 0x000003bc, totlen 0x00000044, #ino     10, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00000400, totlen 0x0000002c, #pino     1, version     9, #ino        11, nsize        4, name root
         Inode      node at 0x0000042c, totlen 0x00000044, #ino     11, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00000470, totlen 0x0000002c, #pino     1, version    10, #ino        12, nsize        4, name sbin
         Inode      node at 0x0000049c, totlen 0x00000044, #ino     12, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000004e0, totlen 0x0000002b, #pino     1, version    11, #ino        13, nsize        3, name tmp
         Inode      node at 0x0000050c, totlen 0x00000044, #ino     13, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00000550, totlen 0x0000002b, #pino     1, version    12, #ino        14, nsize        3, name usr
         Inode      node at 0x0000057c, totlen 0x00000044, #ino     14, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000005c0, totlen 0x0000002b, #pino     1, version    13, #ino        15, nsize        3, name var
         Inode      node at 0x000005ec, totlen 0x00000044, #ino     15, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00000630, totlen 0x0000002b, #pino     2, version    14, #ino        16, nsize        3, name ash
         Inode      node at 0x0000065c, totlen 0x0000004b, #ino     16, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x000006a8, totlen 0x0000002f, #pino     2, version    15, #ino        17, nsize        7, name busybox
         Inode      node at 0x000006d8, totlen 0x00000685, #ino     17, version     1, isize   204208, csize     1601, dsize     4096, offset        0
         Inode      node at 0x00000d60, totlen 0x0000079a, #ino     17, version     2, isize   204208, csize     1878, dsize     4096, offset     4096
         Inode      node at 0x000014fc, totlen 0x00000563, #ino     17, version     3, isize   204208, csize     1311, dsize     4096, offset     8192
         Inode      node at 0x00001a60, totlen 0x0000069c, #ino     17, version     4, isize   204208, csize     1624, dsize     2719, offset    12288
Empty space found from 0x000020fc to 0x00002100
         Inode      node at 0x00002100, totlen 0x0000041b, #ino     17, version     5, isize   204208, csize      983, dsize     1377, offset    15007
         Inode      node at 0x0000251c, totlen 0x00000a69, #ino     17, version     6, isize   204208, csize     2597, dsize     4096, offset    16384
         Inode      node at 0x00002f88, totlen 0x00000ae0, #ino     17, version     7, isize   204208, csize     2716, dsize     4096, offset    20480
         Inode      node at 0x00003a68, totlen 0x00000794, #ino     17, version     8, isize   204208, csize     1872, dsize     2857, offset    24576
Empty space found from 0x000041fc to 0x00004200
         Inode      node at 0x00004200, totlen 0x00000364, #ino     17, version     9, isize   204208, csize      800, dsize     1239, offset    27433
         Inode      node at 0x00004564, totlen 0x00000a6b, #ino     17, version    10, isize   204208, csize     2599, dsize     4096, offset    28672
         Inode      node at 0x00004fd0, totlen 0x00000a1d, #ino     17, version    11, isize   204208, csize     2521, dsize     4096, offset    32768
         Inode      node at 0x000059f0, totlen 0x0000090b, #ino     17, version    12, isize   204208, csize     2247, dsize     3669, offset    36864
Empty space found from 0x000062fc to 0x00006300
         Inode      node at 0x00006300, totlen 0x000001b1, #ino     17, version    13, isize   204208, csize      365, dsize      427, offset    40533
         Inode      node at 0x000064b4, totlen 0x00000a4c, #ino     17, version    14, isize   204208, csize     2568, dsize     4096, offset    40960
         Inode      node at 0x00006f00, totlen 0x00000a40, #ino     17, version    15, isize   204208, csize     2556, dsize     4096, offset    45056
         Inode      node at 0x00007940, totlen 0x00000abc, #ino     17, version    16, isize   204208, csize     2680, dsize     3963, offset    49152
Empty space found from 0x000083fc to 0x00008400
         Inode      node at 0x00008400, totlen 0x000000c9, #ino     17, version    17, isize   204208, csize      133, dsize      133, offset    53115
         Inode      node at 0x000084cc, totlen 0x00000ad9, #ino     17, version    18, isize   204208, csize     2709, dsize     4096, offset    53248
         Inode      node at 0x00008fa8, totlen 0x00000ac2, #ino     17, version    19, isize   204208, csize     2686, dsize     4096, offset    57344
         Inode      node at 0x00009a6c, totlen 0x00000a8f, #ino     17, version    20, isize   204208, csize     2635, dsize     3922, offset    61440
Empty space found from 0x0000a4fc to 0x0000a500
         Inode      node at 0x0000a500, totlen 0x000000f2, #ino     17, version    21, isize   204208, csize      174, dsize      174, offset    65362
         Inode      node at 0x0000a5f4, totlen 0x00000aab, #ino     17, version    22, isize   204208, csize     2663, dsize     4096, offset    65536
         Inode      node at 0x0000b0a0, totlen 0x00000a46, #ino     17, version    23, isize   204208, csize     2562, dsize     4096, offset    69632
         Inode      node at 0x0000bae8, totlen 0x00000a6d, #ino     17, version    24, isize   204208, csize     2601, dsize     4096, offset    73728
Empty space found from 0x0000c558 to 0x0000c600
         Inode      node at 0x0000c600, totlen 0x00000a57, #ino     17, version    25, isize   204208, csize     2579, dsize     4096, offset    77824
         Inode      node at 0x0000d058, totlen 0x00000aa6, #ino     17, version    26, isize   204208, csize     2658, dsize     4096, offset    81920
         Inode      node at 0x0000db00, totlen 0x00000b16, #ino     17, version    27, isize   204208, csize     2770, dsize     4096, offset    86016
         Inode      node at 0x0000e618, totlen 0x000000e8, #ino     17, version    28, isize   204208, csize      164, dsize      164, offset    90112
         Inode      node at 0x0000e700, totlen 0x00000a74, #ino     17, version    29, isize   204208, csize     2608, dsize     3932, offset    90276
         Inode      node at 0x0000f174, totlen 0x00000aef, #ino     17, version    30, isize   204208, csize     2731, dsize     4096, offset    94208
         Inode      node at 0x0000fc64, totlen 0x00000b16, #ino     17, version    31, isize   204208, csize     2770, dsize     4096, offset    98304
Empty space found from 0x0001077c to 0x00010800
         Inode      node at 0x00010800, totlen 0x00000a65, #ino     17, version    32, isize   204208, csize     2593, dsize     4096, offset   102400
         Inode      node at 0x00011268, totlen 0x00000a4e, #ino     17, version    33, isize   204208, csize     2570, dsize     4096, offset   106496
         Inode      node at 0x00011cb8, totlen 0x00000a0a, #ino     17, version    34, isize   204208, csize     2502, dsize     4096, offset   110592
         Inode      node at 0x000126c4, totlen 0x00000237, #ino     17, version    35, isize   204208, csize      499, dsize      647, offset   114688
Empty space found from 0x000128fc to 0x00012900
         Inode      node at 0x00012900, totlen 0x0000091a, #ino     17, version    36, isize   204208, csize     2262, dsize     3449, offset   115335
         Inode      node at 0x0001321c, totlen 0x00000a87, #ino     17, version    37, isize   204208, csize     2627, dsize     4096, offset   118784
         Inode      node at 0x00013ca4, totlen 0x00000a5b, #ino     17, version    38, isize   204208, csize     2583, dsize     4096, offset   122880
         Inode      node at 0x00014700, totlen 0x000002fc, #ino     17, version    39, isize   204208, csize      696, dsize     1001, offset   126976
Empty space found from 0x000149fc to 0x00014a00
         Inode      node at 0x00014a00, totlen 0x0000088f, #ino     17, version    40, isize   204208, csize     2123, dsize     3095, offset   127977
         Inode      node at 0x00015290, totlen 0x00000af2, #ino     17, version    41, isize   204208, csize     2734, dsize     4096, offset   131072
         Inode      node at 0x00015d84, totlen 0x00000aec, #ino     17, version    42, isize   204208, csize     2728, dsize     4096, offset   135168
         Inode      node at 0x00016870, totlen 0x0000028c, #ino     17, version    43, isize   204208, csize      584, dsize      722, offset   139264
Empty space found from 0x00016afc to 0x00016b00
         Inode      node at 0x00016b00, totlen 0x000008b1, #ino     17, version    44, isize   204208, csize     2157, dsize     3374, offset   139986
         Inode      node at 0x000173b4, totlen 0x00000ac7, #ino     17, version    45, isize   204208, csize     2691, dsize     4096, offset   143360
         Inode      node at 0x00017e7c, totlen 0x00000af9, #ino     17, version    46, isize   204208, csize     2741, dsize     4096, offset   147456
         Inode      node at 0x00018978, totlen 0x00000283, #ino     17, version    47, isize   204208, csize      575, dsize      769, offset   151552
Empty space found from 0x00018bfc to 0x00018c00
         Inode      node at 0x00018c00, totlen 0x00000824, #ino     17, version    48, isize   204208, csize     2016, dsize     3327, offset   152321
         Inode      node at 0x00019424, totlen 0x00000967, #ino     17, version    49, isize   204208, csize     2339, dsize     4096, offset   155648
         Inode      node at 0x00019d8c, totlen 0x0000084a, #ino     17, version    50, isize   204208, csize     2054, dsize     4096, offset   159744
         Inode      node at 0x0001a5d8, totlen 0x00000724, #ino     17, version    51, isize   204208, csize     1760, dsize     3114, offset   163840
Empty space found from 0x0001acfc to 0x0001ad00
         Inode      node at 0x0001ad00, totlen 0x00000279, #ino     17, version    52, isize   204208, csize      565, dsize      982, offset   166954
         Inode      node at 0x0001af7c, totlen 0x00000754, #ino     17, version    53, isize   204208, csize     1808, dsize     4096, offset   167936
         Inode      node at 0x0001b6d0, totlen 0x0000081a, #ino     17, version    54, isize   204208, csize     2006, dsize     4096, offset   172032
         Inode      node at 0x0001beec, totlen 0x0000087d, #ino     17, version    55, isize   204208, csize     2105, dsize     4096, offset   176128
         Inode      node at 0x0001c76c, totlen 0x0000068e, #ino     17, version    56, isize   204208, csize     1610, dsize     2688, offset   180224
Empty space found from 0x0001cdfc to 0x0001ce00
         Inode      node at 0x0001ce00, totlen 0x00000370, #ino     17, version    57, isize   204208, csize      812, dsize     1408, offset   182912
         Inode      node at 0x0001d170, totlen 0x000007e4, #ino     17, version    58, isize   204208, csize     1952, dsize     4096, offset   184320
         Inode      node at 0x0001d954, totlen 0x000008b3, #ino     17, version    59, isize   204208, csize     2159, dsize     4096, offset   188416
         Inode      node at 0x0001e208, totlen 0x00000985, #ino     17, version    60, isize   204208, csize     2369, dsize     4096, offset   192512
         Inode      node at 0x0001eb90, totlen 0x0000036b, #ino     17, version    61, isize   204208, csize      807, dsize     1320, offset   196608
Empty space found from 0x0001eefc to 0x0001ef00
         Inode      node at 0x0001ef00, totlen 0x000005cf, #ino     17, version    62, isize   204208, csize     1419, dsize     2776, offset   197928
         Inode      node at 0x0001f4d0, totlen 0x0000051b, #ino     17, version    63, isize   204208, csize     1239, dsize     3504, offset   200704
         Dirent     node at 0x0001f9ec, totlen 0x0000002b, #pino     2, version    16, #ino        18, nsize        3, name cat
         Inode      node at 0x0001fa18, totlen 0x0000004b, #ino     18, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001fa64, totlen 0x0000002d, #pino     2, version    17, #ino        19, nsize        5, name chgrp
         Inode      node at 0x0001fa94, totlen 0x0000004b, #ino     19, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001fae0, totlen 0x0000002d, #pino     2, version    18, #ino        20, nsize        5, name chmod
         Inode      node at 0x0001fb10, totlen 0x0000004b, #ino     20, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001fb5c, totlen 0x0000002d, #pino     2, version    19, #ino        21, nsize        5, name chown
         Inode      node at 0x0001fb8c, totlen 0x0000004b, #ino     21, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001fbd8, totlen 0x0000002a, #pino     2, version    20, #ino        22, nsize        2, name cp
         Inode      node at 0x0001fc04, totlen 0x0000004b, #ino     22, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001fc50, totlen 0x0000002c, #pino     2, version    21, #ino        23, nsize        4, name date
         Inode      node at 0x0001fc7c, totlen 0x0000004b, #ino     23, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001fcc8, totlen 0x0000002a, #pino     2, version    22, #ino        24, nsize        2, name df
         Inode      node at 0x0001fcf4, totlen 0x0000004b, #ino     24, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001fd40, totlen 0x0000002d, #pino     2, version    23, #ino        25, nsize        5, name dmesg
         Inode      node at 0x0001fd70, totlen 0x0000004b, #ino     25, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001fdbc, totlen 0x0000002c, #pino     2, version    24, #ino        26, nsize        4, name echo
         Inode      node at 0x0001fde8, totlen 0x0000004b, #ino     26, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001fe34, totlen 0x00000030, #pino     2, version    25, #ino        27, nsize        8, name hostname
         Inode      node at 0x0001fe64, totlen 0x0000004b, #ino     27, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001feb0, totlen 0x0000002c, #pino     2, version    26, #ino        28, nsize        4, name kill
         Inode      node at 0x0001fedc, totlen 0x0000004b, #ino     28, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001ff28, totlen 0x0000002a, #pino     2, version    27, #ino        29, nsize        2, name ln
         Inode      node at 0x0001ff54, totlen 0x0000004b, #ino     29, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0001ffa0, totlen 0x0000002a, #pino     2, version    28, #ino        30, nsize        2, name ls
         Inode      node at 0x0001ffcc, totlen 0x0000004b, #ino     30, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x00020018, totlen 0x0000002d, #pino     2, version    29, #ino        31, nsize        5, name mkdir
         Inode      node at 0x00020048, totlen 0x0000004b, #ino     31, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x00020094, totlen 0x0000002d, #pino     2, version    30, #ino        32, nsize        5, name mknod
         Inode      node at 0x000200c4, totlen 0x0000004b, #ino     32, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x00020110, totlen 0x0000002d, #pino     2, version    31, #ino        33, nsize        5, name mount
         Inode      node at 0x00020140, totlen 0x0000004b, #ino     33, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0002018c, totlen 0x0000002a, #pino     2, version    32, #ino        34, nsize        2, name mv
         Inode      node at 0x000201b8, totlen 0x0000004b, #ino     34, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x00020204, totlen 0x0000002d, #pino     2, version    33, #ino        35, nsize        5, name pidof
         Inode      node at 0x00020234, totlen 0x0000004b, #ino     35, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x00020280, totlen 0x0000002c, #pino     2, version    34, #ino        36, nsize        4, name ping
         Inode      node at 0x000202ac, totlen 0x0000004b, #ino     36, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x000202f8, totlen 0x0000002a, #pino     2, version    35, #ino        37, nsize        2, name ps
         Inode      node at 0x00020324, totlen 0x0000004b, #ino     37, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x00020370, totlen 0x0000002b, #pino     2, version    36, #ino        38, nsize        3, name pwd
         Inode      node at 0x0002039c, totlen 0x0000004b, #ino     38, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x000203e8, totlen 0x0000002a, #pino     2, version    37, #ino        39, nsize        2, name rm
         Inode      node at 0x00020414, totlen 0x0000004b, #ino     39, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x00020460, totlen 0x0000002d, #pino     2, version    38, #ino        40, nsize        5, name rmdir
         Inode      node at 0x00020490, totlen 0x0000004b, #ino     40, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x000204dc, totlen 0x00000031, #pino     2, version    39, #ino        41, nsize        9, name run-parts
         Inode      node at 0x00020510, totlen 0x0000004b, #ino     41, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x0002055c, totlen 0x0000002a, #pino     2, version    40, #ino        42, nsize        2, name sh
         Inode      node at 0x00020588, totlen 0x0000004b, #ino     42, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x000205d4, totlen 0x0000002d, #pino     2, version    41, #ino        43, nsize        5, name sleep
         Inode      node at 0x00020604, totlen 0x0000004b, #ino     43, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x00020650, totlen 0x0000002d, #pino     2, version    42, #ino        44, nsize        5, name touch
         Inode      node at 0x00020680, totlen 0x0000004b, #ino     44, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x000206cc, totlen 0x0000002e, #pino     2, version    43, #ino        45, nsize        6, name umount
         Inode      node at 0x000206fc, totlen 0x0000004b, #ino     45, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x00020748, totlen 0x0000002d, #pino     2, version    44, #ino        46, nsize        5, name uname
         Inode      node at 0x00020778, totlen 0x0000004b, #ino     46, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x000207c4, totlen 0x0000002e, #pino     2, version    45, #ino        47, nsize        6, name usleep
         Inode      node at 0x000207f4, totlen 0x0000004b, #ino     47, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x00020840, totlen 0x0000002f, #pino     3, version    46, #ino        48, nsize        7, name console
         Inode      node at 0x00020870, totlen 0x00000044, #ino     48, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000208b4, totlen 0x0000002b, #pino     3, version    47, #ino        49, nsize        3, name fb0
         Inode      node at 0x000208e0, totlen 0x00000044, #ino     49, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020924, totlen 0x0000002b, #pino     3, version    48, #ino        50, nsize        3, name fb1
         Inode      node at 0x00020950, totlen 0x00000044, #ino     50, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020994, totlen 0x0000002b, #pino     3, version    49, #ino        51, nsize        3, name fb2
         Inode      node at 0x000209c0, totlen 0x00000044, #ino     51, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020a04, totlen 0x0000002b, #pino     3, version    50, #ino        52, nsize        3, name fb3
         Inode      node at 0x00020a30, totlen 0x00000044, #ino     52, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020a74, totlen 0x0000002b, #pino     3, version    51, #ino        53, nsize        3, name hda
         Inode      node at 0x00020aa0, totlen 0x00000044, #ino     53, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020ae4, totlen 0x0000002c, #pino     3, version    52, #ino        54, nsize        4, name hda1
         Inode      node at 0x00020b10, totlen 0x00000044, #ino     54, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020b54, totlen 0x0000002d, #pino     3, version    53, #ino        55, nsize        5, name hda10
         Inode      node at 0x00020b84, totlen 0x00000044, #ino     55, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020bc8, totlen 0x0000002d, #pino     3, version    54, #ino        56, nsize        5, name hda11
         Inode      node at 0x00020bf8, totlen 0x00000044, #ino     56, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020c3c, totlen 0x0000002d, #pino     3, version    55, #ino        57, nsize        5, name hda12
         Inode      node at 0x00020c6c, totlen 0x00000044, #ino     57, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020cb0, totlen 0x0000002d, #pino     3, version    56, #ino        58, nsize        5, name hda13
         Inode      node at 0x00020ce0, totlen 0x00000044, #ino     58, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020d24, totlen 0x0000002d, #pino     3, version    57, #ino        59, nsize        5, name hda14
         Inode      node at 0x00020d54, totlen 0x00000044, #ino     59, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020d98, totlen 0x0000002c, #pino     3, version    58, #ino        60, nsize        4, name hda2
         Inode      node at 0x00020dc4, totlen 0x00000044, #ino     60, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020e08, totlen 0x0000002c, #pino     3, version    59, #ino        61, nsize        4, name hda3
         Inode      node at 0x00020e34, totlen 0x00000044, #ino     61, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020e78, totlen 0x0000002c, #pino     3, version    60, #ino        62, nsize        4, name hda4
         Inode      node at 0x00020ea4, totlen 0x00000044, #ino     62, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020ee8, totlen 0x0000002c, #pino     3, version    61, #ino        63, nsize        4, name hda5
         Inode      node at 0x00020f14, totlen 0x00000044, #ino     63, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020f58, totlen 0x0000002c, #pino     3, version    62, #ino        64, nsize        4, name hda6
         Inode      node at 0x00020f84, totlen 0x00000044, #ino     64, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00020fc8, totlen 0x0000002c, #pino     3, version    63, #ino        65, nsize        4, name hda7
Empty space found from 0x00020ff4 to 0x00021000
         Inode      node at 0x00021000, totlen 0x00000044, #ino     65, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021044, totlen 0x0000002c, #pino     3, version    64, #ino        66, nsize        4, name hda8
         Inode      node at 0x00021070, totlen 0x00000044, #ino     66, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000210b4, totlen 0x0000002c, #pino     3, version    65, #ino        67, nsize        4, name hda9
         Inode      node at 0x000210e0, totlen 0x00000044, #ino     67, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021124, totlen 0x0000002b, #pino     3, version    66, #ino        68, nsize        3, name hdb
         Inode      node at 0x00021150, totlen 0x00000044, #ino     68, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021194, totlen 0x0000002c, #pino     3, version    67, #ino        69, nsize        4, name hdb1
         Inode      node at 0x000211c0, totlen 0x00000044, #ino     69, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021204, totlen 0x0000002d, #pino     3, version    68, #ino        70, nsize        5, name hdb10
         Inode      node at 0x00021234, totlen 0x00000044, #ino     70, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021278, totlen 0x0000002d, #pino     3, version    69, #ino        71, nsize        5, name hdb11
         Inode      node at 0x000212a8, totlen 0x00000044, #ino     71, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000212ec, totlen 0x0000002d, #pino     3, version    70, #ino        72, nsize        5, name hdb12
         Inode      node at 0x0002131c, totlen 0x00000044, #ino     72, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021360, totlen 0x0000002d, #pino     3, version    71, #ino        73, nsize        5, name hdb13
         Inode      node at 0x00021390, totlen 0x00000044, #ino     73, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000213d4, totlen 0x0000002d, #pino     3, version    72, #ino        74, nsize        5, name hdb14
         Inode      node at 0x00021404, totlen 0x00000044, #ino     74, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021448, totlen 0x0000002c, #pino     3, version    73, #ino        75, nsize        4, name hdb2
         Inode      node at 0x00021474, totlen 0x00000044, #ino     75, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000214b8, totlen 0x0000002c, #pino     3, version    74, #ino        76, nsize        4, name hdb3
         Inode      node at 0x000214e4, totlen 0x00000044, #ino     76, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021528, totlen 0x0000002c, #pino     3, version    75, #ino        77, nsize        4, name hdb4
         Inode      node at 0x00021554, totlen 0x00000044, #ino     77, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021598, totlen 0x0000002c, #pino     3, version    76, #ino        78, nsize        4, name hdb5
         Inode      node at 0x000215c4, totlen 0x00000044, #ino     78, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021608, totlen 0x0000002c, #pino     3, version    77, #ino        79, nsize        4, name hdb6
         Inode      node at 0x00021634, totlen 0x00000044, #ino     79, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021678, totlen 0x0000002c, #pino     3, version    78, #ino        80, nsize        4, name hdb7
         Inode      node at 0x000216a4, totlen 0x00000044, #ino     80, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000216e8, totlen 0x0000002c, #pino     3, version    79, #ino        81, nsize        4, name hdb8
         Inode      node at 0x00021714, totlen 0x00000044, #ino     81, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021758, totlen 0x0000002c, #pino     3, version    80, #ino        82, nsize        4, name hdb9
         Inode      node at 0x00021784, totlen 0x00000044, #ino     82, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000217c8, totlen 0x0000002d, #pino     3, version    81, #ino        83, nsize        5, name input
         Inode      node at 0x000217f8, totlen 0x00000044, #ino     83, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002183c, totlen 0x0000002c, #pino     3, version    82, #ino        84, nsize        4, name kmem
         Inode      node at 0x00021868, totlen 0x00000044, #ino     84, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000218ac, totlen 0x0000002b, #pino     3, version    83, #ino        85, nsize        3, name log
         Inode      node at 0x000218d8, totlen 0x0000004e, #ino     85, version     1, isize       10, csize       10, dsize       10, offset        0
         Dirent     node at 0x00021928, totlen 0x0000002d, #pino     3, version    84, #ino        86, nsize        5, name loop0
         Inode      node at 0x00021958, totlen 0x00000044, #ino     86, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002199c, totlen 0x0000002d, #pino     3, version    85, #ino        87, nsize        5, name loop1
         Inode      node at 0x000219cc, totlen 0x00000044, #ino     87, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021a10, totlen 0x0000002b, #pino     3, version    86, #ino        88, nsize        3, name mem
         Inode      node at 0x00021a3c, totlen 0x00000044, #ino     88, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021a80, totlen 0x0000002c, #pino     3, version    87, #ino        89, nsize        4, name mtd0
         Inode      node at 0x00021aac, totlen 0x00000044, #ino     89, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021af0, totlen 0x0000002c, #pino     3, version    88, #ino        90, nsize        4, name mtd1
         Inode      node at 0x00021b1c, totlen 0x00000044, #ino     90, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021b60, totlen 0x0000002c, #pino     3, version    89, #ino        91, nsize        4, name mtd2
         Inode      node at 0x00021b8c, totlen 0x00000044, #ino     91, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021bd0, totlen 0x0000002c, #pino     3, version    90, #ino        92, nsize        4, name mtd3
         Inode      node at 0x00021bfc, totlen 0x00000044, #ino     92, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021c40, totlen 0x00000031, #pino     3, version    91, #ino        93, nsize        9, name mtdblock0
         Inode      node at 0x00021c74, totlen 0x00000044, #ino     93, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021cb8, totlen 0x00000031, #pino     3, version    92, #ino        94, nsize        9, name mtdblock1
         Inode      node at 0x00021cec, totlen 0x00000044, #ino     94, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021d30, totlen 0x00000031, #pino     3, version    93, #ino        95, nsize        9, name mtdblock2
         Inode      node at 0x00021d64, totlen 0x00000044, #ino     95, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021da8, totlen 0x00000031, #pino     3, version    94, #ino        96, nsize        9, name mtdblock3
         Inode      node at 0x00021ddc, totlen 0x00000044, #ino     96, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021e20, totlen 0x0000002b, #pino     3, version    95, #ino        97, nsize        3, name net
         Inode      node at 0x00021e4c, totlen 0x00000044, #ino     97, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021e90, totlen 0x0000002c, #pino     3, version    96, #ino        98, nsize        4, name null
         Inode      node at 0x00021ebc, totlen 0x00000044, #ino     98, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021f00, totlen 0x0000002d, #pino     3, version    97, #ino        99, nsize        5, name psaux
         Inode      node at 0x00021f30, totlen 0x00000044, #ino     99, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021f74, totlen 0x0000002c, #pino     3, version    98, #ino       100, nsize        4, name ptmx
         Inode      node at 0x00021fa0, totlen 0x00000044, #ino    100, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00021fe4, totlen 0x0000002b, #pino     3, version    99, #ino       101, nsize        3, name pts
         Inode      node at 0x00022010, totlen 0x00000044, #ino    101, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022054, totlen 0x0000002d, #pino     3, version   100, #ino       102, nsize        5, name ptyp0
         Inode      node at 0x00022084, totlen 0x00000044, #ino    102, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000220c8, totlen 0x0000002d, #pino     3, version   101, #ino       103, nsize        5, name ptyp1
         Inode      node at 0x000220f8, totlen 0x00000044, #ino    103, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002213c, totlen 0x0000002d, #pino     3, version   102, #ino       104, nsize        5, name ptyp2
         Inode      node at 0x0002216c, totlen 0x00000044, #ino    104, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000221b0, totlen 0x0000002d, #pino     3, version   103, #ino       105, nsize        5, name ptyp3
         Inode      node at 0x000221e0, totlen 0x00000044, #ino    105, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022224, totlen 0x0000002d, #pino     3, version   104, #ino       106, nsize        5, name ptyp4
         Inode      node at 0x00022254, totlen 0x00000044, #ino    106, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022298, totlen 0x0000002d, #pino     3, version   105, #ino       107, nsize        5, name ptyp5
         Inode      node at 0x000222c8, totlen 0x00000044, #ino    107, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002230c, totlen 0x0000002d, #pino     3, version   106, #ino       108, nsize        5, name ptyp6
         Inode      node at 0x0002233c, totlen 0x00000044, #ino    108, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022380, totlen 0x0000002d, #pino     3, version   107, #ino       109, nsize        5, name ptyp7
         Inode      node at 0x000223b0, totlen 0x00000044, #ino    109, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000223f4, totlen 0x0000002d, #pino     3, version   108, #ino       110, nsize        5, name ptyp8
         Inode      node at 0x00022424, totlen 0x00000044, #ino    110, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022468, totlen 0x0000002d, #pino     3, version   109, #ino       111, nsize        5, name ptyp9
         Inode      node at 0x00022498, totlen 0x00000044, #ino    111, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000224dc, totlen 0x0000002b, #pino     3, version   110, #ino       112, nsize        3, name ram
         Inode      node at 0x00022508, totlen 0x00000044, #ino    112, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002254c, totlen 0x0000002c, #pino     3, version   111, #ino       113, nsize        4, name ram0
         Inode      node at 0x00022578, totlen 0x00000044, #ino    113, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000225bc, totlen 0x0000002c, #pino     3, version   112, #ino       114, nsize        4, name ram1
         Inode      node at 0x000225e8, totlen 0x00000044, #ino    114, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002262c, totlen 0x0000002c, #pino     3, version   113, #ino       115, nsize        4, name ram2
         Inode      node at 0x00022658, totlen 0x00000044, #ino    115, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002269c, totlen 0x0000002c, #pino     3, version   114, #ino       116, nsize        4, name ram3
         Inode      node at 0x000226c8, totlen 0x00000044, #ino    116, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002270c, totlen 0x0000002e, #pino     3, version   115, #ino       117, nsize        6, name random
         Inode      node at 0x0002273c, totlen 0x00000044, #ino    117, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022780, totlen 0x0000002b, #pino     3, version   116, #ino       118, nsize        3, name rtc
         Inode      node at 0x000227ac, totlen 0x00000044, #ino    118, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000227f0, totlen 0x0000002b, #pino     3, version   117, #ino       119, nsize        3, name shm
         Inode      node at 0x0002281c, totlen 0x00000044, #ino    119, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022860, totlen 0x0000002b, #pino     3, version   118, #ino       120, nsize        3, name tty
         Inode      node at 0x0002288c, totlen 0x00000044, #ino    120, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000228d0, totlen 0x0000002c, #pino     3, version   119, #ino       121, nsize        4, name tty0
         Inode      node at 0x000228fc, totlen 0x00000044, #ino    121, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022940, totlen 0x0000002c, #pino     3, version   120, #ino       122, nsize        4, name tty1
         Inode      node at 0x0002296c, totlen 0x00000044, #ino    122, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000229b0, totlen 0x0000002c, #pino     3, version   121, #ino       123, nsize        4, name tty2
         Inode      node at 0x000229dc, totlen 0x00000044, #ino    123, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022a20, totlen 0x0000002c, #pino     3, version   122, #ino       124, nsize        4, name tty3
         Inode      node at 0x00022a4c, totlen 0x00000044, #ino    124, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022a90, totlen 0x0000002c, #pino     3, version   123, #ino       125, nsize        4, name tty4
         Inode      node at 0x00022abc, totlen 0x00000044, #ino    125, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022b00, totlen 0x0000002c, #pino     3, version   124, #ino       126, nsize        4, name tty5
         Inode      node at 0x00022b2c, totlen 0x00000044, #ino    126, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022b70, totlen 0x0000002c, #pino     3, version   125, #ino       127, nsize        4, name tty6
         Inode      node at 0x00022b9c, totlen 0x00000044, #ino    127, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022be0, totlen 0x0000002c, #pino     3, version   126, #ino       128, nsize        4, name tty7
         Inode      node at 0x00022c0c, totlen 0x00000044, #ino    128, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022c50, totlen 0x0000002d, #pino     3, version   127, #ino       129, nsize        5, name ttyP0
         Inode      node at 0x00022c80, totlen 0x00000044, #ino    129, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022cc4, totlen 0x0000002d, #pino     3, version   128, #ino       130, nsize        5, name ttyP1
         Inode      node at 0x00022cf4, totlen 0x00000044, #ino    130, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022d38, totlen 0x0000002d, #pino     3, version   129, #ino       131, nsize        5, name ttyP2
         Inode      node at 0x00022d68, totlen 0x00000044, #ino    131, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022dac, totlen 0x0000002d, #pino     3, version   130, #ino       132, nsize        5, name ttyP3
         Inode      node at 0x00022ddc, totlen 0x00000044, #ino    132, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022e20, totlen 0x0000002d, #pino     3, version   131, #ino       133, nsize        5, name ttyS0
         Inode      node at 0x00022e50, totlen 0x00000044, #ino    133, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022e94, totlen 0x0000002d, #pino     3, version   132, #ino       134, nsize        5, name ttyS1
         Inode      node at 0x00022ec4, totlen 0x00000044, #ino    134, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022f08, totlen 0x0000002d, #pino     3, version   133, #ino       135, nsize        5, name ttyS2
         Inode      node at 0x00022f38, totlen 0x00000044, #ino    135, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022f7c, totlen 0x0000002d, #pino     3, version   134, #ino       136, nsize        5, name ttyS3
         Inode      node at 0x00022fac, totlen 0x00000044, #ino    136, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00022ff0, totlen 0x0000002d, #pino     3, version   135, #ino       137, nsize        5, name ttyp0
         Inode      node at 0x00023020, totlen 0x00000044, #ino    137, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00023064, totlen 0x0000002d, #pino     3, version   136, #ino       138, nsize        5, name ttyp1
         Inode      node at 0x00023094, totlen 0x00000044, #ino    138, version     1, isize        0, csize        0, dsize        0, offset        0
Empty space found from 0x000230d8 to 0x00023100
         Dirent     node at 0x00023100, totlen 0x0000002d, #pino     3, version   137, #ino       139, nsize        5, name ttyp2
         Inode      node at 0x00023130, totlen 0x00000044, #ino    139, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00023174, totlen 0x0000002d, #pino     3, version   138, #ino       140, nsize        5, name ttyp3
         Inode      node at 0x000231a4, totlen 0x00000044, #ino    140, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000231e8, totlen 0x0000002d, #pino     3, version   139, #ino       141, nsize        5, name ttyp4
         Inode      node at 0x00023218, totlen 0x00000044, #ino    141, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002325c, totlen 0x0000002d, #pino     3, version   140, #ino       142, nsize        5, name ttyp5
         Inode      node at 0x0002328c, totlen 0x00000044, #ino    142, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000232d0, totlen 0x0000002d, #pino     3, version   141, #ino       143, nsize        5, name ttyp6
         Inode      node at 0x00023300, totlen 0x00000044, #ino    143, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00023344, totlen 0x0000002d, #pino     3, version   142, #ino       144, nsize        5, name ttyp7
         Inode      node at 0x00023374, totlen 0x00000044, #ino    144, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000233b8, totlen 0x0000002d, #pino     3, version   143, #ino       145, nsize        5, name ttyp8
         Inode      node at 0x000233e8, totlen 0x00000044, #ino    145, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002342c, totlen 0x0000002d, #pino     3, version   144, #ino       146, nsize        5, name ttyp9
         Inode      node at 0x0002345c, totlen 0x00000044, #ino    146, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000234a0, totlen 0x0000002f, #pino     3, version   145, #ino       147, nsize        7, name urandom
         Inode      node at 0x000234d0, totlen 0x00000044, #ino    147, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00023514, totlen 0x0000002c, #pino     3, version   146, #ino       148, nsize        4, name zero
         Inode      node at 0x00023540, totlen 0x00000044, #ino    148, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00023584, totlen 0x0000002e, #pino    83, version   147, #ino       149, nsize        6, name event0
         Inode      node at 0x000235b4, totlen 0x00000044, #ino    149, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000235f8, totlen 0x0000002e, #pino    83, version   148, #ino       150, nsize        6, name event1
         Inode      node at 0x00023628, totlen 0x00000044, #ino    150, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002366c, totlen 0x0000002e, #pino    83, version   149, #ino       151, nsize        6, name event2
         Inode      node at 0x0002369c, totlen 0x00000044, #ino    151, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000236e0, totlen 0x0000002e, #pino    83, version   150, #ino       152, nsize        6, name event3
         Inode      node at 0x00023710, totlen 0x00000044, #ino    152, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00023754, totlen 0x0000002c, #pino    83, version   151, #ino       153, nsize        4, name mice
         Inode      node at 0x00023780, totlen 0x00000044, #ino    153, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000237c4, totlen 0x0000002e, #pino    83, version   152, #ino       154, nsize        6, name mouse0
         Inode      node at 0x000237f4, totlen 0x00000044, #ino    154, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00023838, totlen 0x0000002e, #pino    83, version   153, #ino       155, nsize        6, name mouse1
         Inode      node at 0x00023868, totlen 0x00000044, #ino    155, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000238ac, totlen 0x0000002e, #pino    83, version   154, #ino       156, nsize        6, name mouse2
         Inode      node at 0x000238dc, totlen 0x00000044, #ino    156, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00023920, totlen 0x0000002e, #pino    83, version   155, #ino       157, nsize        6, name mouse3
         Inode      node at 0x00023950, totlen 0x00000044, #ino    157, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00023994, totlen 0x0000002b, #pino    97, version   156, #ino       158, nsize        3, name tun
         Inode      node at 0x000239c0, totlen 0x00000044, #ino    158, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00023a04, totlen 0x0000002a, #pino     4, version   157, #ino       159, nsize        2, name TZ
         Inode      node at 0x00023a30, totlen 0x0000004c, #ino    159, version     1, isize        8, csize        8, dsize        8, offset        0
         Dirent     node at 0x00023a7c, totlen 0x0000002d, #pino     4, version   158, #ino       160, nsize        5, name fstab
         Inode      node at 0x00023aac, totlen 0x00000110, #ino    160, version     1, isize      356, csize      204, dsize      356, offset        0
         Dirent     node at 0x00023bbc, totlen 0x0000002d, #pino     4, version   159, #ino       161, nsize        5, name group
         Inode      node at 0x00023bec, totlen 0x000000c2, #ino    161, version     1, isize      163, csize      126, dsize      163, offset        0
         Dirent     node at 0x00023cb0, totlen 0x00000030, #pino     4, version   160, #ino       162, nsize        8, name hostname
         Inode      node at 0x00023ce0, totlen 0x0000004b, #ino    162, version     1, isize        7, csize        7, dsize        7, offset        0
         Dirent     node at 0x00023d2c, totlen 0x0000002d, #pino     4, version   161, #ino       163, nsize        5, name hosts
         Inode      node at 0x00023d5c, totlen 0x00000058, #ino    163, version     1, isize       20, csize       20, dsize       20, offset        0
         Dirent     node at 0x00023db4, totlen 0x0000002e, #pino     4, version   162, #ino       164, nsize        6, name init.d
         Inode      node at 0x00023de4, totlen 0x00000044, #ino    164, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00023e28, totlen 0x0000002f, #pino     4, version   163, #ino       165, nsize        7, name inittab
         Inode      node at 0x00023e58, totlen 0x000002ec, #ino    165, version     1, isize     1410, csize      680, dsize     1410, offset        0
         Dirent     node at 0x00024144, totlen 0x0000002f, #pino     4, version   164, #ino       166, nsize        7, name inputrc
         Inode      node at 0x00024174, totlen 0x0000026e, #ino    166, version     1, isize     1180, csize      554, dsize     1180, offset        0
         Dirent     node at 0x000243e4, totlen 0x0000002d, #pino     4, version   165, #ino       167, nsize        5, name issue
         Inode      node at 0x00024414, totlen 0x0000007d, #ino    167, version     1, isize       57, csize       57, dsize       57, offset        0
         Dirent     node at 0x00024494, totlen 0x00000033, #pino     4, version   166, #ino       168, nsize       11, name ld.so.cache
         Inode      node at 0x000244c8, totlen 0x000001ba, #ino    168, version     1, isize     1211, csize      374, dsize     1211, offset        0
         Dirent     node at 0x00024684, totlen 0x0000002c, #pino     4, version   167, #ino       169, nsize        4, name mtab
         Inode      node at 0x000246b0, totlen 0x00000052, #ino    169, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x00024704, totlen 0x0000002f, #pino     4, version   168, #ino       170, nsize        7, name network
         Inode      node at 0x00024734, totlen 0x00000044, #ino    170, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00024778, totlen 0x0000002e, #pino     4, version   169, #ino       171, nsize        6, name passwd
         Inode      node at 0x000247a8, totlen 0x00000137, #ino    171, version     1, isize      489, csize      243, dsize      489, offset        0
         Dirent     node at 0x000248e0, totlen 0x0000002f, #pino     4, version   170, #ino       172, nsize        7, name profile
         Inode      node at 0x00024910, totlen 0x00000386, #ino    172, version     1, isize     1702, csize      834, dsize     1702, offset        0
         Dirent     node at 0x00024c98, totlen 0x00000031, #pino     4, version   171, #ino       173, nsize        9, name protocols
         Inode      node at 0x00024ccc, totlen 0x000002ef, #ino    173, version     1, isize     1191, csize      683, dsize     1191, offset        0
         Dirent     node at 0x00024fbc, totlen 0x00000033, #pino     4, version   172, #ino       174, nsize       11, name random-seed
         Inode      node at 0x00024ff0, totlen 0x00000210, #ino    174, version     1, isize      512, csize      460, dsize      460, offset        0
         Inode      node at 0x00025200, totlen 0x00000078, #ino    174, version     2, isize      512, csize       52, dsize       52, offset      460
         Dirent     node at 0x00025278, totlen 0x00000033, #pino     4, version   173, #ino       175, nsize       11, name resolv.conf
         Inode      node at 0x000252ac, totlen 0x00000056, #ino    175, version     1, isize       18, csize       18, dsize       18, offset        0
         Dirent     node at 0x00025304, totlen 0x00000031, #pino     4, version   174, #ino       176, nsize        9, name securetty
         Inode      node at 0x00025338, totlen 0x00000077, #ino    176, version     1, isize       64, csize       51, dsize       64, offset        0
         Dirent     node at 0x000253b0, totlen 0x00000030, #pino     4, version   175, #ino       177, nsize        8, name services
         Inode      node at 0x000253e0, totlen 0x00000799, #ino    177, version     1, isize    10873, csize     1877, dsize     4096, offset        0
         Inode      node at 0x00025b7c, totlen 0x0000073e, #ino    177, version     2, isize    10873, csize     1786, dsize     4096, offset     4096
         Inode      node at 0x000262bc, totlen 0x000003f3, #ino    177, version     3, isize    10873, csize      943, dsize     2681, offset     8192
         Dirent     node at 0x000266b0, totlen 0x0000002e, #pino     4, version   176, #ino       178, nsize        6, name shadow
         Inode      node at 0x000266e0, totlen 0x000000b3, #ino    178, version     1, isize      321, csize      111, dsize      321, offset        0
         Dirent     node at 0x00026794, totlen 0x00000032, #pino   164, version   177, #ino       179, nsize       10, name S20urandom
         Inode      node at 0x000267c8, totlen 0x000002be, #ino    179, version     1, isize     1365, csize      634, dsize     1365, offset        0
         Dirent     node at 0x00026a88, totlen 0x00000032, #pino   164, version   178, #ino       180, nsize       10, name S40network
         Inode      node at 0x00026abc, totlen 0x00000112, #ino    180, version     1, isize      340, csize      206, dsize      340, offset        0
         Dirent     node at 0x00026bd0, totlen 0x00000034, #pino   164, version   179, #ino       181, nsize       12, name S80tftpd-hpa
         Inode      node at 0x00026c04, totlen 0x000003a2, #ino    181, version     1, isize     1837, csize      862, dsize     1837, offset        0
         Dirent     node at 0x00026fa8, totlen 0x0000002b, #pino   164, version   180, #ino       182, nsize        3, name rcS
         Inode      node at 0x00026fd4, totlen 0x0000015c, #ino    182, version     1, isize      408, csize      280, dsize      408, offset        0
         Dirent     node at 0x00027130, totlen 0x00000031, #pino   170, version   181, #ino       183, nsize        9, name if-down.d
         Inode      node at 0x00027164, totlen 0x00000044, #ino    183, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000271a8, totlen 0x00000036, #pino   170, version   182, #ino       184, nsize       14, name if-post-down.d
         Inode      node at 0x000271e0, totlen 0x00000044, #ino    184, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00027224, totlen 0x00000033, #pino   170, version   183, #ino       185, nsize       11, name if-pre-up.d
         Inode      node at 0x00027258, totlen 0x00000044, #ino    185, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0002729c, totlen 0x0000002f, #pino   170, version   184, #ino       186, nsize        7, name if-up.d
Empty space found from 0x000272cc to 0x00027300
         Inode      node at 0x00027300, totlen 0x00000044, #ino    186, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00027344, totlen 0x00000032, #pino   170, version   185, #ino       187, nsize       10, name interfaces
         Inode      node at 0x00027378, totlen 0x00000079, #ino    187, version     1, isize       53, csize       53, dsize       53, offset        0
         Dirent     node at 0x000273f4, totlen 0x0000002f, #pino     5, version   186, #ino       188, nsize        7, name default
         Inode      node at 0x00027424, totlen 0x00000044, #ino    188, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00027468, totlen 0x0000003b, #pino     6, version   187, #ino       189, nsize       19, name ld-uClibc-0.9.29.so
         Inode      node at 0x000274a4, totlen 0x00000891, #ino    189, version     1, isize    21096, csize     2125, dsize     4096, offset        0
         Inode      node at 0x00027d38, totlen 0x00000a2f, #ino    189, version     2, isize    21096, csize     2539, dsize     4096, offset     4096
         Inode      node at 0x00028768, totlen 0x00000aa3, #ino    189, version     3, isize    21096, csize     2655, dsize     4096, offset     8192
         Inode      node at 0x0002920c, totlen 0x000001ee, #ino    189, version     4, isize    21096, csize      426, dsize      509, offset    12288
Empty space found from 0x000293fc to 0x00029400
         Inode      node at 0x00029400, totlen 0x00000986, #ino    189, version     5, isize    21096, csize     2370, dsize     3587, offset    12797
         Inode      node at 0x00029d88, totlen 0x000002a3, #ino    189, version     6, isize    21096, csize      607, dsize     4096, offset    16384
         Inode      node at 0x0002a02c, totlen 0x00000163, #ino    189, version     7, isize    21096, csize      287, dsize      616, offset    20480
         Dirent     node at 0x0002a190, totlen 0x00000036, #pino     6, version   188, #ino       190, nsize       14, name ld-uClibc.so.0
         Inode      node at 0x0002a1c8, totlen 0x00000057, #ino    190, version     1, isize       19, csize       19, dsize       19, offset        0
         Dirent     node at 0x0002a220, totlen 0x00000031, #pino     6, version   189, #ino       191, nsize        9, name libc.so.0
         Inode      node at 0x0002a254, totlen 0x00000057, #ino    191, version     1, isize       19, csize       19, dsize       19, offset        0
         Dirent     node at 0x0002a2ac, totlen 0x0000003a, #pino     6, version   190, #ino       192, nsize       18, name libcrypt-0.9.29.so
         Inode      node at 0x0002a2e8, totlen 0x000009f9, #ino    192, version     1, isize    12892, csize     2485, dsize     4096, offset        0
         Inode      node at 0x0002ace4, totlen 0x00000818, #ino    192, version     2, isize    12892, csize     2004, dsize     2608, offset     4096
Empty space found from 0x0002b4fc to 0x0002b500
         Inode      node at 0x0002b500, totlen 0x00000461, #ino    192, version     3, isize    12892, csize     1053, dsize     1488, offset     6704
         Inode      node at 0x0002b964, totlen 0x0000042f, #ino    192, version     4, isize    12892, csize     1003, dsize     4096, offset     8192
         Inode      node at 0x0002bd94, totlen 0x00000162, #ino    192, version     5, isize    12892, csize      286, dsize      604, offset    12288
         Dirent     node at 0x0002bef8, totlen 0x00000035, #pino     6, version   191, #ino       193, nsize       13, name libcrypt.so.0
         Inode      node at 0x0002bf30, totlen 0x00000056, #ino    193, version     1, isize       18, csize       18, dsize       18, offset        0
         Dirent     node at 0x0002bf88, totlen 0x00000037, #pino     6, version   192, #ino       194, nsize       15, name libdl-0.9.29.so
         Inode      node at 0x0002bfc0, totlen 0x0000090f, #ino    194, version     1, isize     8900, csize     2251, dsize     4096, offset        0
         Inode      node at 0x0002c8d0, totlen 0x0000059a, #ino    194, version     2, isize     8900, csize     1366, dsize     4096, offset     4096
         Inode      node at 0x0002ce6c, totlen 0x00000184, #ino    194, version     3, isize     8900, csize      320, dsize      708, offset     8192
         Dirent     node at 0x0002cff0, totlen 0x00000032, #pino     6, version   193, #ino       195, nsize       10, name libdl.so.0
         Inode      node at 0x0002d024, totlen 0x00000053, #ino    195, version     1, isize       15, csize       15, dsize       15, offset        0
         Dirent     node at 0x0002d078, totlen 0x00000033, #pino     6, version   194, #ino       196, nsize       11, name libgcc_s.so
         Inode      node at 0x0002d0ac, totlen 0x00000051, #ino    196, version     1, isize       13, csize       13, dsize       13, offset        0
         Dirent     node at 0x0002d100, totlen 0x00000035, #pino     6, version   195, #ino       197, nsize       13, name libgcc_s.so.1
         Inode      node at 0x0002d138, totlen 0x000004c2, #ino    197, version     1, isize    44136, csize     1150, dsize     2489, offset        0
Empty space found from 0x0002d5fc to 0x0002d600
         Inode      node at 0x0002d600, totlen 0x000002f1, #ino    197, version     2, isize    44136, csize      685, dsize     1607, offset     2489
         Inode      node at 0x0002d8f4, totlen 0x0000084a, #ino    197, version     3, isize    44136, csize     2054, dsize     4096, offset     4096
         Inode      node at 0x0002e140, totlen 0x00000890, #ino    197, version     4, isize    44136, csize     2124, dsize     4096, offset     8192
         Inode      node at 0x0002e9d0, totlen 0x000008b0, #ino    197, version     5, isize    44136, csize     2156, dsize     4096, offset    12288
         Inode      node at 0x0002f280, totlen 0x0000047a, #ino    197, version     6, isize    44136, csize     1078, dsize     1691, offset    16384
Empty space found from 0x0002f6fc to 0x0002f700
         Inode      node at 0x0002f700, totlen 0x00000528, #ino    197, version     7, isize    44136, csize     1252, dsize     2405, offset    18075
         Inode      node at 0x0002fc28, totlen 0x00000a79, #ino    197, version     8, isize    44136, csize     2613, dsize     4096, offset    20480
         Inode      node at 0x000306a4, totlen 0x0000094e, #ino    197, version     9, isize    44136, csize     2314, dsize     4096, offset    24576
         Inode      node at 0x00030ff4, totlen 0x00000377, #ino    197, version    10, isize    44136, csize      819, dsize     4096, offset    28672
         Inode      node at 0x0003136c, totlen 0x0000048e, #ino    197, version    11, isize    44136, csize     1098, dsize     2672, offset    32768
Empty space found from 0x000317fc to 0x00031800
         Inode      node at 0x00031800, totlen 0x0000011c, #ino    197, version    12, isize    44136, csize      216, dsize     1424, offset    35440
         Inode      node at 0x0003191c, totlen 0x000005f2, #ino    197, version    13, isize    44136, csize     1454, dsize     4096, offset    36864
         Inode      node at 0x00031f10, totlen 0x000005c1, #ino    197, version    14, isize    44136, csize     1405, dsize     3176, offset    40960
         Dirent     node at 0x000324d4, totlen 0x00000036, #pino     6, version   196, #ino       198, nsize       14, name libm-0.9.29.so
         Inode      node at 0x0003250c, totlen 0x00000711, #ino    198, version     1, isize    45812, csize     1741, dsize     4096, offset        0
         Inode      node at 0x00032c20, totlen 0x00000a51, #ino    198, version     2, isize    45812, csize     2573, dsize     4096, offset     4096
         Inode      node at 0x00033674, totlen 0x00000286, #ino    198, version     3, isize    45812, csize      578, dsize      667, offset     8192
Empty space found from 0x000338fc to 0x00033900
         Inode      node at 0x00033900, totlen 0x00000821, #ino    198, version     4, isize    45812, csize     2013, dsize     3429, offset     8859
         Inode      node at 0x00034124, totlen 0x00000a28, #ino    198, version     5, isize    45812, csize     2532, dsize     4096, offset    12288
         Inode      node at 0x00034b4c, totlen 0x00000c0e, #ino    198, version     6, isize    45812, csize     3018, dsize     4096, offset    16384
         Inode      node at 0x0003575c, totlen 0x0000029f, #ino    198, version     7, isize    45812, csize      603, dsize      730, offset    20480
Empty space found from 0x000359fc to 0x00035a00
         Inode      node at 0x00035a00, totlen 0x00000994, #ino    198, version     8, isize    45812, csize     2384, dsize     3366, offset    21210
         Inode      node at 0x00036394, totlen 0x00000a9c, #ino    198, version     9, isize    45812, csize     2648, dsize     4096, offset    24576
         Inode      node at 0x00036e30, totlen 0x00000a0b, #ino    198, version    10, isize    45812, csize     2503, dsize     4096, offset    28672
         Inode      node at 0x0003783c, totlen 0x000002bf, #ino    198, version    11, isize    45812, csize      635, dsize      752, offset    32768
Empty space found from 0x00037afc to 0x00037b00
         Inode      node at 0x00037b00, totlen 0x000008d6, #ino    198, version    12, isize    45812, csize     2194, dsize     3344, offset    33520
         Inode      node at 0x000383d8, totlen 0x000008f1, #ino    198, version    13, isize    45812, csize     2221, dsize     4096, offset    36864
         Inode      node at 0x00038ccc, totlen 0x000004a9, #ino    198, version    14, isize    45812, csize     1125, dsize     4096, offset    40960
         Inode      node at 0x00039178, totlen 0x0000019c, #ino    198, version    15, isize    45812, csize      344, dsize      756, offset    45056
         Dirent     node at 0x00039314, totlen 0x00000031, #pino     6, version   197, #ino       199, nsize        9, name libm.so.0
         Inode      node at 0x00039348, totlen 0x00000052, #ino    199, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x0003939c, totlen 0x00000035, #pino     6, version   198, #ino       200, nsize       13, name libncurses.so
         Inode      node at 0x000393d4, totlen 0x00000053, #ino    200, version     1, isize       15, csize       15, dsize       15, offset        0
         Dirent     node at 0x00039428, totlen 0x00000037, #pino     6, version   199, #ino       201, nsize       15, name libncurses.so.5
         Inode      node at 0x00039460, totlen 0x00000055, #ino    201, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x000394b8, totlen 0x00000039, #pino     6, version   200, #ino       202, nsize       17, name libncurses.so.5.5
         Inode      node at 0x000394f4, totlen 0x000005fc, #ino    202, version     1, isize   244288, csize     1464, dsize     4096, offset        0
         Inode      node at 0x00039af0, totlen 0x0000010a, #ino    202, version     2, isize   244288, csize      198, dsize      371, offset     4096
Empty space found from 0x00039bfc to 0x00039c00
         Inode      node at 0x00039c00, totlen 0x000007a0, #ino    202, version     3, isize   244288, csize     1884, dsize     3725, offset     4467
         Inode      node at 0x0003a3a0, totlen 0x0000081f, #ino    202, version     4, isize   244288, csize     2011, dsize     4096, offset     8192
         Inode      node at 0x0003abc0, totlen 0x0000084e, #ino    202, version     5, isize   244288, csize     2058, dsize     4096, offset    12288
         Inode      node at 0x0003b410, totlen 0x000005fd, #ino    202, version     6, isize   244288, csize     1465, dsize     4096, offset    16384
         Inode      node at 0x0003ba10, totlen 0x000002ec, #ino    202, version     7, isize   244288, csize      680, dsize     2156, offset    20480
Empty space found from 0x0003bcfc to 0x0003bd00
         Inode      node at 0x0003bd00, totlen 0x000001e0, #ino    202, version     8, isize   244288, csize      412, dsize     1940, offset    22636
         Inode      node at 0x0003bee0, totlen 0x0000035f, #ino    202, version     9, isize   244288, csize      795, dsize     4096, offset    24576
         Inode      node at 0x0003c240, totlen 0x0000035a, #ino    202, version    10, isize   244288, csize      790, dsize     4096, offset    28672
         Inode      node at 0x0003c59c, totlen 0x0000034d, #ino    202, version    11, isize   244288, csize      777, dsize     4096, offset    32768
         Inode      node at 0x0003c8ec, totlen 0x00000349, #ino    202, version    12, isize   244288, csize      773, dsize     4096, offset    36864
         Inode      node at 0x0003cc38, totlen 0x0000032c, #ino    202, version    13, isize   244288, csize      744, dsize     4096, offset    40960
         Inode      node at 0x0003cf64, totlen 0x00000362, #ino    202, version    14, isize   244288, csize      798, dsize     4096, offset    45056
         Inode      node at 0x0003d2c8, totlen 0x00000616, #ino    202, version    15, isize   244288, csize     1490, dsize     4096, offset    49152
         Inode      node at 0x0003d8e0, totlen 0x000004b1, #ino    202, version    16, isize   244288, csize     1133, dsize     4096, offset    53248
Empty space found from 0x0003dd94 to 0x0003de00
         Inode      node at 0x0003de00, totlen 0x00000928, #ino    202, version    17, isize   244288, csize     2276, dsize     4096, offset    57344
         Inode      node at 0x0003e728, totlen 0x00000a61, #ino    202, version    18, isize   244288, csize     2589, dsize     4096, offset    61440
         Inode      node at 0x0003f18c, totlen 0x00000a5a, #ino    202, version    19, isize   244288, csize     2582, dsize     4096, offset    65536
         Inode      node at 0x0003fbe8, totlen 0x00000312, #ino    202, version    20, isize   244288, csize      718, dsize      923, offset    69632
Empty space found from 0x0003fefc to 0x0003ff00
         Inode      node at 0x0003ff00, totlen 0x0000050e, #ino    202, version    21, isize   244288, csize     1226, dsize     3173, offset    70555
         Inode      node at 0x00040410, totlen 0x0000069c, #ino    202, version    22, isize   244288, csize     1624, dsize     4096, offset    73728
         Inode      node at 0x00040aac, totlen 0x00000a51, #ino    202, version    23, isize   244288, csize     2573, dsize     4096, offset    77824
         Inode      node at 0x00041500, totlen 0x00000a95, #ino    202, version    24, isize   244288, csize     2641, dsize     4096, offset    81920
Empty space found from 0x00041f98 to 0x00042000
         Inode      node at 0x00042000, totlen 0x00000953, #ino    202, version    25, isize   244288, csize     2319, dsize     4096, offset    86016
         Inode      node at 0x00042954, totlen 0x000009af, #ino    202, version    26, isize   244288, csize     2411, dsize     4096, offset    90112
         Inode      node at 0x00043304, totlen 0x00000b28, #ino    202, version    27, isize   244288, csize     2788, dsize     4096, offset    94208
         Inode      node at 0x00043e2c, totlen 0x000002d0, #ino    202, version    28, isize   244288, csize      652, dsize      791, offset    98304
Empty space found from 0x000440fc to 0x00044100
         Inode      node at 0x00044100, totlen 0x00000856, #ino    202, version    29, isize   244288, csize     2066, dsize     3305, offset    99095
         Inode      node at 0x00044958, totlen 0x000009cf, #ino    202, version    30, isize   244288, csize     2443, dsize     4096, offset   102400
         Inode      node at 0x00045328, totlen 0x00000a35, #ino    202, version    31, isize   244288, csize     2545, dsize     4096, offset   106496
         Inode      node at 0x00045d60, totlen 0x0000049b, #ino    202, version    32, isize   244288, csize     1111, dsize     1704, offset   110592
Empty space found from 0x000461fc to 0x00046200
         Inode      node at 0x00046200, totlen 0x00000610, #ino    202, version    33, isize   244288, csize     1484, dsize     2392, offset   112296
         Inode      node at 0x00046810, totlen 0x00000913, #ino    202, version    34, isize   244288, csize     2255, dsize     4096, offset   114688
         Inode      node at 0x00047124, totlen 0x00000980, #ino    202, version    35, isize   244288, csize     2364, dsize     4096, offset   118784
         Inode      node at 0x00047aa4, totlen 0x00000858, #ino    202, version    36, isize   244288, csize     2068, dsize     3147, offset   122880
Empty space found from 0x000482fc to 0x00048300
         Inode      node at 0x00048300, totlen 0x000002d4, #ino    202, version    37, isize   244288, csize      656, dsize      949, offset   126027
         Inode      node at 0x000485d4, totlen 0x00000a2f, #ino    202, version    38, isize   244288, csize     2539, dsize     4096, offset   126976
         Inode      node at 0x00049004, totlen 0x00000a7d, #ino    202, version    39, isize   244288, csize     2617, dsize     4096, offset   131072
         Inode      node at 0x00049a84, totlen 0x00000977, #ino    202, version    40, isize   244288, csize     2355, dsize     3556, offset   135168
Empty space found from 0x0004a3fc to 0x0004a400
         Inode      node at 0x0004a400, totlen 0x000001f8, #ino    202, version    41, isize   244288, csize      436, dsize      540, offset   138724
         Inode      node at 0x0004a5f8, totlen 0x000009bd, #ino    202, version    42, isize   244288, csize     2425, dsize     4096, offset   139264
         Inode      node at 0x0004afb8, totlen 0x000008fe, #ino    202, version    43, isize   244288, csize     2234, dsize     4096, offset   143360
         Inode      node at 0x0004b8b8, totlen 0x000009b7, #ino    202, version    44, isize   244288, csize     2419, dsize     4096, offset   147456
         Inode      node at 0x0004c270, totlen 0x0000028c, #ino    202, version    45, isize   244288, csize      584, dsize      755, offset   151552
Empty space found from 0x0004c4fc to 0x0004c500
         Inode      node at 0x0004c500, totlen 0x0000088d, #ino    202, version    46, isize   244288, csize     2121, dsize     3341, offset   152307
         Inode      node at 0x0004cd90, totlen 0x00000983, #ino    202, version    47, isize   244288, csize     2367, dsize     4096, offset   155648
         Inode      node at 0x0004d714, totlen 0x0000098f, #ino    202, version    48, isize   244288, csize     2379, dsize     4096, offset   159744
         Inode      node at 0x0004e0a4, totlen 0x00000557, #ino    202, version    49, isize   244288, csize     1299, dsize     2019, offset   163840
Empty space found from 0x0004e5fc to 0x0004e600
         Inode      node at 0x0004e600, totlen 0x000005cf, #ino    202, version    50, isize   244288, csize     1419, dsize     2077, offset   165859
         Inode      node at 0x0004ebd0, totlen 0x000009d9, #ino    202, version    51, isize   244288, csize     2453, dsize     4096, offset   167936
         Inode      node at 0x0004f5ac, totlen 0x000009e5, #ino    202, version    52, isize   244288, csize     2465, dsize     4096, offset   172032
         Inode      node at 0x0004ff94, totlen 0x00000767, #ino    202, version    53, isize   244288, csize     1827, dsize     3081, offset   176128
Empty space found from 0x000506fc to 0x00050700
         Inode      node at 0x00050700, totlen 0x0000034c, #ino    202, version    54, isize   244288, csize      776, dsize     1015, offset   179209
         Inode      node at 0x00050a4c, totlen 0x00000a7a, #ino    202, version    55, isize   244288, csize     2614, dsize     4096, offset   180224
         Inode      node at 0x000514c8, totlen 0x00000a9c, #ino    202, version    56, isize   244288, csize     2648, dsize     4096, offset   184320
         Inode      node at 0x00051f64, totlen 0x00000896, #ino    202, version    57, isize   244288, csize     2130, dsize     3629, offset   188416
Empty space found from 0x000527fc to 0x00052800
         Inode      node at 0x00052800, totlen 0x0000013d, #ino    202, version    58, isize   244288, csize      249, dsize      467, offset   192045
         Inode      node at 0x00052940, totlen 0x000007c4, #ino    202, version    59, isize   244288, csize     1920, dsize     4096, offset   192512
         Inode      node at 0x00053104, totlen 0x0000069d, #ino    202, version    60, isize   244288, csize     1625, dsize     4096, offset   196608
         Inode      node at 0x000537a4, totlen 0x0000067a, #ino    202, version    61, isize   244288, csize     1590, dsize     4096, offset   200704
         Inode      node at 0x00053e20, totlen 0x000006ab, #ino    202, version    62, isize   244288, csize     1639, dsize     4096, offset   204800
         Inode      node at 0x000544cc, totlen 0x00000430, #ino    202, version    63, isize   244288, csize     1004, dsize     2314, offset   208896
Empty space found from 0x000548fc to 0x00054900
         Inode      node at 0x00054900, totlen 0x000002fc, #ino    202, version    64, isize   244288, csize      696, dsize     1782, offset   211210
         Inode      node at 0x00054bfc, totlen 0x000004fc, #ino    202, version    65, isize   244288, csize     1208, dsize     4096, offset   212992
         Inode      node at 0x000550f8, totlen 0x00000572, #ino    202, version    66, isize   244288, csize     1326, dsize     4096, offset   217088
         Inode      node at 0x0005566c, totlen 0x0000063a, #ino    202, version    67, isize   244288, csize     1526, dsize     4096, offset   221184
         Inode      node at 0x00055ca8, totlen 0x00000699, #ino    202, version    68, isize   244288, csize     1621, dsize     4096, offset   225280
         Inode      node at 0x00056344, totlen 0x000006b7, #ino    202, version    69, isize   244288, csize     1651, dsize     3926, offset   229376
Empty space found from 0x000569fc to 0x00056a00
         Inode      node at 0x00056a00, totlen 0x000000b9, #ino    202, version    70, isize   244288, csize      117, dsize      170, offset   233302
         Inode      node at 0x00056abc, totlen 0x000006a2, #ino    202, version    71, isize   244288, csize     1630, dsize     4096, offset   233472
         Inode      node at 0x00057160, totlen 0x000004e8, #ino    202, version    72, isize   244288, csize     1188, dsize     4096, offset   237568
         Inode      node at 0x00057648, totlen 0x0000048a, #ino    202, version    73, isize   244288, csize     1094, dsize     2624, offset   241664
         Dirent     node at 0x00057ad4, totlen 0x00000038, #pino     6, version   201, #ino       203, nsize       16, name libnsl-0.9.29.so
         Inode      node at 0x00057b0c, totlen 0x000001c7, #ino    203, version     1, isize     4636, csize      387, dsize     4096, offset        0
         Inode      node at 0x00057cd4, totlen 0x00000154, #ino    203, version     2, isize     4636, csize      272, dsize      540, offset     4096
         Dirent     node at 0x00057e28, totlen 0x00000033, #pino     6, version   202, #ino       204, nsize       11, name libnsl.so.0
         Inode      node at 0x00057e5c, totlen 0x00000054, #ino    204, version     1, isize       16, csize       16, dsize       16, offset        0
         Dirent     node at 0x00057eb0, totlen 0x0000003c, #pino     6, version   203, #ino       205, nsize       20, name libpthread-0.9.29.so
         Inode      node at 0x00057eec, totlen 0x000006c8, #ino    205, version     1, isize    81341, csize     1668, dsize     4096, offset        0
         Inode      node at 0x000585b4, totlen 0x00000547, #ino    205, version     2, isize    81341, csize     1283, dsize     2469, offset     4096
Empty space found from 0x00058afc to 0x00058b00
         Inode      node at 0x00058b00, totlen 0x0000033a, #ino    205, version     3, isize    81341, csize      758, dsize     1627, offset     6565
         Inode      node at 0x00058e3c, totlen 0x0000055d, #ino    205, version     4, isize    81341, csize     1305, dsize     4096, offset     8192
         Inode      node at 0x0005939c, totlen 0x0000076a, #ino    205, version     5, isize    81341, csize     1830, dsize     4096, offset    12288
         Inode      node at 0x00059b08, totlen 0x00000834, #ino    205, version     6, isize    81341, csize     2032, dsize     4096, offset    16384
         Inode      node at 0x0005a33c, totlen 0x000008bf, #ino    205, version     7, isize    81341, csize     2171, dsize     3253, offset    20480
Empty space found from 0x0005abfc to 0x0005ac00
         Inode      node at 0x0005ac00, totlen 0x00000274, #ino    205, version     8, isize    81341, csize      560, dsize      843, offset    23733
         Inode      node at 0x0005ae74, totlen 0x00000955, #ino    205, version     9, isize    81341, csize     2321, dsize     4096, offset    24576
         Inode      node at 0x0005b7cc, totlen 0x0000096a, #ino    205, version    10, isize    81341, csize     2342, dsize     4096, offset    28672
         Inode      node at 0x0005c138, totlen 0x000007e3, #ino    205, version    11, isize    81341, csize     1951, dsize     4096, offset    32768
         Inode      node at 0x0005c91c, totlen 0x000003e0, #ino    205, version    12, isize    81341, csize      924, dsize     1373, offset    36864
Empty space found from 0x0005ccfc to 0x0005cd00
         Inode      node at 0x0005cd00, totlen 0x000006d3, #ino    205, version    13, isize    81341, csize     1679, dsize     2723, offset    38237
         Inode      node at 0x0005d3d4, totlen 0x00000109, #ino    205, version    14, isize    81341, csize      197, dsize     4096, offset    40960
         Inode      node at 0x0005d4e0, totlen 0x00000083, #ino    205, version    15, isize    81341, csize       63, dsize     4096, offset    45056
         Inode      node at 0x0005d564, totlen 0x00000074, #ino    205, version    16, isize    81341, csize       48, dsize     4096, offset    49152
         Inode      node at 0x0005d5d8, totlen 0x00000074, #ino    205, version    17, isize    81341, csize       48, dsize     4096, offset    53248
         Inode      node at 0x0005d64c, totlen 0x00000074, #ino    205, version    18, isize    81341, csize       48, dsize     4096, offset    57344
         Inode      node at 0x0005d6c0, totlen 0x000004b9, #ino    205, version    19, isize    81341, csize     1141, dsize     4096, offset    61440
         Inode      node at 0x0005db7c, totlen 0x000005d5, #ino    205, version    20, isize    81341, csize     1425, dsize     4096, offset    65536
         Inode      node at 0x0005e154, totlen 0x00000733, #ino    205, version    21, isize    81341, csize     1775, dsize     4096, offset    69632
         Inode      node at 0x0005e888, totlen 0x00000574, #ino    205, version    22, isize    81341, csize     1328, dsize     2920, offset    73728
Empty space found from 0x0005edfc to 0x0005ee00
         Inode      node at 0x0005ee00, totlen 0x00000225, #ino    205, version    23, isize    81341, csize      481, dsize     1176, offset    76648
         Inode      node at 0x0005f028, totlen 0x00000517, #ino    205, version    24, isize    81341, csize     1235, dsize     3517, offset    77824
         Dirent     node at 0x0005f540, totlen 0x00000037, #pino     6, version   204, #ino       206, nsize       15, name libpthread.so.0
         Inode      node at 0x0005f578, totlen 0x00000058, #ino    206, version     1, isize       20, csize       20, dsize       20, offset        0
         Dirent     node at 0x0005f5d0, totlen 0x0000003b, #pino     6, version   205, #ino       207, nsize       19, name libresolv-0.9.29.so
         Inode      node at 0x0005f60c, totlen 0x000001c9, #ino    207, version     1, isize     4640, csize      389, dsize     4096, offset        0
         Inode      node at 0x0005f7d8, totlen 0x00000157, #ino    207, version     2, isize     4640, csize      275, dsize      544, offset     4096
         Dirent     node at 0x0005f930, totlen 0x00000036, #pino     6, version   206, #ino       208, nsize       14, name libresolv.so.0
         Inode      node at 0x0005f968, totlen 0x00000057, #ino    208, version     1, isize       19, csize       19, dsize       19, offset        0
         Dirent     node at 0x0005f9c0, totlen 0x00000037, #pino     6, version   207, #ino       209, nsize       15, name librt-0.9.29.so
         Inode      node at 0x0005f9f8, totlen 0x000004e8, #ino    209, version     1, isize     4608, csize     1188, dsize     4096, offset        0
         Inode      node at 0x0005fee0, totlen 0x00000137, #ino    209, version     2, isize     4608, csize      243, dsize      512, offset     4096
         Dirent     node at 0x00060018, totlen 0x00000032, #pino     6, version   208, #ino       210, nsize       10, name librt.so.0
         Inode      node at 0x0006004c, totlen 0x00000053, #ino    210, version     1, isize       15, csize       15, dsize       15, offset        0
         Dirent     node at 0x000600a0, totlen 0x0000003e, #pino     6, version   209, #ino       211, nsize       22, name libthread_db-0.9.29.so
         Inode      node at 0x000600e0, totlen 0x000007ba, #ino    211, version     1, isize    13044, csize     1910, dsize     4096, offset        0
         Inode      node at 0x0006089c, totlen 0x00000660, #ino    211, version     2, isize    13044, csize     1564, dsize     2673, offset     4096
Empty space found from 0x00060efc to 0x00060f00
         Inode      node at 0x00060f00, totlen 0x00000380, #ino    211, version     3, isize    13044, csize      828, dsize     1423, offset     6769
         Inode      node at 0x00061280, totlen 0x00000410, #ino    211, version     4, isize    13044, csize      972, dsize     4096, offset     8192
         Inode      node at 0x00061690, totlen 0x000001a1, #ino    211, version     5, isize    13044, csize      349, dsize      756, offset    12288
         Dirent     node at 0x00061834, totlen 0x00000039, #pino     6, version   210, #ino       212, nsize       17, name libthread_db.so.1
         Inode      node at 0x00061870, totlen 0x0000005a, #ino    212, version     1, isize       22, csize       22, dsize       22, offset        0
         Dirent     node at 0x000618cc, totlen 0x0000003b, #pino     6, version   211, #ino       213, nsize       19, name libuClibc-0.9.29.so
         Inode      node at 0x00061908, totlen 0x0000073e, #ino    213, version     1, isize   309840, csize     1786, dsize     4096, offset        0
         Inode      node at 0x00062048, totlen 0x0000047c, #ino    213, version     2, isize   309840, csize     1080, dsize     4096, offset     4096
         Inode      node at 0x000624c4, totlen 0x0000086c, #ino    213, version     3, isize   309840, csize     2088, dsize     4096, offset     8192
         Inode      node at 0x00062d30, totlen 0x000002cb, #ino    213, version     4, isize   309840, csize      647, dsize     1061, offset    12288
Empty space found from 0x00062ffc to 0x00063000
         Inode      node at 0x00063000, totlen 0x0000067c, #ino    213, version     5, isize   309840, csize     1592, dsize     3035, offset    13349
         Inode      node at 0x0006367c, totlen 0x00000886, #ino    213, version     6, isize   309840, csize     2114, dsize     4096, offset    16384
         Inode      node at 0x00063f04, totlen 0x0000089d, #ino    213, version     7, isize   309840, csize     2137, dsize     4096, offset    20480
         Inode      node at 0x000647a4, totlen 0x00000901, #ino    213, version     8, isize   309840, csize     2237, dsize     4096, offset    24576
Empty space found from 0x000650a8 to 0x00065100
         Inode      node at 0x00065100, totlen 0x000007f4, #ino    213, version     9, isize   309840, csize     1968, dsize     4096, offset    28672
         Inode      node at 0x000658f4, totlen 0x000006b4, #ino    213, version    10, isize   309840, csize     1648, dsize     4096, offset    32768
         Inode      node at 0x00065fa8, totlen 0x00000696, #ino    213, version    11, isize   309840, csize     1618, dsize     4096, offset    36864
         Inode      node at 0x00066640, totlen 0x00000670, #ino    213, version    12, isize   309840, csize     1580, dsize     4096, offset    40960
         Inode      node at 0x00066cb0, totlen 0x0000054c, #ino    213, version    13, isize   309840, csize     1288, dsize     1684, offset    45056
Empty space found from 0x000671fc to 0x00067200
         Inode      node at 0x00067200, totlen 0x00000357, #ino    213, version    14, isize   309840, csize      787, dsize     2412, offset    46740
         Inode      node at 0x00067558, totlen 0x0000068c, #ino    213, version    15, isize   309840, csize     1608, dsize     4096, offset    49152
         Inode      node at 0x00067be4, totlen 0x00000658, #ino    213, version    16, isize   309840, csize     1556, dsize     4096, offset    53248
         Inode      node at 0x0006823c, totlen 0x000006b6, #ino    213, version    17, isize   309840, csize     1650, dsize     4096, offset    57344
         Inode      node at 0x000688f4, totlen 0x00000887, #ino    213, version    18, isize   309840, csize     2115, dsize     4096, offset    61440
         Inode      node at 0x0006917c, totlen 0x0000017e, #ino    213, version    19, isize   309840, csize      314, dsize      393, offset    65536
Empty space found from 0x000692fc to 0x00069300
         Inode      node at 0x00069300, totlen 0x00000935, #ino    213, version    20, isize   309840, csize     2289, dsize     3703, offset    65929
         Inode      node at 0x00069c38, totlen 0x00000a33, #ino    213, version    21, isize   309840, csize     2543, dsize     4096, offset    69632
         Inode      node at 0x0006a66c, totlen 0x00000997, #ino    213, version    22, isize   309840, csize     2387, dsize     4096, offset    73728
         Inode      node at 0x0006b004, totlen 0x000003f7, #ino    213, version    23, isize   309840, csize      947, dsize     1222, offset    77824
Empty space found from 0x0006b3fc to 0x0006b400
         Inode      node at 0x0006b400, totlen 0x0000076d, #ino    213, version    24, isize   309840, csize     1833, dsize     2874, offset    79046
         Inode      node at 0x0006bb70, totlen 0x000009da, #ino    213, version    25, isize   309840, csize     2454, dsize     4096, offset    81920
         Inode      node at 0x0006c54c, totlen 0x0000096e, #ino    213, version    26, isize   309840, csize     2346, dsize     4096, offset    86016
         Inode      node at 0x0006cebc, totlen 0x0000063f, #ino    213, version    27, isize   309840, csize     1531, dsize     3163, offset    90112
Empty space found from 0x0006d4fc to 0x0006d500
         Inode      node at 0x0006d500, totlen 0x000002ce, #ino    213, version    28, isize   309840, csize      650, dsize      933, offset    93275
         Inode      node at 0x0006d7d0, totlen 0x00000aac, #ino    213, version    29, isize   309840, csize     2664, dsize     4096, offset    94208
         Inode      node at 0x0006e27c, totlen 0x00000938, #ino    213, version    30, isize   309840, csize     2292, dsize     4096, offset    98304
         Inode      node at 0x0006ebb4, totlen 0x00000a48, #ino    213, version    31, isize   309840, csize     2564, dsize     3854, offset   102400
Empty space found from 0x0006f5fc to 0x0006f600
         Inode      node at 0x0006f600, totlen 0x00000136, #ino    213, version    32, isize   309840, csize      242, dsize      242, offset   106254
         Inode      node at 0x0006f738, totlen 0x00000812, #ino    213, version    33, isize   309840, csize     1998, dsize     4096, offset   106496
         Inode      node at 0x0006ff4c, totlen 0x00000a6d, #ino    213, version    34, isize   309840, csize     2601, dsize     4096, offset   110592
         Inode      node at 0x000709bc, totlen 0x00000b6e, #ino    213, version    35, isize   309840, csize     2858, dsize     4096, offset   114688
         Inode      node at 0x0007152c, totlen 0x000001ce, #ino    213, version    36, isize   309840, csize      394, dsize      448, offset   118784
Empty space found from 0x000716fc to 0x00071700
         Inode      node at 0x00071700, totlen 0x00000868, #ino    213, version    37, isize   309840, csize     2084, dsize     3648, offset   119232
         Inode      node at 0x00071f68, totlen 0x000008e5, #ino    213, version    38, isize   309840, csize     2209, dsize     4096, offset   122880
         Inode      node at 0x00072850, totlen 0x000007db, #ino    213, version    39, isize   309840, csize     1943, dsize     4096, offset   126976
         Inode      node at 0x0007302c, totlen 0x000007cf, #ino    213, version    40, isize   309840, csize     1931, dsize     3273, offset   131072
Empty space found from 0x000737fc to 0x00073800
         Inode      node at 0x00073800, totlen 0x00000273, #ino    213, version    41, isize   309840, csize      559, dsize      823, offset   134345
         Inode      node at 0x00073a74, totlen 0x000009ee, #ino    213, version    42, isize   309840, csize     2474, dsize     4096, offset   135168
         Inode      node at 0x00074464, totlen 0x00000b29, #ino    213, version    43, isize   309840, csize     2789, dsize     4096, offset   139264
         Inode      node at 0x00074f90, totlen 0x0000096b, #ino    213, version    44, isize   309840, csize     2343, dsize     3342, offset   143360
Empty space found from 0x000758fc to 0x00075900
         Inode      node at 0x00075900, totlen 0x0000027e, #ino    213, version    45, isize   309840, csize      570, dsize      754, offset   146702
         Inode      node at 0x00075b80, totlen 0x00000b19, #ino    213, version    46, isize   309840, csize     2773, dsize     4096, offset   147456
         Inode      node at 0x0007669c, totlen 0x00000a48, #ino    213, version    47, isize   309840, csize     2564, dsize     4096, offset   151552
         Inode      node at 0x000770e4, totlen 0x00000918, #ino    213, version    48, isize   309840, csize     2260, dsize     3215, offset   155648
Empty space found from 0x000779fc to 0x00077a00
         Inode      node at 0x00077a00, totlen 0x000002e7, #ino    213, version    49, isize   309840, csize      675, dsize      881, offset   158863
         Inode      node at 0x00077ce8, totlen 0x0000066e, #ino    213, version    50, isize   309840, csize     1578, dsize     4096, offset   159744
         Inode      node at 0x00078358, totlen 0x000009d0, #ino    213, version    51, isize   309840, csize     2444, dsize     4096, offset   163840
         Inode      node at 0x00078d28, totlen 0x00000970, #ino    213, version    52, isize   309840, csize     2348, dsize     4096, offset   167936
         Inode      node at 0x00079698, totlen 0x00000462, #ino    213, version    53, isize   309840, csize     1054, dsize     1615, offset   172032
Empty space found from 0x00079afc to 0x00079b00
         Inode      node at 0x00079b00, totlen 0x0000060a, #ino    213, version    54, isize   309840, csize     1478, dsize     2481, offset   173647
         Inode      node at 0x0007a10c, totlen 0x00000a86, #ino    213, version    55, isize   309840, csize     2626, dsize     4096, offset   176128
         Inode      node at 0x0007ab94, totlen 0x00000a2c, #ino    213, version    56, isize   309840, csize     2536, dsize     4096, offset   180224
         Inode      node at 0x0007b5c0, totlen 0x0000063c, #ino    213, version    57, isize   309840, csize     1528, dsize     2133, offset   184320
Empty space found from 0x0007bbfc to 0x0007bc00
         Inode      node at 0x0007bc00, totlen 0x0000057d, #ino    213, version    58, isize   309840, csize     1337, dsize     1963, offset   186453
         Inode      node at 0x0007c180, totlen 0x00000a3b, #ino    213, version    59, isize   309840, csize     2551, dsize     4096, offset   188416
         Inode      node at 0x0007cbbc, totlen 0x00000aa3, #ino    213, version    60, isize   309840, csize     2655, dsize     4096, offset   192512
         Inode      node at 0x0007d660, totlen 0x0000069b, #ino    213, version    61, isize   309840, csize     1623, dsize     2305, offset   196608
Empty space found from 0x0007dcfc to 0x0007dd00
         Inode      node at 0x0007dd00, totlen 0x00000528, #ino    213, version    62, isize   309840, csize     1252, dsize     1791, offset   198913
         Inode      node at 0x0007e228, totlen 0x000008f6, #ino    213, version    63, isize   309840, csize     2226, dsize     4096, offset   200704
         Inode      node at 0x0007eb20, totlen 0x000009b6, #ino    213, version    64, isize   309840, csize     2418, dsize     4096, offset   204800
         Inode      node at 0x0007f4d8, totlen 0x00000922, #ino    213, version    65, isize   309840, csize     2270, dsize     3440, offset   208896
Empty space found from 0x0007fdfc to 0x0007fe00
         Inode      node at 0x0007fe00, totlen 0x0000024b, #ino    213, version    66, isize   309840, csize      519, dsize      656, offset   212336
         Inode      node at 0x0008004c, totlen 0x00000984, #ino    213, version    67, isize   309840, csize     2368, dsize     4096, offset   212992
         Inode      node at 0x000809d0, totlen 0x00000794, #ino    213, version    68, isize   309840, csize     1872, dsize     4096, offset   217088
         Inode      node at 0x00081164, totlen 0x00000913, #ino    213, version    69, isize   309840, csize     2255, dsize     4096, offset   221184
         Inode      node at 0x00081a78, totlen 0x00000484, #ino    213, version    70, isize   309840, csize     1088, dsize     1708, offset   225280
Empty space found from 0x00081efc to 0x00081f00
         Inode      node at 0x00081f00, totlen 0x00000626, #ino    213, version    71, isize   309840, csize     1506, dsize     2388, offset   226988
         Inode      node at 0x00082528, totlen 0x00000aa9, #ino    213, version    72, isize   309840, csize     2661, dsize     4096, offset   229376
         Inode      node at 0x00082fd4, totlen 0x00000a98, #ino    213, version    73, isize   309840, csize     2644, dsize     4096, offset   233472
         Inode      node at 0x00083a6c, totlen 0x00000590, #ino    213, version    74, isize   309840, csize     1356, dsize     1946, offset   237568
Empty space found from 0x00083ffc to 0x00084000
         Inode      node at 0x00084000, totlen 0x000005e7, #ino    213, version    75, isize   309840, csize     1443, dsize     2150, offset   239514
         Inode      node at 0x000845e8, totlen 0x000009cb, #ino    213, version    76, isize   309840, csize     2439, dsize     4096, offset   241664
         Inode      node at 0x00084fb4, totlen 0x000009e7, #ino    213, version    77, isize   309840, csize     2467, dsize     4096, offset   245760
         Inode      node at 0x0008599c, totlen 0x00000760, #ino    213, version    78, isize   309840, csize     1820, dsize     3185, offset   249856
Empty space found from 0x000860fc to 0x00086100
         Inode      node at 0x00086100, totlen 0x00000278, #ino    213, version    79, isize   309840, csize      564, dsize      911, offset   253041
         Inode      node at 0x00086378, totlen 0x00000b23, #ino    213, version    80, isize   309840, csize     2783, dsize     4096, offset   253952
         Inode      node at 0x00086e9c, totlen 0x00000a06, #ino    213, version    81, isize   309840, csize     2498, dsize     4096, offset   258048
         Inode      node at 0x000878a4, totlen 0x00000957, #ino    213, version    82, isize   309840, csize     2323, dsize     3493, offset   262144
Empty space found from 0x000881fc to 0x00088200
         Inode      node at 0x00088200, totlen 0x000001f2, #ino    213, version    83, isize   309840, csize      430, dsize      603, offset   265637
         Inode      node at 0x000883f4, totlen 0x00000983, #ino    213, version    84, isize   309840, csize     2367, dsize     4096, offset   266240
         Inode      node at 0x00088d78, totlen 0x000009bf, #ino    213, version    85, isize   309840, csize     2427, dsize     4096, offset   270336
         Inode      node at 0x00089738, totlen 0x00000b00, #ino    213, version    86, isize   309840, csize     2748, dsize     4096, offset   274432
         Inode      node at 0x0008a238, totlen 0x000000c8, #ino    213, version    87, isize   309840, csize      132, dsize      132, offset   278528
         Inode      node at 0x0008a300, totlen 0x00000617, #ino    213, version    88, isize   309840, csize     1491, dsize     3964, offset   278660
         Inode      node at 0x0008a918, totlen 0x000008ea, #ino    213, version    89, isize   309840, csize     2214, dsize     4096, offset   282624
         Inode      node at 0x0008b204, totlen 0x00000796, #ino    213, version    90, isize   309840, csize     1874, dsize     4096, offset   286720
         Inode      node at 0x0008b99c, totlen 0x00000a00, #ino    213, version    91, isize   309840, csize     2492, dsize     4096, offset   290816
Empty space found from 0x0008c39c to 0x0008c400
         Inode      node at 0x0008c400, totlen 0x00000792, #ino    213, version    92, isize   309840, csize     1870, dsize     4096, offset   294912
         Inode      node at 0x0008cb94, totlen 0x00000711, #ino    213, version    93, isize   309840, csize     1741, dsize     4096, offset   299008
         Inode      node at 0x0008d2a8, totlen 0x00000269, #ino    213, version    94, isize   309840, csize      549, dsize     4096, offset   303104
         Inode      node at 0x0008d514, totlen 0x000004cc, #ino    213, version    95, isize   309840, csize     1160, dsize     2640, offset   307200
         Dirent     node at 0x0008d9e0, totlen 0x00000039, #pino     6, version   212, #ino       214, nsize       17, name libutil-0.9.29.so
         Inode      node at 0x0008da1c, totlen 0x000006f4, #ino    214, version     1, isize     4656, csize     1712, dsize     4096, offset        0
         Inode      node at 0x0008e110, totlen 0x00000152, #ino    214, version     2, isize     4656, csize      270, dsize      560, offset     4096
         Dirent     node at 0x0008e264, totlen 0x00000034, #pino     6, version   213, #ino       215, nsize       12, name libutil.so.0
         Inode      node at 0x0008e298, totlen 0x00000055, #ino    215, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0008e2f0, totlen 0x0000002f, #pino     6, version   214, #ino       216, nsize        7, name libz.so
         Inode      node at 0x0008e320, totlen 0x00000051, #ino    216, version     1, isize       13, csize       13, dsize       13, offset        0
         Dirent     node at 0x0008e374, totlen 0x00000031, #pino     6, version   215, #ino       217, nsize        9, name libz.so.1
         Inode      node at 0x0008e3a8, totlen 0x00000051, #ino    217, version     1, isize       13, csize       13, dsize       13, offset        0
         Dirent     node at 0x0008e3fc, totlen 0x00000035, #pino     6, version   216, #ino       218, nsize       13, name libz.so.1.2.3
         Inode      node at 0x0008e434, totlen 0x000000c7, #ino    218, version     1, isize    72040, csize      131, dsize      193, offset        0
Empty space found from 0x0008e4fc to 0x0008e500
         Inode      node at 0x0008e500, totlen 0x00000721, #ino    218, version     2, isize    72040, csize     1757, dsize     3903, offset      193
         Inode      node at 0x0008ec24, totlen 0x000007e4, #ino    218, version     3, isize    72040, csize     1952, dsize     4096, offset     4096
         Inode      node at 0x0008f408, totlen 0x0000095a, #ino    218, version     4, isize    72040, csize     2326, dsize     4096, offset     8192
         Inode      node at 0x0008fd64, totlen 0x00000897, #ino    218, version     5, isize    72040, csize     2131, dsize     3225, offset    12288
Empty space found from 0x000905fc to 0x00090600
         Inode      node at 0x00090600, totlen 0x000002aa, #ino    218, version     6, isize    72040, csize      614, dsize      871, offset    15513
         Inode      node at 0x000908ac, totlen 0x00000988, #ino    218, version     7, isize    72040, csize     2372, dsize     4096, offset    16384
         Inode      node at 0x00091234, totlen 0x00000a4c, #ino    218, version     8, isize    72040, csize     2568, dsize     4096, offset    20480
         Inode      node at 0x00091c80, totlen 0x000008d3, #ino    218, version     9, isize    72040, csize     2191, dsize     4096, offset    24576
         Inode      node at 0x00092554, totlen 0x000001a8, #ino    218, version    10, isize    72040, csize      356, dsize      386, offset    28672
Empty space found from 0x000926fc to 0x00092700
         Inode      node at 0x00092700, totlen 0x000008ea, #ino    218, version    11, isize    72040, csize     2214, dsize     3710, offset    29058
         Inode      node at 0x00092fec, totlen 0x00000939, #ino    218, version    12, isize    72040, csize     2293, dsize     4096, offset    32768
         Inode      node at 0x00093928, totlen 0x000009b4, #ino    218, version    13, isize    72040, csize     2416, dsize     4096, offset    36864
         Inode      node at 0x000942dc, totlen 0x0000051e, #ino    218, version    14, isize    72040, csize     1242, dsize     1838, offset    40960
Empty space found from 0x000947fc to 0x00094800
         Inode      node at 0x00094800, totlen 0x000005df, #ino    218, version    15, isize    72040, csize     1435, dsize     2258, offset    42798
         Inode      node at 0x00094de0, totlen 0x000009ef, #ino    218, version    16, isize    72040, csize     2475, dsize     4096, offset    45056
         Inode      node at 0x000957d0, totlen 0x00000bf0, #ino    218, version    17, isize    72040, csize     2988, dsize     4096, offset    49152
         Inode      node at 0x000963c0, totlen 0x00000540, #ino    218, version    18, isize    72040, csize     1276, dsize     1276, offset    53248
         Inode      node at 0x00096900, totlen 0x00000b48, #ino    218, version    19, isize    72040, csize     2820, dsize     2820, offset    54524
         Inode      node at 0x00097448, totlen 0x00000e64, #ino    218, version    20, isize    72040, csize     3616, dsize     4096, offset    57344
         Inode      node at 0x000982ac, totlen 0x000005a5, #ino    218, version    21, isize    72040, csize     1377, dsize     4096, offset    61440
         Inode      node at 0x00098854, totlen 0x000001a6, #ino    218, version    22, isize    72040, csize      354, dsize      506, offset    65536
Empty space found from 0x000989fc to 0x00098a00
         Inode      node at 0x00098a00, totlen 0x00000415, #ino    218, version    23, isize    72040, csize      977, dsize     3590, offset    66042
         Inode      node at 0x00098e18, totlen 0x00000402, #ino    218, version    24, isize    72040, csize      958, dsize     2408, offset    69632
         Dirent     node at 0x0009921c, totlen 0x00000035, #pino    11, version   217, #ino       219, nsize       13, name .bash_history
         Inode      node at 0x00099254, totlen 0x00000044, #ino    219, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x00099298, totlen 0x00000034, #pino    11, version   218, #ino       220, nsize       12, name .bash_logout
         Inode      node at 0x000992cc, totlen 0x000000da, #ino    220, version     1, isize      175, csize      150, dsize      175, offset        0
         Dirent     node at 0x000993a8, totlen 0x00000035, #pino    11, version   219, #ino       221, nsize       13, name .bash_profile
         Inode      node at 0x000993e0, totlen 0x000000c5, #ino    221, version     1, isize      161, csize      129, dsize      161, offset        0
         Dirent     node at 0x000994a8, totlen 0x0000002f, #pino    11, version   220, #ino       222, nsize        7, name .bashrc
         Inode      node at 0x000994d8, totlen 0x0000037b, #ino    222, version     1, isize     1711, csize      823, dsize     1711, offset        0
         Dirent     node at 0x00099854, totlen 0x0000002c, #pino    12, version   221, #ino       223, nsize        4, name halt
         Inode      node at 0x00099880, totlen 0x00000052, #ino    223, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x000998d4, totlen 0x00000030, #pino    12, version   222, #ino       224, nsize        8, name ifconfig
         Inode      node at 0x00099904, totlen 0x00000052, #ino    224, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x00099958, totlen 0x0000002e, #pino    12, version   223, #ino       225, nsize        6, name ifdown
         Inode      node at 0x00099988, totlen 0x00000052, #ino    225, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x000999dc, totlen 0x0000002c, #pino    12, version   224, #ino       226, nsize        4, name ifup
         Inode      node at 0x00099a08, totlen 0x00000052, #ino    226, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x00099a5c, totlen 0x0000002c, #pino    12, version   225, #ino       227, nsize        4, name init
         Inode      node at 0x00099a88, totlen 0x00000052, #ino    227, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x00099adc, totlen 0x0000002d, #pino    12, version   226, #ino       228, nsize        5, name klogd
         Inode      node at 0x00099b0c, totlen 0x00000052, #ino    228, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x00099b60, totlen 0x00000030, #pino    12, version   227, #ino       229, nsize        8, name ldconfig
         Inode      node at 0x00099b90, totlen 0x00000785, #ino    229, version     1, isize    18248, csize     1857, dsize     4096, offset        0
         Inode      node at 0x0009a318, totlen 0x000007e4, #ino    229, version     2, isize    18248, csize     1952, dsize     3110, offset     4096
Empty space found from 0x0009aafc to 0x0009ab00
         Inode      node at 0x0009ab00, totlen 0x00000309, #ino    229, version     3, isize    18248, csize      709, dsize      986, offset     7206
         Inode      node at 0x0009ae0c, totlen 0x00000a7a, #ino    229, version     4, isize    18248, csize     2614, dsize     4096, offset     8192
         Inode      node at 0x0009b888, totlen 0x000009ae, #ino    229, version     5, isize    18248, csize     2410, dsize     4096, offset    12288
         Inode      node at 0x0009c238, totlen 0x00000326, #ino    229, version     6, isize    18248, csize      738, dsize     1864, offset    16384
         Dirent     node at 0x0009c560, totlen 0x00000032, #pino    12, version   228, #ino       230, nsize       10, name pivot_root
         Inode      node at 0x0009c594, totlen 0x00000052, #ino    230, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x0009c5e8, totlen 0x00000030, #pino    12, version   229, #ino       231, nsize        8, name poweroff
         Inode      node at 0x0009c618, totlen 0x00000052, #ino    231, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x0009c66c, totlen 0x0000002e, #pino    12, version   230, #ino       232, nsize        6, name reboot
         Inode      node at 0x0009c69c, totlen 0x00000052, #ino    232, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x0009c6f0, totlen 0x0000002d, #pino    12, version   231, #ino       233, nsize        5, name route
         Inode      node at 0x0009c720, totlen 0x00000052, #ino    233, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x0009c774, totlen 0x00000039, #pino    12, version   232, #ino       234, nsize       17, name start-stop-daemon
         Inode      node at 0x0009c7b0, totlen 0x00000052, #ino    234, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x0009c804, totlen 0x00000033, #pino    12, version   233, #ino       235, nsize       11, name switch_root
         Inode      node at 0x0009c838, totlen 0x00000052, #ino    235, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x0009c88c, totlen 0x0000002f, #pino    12, version   234, #ino       236, nsize        7, name syslogd
         Inode      node at 0x0009c8bc, totlen 0x00000052, #ino    236, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x0009c910, totlen 0x0000002e, #pino    12, version   235, #ino       237, nsize        6, name udhcpc
         Inode      node at 0x0009c940, totlen 0x00000052, #ino    237, version     1, isize       14, csize       14, dsize       14, offset        0
         Dirent     node at 0x0009c994, totlen 0x0000002b, #pino    14, version   236, #ino       238, nsize        3, name bin
         Inode      node at 0x0009c9c0, totlen 0x00000044, #ino    238, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0009ca04, totlen 0x0000002b, #pino    14, version   237, #ino       239, nsize        3, name lib
         Inode      node at 0x0009ca30, totlen 0x00000044, #ino    239, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0009ca74, totlen 0x0000002c, #pino    14, version   238, #ino       240, nsize        4, name sbin
         Inode      node at 0x0009caa0, totlen 0x00000044, #ino    240, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0009cae4, totlen 0x0000002d, #pino    14, version   239, #ino       241, nsize        5, name share
         Inode      node at 0x0009cb14, totlen 0x00000044, #ino    241, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x0009cb58, totlen 0x00000029, #pino   238, version   240, #ino       242, nsize        1, name [
         Inode      node at 0x0009cb84, totlen 0x00000055, #ino    242, version     1, isize       17, csize       17, dsize       17, offset        0
Empty space found from 0x0009cbdc to 0x0009cc00
         Dirent     node at 0x0009cc00, totlen 0x0000002a, #pino   238, version   241, #ino       243, nsize        2, name [[
         Inode      node at 0x0009cc2c, totlen 0x00000055, #ino    243, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0009cc84, totlen 0x0000002a, #pino   238, version   242, #ino       244, nsize        2, name du
         Inode      node at 0x0009ccb0, totlen 0x00000055, #ino    244, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0009cd08, totlen 0x0000002b, #pino   238, version   243, #ino       245, nsize        3, name env
         Inode      node at 0x0009cd34, totlen 0x00000055, #ino    245, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0009cd8c, totlen 0x0000002c, #pino   238, version   244, #ino       246, nsize        4, name free
         Inode      node at 0x0009cdb8, totlen 0x00000055, #ino    246, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0009ce10, totlen 0x0000002f, #pino   238, version   245, #ino       247, nsize        7, name killall
         Inode      node at 0x0009ce40, totlen 0x00000055, #ino    247, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0009ce98, totlen 0x0000002b, #pino   238, version   246, #ino       248, nsize        3, name ldd
         Inode      node at 0x0009cec4, totlen 0x000008c4, #ino    248, version     1, isize     9072, csize     2176, dsize     4096, offset        0
         Inode      node at 0x0009d788, totlen 0x00000a3b, #ino    248, version     2, isize     9072, csize     2551, dsize     4096, offset     4096
         Inode      node at 0x0009e1c4, totlen 0x000001ab, #ino    248, version     3, isize     9072, csize      359, dsize      880, offset     8192
         Dirent     node at 0x0009e370, totlen 0x0000002e, #pino   238, version   247, #ino       249, nsize        6, name logger
         Inode      node at 0x0009e3a0, totlen 0x00000055, #ino    249, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0009e3f8, totlen 0x0000002e, #pino   238, version   248, #ino       250, nsize        6, name telnet
         Inode      node at 0x0009e428, totlen 0x00000055, #ino    250, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0009e480, totlen 0x0000002c, #pino   238, version   249, #ino       251, nsize        4, name test
         Inode      node at 0x0009e4ac, totlen 0x00000055, #ino    251, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0009e504, totlen 0x0000002c, #pino   238, version   250, #ino       252, nsize        4, name time
         Inode      node at 0x0009e530, totlen 0x00000055, #ino    252, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0009e588, totlen 0x0000002e, #pino   238, version   251, #ino       253, nsize        6, name uptime
         Inode      node at 0x0009e5b8, totlen 0x00000055, #ino    253, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0009e610, totlen 0x0000002e, #pino   240, version   252, #ino       254, nsize        6, name chroot
         Inode      node at 0x0009e640, totlen 0x00000055, #ino    254, version     1, isize       17, csize       17, dsize       17, offset        0
         Dirent     node at 0x0009e698, totlen 0x00000033, #pino   240, version   253, #ino       255, nsize       11, name flash_erase
         Inode      node at 0x0009e6cc, totlen 0x0000062f, #ino    255, version     1, isize     4848, csize     1515, dsize     2562, offset        0
Empty space found from 0x0009ecfc to 0x0009ed00
         Inode      node at 0x0009ed00, totlen 0x000003e7, #ino    255, version     2, isize     4848, csize      931, dsize     1534, offset     2562
         Inode      node at 0x0009f0e8, totlen 0x00000176, #ino    255, version     3, isize     4848, csize      306, dsize      752, offset     4096
         Dirent     node at 0x0009f260, totlen 0x00000036, #pino   240, version   254, #ino       256, nsize       14, name flash_eraseall
         Inode      node at 0x0009f298, totlen 0x0000097c, #ino    256, version     1, isize     9888, csize     2360, dsize     4096, offset        0
         Inode      node at 0x0009fc14, totlen 0x00000ba0, #ino    256, version     2, isize     9888, csize     2908, dsize     4096, offset     4096
         Inode      node at 0x000a07b4, totlen 0x000002aa, #ino    256, version     3, isize     9888, csize      614, dsize     1696, offset     8192
         Dirent     node at 0x000a0a60, totlen 0x00000032, #pino   240, version   255, #ino       257, nsize       10, name flash_info
         Inode      node at 0x000a0a94, totlen 0x00000367, #ino    257, version     1, isize     3444, csize      803, dsize     1401, offset        0
Empty space found from 0x000a0dfc to 0x000a0e00
         Inode      node at 0x000a0e00, totlen 0x00000461, #ino    257, version     2, isize     3444, csize     1053, dsize     2043, offset     1401
         Dirent     node at 0x000a1264, totlen 0x00000032, #pino   240, version   256, #ino       258, nsize       10, name flash_lock
         Inode      node at 0x000a1298, totlen 0x0000088b, #ino    258, version     1, isize     4308, csize     2119, dsize     4096, offset        0
         Inode      node at 0x000a1b24, totlen 0x000000af, #ino    258, version     2, isize     4308, csize      107, dsize      212, offset     4096
         Dirent     node at 0x000a1bd4, totlen 0x00000034, #pino   240, version   257, #ino       259, nsize       12, name flash_unlock
         Inode      node at 0x000a1c08, totlen 0x000006ef, #ino    259, version     1, isize     3580, csize     1707, dsize     3580, offset        0
         Dirent     node at 0x000a22f8, totlen 0x0000002f, #pino   240, version   258, #ino       260, nsize        7, name flashcp
         Inode      node at 0x000a2328, totlen 0x0000097f, #ino    260, version     1, isize     8052, csize     2363, dsize     4096, offset        0
         Inode      node at 0x000a2ca8, totlen 0x00000254, #ino    260, version     2, isize     8052, csize      528, dsize      695, offset     4096
Empty space found from 0x000a2efc to 0x000a2f00
         Inode      node at 0x000a2f00, totlen 0x00000669, #ino    260, version     3, isize     8052, csize     1573, dsize     3261, offset     4791
         Dirent     node at 0x000a356c, totlen 0x00000030, #pino   240, version   259, #ino       261, nsize        8, name in.tftpd
         Inode      node at 0x000a359c, totlen 0x00000791, #ino    261, version     1, isize    22912, csize     1869, dsize     4096, offset        0
         Inode      node at 0x000a3d30, totlen 0x000008d2, #ino    261, version     2, isize    22912, csize     2190, dsize     4096, offset     4096
         Inode      node at 0x000a4604, totlen 0x000009f6, #ino    261, version     3, isize    22912, csize     2482, dsize     3705, offset     8192
Empty space found from 0x000a4ffc to 0x000a5000
         Inode      node at 0x000a5000, totlen 0x00000191, #ino    261, version     4, isize    22912, csize      333, dsize      391, offset    11897
         Inode      node at 0x000a5194, totlen 0x00000ab4, #ino    261, version     5, isize    22912, csize     2672, dsize     4096, offset    12288
         Inode      node at 0x000a5c48, totlen 0x00000a0b, #ino    261, version     6, isize    22912, csize     2503, dsize     4096, offset    16384
         Inode      node at 0x000a6654, totlen 0x00000439, #ino    261, version     7, isize    22912, csize     1013, dsize     2432, offset    20480
         Dirent     node at 0x000a6a90, totlen 0x00000031, #pino   240, version   260, #ino       262, nsize        9, name jffs2dump
         Inode      node at 0x000a6ac4, totlen 0x00000638, #ino    262, version     1, isize    14196, csize     1524, dsize     2681, offset        0
Empty space found from 0x000a70fc to 0x000a7100
         Inode      node at 0x000a7100, totlen 0x000003f9, #ino    262, version     2, isize    14196, csize      949, dsize     1415, offset     2681
         Inode      node at 0x000a74fc, totlen 0x000009ca, #ino    262, version     3, isize    14196, csize     2438, dsize     4096, offset     4096
         Inode      node at 0x000a7ec8, totlen 0x00000a26, #ino    262, version     4, isize    14196, csize     2530, dsize     4096, offset     8192
         Inode      node at 0x000a88f0, totlen 0x000004a5, #ino    262, version     5, isize    14196, csize     1121, dsize     1908, offset    12288
         Dirent     node at 0x000a8d98, totlen 0x00000031, #pino   240, version   261, #ino       263, nsize        9, name mtd_debug
         Inode      node at 0x000a8dcc, totlen 0x0000042f, #ino    263, version     1, isize     8088, csize     1003, dsize     1972, offset        0
Empty space found from 0x000a91fc to 0x000a9200
         Inode      node at 0x000a9200, totlen 0x00000572, #ino    263, version     2, isize     8088, csize     1326, dsize     2124, offset     1972
         Inode      node at 0x000a9774, totlen 0x000007e9, #ino    263, version     3, isize     8088, csize     1957, dsize     3992, offset     4096
         Dirent     node at 0x000a9f60, totlen 0x00000030, #pino   241, version   262, #ino       264, nsize        8, name terminfo
         Inode      node at 0x000a9f90, totlen 0x00000044, #ino    264, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000a9fd4, totlen 0x0000002e, #pino   241, version   263, #ino       265, nsize        6, name udhcpc
         Inode      node at 0x000aa004, totlen 0x00000044, #ino    265, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000aa048, totlen 0x00000029, #pino   264, version   264, #ino       266, nsize        1, name a
         Inode      node at 0x000aa074, totlen 0x00000044, #ino    266, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000aa0b8, totlen 0x00000029, #pino   264, version   265, #ino       267, nsize        1, name l
         Inode      node at 0x000aa0e4, totlen 0x00000044, #ino    267, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000aa128, totlen 0x00000029, #pino   264, version   266, #ino       268, nsize        1, name v
         Inode      node at 0x000aa154, totlen 0x00000044, #ino    268, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000aa198, totlen 0x00000029, #pino   264, version   267, #ino       269, nsize        1, name x
         Inode      node at 0x000aa1c4, totlen 0x00000044, #ino    269, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000aa208, totlen 0x0000002c, #pino   266, version   268, #ino       270, nsize        4, name ansi
         Inode      node at 0x000aa234, totlen 0x000002bd, #ino    270, version     1, isize     1481, csize      633, dsize     1481, offset        0
         Dirent     node at 0x000aa4f4, totlen 0x0000002d, #pino   267, version   269, #ino       271, nsize        5, name linux
         Inode      node at 0x000aa524, totlen 0x0000035c, #ino    271, version     1, isize     1695, csize      792, dsize     1695, offset        0
         Dirent     node at 0x000aa880, totlen 0x0000002d, #pino   268, version   270, #ino       272, nsize        5, name vt100
         Inode      node at 0x000aa8b0, totlen 0x0000029e, #ino    272, version     1, isize     1194, csize      602, dsize     1194, offset        0
         Dirent     node at 0x000aab50, totlen 0x0000002d, #pino   268, version   271, #ino       273, nsize        5, name vt200
         Inode      node at 0x000aab80, totlen 0x00000319, #ino    273, version     1, isize     1339, csize      725, dsize     1339, offset        0
         Dirent     node at 0x000aae9c, totlen 0x0000002d, #pino   269, version   272, #ino       274, nsize        5, name xterm
         Inode      node at 0x000aaecc, totlen 0x0000042f, #ino    274, version     1, isize     2458, csize     1003, dsize     1869, offset        0
Empty space found from 0x000ab2fc to 0x000ab300
         Inode      node at 0x000ab300, totlen 0x00000166, #ino    274, version     2, isize     2458, csize      290, dsize      589, offset     1869
         Dirent     node at 0x000ab468, totlen 0x00000033, #pino   269, version   273, #ino       275, nsize       11, name xterm-color
         Inode      node at 0x000ab49c, totlen 0x000002da, #ino    275, version     1, isize     1569, csize      662, dsize     1569, offset        0
         Dirent     node at 0x000ab778, totlen 0x00000035, #pino   269, version   274, #ino       276, nsize       13, name xterm-xfree86
         Inode      node at 0x000ab7b0, totlen 0x00000504, #ino    276, version     1, isize     2458, csize     1216, dsize     2458, offset        0
         Dirent     node at 0x000abcb4, totlen 0x00000036, #pino   265, version   275, #ino       277, nsize       14, name default.script
         Inode      node at 0x000abcec, totlen 0x000001fa, #ino    277, version     1, isize      801, csize      438, dsize      801, offset        0
         Dirent     node at 0x000abee8, totlen 0x0000002b, #pino    15, version   276, #ino       278, nsize        3, name lib
         Inode      node at 0x000abf14, totlen 0x00000044, #ino    278, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x000abf58, totlen 0x0000002c, #pino    15, version   277, #ino       279, nsize        4, name lock
         Inode      node at 0x000abf84, totlen 0x0000004a, #ino    279, version     1, isize        6, csize        6, dsize        6, offset        0
         Dirent     node at 0x000abfd0, totlen 0x0000002b, #pino    15, version   278, #ino       280, nsize        3, name log
         Inode      node at 0x000abffc, totlen 0x0000004a, #ino    280, version     1, isize        6, csize        6, dsize        6, offset        0
         Dirent     node at 0x000ac048, totlen 0x0000002e, #pino    15, version   279, #ino       281, nsize        6, name pcmcia
         Inode      node at 0x000ac078, totlen 0x0000004a, #ino    281, version     1, isize        6, csize        6, dsize        6, offset        0
         Dirent     node at 0x000ac0c4, totlen 0x0000002b, #pino    15, version   280, #ino       282, nsize        3, name run
         Inode      node at 0x000ac0f0, totlen 0x0000004a, #ino    282, version     1, isize        6, csize        6, dsize        6, offset        0
         Dirent     node at 0x000ac13c, totlen 0x0000002d, #pino    15, version   281, #ino       283, nsize        5, name spool
         Inode      node at 0x000ac16c, totlen 0x0000004a, #ino    283, version     1, isize        6, csize        6, dsize        6, offset        0
         Dirent     node at 0x000ac1b8, totlen 0x0000002b, #pino    15, version   282, #ino       284, nsize        3, name tmp
         Inode      node at 0x000ac1e4, totlen 0x0000004a, #ino    284, version     1, isize        6, csize        6, dsize        6, offset        0
         Dirent     node at 0x000ac230, totlen 0x0000002e, #pino   278, version   283, #ino       285, nsize        6, name pcmcia
         Inode      node at 0x000ac260, totlen 0x0000004d, #ino    285, version     1, isize        9, csize        9, dsize        9, offset        0
         Dirent     node at 0x000ac2b0, totlen 0x00000030, #pino   278, version   284, #ino       286, nsize        8, name tftpboot
         Inode      node at 0x000ac2e0, totlen 0x00000044, #ino    286, version     1, isize        0, csize        0, dsize        0, offset        0

--0-1240903012-1203609666=:92868--
