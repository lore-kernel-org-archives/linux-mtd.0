Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfdLY-0001s9-6X
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 22:51:24 +0000
Received: by mail-pa0-f50.google.com with SMTP id rd3so2743834pab.23
 for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2014 15:51:02 -0700 (PDT)
Date: Wed, 30 Apr 2014 15:23:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] mtd: denali: disable usage of subpages
Message-ID: <20140430222353.GE2497@norris-Latitude-E6410>
References: <1398862001-29785-1-git-send-email-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398862001-29785-1-git-send-email-bigeasy@linutronix.de>
Cc: Huang Shijie <shijie8@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 30, 2014 at 02:46:41PM +0200, Sebastian Andrzej Siewior wrote:
> I use this driver on an Altera SoC (not MRST) and its ECC algorithm
> does not compute 0xff ECC of an empty page. That problem can be easily
> noticed if ubifs is used. Therefore I disable subpages support.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> I can't test if this is also the case for MRST or not.

This is an important change to get right; if any systems have been using
Denali NAND with subpage writes, then this change will break any flash
with existing UBI data. Can we either confirm that no Denali systems
were using subpage writes successfully, or else tie this option to some
kind of platform data or DT information (e.g., compatible string)?

Or is this related to commit 837a6ba4f3b6d23026674e6af6b6849a4634fff9,
which changed subpage write support? (Or conversely, could this help you
support subpage writes properly?)

Brian
