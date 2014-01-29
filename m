Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8Iyx-00041y-GN
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 00:26:20 +0000
Received: by mail-ob0-f169.google.com with SMTP id wo20so1259937obc.28
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2014 16:25:58 -0800 (PST)
Date: Tue, 28 Jan 2014 16:25:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: nand: add support for SanDisk SDTNRGAMA-008G
Message-ID: <20140129002554.GF8919@ld-irv-0074>
References: <1388043465-17441-1-git-send-email-b32955@freescale.com>
 <1388727423-8997-1-git-send-email-b32955@freescale.com>
 <20140120193613.GP8919@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140120193613.GP8919@ld-irv-0074>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 20, 2014 at 11:36:13AM -0800, Brian Norris wrote:
> On Fri, Jan 03, 2014 at 01:37:03PM +0800, Huang Shijie wrote:
> > The datasheet does not tell us how to parse out the ID data,
> > so handle it as a full ID nand.
> > 
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> 
> Looks OK, but I haven't pushed your 16KB page support (killing
> NAND_MAX_PAGESIZE) yet, so this will have to wait until that has
> settled. I'll probably either bump NAND_MAX_PAGESIZE to 16K temporarily,
> or I'll squeeze your patch into the 3.14 pull request.

I queued your NAND_MAX_PAGESIZE patch series for 3.15, so I've pushed
this patch to l2-mtd.git/next. Thanks!

Brian
