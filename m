Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QDcRU-0006pJ-Uo
	for linux-mtd@lists.infradead.org; Sat, 23 Apr 2011 13:00:09 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QDcRR-0005tl-Cx
	for linux-mtd@lists.infradead.org; Sat, 23 Apr 2011 15:00:05 +0200
Received: from 14.139.128.15 ([14.139.128.15])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sat, 23 Apr 2011 15:00:05 +0200
Received: from kartik.n.nagar by 14.139.128.15 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sat, 23 Apr 2011 15:00:05 +0200
To: linux-mtd@lists.infradead.org
From: Kartik Nagar <kartik.n.nagar@gmail.com>
Subject: Actual number of writes to a MTD device
Date: Sat, 23 Apr 2011 12:55:47 +0000 (UTC)
Message-ID: <loom.20110423T144945-306@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using UBIFS on top of UBI on top of a MTD partition and then running some
workloads on the UBIFS filesystem. I actually want to determine the write
amplification factor for the workload, for which i need the actual number of
writes going to the MTD device. Do UBIFS/MTD systems record such statistics, or
will I have to make changes to the source code to obtain the statistics?
