Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a583H-0000ID-SD
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 08:18:45 +0000
Date: Sat, 5 Dec 2015 09:18:20 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH v2 5/6] mtd: partitions: pass around 'mtd_partitions'
 wrapper struct
Message-ID: <20151205091820.198a004c@bbrezillon>
In-Reply-To: <20151205041835.GL120110@google.com>
References: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
 <1449271518-118900-6-git-send-email-computersforpeace@gmail.com>
 <20151205013049.0c66d38b@bbrezillon>
 <20151205014511.GK120110@google.com>
 <20151205041835.GL120110@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 4 Dec 2015 20:18:35 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi Boris,
> 
> On Fri, Dec 04, 2015 at 05:45:11PM -0800, Brian Norris wrote:
> > On Sat, Dec 05, 2015 at 01:30:49AM +0100, Boris Brezillon wrote:
> > > How about defining a new function to encourage mtd drivers to pass an
> > > mtd_partitions structure instead of the parts + nr_parts arguments.
> 
> ...
> 
> > > Hm, you updated the ->parse_fn() prototype to take a const mtd_partition **
> > > in patch 2, and it seemed pretty easy.
> > > How about updating it again to take an mtd_partitions pointer here?
> 
> OK, so I've hacked around at these two suggestions, and I'm not very
> happy with the results so far. I mentioned some of my objection to the
> first above already, and when I tried to do some kind of compromise, it
> doesn't end up much cleaner IMO.
> 
> For the second suggestion, I don't really like the circular dependency,
> where we have struct mtd_part_parser include pointers to struct
> mtd_partitions which includes pointers to mtd_part_parser. This is
> partly because of the re-use of the parts of the same struct as both an
> input and an output, depending on the context. I don't think that's very
> clean.
> 
> So, if there are good ways to extend some version of your suggestions,
> perhaps they can be tackled after this patch set?

Okay.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
