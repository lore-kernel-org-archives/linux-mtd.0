Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIUzn-0005Q0-Rd
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 07:03:18 +0000
Date: Wed, 7 Jun 2017 09:02:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 04/23] mtd: nand: denali: avoid hard-coding ECC step,
 strength, bytes
Message-ID: <20170607090250.729625c9@bbrezillon>
In-Reply-To: <CAK7LNATXygK2f71J8gggGQRuEdJ21CJfg9WVCYXgO=+NRBwcLg@mail.gmail.com>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
 <1496704922-12261-5-git-send-email-yamada.masahiro@socionext.com>
 <20170607000133.69fbf82b@bbrezillon>
 <CAK7LNATXygK2f71J8gggGQRuEdJ21CJfg9WVCYXgO=+NRBwcLg@mail.gmail.com>
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

On Wed, 7 Jun 2017 12:09:31 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> >> +
> >> +static int denali_ecc_setup(struct mtd_info *mtd, struct nand_chip *chip,
> >> +                         struct denali_nand_info *denali)
> >> +{
> >> +     struct nand_ecc_caps caps;
> >> +     int ret;
> >> +
> >> +     caps.stepinfos = denali->stepinfo;
> >> +     caps.nstepinfos = 1;
> >> +     caps.calc_ecc_bytes = denali_calc_ecc_bytes;
> >> +     caps.oob_reserve_bytes = denali->bbtskipbytes;  
> >
> > If you get rid of this oob_reserve_bytes field, you can define caps as
> > a static const and even directly store ecc_caps in denali_nand_info.  
> 
> To make caps static const, denali_calc_ecc_bytes must be exported
> to be referenced from denali_dt/denali_pci.
> I am reluctant to do it.

You already duplicate other information in denali_dt.c and
denali_pci.c, so what prevents you from duplicating this one-line
function?

Also, denali core already exports 2 functions, I don't see the problem
in exporting the common nand_ecc_caps object. Why are you reluctant to
that?
