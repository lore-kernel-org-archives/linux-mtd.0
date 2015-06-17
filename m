Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z52WU-0004ey-95
 for linux-mtd@lists.infradead.org; Wed, 17 Jun 2015 01:52:14 +0000
Received: by pacgb13 with SMTP id gb13so23712892pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2015 18:51:52 -0700 (PDT)
Date: Tue, 16 Jun 2015 18:51:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/4] mtd: diskonchip: remove two-phase partitioning /
 registration
Message-ID: <20150617015147.GC4917@ld-irv-0074>
References: <1433200640-17858-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433200640-17858-1-git-send-email-computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 01, 2015 at 04:17:17PM -0700, Brian Norris wrote:
> It is a Bad Idea (TM) to call mtd_device_register() or
> mtd_device_parse_register() twice on the same master MTD. Among other
> things, it makes partition overrides (e.g., cmdlinepart) much more
> difficult.
> 
> Since commit 727dc612c46b ("mtd: part: Create the master device node
> when partitioned"), we now have a config option that accomplishes the
> same purpose as the double-registration done in diskonchip.c -- it
> forces the master MTD to *always* be registered, while partitions may
> optionally show up in addition. Eventually, we might like to make
> CONFIG_MTD_PARTITIONED_MASTER into the default, but this could be
> disruptive to user-space expectations of MTD numbering, so we'll take
> that slowly.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Alexander Shiyan <shc_work@mail.ru>

Pushed patch 1 and 2, minus the FIXME's.
