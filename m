Received: from mail-pa0-f43.google.com ([209.85.220.43])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBd2V-0000of-4R
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 03:55:27 +0000
Received: by mail-pa0-f43.google.com with SMTP id hz10so199330pad.30
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 20:55:02 -0700 (PDT)
Date: Mon, 19 Aug 2013 20:54:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: Does this patch set affect your driver(drivers/mtd/nand/alauda.c)?
Message-ID: <20130820035458.GC28421@norris.computersforpeace.net>
References: <5210F132.8030306@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5210F132.8030306@gmail.com>
Cc: joern@logfs.org, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 18, 2013 at 12:07:14PM -0400, Huang Shijie wrote:
> Hi Joern:
> 
> I have submitted a patch set to expose the ecc step size to the user space.
> 
> see:
> http://lists.infradead.org/pipermail/linux-mtd/2013-August/048114.html
> 
> Since your driver does not set the ecc.size, nor calls the
> nand_scan/nand_scan_ident/nand_scan_tail.

The real problem was that by default, we would expose ecc_step_size = 0
for alauda.

> I am not sure if this patch set affect your driver or not.
> Please let me know if it does affect your driver.

I see Joern submitted a patch for this driver's removal, so this
point is now moot.

Thanks,
Brian
