Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DeFJT-0002E1-1H
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2005 12:46:28 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DeFFM-0000u4-RQ
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2005 18:42:19 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Jun 2005 18:42:12 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Jun 2005 18:42:12 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Fri, 3 Jun 2005 16:39:27 +0000 (UTC)
Message-ID: <loom.20050603T175215-163@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: yaffs power fail reliability
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

beg pardon if this is not exactly the right mailing list to post but I did 
post on yaffs mailing list twice and there was no response. So here we go 
again:

*** Did anybody perform power cycling tests on yaffs? ***

This is not an idle question. Yaffs supposed to be robust in respect to 
power failures. I designed a test that produces filesystem corruption after
about 100 power cycles. The symptoms are flipped bits in files, some files
growing in size (appended with a bunch of zeros). After looking at yaffs code 
it seems to me that a few corner cases are not handled:
1. Clean marker is not used. AFAIK that may lead to using partially erased
blocks with bits flipping back and forth (as in original jffs).
2. Garbage collector does not check ecc on data before copying it, e.g. if 
the tags are ok but data is bad, the bad data will be copied and new good ecc 
will be assigned to it. Hmm, on a second thought, I do not recall if ecc 
is checked even on tags there.
3. Few places may benefit from checking return codes (and handling errors).
4. Something else that I missed ;-) Some corruptions I cannot account for.

Unfortunately there is _no_ alternative to yaffs at the moment when using 
large NAND devices. JFFS3 would be nice but it is still in design stage. 
So, as I see it there are two immediate possibilities:
1. I have bad hardware and/or driver and YAFFS may be used just fine as is. 
The argument against that is I've sent 140 GBytes of data using jffs2 and no
power cycling through the NAND chip. Besides, TGLX looked at the driver and 
did not see a problem with it ;-)
2. We, the people with big NAND FLASH devices ;-), test the heck out of 
yaffs and fix what is broken. I've got a few ideas if there is an interest.

Sergei Sharonov
