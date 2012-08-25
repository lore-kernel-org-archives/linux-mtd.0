Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5452-0002kk-Ai
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 00:18:24 +0000
Received: by lagu2 with SMTP id u2so1407338lag.36
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 17:18:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120820162915.7f93e6c4@pixies.home.jungo.com>
References: <20120820162915.7f93e6c4@pixies.home.jungo.com>
Date: Fri, 24 Aug 2012 17:18:22 -0700
Message-ID: <CAN8TOE8ato4XkhHerKBHL_FHr+36yH5F0sVqReZQtDDZTY6jig@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Rename create_bbt()'s 'len' variable to
 'numpages'
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 20, 2012 at 6:29 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> Rename 'len' variable of create_bbt/scan_block_fast/scan_block_full to
> 'numpages', since it really means number of pages to scan when
> searching for the BBM (and not the byte length of the scan).
>
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Thanks, this kind of fix is actually very helpful! It's kinda annoying
that I always have to translate in my head the fact that 'len' means
'number of pages.' And now that you mention it, I should have just
changed this myself a long time ago :)

BTW, some (all?) of this might die if I (or Matthieu) ever end up
polishing Matthieu's patches to utilize nand_chip->block_bad instead
of much of this code. But that's no issue.

I'm not sure what goes here. Acked-by? Reviewed-by? Gladly-welcomed-by?

Reviewed-by: Brian Norris <computersforpeace@gmail.com>
