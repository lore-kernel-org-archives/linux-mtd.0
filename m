Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RiRfi-00070r-KV
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 14:18:31 +0000
Received: from comm.systec-electronic.de (95-91-85-164-dynip.superkabel.de
 [95.91.85.164])
 by webbox1416.server-home.net (Postfix) with ESMTPA id E684127A619
 for <linux-mtd@lists.infradead.org>; Wed,  4 Jan 2012 15:21:54 +0100 (CET)
Received: from ws-stein.localnet (unknown [192.168.10.38])
 by comm.systec-electronic.de (Postfix) with ESMTP id C94BC97C068
 for <linux-mtd@lists.infradead.org>; Wed,  4 Jan 2012 15:18:21 +0100 (CET)
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: linux-mtd@lists.infradead.org
Subject: delayed close on mtdblock
Date: Wed, 04 Jan 2012 15:18:21 +0100
Message-ID: <14259449.DIx1JTusJU@ws-stein>
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

I observed an somewhat interesting situation regarding mtdblock. I have a NOR-
Flash with several mtd partitions. One holds the configuration from the 
bootloader and another one contains UBI/UBIFS.
During bootup I attach UBI and mount UBIFS, no problems so far. To read the 
bootloader coniguration I open the corresponding mtdblock with O_RDONLY, do an 
lseek, read and close it afterwards, nothing special. But I noticed the 
close() call take >1s which seems to far big, as there is nothing to be 
written into this mtdblock device.
I digged into the kernel and get to mtdblock_release(). I can see that 
write_cached_data does nothing as the cache is clean. But mbd->mtd->sync 
(cfi_amdstd_sync in my case) takes a while because the chip state is currently 
FL_ERASING. The retry loop is taken several times before exiting the function.
If I don't mount UBIFS there is no such delay. I'm wondering if there is 
actually a need to sync the chip if the cache is clean. Can someone explain 
this to me?

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein

SYS TEC electronic GmbH
August-Bebel-Str. 29
D-07973 Greiz

Tel: +49-3661-6279-0, Fax: +49-3661-6279-99
eMail:    Alexander.Stein@systec-electronic.com
Internet: http://www.systec-electronic.com

Managing Director: Dipl.-Phys. Siegmar Schmidt
Commercial registry: Amtsgericht Jena, HRB 205563
