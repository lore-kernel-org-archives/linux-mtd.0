Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1WXp-0004CO-0g
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 08:34:49 +0000
Message-ID: <5492918F.2060704@codeaurora.org>
Date: Thu, 18 Dec 2014 10:34:23 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dolev Raviv <draviv@codeaurora.org>
Subject: Synchronization in UBIFS (zero length files)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem/Richard

I've been looking into the "zero length files" issue in UBIFS and came 
across "Synchronization exceptions for buggy applications" @ 
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_sync_semantics. This 
section concludes with:

"We have plans to implement these features in UBIFS, but this has not 
been done yet. The problem is that UBI/MTD are fully synchronous and we 
cannot initiate asynchronous write-out, so we'd have to synchronously 
write files on close/rename, which is slow. So implementing these 
features would require implementing asynchronous I/O in UBI, which is a 
big job. But feel free to do this :-)."

So two questions:
1. was anything done in ubifs to handle file truncation and rename 
similar to ext4? Didn't find anything but afraid I might be missing 
something
2. Not sure I understand why "implementing these features would require 
implementing asynchronous I/O in UBI". Could you please elaborate on this?

Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
