Date: Wed, 18 Dec 2013 19:21:12 +0100
From: Gerhard Sittig <gsi@denx.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v3 6/7] Documentation: add the binding file for Quadspi
 driver
Message-ID: <20131218182112.GK8064@book.gsilab.sittig.org>
References: <1387184330-14448-1-git-send-email-b32955@freescale.com>
 <1387184330-14448-7-git-send-email-b32955@freescale.com>
 <20131218153029.GF8064@book.gsilab.sittig.org>
 <20131218160355.GA1145@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131218160355.GA1145@gmail.com>
Cc: marex@denx.de, angus.clark@st.com, shawn.guo@linaro.org,
 b44548@freescale.com, broonie@linaro.org, dwmw2@infradead.org,
 linux-doc@vger.kernel.org, b18965@freescale.com, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com,
 computersforpeace@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 19, 2013 at 00:03 +0800, Huang Shijie wrote:
> 
> On Wed, Dec 18, 2013 at 04:30:29PM +0100, Gerhard Sittig wrote:
> > > +++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> > > [ ... ]
> > > +Example:
> > > +
> > > +qspi0: quadspi@40044000 {
> > > +	compatible = "fsl,vf610-qspi";
> > > +	reg = <0x40044000 0x1000>;
> > > +	interrupts = <0 24 0x04>;
> > > [ ... ]
> > > +};
> > 
> > [ ... ]
> > I'd suggest to use symbolic names for the flags in the last
> > interrupt specifier cell, as you do for clock items.
> I will use the symbolic name if it has.
> But if it not have a symbolic name, i have to keep it as it is now.

To avoid potential confusion:  I meant symbolic names for the
_flags_ of the interrupt specifier (i.e. trigger type and
polarity).  The <dt-bindings/interrupt-controller/irq.h> file has
IRQ_TYPE_LEVEL_HIGH with value 4 for you.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
