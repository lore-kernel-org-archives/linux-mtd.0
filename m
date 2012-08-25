Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5BkU-0003QZ-4E
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 08:29:42 +0000
Received: by weyr3 with SMTP id r3so1517347wey.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 01:29:38 -0700 (PDT)
Date: Sat, 25 Aug 2012 11:32:29 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: Rename create_bbt()'s 'len' variable to
 'numpages'
Message-ID: <20120825113229.0c28f460@halley>
In-Reply-To: <CAN8TOE8ato4XkhHerKBHL_FHr+36yH5F0sVqReZQtDDZTY6jig@mail.gmail.com>
References: <20120820162915.7f93e6c4@pixies.home.jungo.com>
 <CAN8TOE8ato4XkhHerKBHL_FHr+36yH5F0sVqReZQtDDZTY6jig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 24 Aug 2012 17:18:22 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> On Mon, Aug 20, 2012 at 6:29 AM, Shmulik Ladkani
> Thanks, this kind of fix is actually very helpful! It's kinda annoying
> that I always have to translate in my head the fact that 'len' means
> 'number of pages.'

Exactly.

It was triggered from reviewing some of the latest bbt patches; I was
summarizing on a _paper_: "len is numpages, scanlen is ... readlen is ..."
and I thought to myself, isn't this crazy?

So yes, naming is important ;-)

(BTW scanlen and readlen are annoying, too... but they don't have a
concise meaning)

Regards,
Shmulik
