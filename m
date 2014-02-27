Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIpXZ-00060Q-D9
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2014 01:13:33 +0000
Received: by mail-ie0-f171.google.com with SMTP id to1so1478866ieb.30
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2014 17:13:12 -0800 (PST)
Date: Wed, 26 Feb 2014 17:13:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Leon Pollak <leonp@plris.com>
Subject: Re: What is wrong?
Message-ID: <20140227011308.GJ4194@ld-irv-0074>
References: <4315632.KkRm7kzq26@leonp.plris.com>
 <20140227011148.GI4194@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140227011148.GI4194@ld-irv-0074>
Cc: Richard Weinberger <richard@nod.at>,
 Andrew Ruder <andrew.ruder@elecsyscorp.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Richard, Andrew

(Meant to CC earlier)

On Wed, Feb 26, 2014 at 05:11:48PM -0800, Brian Norris wrote:
> On Wed, Feb 26, 2014 at 04:07:21PM +0200, Leon Pollak wrote:
> > I use JFFS2 version 2.2.(NAND)(SUMMARY)(C) 2001-2006 Red Hat, Inc. 
> > (comes with MontaVistaPro 5.0). Kernel 2.6.18.
> > I prepare JFFS2 partition with mkfs.jffs2 and sumtool and burn it with 
> > flash_eraseall and 'nandwrite -p'.
> > Everything works fine.
> > 
> > The NAND is write protected by HW and the partition is mounted as RO. 
> > At some moment I need to update a small file. 
> > So I do: 
> > - HW write protect off, 
> > - remount RW, 
> > - update file, 
> > - sync, 
> > - remount RO, 
> > - write protect on.
> > 
> > Looking at linux console I see a lot of messages like:
> > Erase at 0x00400000 failed immediately: errno -5
> > Erase at 0x003e0000 failed immediately: errno -5
> > ......
> > Erase at 0x00340000 failed immediately: errno -5
> > jffs2_flush_wbuf(): Write failed with -5
> > Write of 2016 bytes at 0x002578a0 failed. returned -5, retlen 0
> > Not marking the space at 0x002578a0 as dirty because the flash driver 
> > returned retlen zero.
> > 
> > 
> > This is repeated for a long time, but everything seems work OK.
> > The sequential starts and even file updates are also OK, without error 
> > messages.
> > 
> > What do I do wrong? Thanks a lot.
> 
> It's possible you're seeing symptoms of this:
> 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=807612db2f9940b9fa6deaef054eb16d51bd3e00
> 
> It seems like maybe JFFS2 is still doing some GC and/or write flushing
> after the remount.
> 
> Could try this?
> 
>  - HW write protect off, 
>  - remount RW, 
>  - update file, 
>  - sync, 
>  - remount RO, 
>  - sync, <---------- add this, to see if you're experiencing any
>                      writeback after remount
>  - write protect on.
