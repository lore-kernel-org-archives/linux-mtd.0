Received: from [2001:470:b:3e:219:66ff:fee3:2c84] (helo=silka.with-linux.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4CoC-0003ih-L9
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 13:48:42 +0000
Received: from [IPv6:2001:470:b:3e:d69a:20ff:fe56:76db] (comer.internal
	[IPv6:2001:470:b:3e:d69a:20ff:fe56:76db])
	by silka.with-linux.com (8.14.4/8.14.4) with ESMTP id p2SDmXGb023253
	for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2011 07:48:38 -0600
Message-ID: <4D9091B1.80002@silka.with-linux.com>
Date: Mon, 28 Mar 2011 07:48:33 -0600
From: Kelly Anderson <kelly@silka.with-linux.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Mtd alignment bug affecting 1.4.X including current git
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Hey there's a problem with mtd-utils starting with commit 
5dd7d09648bd4c1c87e7c155b960e500925571db
Versions starting with 1.4.X fail.
A SheevaPlug user report the problem, so I git bisected it.
The output from flash_eraseall is at the bottom (the alignments are all 
off by 2).
I looked at the problem and found (in current git) that it's passing 
"offset + clmpos".
I'm pretty sure that clmpos is 2 in this case.  mtd_write_oob is passing 
this to do_oob_op
as "start". do_oob_op is verifying alignment, but it's off by 2 so it fails.
It should be relatively easy to fix.  You probably need to check all of 
the calls to mtd_write_oob
and mtd_read_oob for proper behaviour.  If you create a patch I'll test 
it for you.

flash_erase.c:275
         if (isNAND) {
             if (mtd_write_oob(mtd_desc, &mtd, fd, offset + clmpos, 
clmlen, &cleanmarker) != 0) {
                 sys_errmsg("%s: MTD writeoob failure", mtd_device);
                 continue;
             }
         } else {


libmtd.c:1166
int mtd_write_oob(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
           uint64_t start, uint64_t length, void *data)
{
     return do_oob_op(desc, mtd, fd, start, length, data,
              MEMWRITEOOB64, MEMWRITEOOB);
}

libmtd.c:1105
     if (start % mtd->min_io_size) {
         errmsg("unaligned address %llu, mtd%d page size is %d",
                (unsigned long long)start, mtd->mtd_num,
                mtd->min_io_size);
         errno = EINVAL;
         return -1;
     }


5dd7d09648bd4c1c87e7c155b960e500925571db is the first bad commit
commit 5dd7d09648bd4c1c87e7c155b960e500925571db
Author: Kevin Cernekee <cernekee@gmail.com>
Date:   Fri Jul 23 17:46:15 2010 -0700

     mtd: change flash_eraseall to use libmtd-wrapped ioctls

     ERASE/ERASE64 were tested on 2.6.18 and 2.6.31. OOB is untested.

     Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
     Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

:100644 100644 e6f8d50ea41ff99260ef2528e50866380675d866 
a2a6b0a28ed5e6053c41524f3de686e81fdd5afa M      flash_eraseall.c


Erasing 128 Kibyte @ 0 --  0 % complete.libmtd: error!: unaligned 
address 2, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 20000 --  3 % complete.libmtd: error!: unaligned 
address 131074, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 40000 --  6 % complete.libmtd: error!: unaligned 
address 262146, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 60000 --  9 % complete.libmtd: error!: unaligned 
address 393218, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 80000 -- 12 % complete.libmtd: error!: unaligned 
address 524290, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ a0000 -- 15 % complete.libmtd: error!: unaligned 
address 655362, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ c0000 -- 18 % complete.libmtd: error!: unaligned 
address 786434, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ e0000 -- 21 % complete.libmtd: error!: unaligned 
address 917506, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 100000 -- 25 % complete.libmtd: error!: unaligned 
address 1048578, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 120000 -- 28 % complete.libmtd: error!: unaligned 
address 1179650, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 140000 -- 31 % complete.libmtd: error!: unaligned 
address 1310722, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 160000 -- 34 % complete.libmtd: error!: unaligned 
address 1441794, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 180000 -- 37 % complete.libmtd: error!: unaligned 
address 1572866, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 1a0000 -- 40 % complete.libmtd: error!: unaligned 
address 1703938, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 1c0000 -- 43 % complete.libmtd: error!: unaligned 
address 1835010, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 1e0000 -- 46 % complete.libmtd: error!: unaligned 
address 1966082, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 200000 -- 50 % complete.libmtd: error!: unaligned 
address 2097154, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 220000 -- 53 % complete.libmtd: error!: unaligned 
address 2228226, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 240000 -- 56 % complete.libmtd: error!: unaligned 
address 2359298, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 260000 -- 59 % complete.libmtd: error!: unaligned 
address 2490370, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 280000 -- 62 % complete.libmtd: error!: unaligned 
address 2621442, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 2a0000 -- 65 % complete.libmtd: error!: unaligned 
address 2752514, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 2c0000 -- 68 % complete.libmtd: error!: unaligned 
address 2883586, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 2e0000 -- 71 % complete.libmtd: error!: unaligned 
address 3014658, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 300000 -- 75 % complete.libmtd: error!: unaligned 
address 3145730, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 320000 -- 78 % complete.libmtd: error!: unaligned 
address 3276802, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 340000 -- 81 % complete.libmtd: error!: unaligned 
address 3407874, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 360000 -- 84 % complete.libmtd: error!: unaligned 
address 3538946, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 380000 -- 87 % complete.libmtd: error!: unaligned 
address 3670018, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 3a0000 -- 90 % complete.libmtd: error!: unaligned 
address 3801090, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 3c0000 -- 93 % complete.libmtd: error!: unaligned 
address 3932162, mtd0 page size is 2048

/usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
Erasing 128 Kibyte @ 3e0000 -- 96 % complete.libmtd: error!: unaligned 
address 4063234, mtd0 page size is 2048
