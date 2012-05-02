Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPY5J-0001xk-Bf
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 11:51:06 +0000
Received: by lbbgg6 with SMTP id gg6so410920lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 04:51:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335955122.10293.39.camel@sauron.fi.intel.com>
References: <1335951710-9390-1-git-send-email-hechtb@gmail.com>
 <1335955122.10293.39.camel@sauron.fi.intel.com>
Date: Wed, 2 May 2012 13:51:02 +0200
Message-ID: <CABYn4szhjH0N_DsGc=O0TtJZNUja1KDzZ7HWTnR5nQvnxZEVPQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/10] sh_flctl hardware ECC mode cleanup
From: Bastian Hecht <hechtb@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

2012/5/2 Artem Bityutskiy <dedekind1@gmail.com>:
> On Wed, 2012-05-02 at 11:41 +0200, Bastian Hecht wrote:
>> changelog v3:
>>
>> Just a rebase on current l2-mtd.git.
>
> Aiaiai says that your patch-set introduced several warnings, could you
> please take a look:
>
> -------------------------------------------------------------------------=
-------
>
> Bisectability test results for configuration "l2_mackerel_defconfig,arm,a=
rm-unknown-linux-gnueabi-"
>
> Bisecability test passed
>
> -------------------------------------------------------------------------=
-------
>
> Successfully built configuration "l2_mackerel_defconfig,arm,arm-unknown-l=
inux-gnueabi-", results:
>
> --- before_patching.log
> +++ after_patching.log
> @@ @@
> -drivers/mtd/nand/sh_flctl.c:264:30: warning: incorrect type in argument =
1 (different address spaces) [sparse]
> -drivers/mtd/nand/sh_flctl.c:264:30: =A0 =A0expected void const volatile =
[noderef] <asn:2>*<noident> [sparse]
> -drivers/mtd/nand/sh_flctl.c:264:30: =A0 =A0got void *fifo_addr [sparse]
> +drivers/mtd/nand/sh_flctl.c:301:38: warning: incorrect type in argument =
1 (different address spaces) [sparse]
> +drivers/mtd/nand/sh_flctl.c:301:38: =A0 =A0expected void const volatile =
[noderef] <asn:2>*<noident> [sparse]
> +drivers/mtd/nand/sh_flctl.c:301:38: =A0 =A0got void *fifo_addr [sparse]
> +drivers/mtd/nand/sh_flctl.c:326:28: warning: cast removes address space =
of expression [sparse]
> +drivers/mtd/nand/sh_flctl.c:331:17: warning: incorrect type in argument =
1 (different address spaces) [sparse]
> +drivers/mtd/nand/sh_flctl.c:331:17: =A0 =A0expected void const volatile =
[noderef] <asn:2>*<noident> [sparse]
> +drivers/mtd/nand/sh_flctl.c:331:17: =A0 =A0got void *fifo_addr [sparse]
> +drivers/mtd/nand/sh_flctl.c:967 flctl_probe() warn: 'irq' was not releas=
ed on error [smatch]
>
> -------------------------------------------------------------------------=
-------

Nice! Every day I learn about a new tool for kernel developing. I
cloned your aiaiai tree but am unsure how to run it as
CONFIG_MTD_NAND_SH_FLCTL is not set in the mackerel_defconfig. Can you
supply me with a command line how you tested it?

Thanks,

 Bastian Hecht


> --
> Best Regards,
> Artem Bityutskiy
