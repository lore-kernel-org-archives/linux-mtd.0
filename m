Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1csyru-00089U-CK
 for linux-mtd@lists.infradead.org; Tue, 28 Mar 2017 21:41:36 +0000
Date: Tue, 28 Mar 2017 23:40:23 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Laurent Monat
 <laurent.monat@idquantique.com>, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>, Jason Roberts
 <jason.e.roberts@intel.com>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Weinberger
 <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v2 20/53] mtd: nand: denali: do not set mtd->name
Message-ID: <20170328234023.0c887a51@bbrezillon>
In-Reply-To: <CAK7LNARNng6WuuF9OEfJmPkzR=-f1dmM0Q-ypdrAFNxRarATTw@mail.gmail.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-21-git-send-email-yamada.masahiro@socionext.com>
 <20170327173146.655f090f@bbrezillon>
 <CAK7LNARNng6WuuF9OEfJmPkzR=-f1dmM0Q-ypdrAFNxRarATTw@mail.gmail.com>
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

On Wed, 29 Mar 2017 06:32:24 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 2017-03-28 0:31 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Wed, 22 Mar 2017 23:07:27 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> This will be filled by nand_scan_ident() later.
> >>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> ---
> >>
> >> Changes in v2: None
> >>
> >>  drivers/mtd/nand/denali.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> >> index 3badb1d..1706975 100644
> >> --- a/drivers/mtd/nand/denali.c
> >> +++ b/drivers/mtd/nand/denali.c
> >> @@ -1495,7 +1495,6 @@ int denali_init(struct denali_nand_info *denali)
> >>
> >>       /* now that our ISR is registered, we can enable interrupts */
> >>       denali_set_intr_modes(denali, true);
> >> -     mtd->name = "denali-nand";  
> >
> > Are you sure this is safe to do that? When mtd->name is NULL, the core
> > takes the parent name, and in the denali_dt case it's not "denali-nand",
> > which means you're breaking mtdparts compat.  
> 
> How big impact is this?

Breaking boot on some platforms (those defining partitions through
mtdparts= cmdline parameter), which is not negligible :P.

> 
> I think a bootloader could give mtdparts=denali-nand:...
> but, now we are able to have partitions in DT nodes.

Just because you have a new way to describe partitions (using DT) does
not mean people are not using the old one (mtdparts= parameter).
