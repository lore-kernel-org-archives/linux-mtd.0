Received: from imo-m21.mx.aol.com ([64.12.137.2])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IW9Hm-0004Uq-AD
	for linux-mtd@lists.infradead.org; Fri, 14 Sep 2007 12:24:37 +0100
Received: from payagond@aol.com
	by imo-m21.mx.aol.com (mail_out_v38_r9.2.) id 3.ca3.18d4e84c (34917)
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Sep 2007 07:24:21 -0400 (EDT)
To: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 7bit
Subject: Increasing read request size in JFFS2
Date: Fri, 14 Sep 2007 07:24:21 -0400
MIME-Version: 1.0
From: payagond@aol.com
Content-Type: text/plain; charset="us-ascii"; format=flowed
Message-Id: <8C9C4D8EE8B6B02-F08-232@webmail-mf13.sysops.aol.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I want to know, whether, we can exploit the fast sequential read 
(multiple pages at one go) feature of a nand flash device by existing 
JFFS2 code.
read_pages in readahead decides to call either 
mapping->a_ops->readpages or mapping->a_ops->readpage
can I implement jffs2_readpages to do so?
The problem I feel is (if I have understood correctly)
To read more pages at one shot, we need to anyway read the 
jffs2_raw_inode header first and then calculate the lenth to read, will 
it give me more performance than what is existing?
regards
payagond


________________________________________________________________________
Email and AIM finally together. You've gotta check out free AOL Mail! - 
http://mail.aol.com
