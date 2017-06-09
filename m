Date: Thu, 8 Jun 2017 18:35:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lee Jones <lee.jones@linaro.org>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/9] mtd: sharpslpart partition parser
Message-ID: <20170609013521.GL102137@google.com>
References: <1496270458-6479-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496270458-6479-1-git-send-email-andrea.adami@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 01, 2017 at 12:40:49AM +0200, Andrea Adami wrote:
> This patchset introduces a simple partition parser for the Sharp SL
> Series PXA handhelds. More details in the commit text.
> 
> I have set in cc the ARM PXA maintainers because this is the MTD part of
> a planned wider patchset cleaning the Zaurus board files. The MFD maintainers
> are also in cc (tmio.h change).
> 
> Changelog:
> v1 initial import of 2.4 sources [1]
> v2 refactor applying many suggested fixes [2]
> v3 put the partition parser types in the platform data
> 
> [1] https://github.com/LinuxPDA/Sharp_FTL_2.4.20
> [2] https://github.com/LinuxPDA/linux/commits/sharpslpart_v2
> 
> Andrea Adami (9):
>   mtd: sharpslpart: add sharpslpart MTD partition parser
>   mtd: nand: sharpsl.h: support partition parser types
>   mfd: nand: tmio.h: support partition parser types
>   mtd: nand: sharpsl.c: take in account partition parser types
>   mtd: nand: tmio_nand.c: take in account partition parser types
>   arm: pxa: corgi.c: remove hardcoded partitioning, use sharpslpart
>     parser
>   arm: pxa: tosa.c: remove hardcoded partitioning, use sharpslpart
>     parser
>   arm: pxa: spitz.c: remove hardcoded partitioning, use sharpslpart
>     parser
>   arm: pxa: poodle.c: remove hardcoded partitioning, use sharpslpart
>     parser

Barring my comments on patch 1 and Wolfram's comments on a few of the
others, for the whole series:

Reviewed-by: Brian Norris <computersforpeace@gmail.com>

Once things are fixed up, this should probably go through MTD.

Brian
