Received: from plane.gmane.org ([80.91.229.3])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWOp8-0006cT-ST
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 09:54:59 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1TWOpD-0000bO-Lf
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 10:55:04 +0100
Received: from 194-208-216-12.ikanos.com ([194-208-216-12.ikanos.com])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2012 10:55:03 +0100
Received: from tttechmail by 194-208-216-12.ikanos.com with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2012 10:55:03 +0100
To: linux-mtd@lists.infradead.org
From: Joe <tttechmail@gmail.com>
Subject: Frequent Writes to NAND flash with UBIFS in sychronous mode 
Date: Thu, 8 Nov 2012 09:51:48 +0000 (UTC)
Message-ID: <loom.20121108T103932-198@post.gmane.org>
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
 I have the following observation when UBIFS is mounted as synchronous fs. (-o
sync option from bootargs). 

 1. For every file read, there are writes  to nand flash. 
 2. For the execution of every command, there are writes to nand flash. 
 For ex. On execution of any command, say 'cd' or 'ls' i observe quiet a few
writes happening to NAND flash. 

What could be the reason for this behaviour? Any other option to bring down the
amount of writes but by retaining the synchronous behaviour? 

With sync option enabled, we expect Flash writes to happen more frequently ,
how-ever we do not want  writes to happen with the execution of every command. 

This observation holds true for linux 2.6.28, 2.6.35 & 3.4.10 linux kernel
versions. 

Since, there is a limit on number of writes per block of nand flash, we are
concerned if the above behaviour will trigger a faster nand corruption on the
long run. 

Regards,
Joe. 

 
