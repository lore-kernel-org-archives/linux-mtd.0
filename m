Subject: Re: [PATCH v2] mtd/maps: gpio-addr-flash: new driver for GPIO
	assisted flash addressing
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0909201835j7f43330cuc7b1e28b45550651@mail.gmail.com>
References: <1243915650-29628-1-git-send-email-vapier@gentoo.org>
	<1244033509-31586-1-git-send-email-vapier@gentoo.org>
	<1253484248.6317.217.camel@macbook.infradead.org>
	<8bd0f97a0909201549w2980c02em4c401f3f86b732a4@mail.gmail.com>
	<1253496321.6317.218.camel@macbook.infradead.org>
	<8bd0f97a0909201835j7f43330cuc7b1e28b45550651@mail.gmail.com>
Content-Type: text/plain
Date: Sun, 20 Sep 2009 18:56:20 -0700
Message-Id: <1253498180.6317.226.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Sun, 2009-09-20 at 21:35 -0400, Mike Frysinger wrote:
> On Sun, Sep 20, 2009 at 21:25, David Woodhouse wrote:
> > On Sun, 2009-09-20 at 18:49 -0400, Mike Frysinger wrote:
> >> i think you mean:
> >> depend GPIOLIB || GENERIC_GPIO
> >
> > No, I think the failing configuration was GENERIC_GPIO && !GPIOLIB
> >
> > With GENERIC_GPIO, we include <asm-generic/gpio.h>, and _without_
> > GPIOLIB that header doesn't actually do anything useful.
> 
> i dont know what you mean by "we". GENERIC_GPIO means asm/gpio.h is
> useful and so provides the basic gpio functions (which this driver
> uses).  the driver, nor common gpio.h headers, pull in
> asm-generic/gpio.h.
> 
> that is how the Blackfin arch works.  GENERIC_GPIO -> basic gpio
> functions work fine as the on-chip gpio functions are supported.
> -mike

On i386, <linux/gpio.h> includes <asm/gpio.h>. And that includes
<asm-generic/gpio.h> -- which only does anything useful if
CONFIG_GPIOLIB is set.

The failed compilation I showed you earlier was with CONFIG_GENERIC_GPIO
set, but not CONFIG_GPIOLIB.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
