Received: from elasmtp-banded.atl.sa.earthlink.net ([209.86.89.70])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fjh1W-0007jy-Nc
	for linux-mtd@lists.infradead.org; Fri, 26 May 2006 19:27:00 +0100
Message-ID: <22041269.1148668002935.JavaMail.root@elwamui-little.atl.sa.earthlink.net>
Date: Fri, 26 May 2006 14:26:42 -0400 (EDT)
From: Steve Finney <saf76@earthlink.net>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Bug in nand_base.c?
Reply-To: Steve Finney <saf76@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello experts:
I have a symptom and a partial diagnosis of what I'm pretty sure is
a bug (or two?) in nand_base.c as distributed in 2.6.14.3 (although
my glance at 2.6.16.X suggests the code is still the same). I'm seeking
recommendations for a proper fix or workaround(or, if necessary, descriptions
of  what I'm doing that's really stupid :-) ).

Context: I want to test single bit error-correction using a Samsung S3C2410
chip (which has a hardware ECC calculator, 3 bytes/512) and a Samsung
K9F56* 32 MB NAND flash (which allows 2 or 3 partial page writes
between erase cycles, which might be relevant). To do the ECC test
I want, I need to be able to write the OOB area without having it
mucked with by the kernel. The following is an indication of the problem
using standard tools.

Symptom: (I'm using slightly modified versions of mtd-utils that allow
hex arguments; patches have been submitted): /dev/mtd1 has valid Linux-written
data with ECC, /dev/mtd7 is erased. The intent is to copy the valid ECC
data in the OOB to the output partition:

nanddump  -s 0       -l 0x4000 -f /usr/local/data /dev/mtd1
nandwrite -s 0       -o /dev/mtd7 /usr/local/data
nandwrite -s 0x4000  -o -n /dev/mtd7 /usr/local/data

After this sequence, nanddump shows that location 0 on mtd7 has valid ECC. 
The pages starting at location 0x4000 on mtd7 have corrupt ECC.

Diagnosis: I believe there are two separate issues.
1) nandwrite with "-o" first writes the (provided) OOB with ioctl
  (MEMWRITEOOB), and then writes the data (invoking nand_write_page() ).
  nand_write_page() in nand_base.c calls write_buf() on the data,
  AND then calls write_buf() on with oob_buf even
  if NAND_ECC_NONE is set (as it will be in the second nandwrite above).
  This strikes me as possibly bogus, but maybe there's subtleties about
  OOB and ECC I don't understand. However, in the normal case this ends up
  being harmless because the contents of oob_buf should be 0xFF, so you
  don't risk changing the OOB values you already wrote (maybe the Samsung
  flash is special here).
2) HOWEVER, based on debug printk's in the kernel, in the above sequence,
  oob_buf during the second nandwrite above remains set to the last (valid)
  ECC bytes from the preceding nandwrite. And, in fact, the ECC at location
  0x4000 is the correct value but with  bits cleared which were zero in the
  left-over ECC value. I do not currently have a hypothesis for why
  this->oobdirty isn't setting the leftover value to 0xFF.

Sorry for the length, but this is summarizing a day or two of work :-).

Comments/suggestions?

sf
