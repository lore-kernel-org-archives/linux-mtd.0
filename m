Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dwlA0-0005bW-6m
 for linux-mtd@lists.infradead.org; Tue, 26 Sep 2017 08:24:09 +0000
Date: Tue, 26 Sep 2017 10:23:44 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Richard Weinberger <richard@nod.at>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: wait for tWHR after NAND_CMD_STATUS /
 NAND_CMD_READID
Message-ID: <20170926102344.6953d072@bbrezillon>
In-Reply-To: <CAK7LNASpP9qQABLqXPqz8bQNsMjuxb8GKHU4Xxy_dAhgzT2O2A@mail.gmail.com>
References: <1506397164-3648-1-git-send-email-yamada.masahiro@socionext.com>
 <20170926084356.553867a1@bbrezillon>
 <CAK7LNASpP9qQABLqXPqz8bQNsMjuxb8GKHU4Xxy_dAhgzT2O2A@mail.gmail.com>
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

On Tue, 26 Sep 2017 17:17:49 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 2017-09-26 15:43 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Tue, 26 Sep 2017 12:39:24 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> Read Status and Read ID require tWHR before reading the first data.
> >> Insert a very short wait to make sure to meet the spec.
> >>
> >> I have not seen any problem report for now, but nand_command() and
> >> nand_command_lP() are generic hooks, so it makes sense to implement
> >> fail-safe code here.
> >>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> ---  
> >  
> 
> 
> OK, will do.
> 
> 
> 
> BTW, I see unconditional wait for tWB a few lines below,
> but it gives no performance regression because we will wait
> much longer in nand_wait_ready().

Yep, but this one is here for quite some time. Normally there should be
no problem with your ndelay(200), but I don't want to take the risk
and have someone complain that his NAND controller driver is broken
because of this extra delay ;-).

> 
> 
>      /*
>       * Apply this short delay always to ensure that we do wait tWB in
>       * any case on any machine.
>       */
>      ndelay(100);
> 
>      nand_wait_ready(mtd);
> 
> 
> 
> 
