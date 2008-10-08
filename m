Received: from smtp-vbr3.xs4all.nl ([194.109.24.23])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnUnI-0003GZ-BR
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 08:53:20 +0000
Received: from mail3.aimsys.nl (a80-127-156-242.adsl.xs4all.nl
	[80.127.156.242])
	by smtp-vbr3.xs4all.nl (8.13.8/8.13.8) with ESMTP id m988rIH9013786
	for <linux-mtd@lists.infradead.org>;
	Wed, 8 Oct 2008 10:53:18 +0200 (CEST)
	(envelope-from nvbolhuis@aimvalley.nl)
Message-ID: <48EC74FC.7070602@aimvalley.nl>
Date: Wed, 08 Oct 2008 10:53:16 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: preventing multi-bit errors on NAND
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Some of our NAND chips (128MB, 128k blocks, 2k pages) have multi but errors
# cat /proc/nand
single-bit data errors : 1000
single-bit ecc errors  : 8
multi-bit errors       : 4
double multi-bit errors: 5

This causes some of our products (using these NAND chips) to fail horribly
(since data is lost).

Btw. we're using on old kernel/JFFS2/NAND version (linux-2.4.25, MTD CVS 2005).

I studied some JFFS2/NAND/MTD source code and wonder whether we could
have prevented this. I also looked at the latest JFFS2/NAND/MTD code
(kernel 2.6.26) and there aren't any major ECC/bad-block changes/improvements.
Now I have the following questions:

Why not use 6 bytes ECC code (per 256 bytes) to correct at max 2 bits ?
I know, this is not standard and would cause incompatibilities, still
I'd like to know whether it could be done or already has been done. There's
enough room in the OOB I believe.

Why not mark a block bad when detecting a single-bit error ?
I assume a multi-bit error was a singe-bit error before.
A single-bit error is corrected and that's it. Nobody knows about it,
let alone JFFS2 acts upon it.

Would #defining CONFIG_MTD_NAND_VERIFY_WRITE have helped/prevented this ?
Currently CONFIG_MTD_NAND_VERIFY_WRITE isn't #defined. It would probably
better to actually #define it. It looks like a failed verification doesn't
lead to a block marked bad, why not ?
I guess that if a verification fails mtdblock will use another block
to write the data, is this correct ?


-- 
This message has been scanned for viruses and is believed to be clean
