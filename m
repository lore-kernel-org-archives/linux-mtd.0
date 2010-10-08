Received: from [67.215.48.194] (helo=koko.iders.ca)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P4HIp-00077l-15
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2010 18:04:19 +0000
Received: from [172.16.22.4] (zen.iders.ca [172.16.22.4])
	by koko.iders.ca (Postfix) with ESMTP id 1C681C45002E
	for <linux-mtd@lists.infradead.org>;
	Fri,  8 Oct 2010 13:26:07 -0500 (CDT)
Message-ID: <4CAF5D21.2050103@iders.ca>
Date: Fri, 08 Oct 2010 13:04:17 -0500
From: Andrew McKay <amckay@iders.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 Summary warnings on large block NAND device
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've been using JFFS2 for a little while now, and I'm just going through 
the warning and error messages that JFFS2 sometimes reports to see if we 
have any issues with our system.  We've moved to a new NAND part from 
Micron that has 4K pages and 512K erase blocks and I'm getting some new 
warnings from JFFS2 that I've never seen before and am wondering if I 
have an issue.

Here's the three messages I'm worried about:
JFFS2 warning: (1) jffs2_sum_scan_sumnode: Summary node crc error, 
skipping summary information.
JFFS2 warning: (633) jffs2_sum_write_data: Summary too big (-32 data, 
-2794 pad) in eraseblock at 27b80000
JFFS2 warning: (739) jffs2_sum_write_data: Not enough space for summary, 
padsize = -1324

Presumably, these messages are all related and are because summary 
information is limited to 64K so that kmalloc can be used for 
allocation.  With the larger sized erase block I assume that the summary 
information is often exceeding 64K.  Should I be worried about these 
messages?  As far as I understand summary information is only used so 
that JFFS2 can mount quickly.  Without it mount times will be a bit 
longer as it has to scan each page in the device instead of the summary 
page at the end of the erase block.

Is there a fix for this issue? Admittedly my kernel is a little old. 
2.6.30.9, so I may not have the most up to date JFFS2 code.  Though I 
did some searching online and I haven't found mention of solution to 
this problem, or if it is something that I should be concerned about.

Thanks for your time

-- 
Andrew McKay
IDERS Inc.
