Received: from mail-yx0-f202.google.com ([209.85.210.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MpYSM-0004vF-Rg
	for linux-mtd@lists.infradead.org; Mon, 21 Sep 2009 02:16:51 +0000
Received: by yxe40 with SMTP id 40so3126074yxe.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 20 Sep 2009 19:16:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1253498180.6317.226.camel@macbook.infradead.org>
References: <1243915650-29628-1-git-send-email-vapier@gentoo.org>
	<1244033509-31586-1-git-send-email-vapier@gentoo.org>
	<1253484248.6317.217.camel@macbook.infradead.org>
	<8bd0f97a0909201549w2980c02em4c401f3f86b732a4@mail.gmail.com>
	<1253496321.6317.218.camel@macbook.infradead.org>
	<8bd0f97a0909201835j7f43330cuc7b1e28b45550651@mail.gmail.com>
	<1253498180.6317.226.camel@macbook.infradead.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 20 Sep 2009 22:16:25 -0400
Message-ID: <8bd0f97a0909201916k128d05d5o97331a1887d9c1c3@mail.gmail.com>
Subject: Re: [PATCH v2] mtd/maps: gpio-addr-flash: new driver for GPIO
	assisted flash addressing
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Sun, Sep 20, 2009 at 21:56, David Woodhouse wrote:
> On Sun, 2009-09-20 at 21:35 -0400, Mike Frysinger wrote:
>> On Sun, Sep 20, 2009 at 21:25, David Woodhouse wrote:
>> > On Sun, 2009-09-20 at 18:49 -0400, Mike Frysinger wrote:
>> >> i think you mean:
>> >> depend GPIOLIB || GENERIC_GPIO
>> >
>> > No, I think the failing configuration was GENERIC_GPIO && !GPIOLIB
>> >
>> > With GENERIC_GPIO, we include <asm-generic/gpio.h>, and _without_
>> > GPIOLIB that header doesn't actually do anything useful.
>>
>> i dont know what you mean by "we". GENERIC_GPIO means asm/gpio.h is
>> useful and so provides the basic gpio functions (which this driver
>> uses). =C2=A0the driver, nor common gpio.h headers, pull in
>> asm-generic/gpio.h.
>>
>> that is how the Blackfin arch works. =C2=A0GENERIC_GPIO -> basic gpio
>> functions work fine as the on-chip gpio functions are supported.
>
> On i386, <linux/gpio.h> includes <asm/gpio.h>. And that includes
> <asm-generic/gpio.h> -- which only does anything useful if
> CONFIG_GPIOLIB is set.
>
> The failed compilation I showed you earlier was with CONFIG_GENERIC_GPIO
> set, but not CONFIG_GPIOLIB.

that isnt a valid GENERIC_GPIO implementation.  x86 cant support it
w/out GPIOLIB.  so the depend still should be "(GENERIC_GPIO ||
GPIOLIB)".
-mike
