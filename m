Received: from [218.94.130.26] (helo=mail.mobilesoft.com.cn)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKvMA-00040g-Ee
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 06:09:58 -0400
Received: from [192.168.164.117] (unknown [221.226.103.136])
	by mail.mobilesoft.com.cn (Postfix) with ESMTP id 9E6F16F009A
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Sep 2005 16:28:43 +0800 (CST)
Message-ID: <433A54EB.4060900@mobilesoft.com.cn>
Date: Wed, 28 Sep 2005 16:31:39 +0800
From: Zhonglin <zhonglinzh@mobilesoft.com.cn>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 Error or Maybe Flash Driver Error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I pulled the JFFS2 code from CVS.  And Ported 2.6.12-omap1 to p2-sample.
When P2 sample run for a while, Sometimes The following message will show.

But when I boot again, it is ok again. 

Does anybody meet the same problem ?


Node CRC 00800080 != calculated CRC 4bf2ff8d for node at 00676518
JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9dfa60.
But it must have been OK earl.Node totlen on flash (0x00800080) !=
totlen from node ref (0x0000059c)
JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9deb3c.
But it must have been OK earl.Node totlen on flash (0x00800080) !=
totlen from node ref (0x00000f24)
JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9ddcbc.
But it must have been OK earl.Node totlen on flash (0x00800080) !=
totlen from node ref (0x00000e80)
JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9dce64.
But it must have been OK earl.Node totlen on flash (0x00800080) !=
totlen from node ref (0x00000e58)
JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9dbf3c.
But it must have been OK earl.Node totlen on flash (0x00800080) !=
totlen from node ref (0x00000f28)
JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9db5dc.
But it must have been OK earl.Node totlen on flash (0x00800080) !=
totlen from node ref (0x00000960)
JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9da914.
But it must have been OK earl.Node totlen on flash (0x00800080) !=
totlen from node ref (0x00000cc8)
JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9d9c94.
But it must have been OK earl.Node totlen on flash (0x00800080) !=
totlen from node ref (0x00000c80)
JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9d93c8.
But it must have been OK earl.Node totlen on flash (0x00800080) !=
totlen from node ref (0x000008cc)
JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9d883c.
But it must have been OK earl.Node totlen on flash (0x00800080) !=
totlen from node ref (0x00000b8c)
JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9d7f74.
But it must have been OK earl.Node totlen on flash (0x00800080) !=
totlen from node ref (0x000008c8)


In our kernel source code, FILE drivers/mtd/chips/cfi_cmdset_0001.c ,
we change like below to fix a bug.

static void cfi_intelext_resume(struct mtd_info *mtd)
{
    struct map_info *map = mtd->priv;
    struct cfi_private *cfi = map->fldrv_priv;
    int i;
    struct flchip *chip;

    for (i=0; i<cfi->numchips; i++) {

        chip = &cfi->chips[i];

        spin_lock(chip->mutex);

        /* Go to known state. Chip may have been power cycled */
        if (chip->state == FL_PM_SUSPENDED) {
            //map_write(map, CMD(0xFF), cfi->chips[i].start);  //@@@@@@@@@@@@@@@ It will report error!!!
            map_write(map, CMD(0xFF), 0);
            chip->oldstate = chip->state = FL_READY;
            wake_up(&chip->wq);
        }

        spin_unlock(chip->mutex);
    }
}


When our p2-sample enter the sleep mode, then resume , the resume code will be called. 

So could anyone give me to fix the bug ??



Thanks a lot!

zhonglin
