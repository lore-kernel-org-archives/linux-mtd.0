Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHXY8-0004LP-DH
 for linux-mtd@lists.infradead.org; Sat, 31 Jan 2015 12:53:21 +0000
Message-ID: <1422708775.8637.333.camel@sauron.fi.intel.com>
Subject: Re: Synchronization in UBIFS (zero length files)
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Sat, 31 Jan 2015 14:52:55 +0200
In-Reply-To: <5492918F.2060704@codeaurora.org>
References: <5492918F.2060704@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Dolev Raviv <draviv@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tanya,

On Thu, 2014-12-18 at 10:34 +0200, Tanya Brokhman wrote:
> So two questions:
> 1. was anything done in ubifs to handle file truncation and rename 
> similar to ext4? Didn't find anything but afraid I might be missing 
> something

Nope.

> 2. Not sure I understand why "implementing these features would require 
> implementing asynchronous I/O in UBI". Could you please elaborate on this?

Well, the idea was to implement something like BIO for UBIFS. You submit
your read or write requests, and go on doing your things. When your
requests are done, you have your call-back function invoked. You may
also go ahead and way for the completion of your request.

But we have the work queue API in Linux. Just create UBIFS work queue
(this will essentially create a separate thread for you, AFAIK), submit
write works there, let them write the closed-but-not-fsynced files
there.

On unmount, flush, cancel all jobs and destroy the queue.

Just off-the top of my head.
