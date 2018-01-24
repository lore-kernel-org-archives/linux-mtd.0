Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eeNpE-0006gj-0F
 for linux-mtd@lists.infradead.org; Wed, 24 Jan 2018 16:23:01 +0000
Received: by mail-qt0-x230.google.com with SMTP id z11so11726902qtm.3
 for <linux-mtd@lists.infradead.org>; Wed, 24 Jan 2018 08:22:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180124100828.GD19593@lenoch>
References: <20180124100604.GA19593@lenoch> <20180124100828.GD19593@lenoch>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jan 2018 18:22:48 +0200
Message-ID: <CAHp75Vf=5uCmJ4B2wDsbmxq4oJgt5+S2+n-mp1p6g4FLuwOeFw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: nand: davinci: Use
 devm_ioremap_shared_resource()
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

On Wed, Jan 24, 2018 at 12:08 PM, Ladislav Michl <ladis@linux-mips.org> wrote:

> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       vaddr = devm_ioremap_resource(&pdev->dev, res);

_resource_exclusive()

> +       info->base = devm_ioremap_shared_resource(&pdev->dev, res);

_resource_shared()

-- 
With Best Regards,
Andy Shevchenko
