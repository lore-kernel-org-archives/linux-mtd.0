Received: from [202.56.196.162] (helo=brahma.intotoind.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6QmI-0000pF-Cl
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2004 09:03:55 +0000
Received: from rajeshbv.intotoinc.com (3mc76.intotoind.com [172.16.3.76])
	by brahma.intotoind.com (8.12.6/8.11.6) with ESMTP id i2P95YTX019133
	for <linux-mtd@lists.infradead.org>; Thu, 25 Mar 2004 14:35:34 +0530
Message-Id: <5.1.0.14.0.20040325143833.01b20e50@172.16.1.10>
Date: Thu, 25 Mar 2004 14:45:27 +0530
To: linux-mtd@lists.infradead.org
From: "Rajesh B. V." <rajeshbv@intotoinc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: Running out of space on MTD partition with JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I mounted JFFS2 file system through device 'mtdblock4' on my ARM target.
I need to update some files ( kind of configuration files ) periodically in 
the JFFS2 partition.
For this i create the files in RAM and just copy the files from RAM to 
JFFS2, overwriting the previous files.

But the problem i am facing is, after doing for couple of times it is 
giving error saying
"No space left on device "
I could not understand why the space is consumed on the JFFS2 partition as 
the files i am updating are not bigger in size compared to older ones.

When i run " df -h" after every copy, i observed that always the free 
memory is becoming less on JFFS2 partition, even though the files i replace 
are of same size.

I will be thankful if anybody give a hint on why it is happening, even 
though there are no new files added.

Regards,
--Rajesh
