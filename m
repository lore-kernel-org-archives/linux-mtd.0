Subject: Re: [PATCH v2] mtd/maps: gpio-addr-flash: new driver for GPIO
	assisted flash addressing
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1244033509-31586-1-git-send-email-vapier@gentoo.org>
References: <1243915650-29628-1-git-send-email-vapier@gentoo.org>
	<1244033509-31586-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 20 Sep 2009 15:04:08 -0700
Message-Id: <1253484248.6317.217.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: uclinux-dist-devel@blackfin.uclinux.org, Bryan Wu <cooloney@kernel.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-06-03 at 08:51 -0400, Mike Frysinger wrote:
> This driver lets people use GPIO's for additional address lines in case
> their processor does not have enough address lines already.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> Signed-off-by: Bryan Wu <cooloney@kernel.org>

In file included from /home/dwmw2/git/mtd-2.6/arch/x86/include/asm/gpio.h:20,
                 from drivers/mtd/maps/gpio-addr-flash.c:27:
include/asm-generic/gpio.h: In function ‘gpio_get_value_cansleep’:
include/asm-generic/gpio.h:168: error: implicit declaration of function ‘gpio_get_value’
include/asm-generic/gpio.h: In function ‘gpio_set_value_cansleep’:
include/asm-generic/gpio.h:174: error: implicit declaration of function ‘gpio_set_value’
drivers/mtd/maps/gpio-addr-flash.c: In function ‘gpio_flash_probe’:
drivers/mtd/maps/gpio-addr-flash.c:232: error: implicit declaration of function ‘gpio_request’
drivers/mtd/maps/gpio-addr-flash.c:236: error: implicit declaration of function ‘gpio_free’
drivers/mtd/maps/gpio-addr-flash.c:240: error: implicit declaration of function ‘gpio_direction_output’
make[2]: *** [drivers/mtd/maps/gpio-addr-flash.o] Error 1
make[1]: *** [drivers/mtd/maps] Error 2
make: *** [_module_drivers/mtd] Error 2

Setting CONFIG_GPIOLIB seems to fix it -- but we can't make it depend on
that, can we? Maybe it should be GPIOLIB || !GENERIC_GPIO?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
