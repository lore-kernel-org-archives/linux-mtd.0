Date: Mon, 25 Sep 2017 09:58:31 +0100
From: Jamie Iles <jamie.iles@oracle.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Frans Klaver <fransklaver@gmail.com>, Gerhard Sittig <gsi@denx.de>,
 Jamie Iles <jamie.iles@oracle.com>
Subject: Re: [PATCH] mtd: nand: gpio: Convert to use GPIO descriptors
Message-ID: <20170925085831.mamuitnvljrek3bo@cedar>
References: <20170924173912.9199-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170924173912.9199-1-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 24, 2017 at 07:39:12PM +0200, Linus Walleij wrote:
> There is exactly one board in the kernel that defines platform data
> for the GPIO NAND driver.
> 
> Use the feature to provide a lookup table for the GPIOs in the board
> file so we can convert the driver as a whole to just use GPIO
> descriptors.
> 
> After this we can cut the use of <linux/of_gpio.h> and use the GPIO
> descriptor management from <linux/gpio/consumer.h> alone to grab and use
> the GPIOs used in the driver.
> 
> I also created a local struct device *dev in the probe() function
> because I was getting annoyed with all the &pdev->dev dereferencing.
> 
> Cc: arm@kernel.org
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: Frans Klaver <fransklaver@gmail.com>
> Cc: Gerhard Sittig <gsi@denx.de>

Acked-by: Jamie Iles <jamie.iles@oracle.com>
