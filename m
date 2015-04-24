Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YldLf-0003Im-DI
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2015 13:08:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by bes.se.axis.com (Postfix) with ESMTP id 113572E439
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 15:08:21 +0200 (CEST)
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
 by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id iFTzMAT9I-t0 for <linux-mtd@lists.infradead.org>;
 Fri, 24 Apr 2015 15:08:20 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
 by bes.se.axis.com (Postfix) with ESMTP id 5C4122E099
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 15:08:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
 by postfix.imss71 (Postfix) with ESMTP id 642A7136A
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 15:08:11 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
 by boulder.se.axis.com (Postfix) with ESMTP id 5895612FC
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 15:08:11 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
 by thoth.se.axis.com (Postfix) with ESMTP id 56B0034005
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 15:08:11 +0200 (CEST)
Date: Fri, 24 Apr 2015 15:08:10 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: process prioritization and mtd access
Message-ID: <alpine.DEB.2.02.1504241439540.31409@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: Umut Tezduyar <umuttl@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I have a question related to process prioritization and mtd access. 
Prioritization and scheduling are not areas which I'm too familiar with 
so I'm not too sure exactly how to phrase this.  

Say we have two processes running at different priorities, with their 
respective binaries in a filesystem residing on an mtd device.

Now, assuming that the processes binaries have been loaded into memory, we 
see that process prioritization works as expected. However, while the 
system is paging data in from the respective binaries in the flash, both 
processes seem to get the same priority. This means that the low priority 
process tends to block the high priority process, which is not what we 
want.

There is an I/O prioritization mechanism for block devices, but mtd 
devices are not block devices so it can't be used. I don't know if it 
would apply in this case anyway.

Is there some form of mechanism to handle this on a file system level?

I can't recall seeing anything about this down at the mtd layer, at least 
not in the NAND parts which I'm the most familiar with.

Anyone have any pointers?

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
