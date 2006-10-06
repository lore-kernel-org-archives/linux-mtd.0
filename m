Received: from py-out-1112.google.com ([64.233.166.178])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GVi1b-0001m7-R9
	for linux-mtd@lists.infradead.org; Fri, 06 Oct 2006 01:13:36 -0400
Received: by py-out-1112.google.com with SMTP id c59so1045265pyc
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Oct 2006 22:13:30 -0700 (PDT)
Message-ID: <4525E60D.1030006@gmail.com>
Date: Fri, 06 Oct 2006 00:13:49 -0500
From: Nishanth Menon <menon.nishanth@gmail.com>
MIME-Version: 1.0
To: z l <zql@glomationinc.com>
Subject: Re: Problem with developing Samsung K9F1G08U0A MTD driver
References: <20061005220807.86730.qmail@web212.biz.mail.re2.yahoo.com>
In-Reply-To: <20061005220807.86730.qmail@web212.biz.mail.re2.yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

z l stated on 10/5/2006 1:35 PM:
> driver for Samsung K9F1G08U0A chip on the board.  We
<snip>
>
> mtd.type = NAND FLASH
> mtd.flags = MTD_CLEAR_BITS | MTD_ERASEABLE | MTD_OOB |
> MTD_ECC
> mtd.size = 134217728 (128M)
> mtd.erasesize = 131072 (128K)
> mtd.oobblock = 2048 (2K)
> mtd.oobsize = 64
> mtd.ecctype = MTD_ECC_NONE
> regions = 0
>
z l stated on 10/5/2006 5:08 PM:
<snip>
> http://lists.infradead.org/pipermail/linux-mtd/2006-July/016159.html.
> and interesting enough it fixed one of our problems. 
> So it was the nandwriite that was doing the bad thing
> by writing things where "not suppose to" and made good
> blocks into "bad".  After applying the fix, at least
> we can write to the NAND without making lots of new
I have hardly looked at the nand mtd code, but maybe the data sheet
(http://www.samsung.com/Products/Semiconductor/NANDFlash/SLC_LargeBlock/1Gbit/K9F1G08U0A/ds_k9f1g08x0a_rev10.pdf#search=%22K9F1G08U0A%20%20data%20sheet%22)
might help, on the R1 device is 128M, the U device is 256M(so am not too
sure abt ur mtd.size param), on this device, page1,page2 offset 0 had
badblock info, so am not sure if mtd is putting ecc over there..

> "bad" blocks.  And the JFFS2 copied over is somewhat
> working.  Still got lot's of "nand_read_ecc: Failed
> ECC read, page 0xXXXXXXXXX" when doing normal file
> access.  So we are looking into that to see what is
> the cause of this problem.
mebbe u can try this: (dunno if it works): flash_eraseall mtd and mount
and umount the same, let jffs2 maintain the bad blocks - remount should
not show any jffs2 errors.
another issue is possibly that ur host based mkfs.jffs2 might not have
been given the right params..

Just my guesses.. but then.. I can be completely wrong...

Regards,
Nishanth Menon
