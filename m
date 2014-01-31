Received: from mail-pd0-f173.google.com ([209.85.192.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W9ISs-0000Rc-Oo
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2014 18:05:19 +0000
Received: by mail-pd0-f173.google.com with SMTP id y10so4556389pdj.4
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2014 10:04:53 -0800 (PST)
Date: Fri, 31 Jan 2014 10:04:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 1/2] mtd: nand: force NAND_CMD_READID onto 8-bit bus
Message-ID: <20140131180446.GA10094@norris-Latitude-E6410>
References: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA6C83A@DBDE04.ent.ti.com>
 <20140130195107.GB10673@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA6C85E@DBDE04.ent.ti.com>
 <20140130204756.GI8919@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EA6C9BF@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA6C9BF@DBDE04.ent.ti.com>
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Huang

On Fri, Jan 31, 2014 at 06:55:49AM +0000, Pekon Gupta wrote:
> Though its redundant, as Ezequiel has already tested these
> patches on AM335x using both x8 and x16 Micron devices.
> But still I re-tested them on different OMAP boards.

Still worthwhile.

> Tested-By: Pekon Gupta <pekon@ti.com>

Thanks! Pushed both to l2-mtd.git/next.

BTW, I think Huang's JEDEC parameter page support should be modified
similar to patch 1. I'll comment there.

Brian
