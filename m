Received: from gate.aminocom.com
	([193.132.141.181] helo=aminocom.com ident=0)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Tncn-0001sw-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 17:25:21 +0000
Received: from aminocom.com (eclarke.aminocom.com [10.171.23.32])
	by aminocom.com (8.11.6/8.11.6) with ESMTP id g0OHaPO06373
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 17:36:25 GMT
Message-ID: <3C5045C8.4105EC82@aminocom.com>
Date: Thu, 24 Jan 2002 17:35:04 +0000
From: Elizabeth Clarke <eclarke@aminocom.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Nand flash: hang after erase
References: <3C4FFA62.505BD064@aminocom.com> <9294.1011878619@redhat.com> <3C501070.F9A2043E@aminocom.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Elizabeth Clarke wrote:
> erase->state is zero... nand_erase is not setting it appropriately. I
> bunged in a line  instr->state = MTD_ERASE_DONE; on the way out and now
> getting further.

hmmm, interesting. Further means as far as noticing nandtest seems to
trash the manufacturers info. Doh, I should have realised that.

And this whilst mounting jffs2:

JFFS2: Erase block at 0x00014000 is not formatted. It will be
erased            nand_read_ecc: from = 0x00016000, len =
4096                                    nand_read_ecc: Failed ECC read,
page 0x000000b1                                
mtdblock_release                                                               
nand_sync: called
ok                                                                             
mount: Mounting /dev/mtdblock0 on /mnt/jffs2 failed: Invalid argument

Which is where I believe I had a genuine bad block. I thought JFFS2 is
supposed to handle bad blocks? Or have I got the wrong impression...

Beth
