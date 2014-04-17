Received: from mail-ee0-x229.google.com ([2a00:1450:4013:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Warhj-0004tp-D9
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 19:10:36 +0000
Received: by mail-ee0-f41.google.com with SMTP id t10so990041eei.28
 for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2014 12:10:12 -0700 (PDT)
Received: from leonp.plris.com ([5.29.131.36])
 by mx.google.com with ESMTPSA id bc51sm69813104eeb.22.2014.04.17.12.10.10
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Apr 2014 12:10:11 -0700 (PDT)
Sender: Leon Pollak <leon.pollak@gmail.com>
From: Leon Pollak <leonp@plris.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: Problem with JFFS2 garbage collector
Date: Thu, 17 Apr 2014 22:10:02 +0300
Message-ID: <1752110.UB8PI1dY1s@leonp.plris.com>
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
