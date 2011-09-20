Received: from a.relay.invitel.net ([62.77.203.3])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5vDf-0000SG-4k
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2011 07:58:19 +0000
Date: Tue, 20 Sep 2011 09:58:08 +0200
From: Heiko Schocher <hs@denx.de>
Subject: mtd-util, flash_erase: MEMGETOOBSEL on davinci based board fail
To: linux-mtd@lists.infradead.org
Message-id: <4E784790.4010601@denx.de>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-15
Content-transfer-encoding: 7BIT
Reply-To: hs@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I tried to use mtd-util:flash_erase on a davinci am1808 based board,
and get the following error:

flash_erase -j /dev/mtd5 0 0
flash_erase: error!: /dev/mtd5: unable to get NAND oobinfo
              error 22 (Invalid argument)

The problem is here:

drivers/mtd/mtdchar.c line 786:

                if (mtd->ecclayout->eccbytes > ARRAY_SIZE(oi.eccpos))
                        return -EINVAL;

On such a plattform we have:

mtd->ecclayout->eccbytes = 40
ARRAY_SIZE(oi.eccpos) = 32

following patch solves the issue:

diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index a86364a..5dc6ed1 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -136,7 +136,7 @@ struct nand_oobinfo {
        __u32 useecc;
        __u32 eccbytes;
        __u32 oobfree[8][2];
-       __u32 eccpos[32];
+       __u32 eccpos[40];
 };

 struct nand_oobfree {

Now the questions:

a) is this fix Ok? (Has it i chance to go in mainline?)
b) in include/mtd/mtd-abi.h I found this comment:

/*
 * Obsolete legacy interface. Keep it in order not to break userspace
 * interfaces
 */
struct nand_oobinfo {

so this Interface should not be used ... which Interface should be
used instead?

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
