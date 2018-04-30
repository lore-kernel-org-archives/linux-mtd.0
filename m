Date: Mon, 30 Apr 2018 12:09:30 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tony
 Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartosz
 Golaszewski <bgolaszewski@baylibre.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] mtd: nand: davinci: stop using pdev->id as
 chipselect
Message-ID: <20180430120930.4768a7cb@bbrezillon>
In-Reply-To: <20180430082453.8091-1-brgl@bgdev.pl>
References: <20180430082453.8091-1-brgl@bgdev.pl>
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

Hi Bartosz,

On Mon, 30 Apr 2018 10:24:41 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We have the 'ti,davinci-chipselect' property in the device tree, but
> when using platform data the driver silently uses the id field of
> struct platform_device as the chipselect. This is confusing and we
> almost broke the nand support again recently after converting the
> platform to common clock framework (which changed the device id in the
> clock lookup - the problem is gone now that we no longer acquire the
> clock in the nand driver.
> 
> This series adds a new field to davinci-nand platform data, then makes
> all board use it and finally modifies the two drivers that make use of
> it.
> 
> Bartosz Golaszewski (12):
>   mtd: nand: davinci: store the core chipselect number in platform data

Raw NAND related patches (that is, everything that is not onenand or
SPI NAND) should use the "mtd: rawnand: " prefix now. Other than that,
I'm fine with the patch series, just let me know how you want to have it
merged (through the MTD tree or the davinci tree).

Thanks,

Boris
