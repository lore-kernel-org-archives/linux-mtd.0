Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AUqua-0007FD-73
	for linux-mtd@lists.infradead.org; Fri, 12 Dec 2003 17:17:08 +0000
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: David Vrabel <dvrabel@arcom.com>
In-Reply-To: <3FD998F6.9000303@arcom.com>
References: <3FD998F6.9000303@arcom.com>
Content-Type: text/plain
Message-Id: <1071248708.21490.210.camel@tubarao>
Mime-Version: 1.0
Date: 12 Dec 2003 10:05:08 -0700
Content-Transfer-Encoding: 7bit
cc: Linux MTD List <linux-mtd@lists.infradead.org>
Subject: Re: cfi_cmdset_0002 -- erase suspends broken.
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-12-12 at 03:31, David Vrabel wrote:
> Hi,
> 
> The latest cfi_cmdset_0002.c (AMD chips) in CVS has broken erase-suspends.

I knew there was a possibility of this, but didn't have hardware and
software for a good test.

> 1. Erase suspend command must be written to the block to be resumed.
> 2. When erasing DQ2 must a) be read from the erase in progress block b) 
> doesn't indicate that an erase has been suspended.  DQ6 is the toggle 
> bit to check.
> 
> There's a patch attached that fixes these issues.

Wonderful.  I need to look through it a bit more.

>   It's a 
> work-in-progress as there's still an issue remaining -- JFFS2 reports 
> (for example):
> 
> "Newly-erased block contained word 0xff7fffff at offset 0x00ca4540
> Newly-erased block contained word 0xffefffff at offset 0x00c90a14
> Newly-erased block contained word 0xffffffbf at offset 0x00c82ef4
> Newly-erased block contained word 0xfffffbff at offset 0x00df0e20
> Newly-erased block contained word 0xfffffffe at offset 0x00de0010"
> 
> My 1st thought was that some toggle/status bit were still active but it 
> doesn't really make sense.

I'll be looking for another patch, then. 8^)

-- 
Thayne Harbaugh
Linux Networx
