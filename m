Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAMKC-0005sO-Fd
 for linux-mtd@lists.infradead.org; Thu, 24 Jul 2014 16:57:01 +0000
Received: by mail-pd0-f182.google.com with SMTP id fp1so3879603pdb.41
 for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2014 09:56:36 -0700 (PDT)
Date: Thu, 24 Jul 2014 09:56:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: Subject: [PATCH 1/1] mtd:nand:fix nand_lock/unlock() function
Message-ID: <20140724165633.GF3711@ld-irv-0074>
References: <CB9F11E856CFD04BB18EC1C68F2598931B1112@NTXXIAMBX01.xacn.micron.com>
 <20140724012730.GA3711@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EB068AB@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EB068AB@DBDE04.ent.ti.com>
Cc: bpqw <bpqw@micron.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ron@debian.org" <ron@debian.org>,
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

On Thu, Jul 24, 2014 at 07:54:41AM +0000, Pekon Gupta wrote:
> >On Thu, Jul 24, 2014 at 01:00:01AM +0000, bpqw wrote:
> >I don't see any in-tree users of nand_{un,}lock(). I recently caught a
> >bug in nand_lock() via inspection (still need to send a fix), but I was
> >considering dropping the functions entirely.
> >
> >I presume you have some out-of-tree driver that uses these functions,
> >then?
> >
> Please don't drop nand_{unlock, lock} interfaces at-least for sometime.
> I remember there were some users trying to use these for secure
> applications. But due to lack of proper userland utility support they
> probably dropped the idea.

OK, I won't drop them yet.

> Good to have this added as part of mtd-utils package, and then let it live
> for some more time.

As you note, there's no user-space support. There's actually no one
using them even in the kernel, which is why I considered dropping them.
If you want to use them, find a proper way to use them then! (I'm not
sure: do they match with mtd_lock() / ioctl(MEMLOCK) interface?)

Brian
