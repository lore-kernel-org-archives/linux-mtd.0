Received: from extern.plris.com ([212.199.10.23] helo=plris.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WeKue-0005RB-KP
 for linux-mtd@lists.infradead.org; Sun, 27 Apr 2014 08:58:17 +0000
Received: from leonp.plris.com (leonp.plris.com [192.168.50.57])
 by plris.com (Postfix) with ESMTP id 63407870001
 for <linux-mtd@lists.infradead.org>; Sun, 27 Apr 2014 11:57:42 +0300 (IDT)
From: Leon Pollak <leonp@plris.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: Problem with JFFS2 garbage collector
Date: Sun, 27 Apr 2014 11:57:42 +0300
Message-ID: <2850202.tnNSLEu5dC@leonp.plris.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I plead and beg the community for ANY answer!

As there was an interest in the past (2 months), I am in doubts if it is not 
interesting a person today!

Please, even if there is no interest - let me know!
=============================================================================
Hello to all.

About a month ago I already wrote here about the problem I have (see below).
At that time 3-4 of list members reacted saying this is the bug and there were 
some suggestions for testing/work-arounding it.

I kindly ask people to return to this issue and I am ready to debug the 
possible solutions/work-arounds....
-------------------------------------------
The following scenario produces a lot of errors -5 or crashes in the following 
case:
After initial flash partition burn from within U-Boot, JFFS2 partition is 
mounted RO at fstab, flashes are write protected by HW. 

On the first boot I:
- take HW flash write protect off;
- remount as RW;
- make a small update to a small file;
- sync;
- remount as RO;
- HW write protect ON.

At this moment I receive a lot of error -5 messages and sometimes even crash 
dumps.
This problem repeats at each sequential boot 5-8 times with each time less 
number of -5 errors till it finally is gone.

I will be very thankful to you for any tip what can be done.

Many thanks ahead and best regards
-- 
Leon
