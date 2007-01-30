Received: from nf-out-0910.google.com ([64.233.182.189])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HBhVo-0003Do-Js
	for linux-mtd@lists.infradead.org; Mon, 29 Jan 2007 20:10:19 -0500
Received: by nf-out-0910.google.com with SMTP id i2so40047nfe
	for <linux-mtd@lists.infradead.org>;
	Mon, 29 Jan 2007 17:10:14 -0800 (PST)
Message-ID: <c0526ddf0701291710o65b9f786ifd1e579b75412cc2@mail.gmail.com>
Date: Mon, 29 Jan 2007 17:10:14 -0800
From: "Michael Marineau" <mike@marineau.org>
Sender: marineam@gmail.com
To: linux-mtd@lists.infradead.org
Subject: NAND diskonchip driver broken with NFTL DOC 2000
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have been having a bit of an adventure trying to get a DiskOnChip
2000 (NFTL model) working properly with nandwrite/nanddump utilities
and jffs2.  With the current version in 2.6.20-rc6 nandwrite/nanddump
can properly read and write the main data area but writes to the oob
area didn't do anything and reads just got garbage.  jffs2 was
similar, generally working but could never find clearmarkes.

If I use the generic nand_read/write_oob_std functions from
nand_base.c instead of nand_read/write_syndrome then
nandwrite/nanddump operates perfectly for both the data area and oob.
Unfortunatly with those oob functions swapped jffs2 is unhappy,
throwing ecc errors constantly.  I didn't check if jffs2 was able to
read the clearmarkers from oob.

For kicks I tried switching the diskonchip ecc.mode completely over to
NAND_ECC_HW instead of NAND_ECC_HW_SYNDROME but that broke ecc for
nandread/nanddump as well. Non-ecc reads/writes did work in that mode
though.

I have been having trouble understanding any further details because I
don't know enough about the chip and I can't find any documentation on
it beyond simply interfacing with m-systems' TrueFFS.

I would greatly appreciate any suggestions or ideas. :-)

If it is important, the exact chip model is MD2202-D48.
-- 
Michael Marineau
Oregon State University
mike@marineau.org
