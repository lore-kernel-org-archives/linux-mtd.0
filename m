Received: from elasmtp-scoter.atl.sa.earthlink.net ([209.86.89.67])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KVYjK-0005Ci-UN
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 21:27:07 +0000
Received: from [24.41.66.60] (helo=[10.0.1.3])
	by elasmtp-scoter.atl.sa.earthlink.net with esmtpa (Exim 4.67)
	(envelope-from <brucle@earthlink.net>) id 1KVYjI-0004GZ-7s
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 17:27:05 -0400
Message-ID: <48AB3AA7.60801@earthlink.net>
Date: Tue, 19 Aug 2008 14:27:03 -0700
From: Bruce Leonard <brucle@earthlink.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] Add support for > 2GiB MTD devices
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

All,

Over the course of the last several months, I've been working on adding support to the kernel for MTD devices that exceed 2GiB in 
size.  In my particular case I have a need for 8GiB of NAND flash that appears as a single device.  I'm now ready to submit my 
(first ever) patch (please be kind :)  ).  Seriously, I've been on this list a LOT during this time and I've gotten nothing but 
great support, thank you to the entire list.

A couple of comments.  First and foremost, these patches don't completely change the MTD layer.  Due to my in-experience outside of 
what I was focused on (NAND/UBI/UBIFS/MTDCHAR) I felt it was best if I restricted my changes to what I knew.  If the community feels 
I need to take these changes into the rest of the kernel please advise.  Secondly, there were changes that I needed to make in 
mtd-utils, but I again only focused on the UBI sub-set.  mtd-utils no longer builds because of the changes, but I really do NOT feel 
qualified to make changes to the rest of mtd-utils as they're tools I don't use and don't understand.  The changes in mtd-utils are 
the same changes as in .../include/linux/mtd/mtd.h and .../include/mtd/mtd-abi.h.  If anyone has a suggestion as to how I should 
handle mtd-utils I would appreciate it.

Thanks again to everyone on the list who's answered my endless stupid questions.

Bruce
