Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fR1dA-00073g-0U
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2018 20:35:37 +0000
Received: by mail-wm0-x230.google.com with SMTP id v131-v6so21723128wma.1
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2018 13:35:25 -0700 (PDT)
From: Christian Lamparter <chunkeey@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at
Subject: Regression due to "Return correct error number in ubi_get_vol_info1"
 in mtd-utils 2.0.1+
Date: Thu, 07 Jun 2018 22:35:22 +0200
Message-ID: <2542341.JDPxxHf69l@debian64>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

the commit "Return correct error number in ubi_get_vol_info1" [0]
causes an regression within the libubi of mtd-utils. Affected
by this is ubinfo, ubirmvol and ubirsvol (basically all tools that
use "ubi_get_vol_info1" and check for ENOENT error code).

steps to reproduce: have mtd-utils 2.0.1 or 2.0.2

0. make a bunch of ubi volumes in sequential order
# ubimkvol /dev/ubi0 -s 64KiB -N test1
# ubimkvol /dev/ubi0 -s 64KiB -N test2
# ubimkvol /dev/ubi0 -s 64KiB -N test3
# ubimkvol /dev/ubi0 -s 64KiB -N test4
..

(The idea is that the volume ID of test4 is bigger than
of test1).

1. delete the test1 volume

# ubirmvol /dev/ubi0 -N test1
(this makes a hole in the volume table)

2. try an affected tool (i.e. "ubirmvol /dev/ubi0 -N test4" )

 |root@mr24:/# ubirmvol /dev/ubi0 -N test4
 |ubirmvol: error!: cannot find UBI volume "test4"
 |         error 19 (No such device)

or "ubinfo -a"

 | root@mr24:/# ubinfo -a
 | UBI version:                    1
 | Count of UBI devices:           1
 | UBI control device major/minor: 10:59
 | Present UBI devices:            ubi0
 | 
 | ubi0
 | Volumes count:                           11
 | Logical eraseblock size:                 15872 bytes, 15.5 KiB
 | Total amount of logical eraseblocks:     1952 (30982144 bytes, 29.5 MiB)
 | Amount of available logical eraseblocks: 75 (1190400 bytes, 1.1 MiB)
 | Maximum count of volumes                 92
 | Count of bad physical eraseblocks:       0
 | Count of reserved physical eraseblocks:  40
 | Current maximum erase counter value:     984
 | Minimum input/output unit size:          512 bytes
 | Character device major/minor:            251:0
 | ubinfo: error!: libubi failed to probe volume 5 on ubi0
 |        error 19 (No such device)
 | Present volumes:                         0, 1, 2, 3, 4root@mr24:/# 

The problem with this patch is, that it updated ubi_get_vol_info1() to
return a different errno code (ENODEV instead of ENOENT). 

|-       if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor))
|+       if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor)) {
|+               if (errno == ENOENT)
|+                       errno = ENODEV;
|                return -1;
|+       }

However, the patch didn't update any existing code. For example this
loop @ line 1327 in ubi_get_vol_info1_nm() [1]

|1327         for (i = dev_info.lowest_vol_id;
|1328              i <= dev_info.highest_vol_id; i++) {
|1329                 err = ubi_get_vol_info1(desc, dev_num, i, info);
|1330                 if (err == -1) {
|1331                         if (errno == ENOENT)
|1332                                 continue;
|1333                         return -1;
|1334                 }
|1335 
|1336                 if (nlen == strlen(info->name) && !strcmp(name, info->name))
|1337                         return 0;
|1338         }

will now fail with the aforementioned ENODEV error, instead of
skipping deleted entry.

the same is true for ubinfo [2]:

| 266         for (i = dev_info.lowest_vol_id;
| 267              i <= dev_info.highest_vol_id; i++) {
| 268                 err = ubi_get_vol_info1(libubi, dev_info.dev_num, i, &vol_info);
| 269                 if (err == -1) {
| 270                         if (errno == ENOENT)
| 271                                 continue;
| 272 
| 273                         return sys_errmsg("libubi failed to probe volume %d on ubi%d",
| 274                                           i, dev_info.dev_num);
| 275                 }

reverting the patch [0] would probably be the easiest 
way to fix the issue, but I'm not sure if that's the
best course of action. If somebody has an idea or
different opinion, please: hit "reply all" ;-).

Regards,
Christian Lamparter

[0] <http://git.infradead.org/mtd-utils.git/commitdiff/dede98ffb706676309488d7cc660f569548d5930>
[1] <http://git.infradead.org/mtd-utils.git/blob/bc63d36e39f389c8c17f6a8e9db47f2acc884659:/lib/libubi.c#l1327>
[2] <http://git.infradead.org/mtd-utils.git/blob/HEAD:/ubi-utils/ubinfo.c#l268>
