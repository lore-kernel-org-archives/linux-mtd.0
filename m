Received: from mail1.cray.com ([136.162.0.111])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6Zqf-0003XE-4I
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2004 18:45:01 +0000
Received: from relaya.us.cray.com (relaya.us.cray.com [192.168.252.144])
	i2PIirFj007005	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Mar 2004 12:44:54 -0600 (CST)
Received: from orchid.us.cray.com (orchid.us.cray.com [172.30.27.91])
	i2PIiqUc011821	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Mar 2004 12:44:52 -0600 (CST)
Received: from cray.com (troll [192.168.250.5])i2PIipTi4454784
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Mar 2004 12:44:52 -0600 (CST)
Message-ID: <406328A2.3060905@cray.com>
Date: Thu, 25 Mar 2004 12:44:50 -0600
From: David Updegraff <dave@cray.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: nand oob layout assumptions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

So I have a little ducttape-string-and-bailing wire driver here now that 
deals with these newer bigger Samsung K9xxx chips; am hitting snags 
around the declarations of oob areas.

The ecc calcluations within the driver are easy to deal with, straightup 
algorithm of ecc-space-needed = 3 * #-of-256byte chunks in the page.

But how to cope with that exposed oobinfo structure defn. in mtd.h that 
declares the all the universe uses 6 bytes for ecc in oob?

It seems we need the lo-level driver to declare (and allocate?) that 
oobinfo struct, and while we're at breaking everything by doing so, add 
a badblock_pos element to it, since these samsung chips mark badblocks 
not at offset:5 but offset:0 in oob.

I have no solution dreamed up yet on how to cope with the MEMSETOOBSEL
ioctl, though.  Do you?

-dbu.
