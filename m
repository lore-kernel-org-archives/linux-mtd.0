Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYdPl-0005Uw-PL
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 14:58:34 +0000
Received: from localhost (localhost [127.0.0.1])
 by ra.se.axis.com (Postfix) with ESMTP id 5CA3C384E93
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 16:58:12 +0200 (CEST)
Received: from ra.se.axis.com ([127.0.0.1])
 by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 37hIV60DvCpm for <linux-mtd@lists.infradead.org>;
 Tue, 22 Oct 2013 16:58:11 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
 by ra.se.axis.com (Postfix) with ESMTP id 3A101384E8E
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 16:58:10 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
 by postfix.imss71 (Postfix) with ESMTP id 240669BD
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 16:58:10 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
 by boulder.se.axis.com (Postfix) with ESMTP id 18EA69B8
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 16:58:10 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
 by seth.se.axis.com (Postfix) with ESMTP id 173DB3E06F
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 16:58:10 +0200 (CEST)
Date: Tue, 22 Oct 2013 16:58:09 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: How to handle ECC in erased pages?
Message-ID: <alpine.DEB.2.00.1310221610570.28562@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


When erasing a page in a NAND flash all the bits are erased to ones so all 
bytes are 0xff . This presents a potential problem with the ECC, in that 
if the ECC for an all-ff block of data is not itself all-ff, there will be 
ECC errors when reading an erased page.

This is handled in the software Hamming and BCH cases by XOR masking the 
ECC with a bitmask such that the ECC of an erased block of data is in fact 
all-ff.

In some cases however, there are hardware NAND flash controllers with 
built-in ECC generation and management, i.e. the controller writes the ECC 
to the OOB automatically when writing a page, and automatically corrects 
potential bit errors using the ECC stored in the OOB when reading. In this 
case there is no way to influence the actual ECC bits written to the 
flash.

I've come across such a controller, which in fact does return an ECC error 
for an erased page. I'm trying to figure out a reasonable way to deal with 
this. The first step would be to verify that the page indeed is erased if 
it supposed to be, but that is compounded by the fact that bitflips could 
occur in an erased page, so that the data in fact is not all-ff when it 
should be, but should still be considered 'erased', because assuming that 
ECC were properly applied, this case would be handled transparently.

One existing case I've come across while looking through the existing NAND 
flash drivers is denali.c which when it detects an uncorrectable ECC 
error, scans the whole data and spare areas of the page for an all-ff 
condition - this would fail if there were in fact a bit flip.

davinci_nand.c uses an XOR mask for 1 bit ECC, but checks the ECC for an 
all-ff condition, deciding that the page is erased if that is the case. 
Again this ignores the problem of a bit flip in the ECC data area of an 
erased page.

fmsc_nand.c when encountering a page with more errors that the correction 
algorithm can handle (BCH-8 in this case), counts the number of 0 bits in 
the main and spare areas of the page; if the number of 0 bits is less than 
8 it considers the page erased. This would seem to be the most correct 
approach so far, but requires quite a lot of work (i.e. scanning through 
all bytes in the page) in order to accomplish this.

One thing I was considering was if when using UBI and ubifs erased blocks 
are read at all in normal operation. In fact this doesn't seem to be the 
case; once the partition has been formatted and/or mounted UBI doesn't 
need to do any scanning operations on the data. I did a quick empirical 
test by adding a printk in nand.c:nand_read_page_swecc() when an empty 
page is read, the 'reading blank page' printk was triggered during mount 
for a couple of pages (probably while reading the index pages for UBI), 
but not afterwards, until the file system started to fill up, when I 
assume some form of garbage collection was being trigged. Writing a big 
file to a new ubifs volume didn't cause any blank page printouts except 
for the ones occurring during mount.'

All in all it seems then that the performance penalty of explicitly 
checking pages that are supposedly erased would be rather small, because 
it is not done very often.

Any other thoughts on this?

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
