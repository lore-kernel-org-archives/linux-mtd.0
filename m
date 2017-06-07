Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIVeu-0006mj-W7
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 07:45:42 +0000
Date: Wed, 7 Jun 2017 09:45:09 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Brian Norris
 <computersforpeace@gmail.com>, Enrico Jorns <ejo@pengutronix.de>, David
 Woodhouse <dwmw2@infradead.org>, Graham Moore
 <grmoore@opensource.altera.com>
Subject: Re: [PATCH v4 04/23] mtd: nand: denali: avoid hard-coding ECC step,
 strength, bytes
Message-ID: <20170607094509.263f155d@bbrezillon>
In-Reply-To: <CAK7LNATObBpfjdSJB9G5RgHQV2FaSepzk6Lb=b=_eMqfxYf7ng@mail.gmail.com>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
 <1496704922-12261-5-git-send-email-yamada.masahiro@socionext.com>
 <20170607000133.69fbf82b@bbrezillon>
 <CAK7LNATXygK2f71J8gggGQRuEdJ21CJfg9WVCYXgO=+NRBwcLg@mail.gmail.com>
 <20170607090250.729625c9@bbrezillon>
 <CAK7LNATObBpfjdSJB9G5RgHQV2FaSepzk6Lb=b=_eMqfxYf7ng@mail.gmail.com>
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

On Wed, 7 Jun 2017 16:21:15 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2017-06-07 16:02 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Wed, 7 Jun 2017 12:09:31 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> >> +
> >> >> +static int denali_ecc_setup(struct mtd_info *mtd, struct nand_chip *chip,
> >> >> +                         struct denali_nand_info *denali)
> >> >> +{
> >> >> +     struct nand_ecc_caps caps;
> >> >> +     int ret;
> >> >> +
> >> >> +     caps.stepinfos = denali->stepinfo;
> >> >> +     caps.nstepinfos = 1;
> >> >> +     caps.calc_ecc_bytes = denali_calc_ecc_bytes;
> >> >> +     caps.oob_reserve_bytes = denali->bbtskipbytes;  
> >> >
> >> > If you get rid of this oob_reserve_bytes field, you can define caps as
> >> > a static const and even directly store ecc_caps in denali_nand_info.  
> >>
> >> To make caps static const, denali_calc_ecc_bytes must be exported
> >> to be referenced from denali_dt/denali_pci.
> >> I am reluctant to do it.  
> >
> > You already duplicate other information in denali_dt.c and
> > denali_pci.c,  
> 
> The ECC step-size and strength are tightly associated to each IP variant.
> I see duplication between denali_dt and denali_pci, but it is just because
> Intel and Altera happened to have the same parameters.

It's still duplication.

> 
> On the other hand, denali_calc_ecc_bytes() is common to all variants
> because ECC algorithm is not customizable.

Yes, I agree.

> 
> 
> > so what prevents you from duplicating this one-line
> > function?
> >
> > Also, denali core already exports 2 functions,  
> 
> They are entries for probe/remove.
> 
> > I don't see the problem
> > in exporting the common nand_ecc_caps object. Why are you reluctant to
> > that?  
> 
> denali_calc_ecc_bytes() is independent of DT, PCI, or whatever.
> I see less reason to expose it.

I don't get that one. The fact that it's a generic implementation makes
it a good match for something you want to have in the core and expose
to DT/PCI implems.

> 
> caps is only used on probing, so I used a local variable.
> I do not think it is a big problem.
> 

It is to me, because you'll be the only user of the API at first, and
people tend to copy&paste code from other drivers.
nand_ecc_caps is really something that should be const and attached to
a specific IP revision.
