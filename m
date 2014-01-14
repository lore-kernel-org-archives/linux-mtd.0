Received: from mail-ie0-f170.google.com ([209.85.223.170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2yYu-00030C-4M
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2014 07:37:25 +0000
Received: by mail-ie0-f170.google.com with SMTP id tq11so19889ieb.15
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2014 23:36:58 -0800 (PST)
Date: Mon, 13 Jan 2014 23:36:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v4 1/5] mtd: nand: localize ECC failures per page
Message-ID: <20140114073652.GL1992@norris-Latitude-E6410>
References: <1389642280-11714-1-git-send-email-computersforpeace@gmail.com>
 <20140114023439.GA22730@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140114023439.GA22730@shlinux2.ap.freescale.net>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 14, 2014 at 10:34:40AM +0800, Huang Shijie wrote:
> On Mon, Jan 13, 2014 at 11:44:36AM -0800, Brian Norris wrote:
> > ECC failures can be tracked at the page level, not the do_read_ops level
> > (i.e., a potentially multi-page transaction).
> > 
> > This helps prepare for READ RETRY support.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---

[...]

> Please add my acks to all the patch set:
> Acked-by: Huang Shijie <b32955@freescale.com>

Thanks! Done, and pushed to l2-mtd.git.

Brian
