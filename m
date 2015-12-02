Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3xqM-0002F6-BO
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 03:12:35 +0000
Received: by padhx2 with SMTP id hx2so25777597pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2015 19:12:12 -0800 (PST)
Date: Tue, 1 Dec 2015 19:12:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] mtd: support a cleanup callback for partition parsers
Message-ID: <20151202031209.GE64635@google.com>
References: <1447989997-108476-1-git-send-email-computersforpeace@gmail.com>
 <1447989997-108476-4-git-send-email-computersforpeace@gmail.com>
 <20151130193624.152c032a@bbrezillon>
 <20151130235340.GP64635@google.com>
 <20151201133732.440f2357@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151201133732.440f2357@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 01, 2015 at 01:37:32PM +0100, Boris Brezillon wrote:
> On Mon, 30 Nov 2015 15:53:40 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> > On Mon, Nov 30, 2015 at 07:36:24PM +0100, Boris Brezillon wrote:
> > > What do you think?
> > 
> > I guess I do like the idea of hiding the handling of the parser
> > reference so mtd_device_parse_register() doesn't have to track the
> > parser directly. I'll admit I didn't like yet another
> > return-by-pointer-argument, but I didn't bother finding a better
> > solution at the time.
> > 
> > About the extra parser field: it's awkward that you assume the first
> > partition has the reference, making all the other instances of that
> > field pointless. Maybe a new mtd_partitions struct would be nice for
> > encapsulating everything properly.
> 
> Agreed. I just wanted to show that with a minimal amount of changes we
> could have a simpler implementation, but I clearly prefer the
> mtd_partitions approach.

OK, do you want to roll up all the suggestions into a new patch series,
or should I?

Brian
