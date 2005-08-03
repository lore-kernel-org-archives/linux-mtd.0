Received: from bay106-f14.bay106.hotmail.com ([65.54.161.24] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E0RBX-0003eM-2O
	for linux-mtd@lists.infradead.org; Wed, 03 Aug 2005 17:54:09 -0400
Message-ID: <BAY106-F1441981113829DBB9BB23B98C50@phx.gbl>
From: "Nathan H." <n_8_10@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 03 Aug 2005 15:35:51 -0600
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Subject: Mask error in nandbase.c:  nand_scan(): oob_size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I noticed an error in nandbase.c file.  The nand_scan() function in 
calculates the oob_size:

Line 2372:
/* Calc oobsize */
mtd->oobsize = (8 << (extid & 0x03)) * (mtd->oobblock / 512);
                                                      ^error

The mask used allows for the lowest 2 bits to pass.  But this is supposed to 
be a single bit field.  This error has not caused any problems because the 
next highest bit is reserved for now (always zero).  However it could cause 
a problem in the future.

The code line should be:
mtd->oobsize = (8 << (extid & 0x01)) * (mtd->oobblock / 512);
                                                       ^fix

Reference:  Page 31 (Table: 4th ID Data)
http://www.samsung.com/Products/Semiconductor/Flash/NAND/2Gbit/K9F2G08U0M/ds_k9f2gxxu0m_rev10.pdf

-Nathan
