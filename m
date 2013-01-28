Received: from mail-ia0-x22b.google.com ([2607:f8b0:4001:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TzwZX-0001cy-Dd
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 21:48:59 +0000
Received: by mail-ia0-f171.google.com with SMTP id z13so4995237iaz.30
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2013 13:48:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20130128213135.GA3047@quad.lixom.net>
References: <CACRpkdZM8+6QaGrRtCCMWoZQO23uej7JDr1xz2zG7TtwQ7Ngqw@mail.gmail.com>
 <20130128213135.GA3047@quad.lixom.net>
Date: Mon, 28 Jan 2013 22:48:58 +0100
Message-ID: <CACRpkdZB-zcd8R=pmsONY9JgdiJFn=5HWApo7QiL1MLKL13=2Q@mail.gmail.com>
Subject: Re: [GIT PULL] Nomadik devicetree and cleanups
From: Linus Walleij <linus.walleij@linaro.org>
To: Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, arm@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 28, 2013 at 10:31 PM, Olof Johansson <olof@lixom.net> wrote:
> On Tue, Jan 22, 2013 at 10:19:16AM +0100, Linus Walleij wrote:
>> Hi ARM SoC guys,
>>
>> This patch series converts the Nomadik to use Device Tree.
>>
>> Changes outside of the subsystem are constrained to pinctrl (my subsystem
>> and thus OK:ed) and a oneline in drivers/mtd/nand/fsmc_nand.c adding
>> a new compatible value.
>>
>> The MTD maintainers have had time enough to ACK that oneliner and it
>> shouldn't be a big issue, so:
>>
>> Please pull this into your tree.
>
> Hi,
>
> Sorry for a late feedback on this, but after merging, this doesn't seem to
> build due to lack of vic_of_init symbol visibility (i.e. it's exported out of
> drivers/irqchip/irq-vic.c, but it's not actually defined in any header file.

Hm?
arch/arm/include/asm/hardware/vic.h
int vic_of_init(struct device_node *node, struct device_node *parent);

> Also, a couple of small merge conflicts with the timer and irq cleanup
> branches.

Do you think the above also comes from that branch?

> Would you mind rebasing on top of the depends/cleanup branch in arm-soc, sort
> out the breakage (and test it) and resubmit?

I'll try!

Yours,
Linus Walleij
