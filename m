Received: from mailout03.sul.t-online.com ([194.25.134.81])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZnQO-0003gL-65
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2003 09:02:08 +0100
Received: from merkur.eurodsn.de (merkur.eurodsn.de [192.168.0.7])
	ESMTP id h687qGT00515
	for <linux-mtd@lists.infradead.org>; Tue, 8 Jul 2003 09:52:16 +0200
From: Juergen Beisert <jbeisert@eurodsn.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 8 Jul 2003 10:01:10 +0200
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200307081001.10555.jbeisert@eurodsn.de>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: NAND-Flash ECC data not used
Reply-To: jbeisert@eurodsn.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I have tried to use a 16MiB NAND flash in my application. It seems to work, 
but it also seem that the driver is not using the ECC data. I have derived my 
small driver from the spia.c source and have added the line

this->eccmode=NAND_ECC_SOFT;

before calling nand_scan(). nand_scan() inserts the ECC check routines 
correctly in the structure. But later, if the jffs2 calls the driver to read 
data from flash, it calls nand_read_ecc() with parameter oobsel = 0. So the 
line 

int	eccmode = oobsel ? this->eccmode : NAND_ECC_NONE;

in nand_read_ecc() switches back to NONE ecc mode while reading.

Any ideas what's going wrong?

Juergen Beisert
