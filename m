Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eeNqA-00070u-11
 for linux-mtd@lists.infradead.org; Wed, 24 Jan 2018 16:23:59 +0000
Received: by mail-qt0-x244.google.com with SMTP id o35so11679660qtj.13
 for <linux-mtd@lists.infradead.org>; Wed, 24 Jan 2018 08:23:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180124100604.GA19593@lenoch>
References: <20180124100604.GA19593@lenoch>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jan 2018 18:23:43 +0200
Message-ID: <CAHp75VfW--mCEFEh7hFEtMKN0gz4xo2kcrN0y7yyK+QfuZ7NOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add managed ioremap function for shared resources
To: Ladislav Michl <ladis@linux-mips.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@suse.de>,
 Ingo Molnar <mingo@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Wei Yongjun <weiyongjun1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 24, 2018 at 12:06 PM, Ladislav Michl <ladis@linux-mips.org> wrote:
> Many drivers can simplified by using devm_ioremap_resource()
> instead of open coding its functionality. However, as pointed
> by Wei Yongjun, that function cannot be used when memory region
> is already taken. See previous discussion here:
> https://www.spinics.net/lists/linux-pci/msg68495.html
>
> To ease job of driver developers, new function for that
> purpose is implemented and its usage shown on davinci
> mtd driver.
>

Sometimes we also need that, so, after addressing my comments FWIW

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Changes from previous version:
> - moved function prototype in headers other way around (PATCH 1/3),
>   the rest of patches was dropped.
>
> Ladislav Michl (3):
>   devres: Move devm_ioremap_resource() out of device.h
>   devres: Add devm_ioremap_shared_resource()
>   mtd: nand: davinci: Use devm_ioremap_shared_resource()
>
>  drivers/mtd/nand/davinci_nand.c | 24 +++++++-----------------
>  include/linux/device.h          |  2 --
>  include/linux/io.h              |  7 +++++++
>  lib/devres.c                    | 22 ++++++++++++++--------
>  4 files changed, 28 insertions(+), 27 deletions(-)
>
> --
> 2.15.1
>



-- 
With Best Regards,
Andy Shevchenko
