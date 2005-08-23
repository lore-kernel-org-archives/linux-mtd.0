Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7iRC-0000Xj-Qe
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 19:44:23 -0400
Received: from ep_mmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ILP007PT8JGIC@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 08:42:52 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0ILP000HI8JG7E@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 08:42:52 +0900 (KST)
Date: Wed, 24 Aug 2005 08:42:53 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <430B2B12.8000307@gmail.com>
To: 'Bernhard Priewasser' <priewasser@gmail.com>
Message-id: <0ILP000HJ8JG7E@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] OneNAND: Simple Bad Block handling support
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Which directory are you patch? MTD-CVS or kernel?

In MTD-CVS I also have similar message 

$ patch --dry-run -p1 < ../onenand-bbm.patch
patching file drivers/mtd/onenand/Makefile
Hunk #1 FAILED at 3.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/mtd/onenand/Makefile.rej
patching file drivers/mtd/onenand/onenand_base.c
Hunk #1 FAILED at 311.
Hunk #2 succeeded at 1033 (offset -29 lines).
Hunk #4 succeeded at 1158 (offset -29 lines).
Hunk #6 succeeded at 1504 (offset -35 lines).
1 out of 6 hunks FAILED -- saving rejects to file
drivers/mtd/onenand/onenand_base.c.rej
patching file drivers/mtd/onenand/onenand_bbt.c
patching file include/linux/mtd/bbm.h
patching file include/linux/mtd/onenand.h
Hunk #3 FAILED at 101.
Hunk #4 succeeded at 109 (offset -1 lines).
1 out of 4 hunks FAILED -- saving rejects to file
include/linux/mtd/onenand.h.rej

I think the patch scenario is following

1. patching onenand-syncread.patch (check previous e-mail)
2. onenand-bbm.patch
3. omap-onenand.patch

Try again and If you have same problem. please let me know

In my test there's two .rej file

./drivers/mtd/onenand/Makefile.rej
./drivers/mtd/onenand/onenand_base.c.rej

***************
*** 3,9 ****
  #

  # Core functionality.
- obj-$(CONFIG_MTD_ONENAND)             += onenand_base.o

  # Board specific.
  obj-$(CONFIG_MTD_ONENAND_OMAP)                += omap-onenand.o
--- 3,11 ----
  #

  # Core functionality.
+ obj-$(CONFIG_MTD_ONENAND)             += onenand.o

  # Board specific.
  obj-$(CONFIG_MTD_ONENAND_OMAP)                += omap-onenand.o
+
+ onenand-objs = onenand_base.o onenand_bbt.o

***************
*** 311,329 ****
        ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);

        if (ctrl & ONENAND_CTRL_ERROR) {
-               DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error =
0x%04x", ctrl);
-               return -EAGAIN;
        }

        if (ctrl & ONENAND_CTRL_LOCK) {
-               DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error =
0x%04x", ctrl);
-               return -EIO;
        }

        if (interrupt & ONENAND_INT_READ) {
                ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
                if (ecc & ONENAND_ECC_2BIT_ALL) {
-                       DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error =
0x%04x", ecc);
                        return -EBADMSG;
                }
        }
--- 311,331 ----
        ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);

        if (ctrl & ONENAND_CTRL_ERROR) {
+               /* It maybe occur at initial bad block */
+               DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error =
0x%04x\n", ctrl);
+               /* Clear other interrupt bits for preventing ECC error */
+               interrupt &= ONENAND_INT_MASTER;
        }

        if (ctrl & ONENAND_CTRL_LOCK) {
+               DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error =
0x%04x\n", ctrl);
+               return -EACCES;
        }

        if (interrupt & ONENAND_INT_READ) {
                ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
                if (ecc & ONENAND_ECC_2BIT_ALL) {
+                       DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error =
0x%04x\n", ecc);
                        return -EBADMSG;
                }
        }

I tried to solve this problem

Thank you

Kyungmin Park

> -----Original Message-----
> From: Bernhard Priewasser [mailto:priewasser@gmail.com] 
> Sent: Tuesday, August 23, 2005 10:57 PM
> To: kyungmin.park@samsung.com
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: [PATCH] OneNAND: Simple Bad Block handling support
> 
> Hi,
> 
> trying patching a today's snapshot I get:
> 
> patch -p1 < onenand-bbm.patch
> patching file drivers/mtd/onenand/Makefile
> Hunk #1 FAILED at 3.
> 1 out of 1 hunk FAILED -- saving rejects to file 
> drivers/mtd/onenand/Makefile.rej
> patching file drivers/mtd/onenand/onenand_base.c
> Hunk #1 FAILED at 311.
> Hunk #2 succeeded at 1033 (offset -29 lines).
> Hunk #3 succeeded at 1101 (offset -29 lines).
> Hunk #4 succeeded at 1158 (offset -29 lines).
> Hunk #5 succeeded at 1444 (offset -29 lines).
> Hunk #6 succeeded at 1504 (offset -35 lines).
> 1 out of 6 hunks FAILED -- saving rejects to file 
> drivers/mtd/onenand/onenand_base.c.rej
> patching file drivers/mtd/onenand/onenand_bbt.c
> patching file include/linux/mtd/bbm.h
> patching file include/linux/mtd/onenand.h
> Hunk #3 FAILED at 101.
> Hunk #4 succeeded at 109 (offset -1 lines).
> 1 out of 4 hunks FAILED -- saving rejects to file 
> include/linux/mtd/onenand.h.rej
> 
> .rej files are available.
> Perhaps it's a silly fault... I'm new to diff/patch, sorry.
> 
> Regards,
> Bernhard
> 
> 
