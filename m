Received: from hskim.ucsd.edu ([132.239.95.11])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GXeOE-0001F0-3X
	for linux-mtd@lists.infradead.org; Wed, 11 Oct 2006 09:45:33 -0400
Resent-Message-ID: <20061011134400.GA26666@pooky.senux.com>
Date: Wed, 11 Oct 2006 09:03:58 +0900
From: Seongsu Lee <senux@senux.com>
To: linux-mtd@lists.infradead.org
Subject: mounting yaffs2 on mtdconcat-ed partition
Message-ID: <20061011000358.GA21321@pooky.senux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: cgan@iders.ca
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

The test machine is a small embedded box, 
labeled xhyper270a-nand6ea from HyBus, Korea. 
The version of Linux kernel that I used in the test is 
2.6.11.

I created two concatenated partition as the follow. 

[dmesg]
Concatenating MTD devices:
(0): "xhyper27x_Nand_Flash_A_128K"
(1): "xhyper27x_Nand_Flash_B_128K"
into device "posllayer0"
Concatenating MTD devices:
(0): "xhyper27x_Nand_Flash_C_128K"
into device "posllayer1"

[root@hybus tmp]# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00040000 "boot"
mtd1: 00180000 00040000 "kernel"
mtd2: 01e40000 00040000 "rootfs"
mtd3: 08000000 00020000 "xhyper27x_Nand_Flash_A_128K"
mtd4: 08000000 00020000 "xhyper27x_Nand_Flash_B_128K"
mtd5: 08000000 00020000 "xhyper27x_Nand_Flash_C_128K"
mtd6: 08000000 00020000 "xhyper27x_Nand_Flash_D_128K"
mtd7: 10000000 00020000 "posllayer0"
mtd8: 08000000 00020000 "posllayer1"

The problem is that I can't mount yaffs2 filesystem on
a partition that is concatenated by mtdconcat.c. Follow is
the message in mount command. (permission error was occured)

[root@hybus mnt]# eraseall /dev/mtd6
Erasing 128 Kibyte @ 0 --  0 % complete.
eraseall: /dev/mtd6: MTD Erase failure: Input/output error
Erasing 128 Kibyte @ c000000 -- 11 % complete.
eraseall: /dev/mtd6: MTD Erase failure: Input/output error
Erasing 128 Kibyte @ ffe0000 --  3 % complete.
[root@hybus mnt]# mount -t yaffs2 /dev/mtdblock6 /mnt/data6
mount: permission denied. (are you root?)

So, I looked the source code of yaffs2 and mtd. I found that
there is not bad block management support in mtdconcat. 
Am I right? I made follow simple patch for mtdconcat.c and 
it works. (mounting)

Index: mtdconcat.c
===================================================================
RCS file: /***/linux/drivers/mtd/mtdconcat.c,v
retrieving revision 1.1.1.1
diff -r1.1.1.1 mtdconcat.c
639a640,687
> static int concat_block_isbad(struct mtd_info *mtd, loff_t ofs) {
>        struct mtd_concat *concat = CONCAT(mtd);
>        int i;
>        int err = 0;
>
>        if (ofs > mtd->size) {
>                return -EINVAL;
>        }
>
>        for (i = 0; i < concat->num_subdev; i++) {
>                struct mtd_info *subdev = concat->subdev[i];
>
>                if (ofs >= subdev->size) {
>                        ofs -= subdev->size;
>                        continue;
>                }
>
>                err = subdev->block_isbad(subdev, ofs);
>                break;
>        }
>
>        return err;
> }
>
> static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs) {
>        struct mtd_concat *concat = CONCAT(mtd);
>        int i;
>        int err = 0;
>
>        if (ofs > mtd->size) {
>                return -EINVAL;
>        }
>
>        for (i = 0; i < concat->num_subdev; i++) {
>                struct mtd_info *subdev = concat->subdev[i];
>
>                if (ofs >= subdev->size) {
>                        ofs -= subdev->size;
>                        continue;
>                }
>
>                err = subdev->block_isbad(subdev, ofs);
>                break;
>        }
>
>        return err;
> }
>
754a803,806
>       /* bad block management */
>       concat->mtd.block_isbad   = concat_block_isbad;
>       concat->mtd.block_markbad = concat_block_markbad;
>

The result of mount test after patching mtdconcat.c.

[root@hybus mnt]# mount -t yaffs2 /dev/mtdblock7 /mnt/data7
[root@hybus mnt]# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/rom2                30.3M     15.3M     15.0M  51% /
/dev/mtdblock7          256.0M      1.0M    255.0M   0% /mnt/data7

I think bad block management is not supported in mtdconcat.
Is it right? If so, could you somebody add the support?

Let me know if something wrong in my posting. 
I am waiting for help.

-- 
Seongsu Lee - http://www.senux.com/
"World domination. Fast" (By Linus Torvalds)
