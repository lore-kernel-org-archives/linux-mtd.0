Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dD5rC-0002Vw-Sy
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 09:12:00 +0000
Received: by mail-wm0-x244.google.com with SMTP id b84so21936862wmh.0
 for <linux-mtd@lists.infradead.org>; Tue, 23 May 2017 02:11:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1492860013-20848-1-git-send-email-andrea.adami@gmail.com>
References: <1492860013-20848-1-git-send-email-andrea.adami@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 23 May 2017 11:11:36 +0200
Message-ID: <CAAQYJAv-8wH=UuEvOtubimw1bLTiPEwdgJTdhiYQ_z_PYd+keA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mtd: sharpslpart partition parser
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 22, 2017 at 1:20 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> This patchset introduces a simple partition parser for the Sharp SL
> Series PXA handhelds. More details in the commit text.
>
> I have set in cc the ARM PXA maintainers because this is the MTD part of
> a planned wider patchset cleaning the Zaurus board files.
>
> Changelog:
> v1 initial import of 2.4 sources [1]
> v2 refactor applying many suggested fixes [2]
>
> [1] https://github.com/LinuxPDA/Sharp_FTL_2.4.20
> [2] https://github.com/LinuxPDA/linux/commits/sharpslpart_v2
>
> Andrea Adami (3):
>   mtd: sharpsl: add sharpslpart MTD partition parser
>   mtd: nand: sharpsl.c: prefer sharpslpart MTD partition parser
>   mtd: nand: tmio_nand.c: prefer sharpslpart MTD partition parser
>
>  drivers/mtd/Kconfig          |   8 ++
>  drivers/mtd/Makefile         |   2 +
>  drivers/mtd/nand/sharpsl.c   |   4 +-
>  drivers/mtd/nand/tmio_nand.c |   4 +-
>  drivers/mtd/sharpsl_ftl.c    | 219 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/sharpsl_ftl.h    |  34 +++++++
>  drivers/mtd/sharpslpart.c    | 132 ++++++++++++++++++++++++++
>  7 files changed, 401 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mtd/sharpsl_ftl.c
>  create mode 100644 drivers/mtd/sharpsl_ftl.h
>  create mode 100644 drivers/mtd/sharpslpart.c
>
> --
> 2.7.4
>

Hello,

I'd be thankful for a second review after the big changes from v1
which was just a proof of concept.
As for the memory management, it totally mimics the other parsers.

The patch has been backported to 4.4 [1] and up to 3.10 [2] with
minimal changes to module init/exit:
since linux 4.5 (commit b8f70ba mtd: kill off MTD partition parser
boilerplate) we use module_mtd_part_parser().

With this parser we have finally a single linux-as bootloader kernel
covering the 4 Zaurus pxa 27x devices (repartitioned or not).

Thanks in advance
Andrea

[1] http://cgit.openembedded.org/meta-handheld/tree/recipes-kernel/linux/linux-handheld-4.4/sharpslpart/0001-mtd-sharpsl-add-sharpslpart-MTD-partition-parser.patch
[2] https://github.com/greguu/linux-3.10.y-c3x00-f2fs-kexec-r0/commit/f087900fbd778cce642a8e24e7351a0d814bb9a7
