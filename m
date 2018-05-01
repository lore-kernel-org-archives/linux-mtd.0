Date: Tue, 1 May 2018 17:02:01 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tony
 Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartosz
 Golaszewski <bgolaszewski@baylibre.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/12] mtd: nand: davinci: stop using pdev->id as
 chipselect
Message-ID: <20180501170201.6b3c034a@bbrezillon>
In-Reply-To: <276f8b2b-34a1-ec00-e348-21b5bcb2f0c0@ti.com>
References: <20180430082453.8091-1-brgl@bgdev.pl>
 <20180430120930.4768a7cb@bbrezillon>
 <276f8b2b-34a1-ec00-e348-21b5bcb2f0c0@ti.com>
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

On Tue, 1 May 2018 16:01:42 +0530
Sekhar Nori <nsekhar@ti.com> wrote:

> On Monday 30 April 2018 03:39 PM, Boris Brezillon wrote:
> > Hi Bartosz,
> > 
> > On Mon, 30 Apr 2018 10:24:41 +0200
> > Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >   
> >> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>
> >> We have the 'ti,davinci-chipselect' property in the device tree, but
> >> when using platform data the driver silently uses the id field of
> >> struct platform_device as the chipselect. This is confusing and we
> >> almost broke the nand support again recently after converting the
> >> platform to common clock framework (which changed the device id in the
> >> clock lookup - the problem is gone now that we no longer acquire the
> >> clock in the nand driver.
> >>
> >> This series adds a new field to davinci-nand platform data, then makes
> >> all board use it and finally modifies the two drivers that make use of
> >> it.
> >>
> >> Bartosz Golaszewski (12):
> >>   mtd: nand: davinci: store the core chipselect number in platform data  
> > 
> > Raw NAND related patches (that is, everything that is not onenand or
> > SPI NAND) should use the "mtd: rawnand: " prefix now. Other than that,
> > I'm fine with the patch series, just let me know how you want to have it  
> 
> Hi Boris, should I convert the "I'm fine" to some sort of formal tag? If
> yes, what is the tag and for which patches?

Yep, you can add

Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>

on patches 1 and 11.

Thanks,

Boris
