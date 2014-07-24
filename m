Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XA7pA-0007rO-Ib
 for linux-mtd@lists.infradead.org; Thu, 24 Jul 2014 01:28:01 +0000
Received: by mail-pa0-f54.google.com with SMTP id fa1so2842129pad.27
 for <linux-mtd@lists.infradead.org>; Wed, 23 Jul 2014 18:27:39 -0700 (PDT)
Date: Wed, 23 Jul 2014 18:27:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: bpqw <bpqw@micron.com>
Subject: Re: Subject: [PATCH 1/1] mtd:nand:fix nand_lock/unlock() function
Message-ID: <20140724012730.GA3711@ld-irv-0074>
References: <CB9F11E856CFD04BB18EC1C68F2598931B1112@NTXXIAMBX01.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CB9F11E856CFD04BB18EC1C68F2598931B1112@NTXXIAMBX01.xacn.micron.com>
Cc: "ron@debian.org" <ron@debian.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi White,

On Thu, Jul 24, 2014 at 01:00:01AM +0000, bpqw wrote:
> Do nand reset before write protect check
> If we want to check the WP# low or high through STATUS READ and check bit 7,
> we must reset the device, other operation (eg.erase/program a locked block) can
> also clear the bit 7 of status register.
> 
> Signed-off-by: White Ding <bpqw@micron.com>
> ---
>  drivers/mtd/nand/nand_base.c |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 41167e9..22dd3aa 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -965,6 +965,15 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
[...]
> @@ -1015,6 +1024,15 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
[...]

I don't see any in-tree users of nand_{un,}lock(). I recently caught a
bug in nand_lock() via inspection (still need to send a fix), but I was
considering dropping the functions entirely.

I presume you have some out-of-tree driver that uses these functions,
then?

Brian
