Received: from f04s01.cac.psu.edu ([128.118.141.31] helo=f04n01.cac.psu.edu)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15biJQ-0003NQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 13:49:48 +0100
Received: from nrlgrad.psu.edu (nrlgrad.cedcc.psu.edu [130.203.252.43])
	by f04n01.cac.psu.edu (8.9.3/8.9.3) with ESMTP id IAA45634
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 08:55:45 -0400
Message-Id: <5.1.0.14.2.20010828083646.00a63a00@mail.psu.edu>
Date: Tue, 28 Aug 2001 08:55:42 -0400
To: linux-mtd@lists.infradead.org
From: Bill Seisler <wrs122@psu.edu>
Subject: DOC 2000 Issues
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

After working on this and getting nowhere fast, I need some advice. I have 
a P3-850 w/256 MB RAM and a Disk on Chip socket . I have a 141 MB Disk on 
Chip 2000. The end goal is to get the system to boot off of the Disk on 
Chip with Linux Redhat 7.1 and kernel 2.4.9 (Very simple, no graphics, just 
network support). Originally, I tried the m-sys drivers with TrueFFS 5.0. 
Followed the instructions provided and ran into minor difficulties until I 
reached the dformat command (I get an error, the UPDATE flag is invalid). 
After having no luck getting around that, I called their tech support. The 
guy on the line was less than enthusiastic about Linux support and 
suggested I use TrueFFS v4.2 (oddly enough, when I flashed the DOC with 
TrueFFS 5.0, it said it was running v4.3, but in the end, 4.2 didn't seem 
to help matters). In my next attempt, I tried to use the code supplied in 
kernel 2.4.9 and the mtd-lilo instead of the m-sys drivers. In both cases, 
I can get it to recognize the DOC in some fashion. Generally I am able to 
mount the DOC and copy files to it as well, but I just can't seem to make 
the final step and be able to boot from it. I looked through the cvs 
distribution readme and I'd like to try it but I don't want to have to 
compress the filesystem on the DOC (I shouldn't need to). Any comments on 
this are greatly appreciated.

Here are my final questions for this message:
Which TrueFFS do I have better luck with? 4.2 or 5.0 (4.3?)
What is the difference between the code that came with kernel 2.4.9 and the 
cvs? Is the code in 2.4.9 just a previous cvs or did it come from a 
different author?

Thanks ahead of time for your help,
-Bill
