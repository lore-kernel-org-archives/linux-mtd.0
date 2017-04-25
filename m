Date: Tue, 25 Apr 2017 08:53:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Haavard Skinnemoen
 <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>,
 linux-kernel@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu
 <rainyfeeling@outlook.com>, David Woodhouse <dwmw2@infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian
 Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala
 <galak@codeaurora.org>, devicetree@vger.kernel.org, Masahiro Yamada
 <yamada.masahiro@socionext.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Message-ID: <20170425085304.139d894b@bbrezillon>
In-Reply-To: <20170425010930.GA120971@google.com>
References: <1489651362-17077-1-git-send-email-boris.brezillon@free-electrons.com>
 <1489651362-17077-2-git-send-email-boris.brezillon@free-electrons.com>
 <20170425010930.GA120971@google.com>
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

On Mon, 24 Apr 2017 18:09:30 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Thu, Mar 16, 2017 at 09:02:40AM +0100, Boris Brezillon wrote:
> 
> > diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
> > new file mode 100644
> > index 000000000000..f71b9e5d7d9d
> > --- /dev/null
> > +++ b/drivers/mtd/nand/atmel/nand-controller.c
> > @@ -0,0 +1,2198 @@  
> [...]
> 
> > +static int
> > +atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
> > +{
> > +	struct regmap_config regmap_conf = {
> > +		.reg_bits = 32,
> > +		.val_bits = 32,
> > +		.reg_stride = 4,
> > +		.val_bits = 32,  
> 
> You assigned val_bits twice. Is that just a harmless mistake, or did you
> mean to set something else?

Nope, I didn't mean to set another field to 32. I'll just apply the fix
you provided.

Thanks,

Boris
