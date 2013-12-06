Date: Fri, 6 Dec 2013 11:07:14 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/4] mtd: spi-nor: add a new framework for SPI NOR
Message-ID: <20131206030713.GA3710@shlinux2.ap.freescale.net>
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <20131127043253.GA9468@ld-irv-0074.broadcom.com>
 <5298AA23.7080404@st.com>
 <1386082273.18201.61.camel@shinybook.infradead.org>
 <20131204184405.GE9468@ld-irv-0074.broadcom.com>
 <20131205071224.GA8936@shlinux2.ap.freescale.net>
 <20131205081101.GA4636@norris.computersforpeace.net>
 <20131205075901.GA20407@shlinux2.ap.freescale.net>
 <20131205092048.GE4636@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20131205092048.GE4636@norris.computersforpeace.net>
Cc: marex@denx.de, Angus Clark <angus.clark@st.com>, broonie@linaro.org,
 David Woodhouse <dwmw2@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 05, 2013 at 01:20:48AM -0800, Brian Norris wrote:
> SPI is not used only for SPI NOR; it is useful for other things, like
> communicating with off-chip peripherals or microcontrollers, supporting
> touchscreens, LEDs, media controllers, etc. So with a SPI NOR framework
> living only in the MTD subsystem, I have to write two drivers: one
> (under drivers/spi/) to use only-(a) for controlling non-flash SPI
> devices, and one (under drivers/mtd/) to manage (a)+(b) on SPI NOR
> flash.

If the NOR is connected to a SPI bus controller which can attaches other SPI
devices too, I think you use a pure SPI driver to access it;

If the NOR is connected to a SPI-NOR controller such as your spi-nor controller
, you can use a SPI-NOR driver to access it.


Does your NOR flash connect to both the SPI bus controller and SPI-NOR
controller at the same time? :) If it does connect to both of the controllers,
I do not know how to handle it too.	   


> 
> If, however, we can define a spi_nor_transfer like Angus suggested, and
> if we take that a step further and make it a first-class (but optional)
> citizen of the SPI framework, then we could have drivers that support
> SPI-only, SPI-NOR-only, or both.
> 
I guess Mark will not agree with this. :)


thanks
Huang Shijie


> Now, I'm not sure how exactly that sort of proposal would work yet, but
> I wanted to test the waters to see
>   - if this is a complete distortion of what Angus or David may have
>     suggested;
>   - if Mark thinks this is reasonable, or if he thinks I'm spouting
>     nonsense; and
>   - if there is some obvious alternate way to support what I describe
>     without moving the SPI-NOR layer into the SPI subsystem.
> 
> Brian
> 
