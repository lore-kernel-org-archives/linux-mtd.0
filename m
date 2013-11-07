Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeNOq-0004Ko-LP
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 11:05:21 +0000
Message-ID: <1383822296.2722.186.camel@sauron.fi.intel.com>
Subject: Re: Bad blocks while attaching UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fernando Silveira <fsilveira@gmail.com>
Date: Thu, 07 Nov 2013 13:04:56 +0200
In-Reply-To: <CAGZNvdqt=1K4cd4xLu+2k9KpUa5U_Hu0w1xi_aCwOn7pXiRVBg@mail.gmail.com>
References: <CAGZNvdqt=1K4cd4xLu+2k9KpUa5U_Hu0w1xi_aCwOn7pXiRVBg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-11-06 at 13:35 -0200, Fernando Silveira wrote:
> Hi,
> 
> I'm using an yet unreleased NAND flash controller with my own MTD
> driver and everything is working perfectly except for one thing: after
> a few weeks UBIFS begins to throw some error messages while attaching
> and a few days later it just doesn't attach anymore. I know bad blocks
> are supposed to appear after rewriting lots of data but it seems to me
> that UBIFS is not marking the "attach" blocks as bad nor wear leveling
> the "attach/info" sector. The error message follows below:
> 
> UBI: attaching mtd3 to ubi0
> UBI: physical eraseblock size:   2097152 bytes (2048 KiB)
> UBI: logical eraseblock size:    2080768 bytes
> UBI: smallest flash I/O unit:    8192
> UBI: VID header offset:          8192 (aligned 8192)
> UBI: data offset:                16384
> [my mtd driver printing error messages while trying to read a block]
> UBI error: ubi_io_read: error -5 while reading 64 bytes from PEB
> 3394:0, read 0 bytes
> 
> Note that once a UBIFS file system starts to fail, that PEB indicated
> in the "ubi_io_read" error seems to never change. I'll take a closer
> look at this detail if I see more errors.
> 
> My questions are:
> 
>   1. Does UBIFS mark a bad block when it is failing to attach?

UBI marks eraseblocks as bad when it cannot write or erase. And blocks
are not marked a s bad right away. Instead, they are first "tortured",
and if the torture test fails, then the eraseblock is marked as bad.

>   2. If yes, what might be wrong with my driver?

Does it handle short reads properly? Please, run mtd tests to validate
your driver.

-- 
Best Regards,
Artem Bityutskiy
