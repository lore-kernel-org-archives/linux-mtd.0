Received: from mail-pa0-f45.google.com ([209.85.220.45])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TzwIl-0000FF-Qo
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 21:31:41 +0000
Received: by mail-pa0-f45.google.com with SMTP id bg2so1760431pad.4
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2013 13:31:38 -0800 (PST)
Date: Mon, 28 Jan 2013 13:31:35 -0800
From: Olof Johansson <olof@lixom.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] Nomadik devicetree and cleanups
Message-ID: <20130128213135.GA3047@quad.lixom.net>
References: <CACRpkdZM8+6QaGrRtCCMWoZQO23uej7JDr1xz2zG7TtwQ7Ngqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZM8+6QaGrRtCCMWoZQO23uej7JDr1xz2zG7TtwQ7Ngqw@mail.gmail.com>
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

On Tue, Jan 22, 2013 at 10:19:16AM +0100, Linus Walleij wrote:
> Hi ARM SoC guys,
> 
> This patch series converts the Nomadik to use Device Tree.
> 
> Changes outside of the subsystem are constrained to pinctrl (my subsystem
> and thus OK:ed) and a oneline in drivers/mtd/nand/fsmc_nand.c adding
> a new compatible value.
> 
> The MTD maintainers have had time enough to ACK that oneliner and it
> shouldn't be a big issue, so:
> 
> Please pull this into your tree.

Hi,

Sorry for a late feedback on this, but after merging, this doesn't seem to
build due to lack of vic_of_init symbol visibility (i.e. it's exported out of
drivers/irqchip/irq-vic.c, but it's not actually defined in any header file.

Also, a couple of small merge conflicts with the timer and irq cleanup
branches.

Would you mind rebasing on top of the depends/cleanup branch in arm-soc, sort
out the breakage (and test it) and resubmit?


Thanks!

-Olof
