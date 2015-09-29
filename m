Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh1Tl-0008CE-TR
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 20:26:26 +0000
Received: by pacex6 with SMTP id ex6so15744924pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 13:26:04 -0700 (PDT)
Date: Tue, 29 Sep 2015 13:26:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Furquan Shaikh <furquan@google.com>,
 Stephen Barber <smbarber@chromium.org>, Marek Vasut <marex@denx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH] mtd: spi-nor: scale up timeout for full-chip erase
Message-ID: <20150929202601.GK31505@google.com>
References: <1442613557-36838-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442613557-36838-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2015 at 02:59:17PM -0700, Brian Norris wrote:
> From: Furquan Shaikh <furquan@google.com>
> 
> This patch fixes timeout issues seen on large NOR flash (e.g., 16MB
> w25q128fw) when using ioctl(MEMERASE) with offset=0 and length=16M. The
> input parameters matter because spi_nor_erase() uses a different code
> path for full-chip erase, where we use the SPINOR_OP_CHIP_ERASE (0xc7)
> opcode.
> 
> Fix: use a different timeout for full-chip erase than for other
> commands.
> 
> While most operations can be expected to perform relatively similarly
> across a variety of NOR flash types and sizes (and therefore might as
> well use a similar timeout to keep things simple), full-chip erase is
> unique, because the time it typically takes to complete:
> (1) is much larger than most operations and
> (2) scales with the size of the flash.
> 
> Let's base our timeout on the original comments stuck here -- that a 2MB
> flash requires max 40s to erase.
> 
> Small survey of a few flash datasheets I have lying around:
> 
>   Chip         Size (MB)   Max chip erase (seconds)
>   ----         --------    ------------------------
>   w25q32fw     4           50
>   w25q64cv     8           30
>   w25q64fw     8           100
>   w25q128fw    16          200
>   s25fl128s    16          ~256
>   s25fl256s    32          ~512
> 
> From this data, it seems plenty sufficient to say we need to wait for
> 40 seconds for each 2MB of flash.
> 
> After this change, it might make some sense to decrease the timeout for
> everything else, as even the most extreme operations (single block
> erase?) shouldn't take more than a handful of seconds. But for safety,
> let's leave it as-is. It's only an error case, after all, so we don't
> exactly need to optimize it.
> 
> Signed-off-by: Furquan Shaikh <furquan@google.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git
