Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a43C6-0001IW-KA
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 08:55:24 +0000
Date: Wed, 2 Dec 2015 09:55:00 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] mtd: support a cleanup callback for partition parsers
Message-ID: <20151202095500.02cc5894@bbrezillon>
In-Reply-To: <20151202031209.GE64635@google.com>
References: <1447989997-108476-1-git-send-email-computersforpeace@gmail.com>
 <1447989997-108476-4-git-send-email-computersforpeace@gmail.com>
 <20151130193624.152c032a@bbrezillon>
 <20151130235340.GP64635@google.com>
 <20151201133732.440f2357@bbrezillon>
 <20151202031209.GE64635@google.com>
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

On Tue, 1 Dec 2015 19:12:09 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> On Tue, Dec 01, 2015 at 01:37:32PM +0100, Boris Brezillon wrote:
> > On Mon, 30 Nov 2015 15:53:40 -0800
> > Brian Norris <computersforpeace@gmail.com> wrote:
> > > On Mon, Nov 30, 2015 at 07:36:24PM +0100, Boris Brezillon wrote:
> > > > What do you think?
> > > 
> > > I guess I do like the idea of hiding the handling of the parser
> > > reference so mtd_device_parse_register() doesn't have to track the
> > > parser directly. I'll admit I didn't like yet another
> > > return-by-pointer-argument, but I didn't bother finding a better
> > > solution at the time.
> > > 
> > > About the extra parser field: it's awkward that you assume the first
> > > partition has the reference, making all the other instances of that
> > > field pointless. Maybe a new mtd_partitions struct would be nice for
> > > encapsulating everything properly.
> > 
> > Agreed. I just wanted to show that with a minimal amount of changes we
> > could have a simpler implementation, but I clearly prefer the
> > mtd_partitions approach.
> 
> OK, do you want to roll up all the suggestions into a new patch series,
> or should I?

If you don't mind and have some time I'll let you do it ;-).

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
