Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEV0n-00028B-DM
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 03:02:07 +0000
Received: by mail-pa0-f52.google.com with SMTP id bj1so479936pad.25
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 20:01:43 -0700 (PDT)
Date: Mon, 4 Aug 2014 20:01:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: bpqw <bpqw@micron.com>
Subject: Re: Subject: [PATCH 1/1] mtd:nand:fix nand_lock/unlock() function
Message-ID: <20140805030140.GJ3711@ld-irv-0074>
References: <CB9F11E856CFD04BB18EC1C68F2598931B1112@NTXXIAMBX01.xacn.micron.com>
 <20140728061006.GC3095@norris-Latitude-E6410>
 <CB9F11E856CFD04BB18EC1C68F2598931B1342@NTXXIAMBX01.xacn.micron.com>
 <20140804224757.GH3711@ld-irv-0074>
 <CB9F11E856CFD04BB18EC1C68F2598931B1724@NTXXIAMBX01.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CB9F11E856CFD04BB18EC1C68F2598931B1724@NTXXIAMBX01.xacn.micron.com>
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

On Tue, Aug 05, 2014 at 01:54:07AM +0000, bpqw wrote:
> From 0304e9618d8c3ef5360b611f881f1b1bed08be06 Mon Sep 17 00:00:00 2001
> From: White Ding <bpqw@micron.com>
> Date: Thu, 24 Jul 2014 00:10:45 +0800
> Subject: [PATCH 1/1] mtd:nand:fix nand_lock/unlock() function
> 
> Do nand reset before write protect check.
> 
> If we want to check the WP# low or high through STATUS READ and check bit 7,
> we must reset the device, other operation (eg.erase/program a locked block) can
> also clear the bit 7 of status register.
> 
> As we know the status register can be refreshed, if we do some operation to trigger it,
> for example if we do erase/program operation to one block that is locked, then READ STATUS,
> the bit 7 of READ STATUS will be 0 indicate the device in write protect, then if we do
> erase/program operation to another block that is unlocked, the bit 7 of READ STATUS will
> be 1 indicate the device is not write protect.
> Suppose we checked the bit 7 of READ STATUS is 0 then judge the WP# is low (write protect),
> but in this case the WP# maybe high if we do erase/program operation to a locked block, 
> so we must reset the device if we want to check the WP# low or high through STATUS READ and 
> check bit 7.
> 
> Signed-off-by: White Ding <bpqw@micron.com>

Thanks. Queued to l2-mtd.git/next.

Brian
