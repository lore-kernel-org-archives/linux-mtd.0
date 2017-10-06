Received: from mail-io0-x22a.google.com ([2607:f8b0:4001:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e0aYG-0000QR-Ii
 for linux-mtd@lists.infradead.org; Fri, 06 Oct 2017 21:53:09 +0000
Received: by mail-io0-x22a.google.com with SMTP id 21so17246859iof.6
 for <linux-mtd@lists.infradead.org>; Fri, 06 Oct 2017 14:52:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fuawf1h8.fsf@belgarion.home>
References: <20170924173912.9199-1-linus.walleij@linaro.org>
 <87fuawf1h8.fsf@belgarion.home>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 6 Oct 2017 23:52:38 +0200
Message-ID: <CACRpkdZEx8=887BiW786Cfh89yjLx1cVdJ=jdD+tVdqec-k3Fw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: gpio: Convert to use GPIO descriptors
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Jamie Iles <jamie.iles@oracle.com>, "arm@kernel.org" <arm@kernel.org>,
 Frans Klaver <fransklaver@gmail.com>, Gerhard Sittig <gsi@denx.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 6, 2017 at 10:46 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
>
>>  #if defined(CONFIG_MTD_NAND_GPIO) || defined(CONFIG_MTD_NAND_GPIO_MODULE)
>> +
>> +static struct gpiod_lookup_table cmx255_nand_gpiod_table = {
>> +     .dev_id         = "cmx255-nand",
> Shouldn't the device name be "gpio-nand" instead ?
> "cmx255-nand" is AFAIR a partition name, not a device name.

My silly mistake. Sent a fixup patch.

Thanks for spotting this!

Yours,
Linus Walleij
