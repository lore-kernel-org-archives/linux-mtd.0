Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNktS-0005kN-Fo
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 13:07:27 +0000
Received: by iaky10 with SMTP id y10so1249584iak.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 06:07:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335531419.1910.0.camel@koala>
References: <1334834157-16860-1-git-send-email-jonas.gorski@gmail.com>
 <1335531419.1910.0.camel@koala>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Fri, 27 Apr 2012 15:07:02 +0200
Message-ID: <CAOiHx==j+uMQ_fxG_r6Szfbunpek5U-Dw0BZ2ai7ja-GvucLXA@mail.gmail.com>
Subject: Re: [PATCH] MTD: bcm63xxpart: handle Broadcom partition order
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27 April 2012 14:56, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2012-04-19 at 13:15 +0200, Jonas Gorski wrote:
>> The original Broadcom partition order has the root fs in front of the
>> kernel, which resulted in miscalculated partition sizes.
>> Detect when such an image is on the flash and also reorder the partition=
s
>> accordingly.
>>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>
> Unrilated, but would someone from bcm community take a look at this
> compilation problem:
>
> In file included from /home/dedekind/git/l2-mtd/arch/mips/include/asm/mac=
h-bcm63xx/gpio.h:4:0,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /home/dedeki=
nd/git/l2-mtd/arch/mips/include/asm/gpio.h:4,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/linu=
x/gpio.h:36,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from drivers/mtd/=
maps/gpio-addr-flash.c:16:
> /home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio=
.h: In function 'bcm63xx_gpio_count':
> /home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio=
.h:10:2: error: implicit declaration of function 'bcm63xx_get_cpu_id' [-Wer=
ror=3Dimplicit-function-declaration]
> /home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio=
.h:11:7: error: 'BCM6358_CPU_ID' undeclared (first use in this function)
> /home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio=
.h:11:7: note: each undeclared identifier is reported only once for each fu=
nction it appears in
> /home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio=
.h:13:7: error: 'BCM6338_CPU_ID' undeclared (first use in this function)
> /home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio=
.h:15:7: error: 'BCM6345_CPU_ID' undeclared (first use in this function)
> /home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio=
.h:17:7: error: 'BCM6368_CPU_ID' undeclared (first use in this function)
> /home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio=
.h:19:7: error: 'BCM6348_CPU_ID' undeclared (first use in this function)

There's already a patch for that waiting to be applied:

http://patchwork.linux-mips.org/patch/3351/

Regards
Jonas
