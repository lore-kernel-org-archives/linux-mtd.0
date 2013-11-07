Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeKSl-0008CQ-Mq
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 07:57:12 +0000
Received: by mail-pa0-f45.google.com with SMTP id kp14so231834pab.18
 for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2013 23:56:49 -0800 (PST)
Date: Wed, 6 Nov 2013 23:56:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [MTD] 3.13 pull request?
Message-ID: <20131107075645.GD3805@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

It's that season again; are you prepping a pull request for 3.13? I
guess technically, the merge window doesn't start for a few days
(according to Linus), but he's been merging stuff for 3.13 already...

Anyway, let me know what you're thinking, or else I'll scrape together
something myself.

Some things of note:

There is at least one gpmi regression reported against 3.12, with no
proper fix posted yet. Huang has at least one other -stable bugfix patch
out there that hasn't gotten reviewed yet. If it's a good fix, hopefully
it can get into 3.13 (a later -rc, I guess?).

A large portion of Pekon's OMAP updates has been queued up; they've
gotten a pretty hard beating over reviews, and they've gotten a little
external testing (at least Ezequiel; not sure of others), but they've
only sat in linux-next for about a week now.

Everything else should be pretty benign, I think.

Brian
