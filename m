Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV1X4-00023K-36
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 17:31:58 +0000
Received: by padet14 with SMTP id et14so77677011pad.0
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 10:31:35 -0700 (PDT)
Date: Mon, 9 Mar 2015 10:31:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Message-ID: <20150309173131.GT18140@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
 <CACna6rzL2=aUjvDw0ccRCBd1tu2QOavZf15CiZfZeimMDoWEGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rzL2=aUjvDw0ccRCBd1tu2QOavZf15CiZfZeimMDoWEGw@mail.gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, sbranden@broadcom.com,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Kevin Cernekee <cernekee@gmail.com>,
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

On Sat, Mar 07, 2015 at 02:21:26PM +0100, Rafał Miłecki wrote:
> On 7 March 2015 at 02:18, Brian Norris <computersforpeace@gmail.com> wrote:
> > +       /* NAND register range */
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       ctrl->nand_base = devm_ioremap_resource(dev, res);
> > +       if (!ctrl->nand_base)
> > +               return -ENODEV;
> 
> This is what I got during my first test:
> brcmstb_nand 11315e0.nand: can't request region for resource [mem
> 0x011315e0-0x011325df]
> Unable to handle kernel paging request at virtual address fffffff0
> (not sure why yet).
> 
> Hint: devm_ioremap_resource does never return NULL

Thanks, fixed in 3 places.

I expect you've figured out your problem here by now.

Brian
