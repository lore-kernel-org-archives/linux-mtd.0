Date: Fri, 6 Dec 2013 16:18:08 +0800
From: Huang Shijie <b32955@freescale.com>
To: Angus Clark <angus.clark@st.com>
Subject: Re: [PATCH 0/4] mtd: spi-nor: add a new framework for SPI NOR
Message-ID: <20131206081807.GB3710@shlinux2.ap.freescale.net>
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <20131127043253.GA9468@ld-irv-0074.broadcom.com>
 <5298AA23.7080404@st.com>
 <1386082273.18201.61.camel@shinybook.infradead.org>
 <20131204184405.GE9468@ld-irv-0074.broadcom.com>
 <52A08F43.6060307@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <52A08F43.6060307@st.com>
Cc: marex@denx.de, broonie@linaro.org, David Woodhouse <dwmw2@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 05, 2013 at 02:35:47PM +0000, Angus Clark wrote:
> Hi Brian,
> 
> On 12/04/2013 06:44 PM, Brian Norris wrote:
> > On this topic, I have one more stick to throw on this fire; I have some
> > Broadcom hardware that consists of two pieces:
> > 
> >   (1) a true SPI controller, with single-line-I/O and
> >   (2) a Serial Flash controller that can accelerate flash read, using
> >       dual/quad I/O.
> 
> We support one platform with properties similar to the hardware you describe,
> and such a hybrid configuration was in mind when I was thinking about the
> spi-nor framework.  I am not sure how well this will come across over email, but
> I envisage something like this:
> 
>                              spi-nor
>                                 |
>                                 v
>                           [spi-nor-xfer]
>                                 |
>          ------------------------------------------------
>         |                       |                        |
>         v                       v                        v
>    spi-wrapper (<------)  hybrid-driver          serial-flash-driver
>         |                       |                        |
>       [SPI]                     |                        |
>         |                       |                        |
>         v                       |                        |
> generic-spi-driver              |                        |
>         |                       |                        |
>         v                       v                        v
> [generic-SPI-Cntrl]   [SPI-Flash-Read Cntrl]   [SPI-Flash-Controller]
> 
> The 'spi-nor' layer is responsible for Serial Flash domain knowledge, and how to
> generate 'spi-nor-xfer' messages.  The 'spi-wrapper' would provide an interface
> to the generic SPI framework, flattening the 'spi-nor-xfer' message to standard
> SPI calls.  The combination of 'spi-nor' and 'spi-wrapper' should achieve what
> we have today for the m25p80 driver.  The 'serial-flash-driver' in the example
> provides an implementation for a dedicated Serial Flash Controller, making use
> of the spi-nor-xfer semantics where required.  The 'hybrid-driver' could use the
> 'spi-wrapper' implementation for write and erase hooks, and optimised
> implementations for read hooks.
> 
For the diagram above, I think we can regard the hybrid driver as a kind of
serial-flash-driver too.

thanks
Huang Shijie
