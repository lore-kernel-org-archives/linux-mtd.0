Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUEfs-0001FL-Gj
 for linux-mtd@lists.infradead.org; Sat, 07 Mar 2015 13:21:49 +0000
Received: by igkb16 with SMTP id b16so10371549igk.1
 for <linux-mtd@lists.infradead.org>; Sat, 07 Mar 2015 05:21:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Date: Sat, 7 Mar 2015 14:21:26 +0100
Message-ID: <CACna6rzL2=aUjvDw0ccRCBd1tu2QOavZf15CiZfZeimMDoWEGw@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, bcm-kernel-feedback-list@broadcom.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7 March 2015 at 02:18, Brian Norris <computersforpeace@gmail.com> wrote:
> +       /* NAND register range */
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       ctrl->nand_base = devm_ioremap_resource(dev, res);
> +       if (!ctrl->nand_base)
> +               return -ENODEV;

This is what I got during my first test:
brcmstb_nand 11315e0.nand: can't request region for resource [mem
0x011315e0-0x011325df]
Unable to handle kernel paging request at virtual address fffffff0
(not sure why yet).

Hint: devm_ioremap_resource does never return NULL
